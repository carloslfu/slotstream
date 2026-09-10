---
type: run
id: 01m1xxzrdrhk43tj8q9jdmz9z1
created: 2026-09-07T12:37:45.016975+00:00
updated: 2026-09-07T12:37:45.263847+00:00
summary: Correction to the component probe allocator-peak label
binary: V280 eba9ee894aba4722d082fda7d39192339d0299fe7af264a624dd4209d1e648cf
captured_at: 2026-09-07
command: Exact archived protocols, actual raw results and guarded receipts below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Correction to the component probe allocator-peak label
tool: python3
---
# Allocator-peak wording correction

The preceding retained-window synchronization source correctly preserves the raw mx.get_peak_memory value336,183,310 bytes, but its narrative describes that value as active-plus-cache allocation. That classification was not established and must not be used. The installed Python API describes a used-memory peak without asserting that sum; the pinned native Metal allocator source below updates peak_memory_ from active_memory_, while cache accounting is separate. The supported description for the recorded Python probe is its raw MLX allocator-peak reading. No sampled process-footprint, whole-machine memory figure or allocator saving was measured in this probe.

This corrects only the narrative classification in [[sources/runs/2026/09/2026-09-07-optimization-retained-window-sync-component]]. The original source remains byte-for-byte preserved. All48 clean component pairs, their46–48% isolated timing reductions,12 edge cases, actual library/probe/config identities and the explicit absence of any Swift/serving qualification are unchanged. Current serving percentages and their separately sampled physical-footprint and active-tensor metrics are unaffected. Native MLX Swift module metadata identifies wrapper version0.31.6; the exploratory Python distribution is0.31.1, so native confirmation remains explicitly required.

## Complete artifact inventory

````json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/allocator.cpp",
    "sha256": "2e7ea0bccec1c2e2b962b579f838b8d088b7197f1c7c2cda98535c9b53070dd0",
    "bytes": 7933
  }
]
````

## /Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/allocator.cpp

SHA-256 `2e7ea0bccec1c2e2b962b579f838b8d088b7197f1c7c2cda98535c9b53070dd0`; 7933 bytes.

````text
// Copyright © 2023-2024 Apple Inc.
#include "mlx/backend/metal/allocator.h"
#include "mlx/backend/gpu/device_info.h"
#include "mlx/backend/metal/metal.h"
#include "mlx/backend/metal/resident.h"
#include "mlx/memory.h"

#include <mach/vm_page_size.h>
#include <unistd.h>
#include <cstdlib>

namespace mlx::core {

constexpr size_t resource_options =
    MTL::ResourceStorageModeShared | MTL::ResourceHazardTrackingModeUntracked;

namespace allocator {

Allocator& allocator() {
  return metal::allocator();
}

void* Buffer::raw_ptr() {
  if (!ptr_) {
    return nullptr;
  }
  return static_cast<MTL::Buffer*>(ptr_)->contents();
}

} // namespace allocator

namespace metal {

MetalAllocator::MetalAllocator()
    : device_(device(mlx::core::Device::gpu).mtl_device()),
      buffer_cache_(
          vm_page_size,
          [](MTL::Buffer* buf) { return buf->length(); },
          [this](MTL::Buffer* buf) {
            if (!buf->heap()) {
              residency_set_.erase(buf);
            }
            buf->release();
          }),
      residency_set_(device_) {
  auto pool = metal::new_scoped_memory_pool();
  const auto& info = gpu::device_info(0);
  auto memsize = std::get<size_t>(info.at("memory_size"));
  auto max_rec_size =
      std::get<size_t>(info.at("max_recommended_working_set_size"));
  resource_limit_ = std::get<size_t>(info.at("resource_limit"));
  block_limit_ = std::min(1.5 * max_rec_size, 0.95 * memsize);
  gc_limit_ = std::min(static_cast<size_t>(0.95 * max_rec_size), block_limit_);
  max_pool_size_ = block_limit_;
  device(mlx::core::Device::gpu)
      .set_residency_set(residency_set_.mtl_residency_set());
  bool is_vm = std::get<std::string>(info.at("device_name")) ==
      "Apple Paravirtual device";
  if (is_vm) {
    return;
  }
  auto heap_desc = MTL::HeapDescriptor::alloc()->init();
  heap_desc->setResourceOptions(resource_options);
  heap_desc->setSize(heap_size_);
  heap_ = device_->newHeap(heap_desc);
  heap_desc->release();
  residency_set_.insert(heap_);
}

MetalAllocator::~MetalAllocator() {
  auto pool = metal::new_scoped_memory_pool();
  if (heap_) {
    heap_->release();
  }
  buffer_cache_.clear();
}

size_t MetalAllocator::set_cache_limit(size_t limit) {
  std::unique_lock lk(mutex_);
  std::swap(limit, max_pool_size_);
  return limit;
};

size_t MetalAllocator::set_memory_limit(size_t limit) {
  std::unique_lock lk(mutex_);
  std::swap(limit, block_limit_);
  gc_limit_ = std::min(
      block_limit_,
      static_cast<size_t>(0.95 * device_->recommendedMaxWorkingSetSize()));
  return limit;
};

size_t MetalAllocator::get_memory_limit() {
  return block_limit_;
}

size_t MetalAllocator::set_wired_limit(size_t limit) {
  std::unique_lock lk(mutex_);
  std::swap(limit, wired_limit_);
  residency_set_.resize(wired_limit_);
  return limit;
};

Buffer MetalAllocator::malloc(size_t size) {
  // Metal doesn't like empty buffers
  if (size == 0) {
    return Buffer{nullptr};
  }

  // More helpful message if maximum buffer length is exceeded
  if (size > device_->maxBufferLength()) {
    std::ostringstream msg;
    msg << "[metal::malloc] Attempting to allocate " << size
        << " bytes which is greater than"
        << " the maximum allowed buffer size of " << device_->maxBufferLength()
        << " bytes.";
    throw std::runtime_error(msg.str());
  }

  // Align up memory
  if (size > vm_page_size) {
    size = vm_page_size * ((size + vm_page_size - 1) / vm_page_size);
  }

  // Try the cache
  std::unique_lock lk(mutex_);
  MTL::Buffer* buf = buffer_cache_.reuse_from_cache(size);
  if (!buf) {
    size_t mem_required = get_active_memory() + get_cache_memory() + size;

    auto pool = metal::new_scoped_memory_pool();

    // If we have a lot of memory pressure try to reclaim memory from the cache
    if (mem_required >= gc_limit_ || num_resources_ >= resource_limit_) {
      num_resources_ -=
          buffer_cache_.release_cached_buffers(mem_required - gc_limit_);
    }

    // Allocate new buffer if needed
    if (num_resources_ >= resource_limit_) {
      std::ostringstream msg;
      msg << "[metal::malloc] Resource limit (" << resource_limit_
          << ") exceeded.";
      throw std::runtime_error(msg.str());
    }
    lk.unlock();
    if (size < small_size_ && heap_) {
      buf = heap_->newBuffer(size, resource_options);
    }
    if (!buf) {
      buf = device_->newBuffer(size, resource_options);
    }
    if (!buf) {
      std::ostringstream msg;
      msg << "[malloc] Unable to allocate " << size << " bytes.";
      throw std::runtime_error(msg.str());
    }
    lk.lock();
    num_resources_++;
    if (!buf->heap()) {
      residency_set_.insert(buf);
    }
  }

  active_memory_ += buf->length();
  peak_memory_ = std::max(peak_memory_, active_memory_);

  // Maintain the cache below the requested limit
  if (get_cache_memory() > max_pool_size_) {
    auto pool = metal::new_scoped_memory_pool();
    num_resources_ -= buffer_cache_.release_cached_buffers(
        get_cache_memory() - max_pool_size_);
  }

  return Buffer{static_cast<void*>(buf)};
}

void MetalAllocator::clear_cache() {
  std::unique_lock lk(mutex_);
  auto pool = metal::new_scoped_memory_pool();
  num_resources_ -= buffer_cache_.clear();
}

void MetalAllocator::free(Buffer buffer) {
  auto buf = static_cast<MTL::Buffer*>(buffer.ptr());
  if (buf == nullptr) {
    return;
  }
  std::unique_lock lk(mutex_);
  active_memory_ -= buf->length();
  if (get_cache_memory() < max_pool_size_) {
    buffer_cache_.recycle_to_cache(buf);
  } else {
    num_resources_--;
    if (!buf->heap()) {
      residency_set_.erase(buf);
    }
    lk.unlock();
    auto pool = metal::new_scoped_memory_pool();
    buf->release();
  }
}

size_t MetalAllocator::size(Buffer buffer) const {
  return static_cast<MTL::Buffer*>(buffer.ptr())->length();
}

Buffer MetalAllocator::make_buffer(void* ptr, size_t size) {
  auto buf = device_->newBuffer(ptr, size, resource_options, nullptr);
  if (!buf) {
    return Buffer{nullptr};
  }
  std::unique_lock lk(mutex_);
  residency_set_.insert(buf);
  active_memory_ += buf->length();
  peak_memory_ = std::max(peak_memory_, active_memory_);
  num_resources_++;
  return Buffer{static_cast<void*>(buf)};
}

void MetalAllocator::release(Buffer buffer) {
  auto buf = static_cast<MTL::Buffer*>(buffer.ptr());
  if (buf == nullptr) {
    return;
  }
  std::unique_lock lk(mutex_);
  active_memory_ -= buf->length();
  num_resources_--;
  residency_set_.erase(buf);
  lk.unlock();
  auto pool = metal::new_scoped_memory_pool();
  buf->release();
}

MetalAllocator& allocator() {
  // By creating the |allocator_| on heap, the destructor of MetalAllocator
  // will not be called on exit and buffers in the cache will be leaked. This
  // can save some time at program exit.
  static MetalAllocator* allocator_ = new MetalAllocator;
  return *allocator_;
}

} // namespace metal

size_t set_cache_limit(size_t limit) {
  return metal::allocator().set_cache_limit(limit);
}
size_t set_memory_limit(size_t limit) {
  return metal::allocator().set_memory_limit(limit);
}
size_t get_memory_limit() {
  return metal::allocator().get_memory_limit();
}
size_t set_wired_limit(size_t limit) {
  if (limit > std::get<size_t>(
                  gpu::device_info(0).at("max_recommended_working_set_size"))) {
    throw std::invalid_argument(
        "[metal::set_wired_limit] Setting a wired limit larger than "
        "the maximum working set size is not allowed.");
  }
  return metal::allocator().set_wired_limit(limit);
}
size_t get_active_memory() {
  return metal::allocator().get_active_memory();
}
size_t get_peak_memory() {
  return metal::allocator().get_peak_memory();
}
void reset_peak_memory() {
  metal::allocator().reset_peak_memory();
}
size_t get_cache_memory() {
  return metal::allocator().get_cache_memory();
}
void clear_cache() {
  return metal::allocator().clear_cache();
}

} // namespace mlx::core
````

