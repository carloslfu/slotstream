#!/usr/bin/env python3
"""Observe the same instantaneous Foundation policy state used by the runtime.

This optional pre-launch check loads no model, compiler or GPU runtime. It does
not replace any frozen per-request thermal, memory, VM or acceptance checks.
One nominal observation is not a temperature reading or a promise about a run.
"""
import argparse
import ctypes
import datetime
import json
import sys


THERMAL_STATES = {0: 'nominal', 1: 'fair', 2: 'serious', 3: 'critical'}


def current_conditions():
    if sys.platform != 'darwin':
        raise RuntimeError('Foundation operating conditions require macOS')
    # Match ProcessMemory.operatingConditions(): NSProcessInfo, rather than
    # pmset's historical warning text. Keep both libraries alive for the calls.
    foundation = ctypes.CDLL('/System/Library/Frameworks/Foundation.framework/Foundation')
    objc = ctypes.CDLL('/usr/lib/libobjc.A.dylib')
    objc.objc_getClass.argtypes = [ctypes.c_char_p]
    objc.objc_getClass.restype = ctypes.c_void_p
    objc.sel_registerName.argtypes = [ctypes.c_char_p]
    objc.sel_registerName.restype = ctypes.c_void_p
    address = ctypes.cast(objc.objc_msgSend, ctypes.c_void_p).value
    if not address:
        raise RuntimeError('Objective-C message dispatch is unavailable')
    pointer_call = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p)(address)
    integer_call = ctypes.CFUNCTYPE(ctypes.c_long, ctypes.c_void_p, ctypes.c_void_p)(address)
    boolean_call = ctypes.CFUNCTYPE(ctypes.c_bool, ctypes.c_void_p, ctypes.c_void_p)(address)
    responds = ctypes.CFUNCTYPE(ctypes.c_bool, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p)(address)
    responds_selector = objc.sel_registerName(b'respondsToSelector:')

    def selector(receiver, name):
        value = objc.sel_registerName(name)
        if not receiver or not value or not responds(receiver, responds_selector, value):
            raise RuntimeError('Foundation selector is unavailable: ' + name.decode('ascii'))
        return value

    process_class = objc.objc_getClass(b'NSProcessInfo')
    process = pointer_call(process_class, selector(process_class, b'processInfo'))
    if not process:
        raise RuntimeError('Foundation returned no process information')
    thermal = integer_call(process, selector(process, b'thermalState'))
    low_power = boolean_call(process, selector(process, b'isLowPowerModeEnabled'))
    return thermal, low_power


def observe(reader=None):
    thermal, low_power = (reader or current_conditions)()
    if type(thermal) is not int or thermal not in THERMAL_STATES:
        raise ValueError('unknown or unavailable Foundation thermal state')
    if type(low_power) is not bool:
        raise ValueError('unknown or unavailable Foundation low-power state')
    conditions = {'thermalState': THERMAL_STATES[thermal], 'lowPowerModeEnabled': low_power}
    return {
        'provider': 'Foundation NSProcessInfo',
        'observed_at_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'conditions': conditions,
        'ready': thermal == 0 and not low_power,
        'scope': 'One pre-launch policy observation; all original request and qualification gates remain required.',
    }


def main(argv=None, *, reader=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--require-nominal', action='store_true',
                        help='Exit 2 unless the observation is nominal and low-power mode is disabled')
    args = parser.parse_args(argv)
    try:
        result = observe(reader)
    except (AttributeError, OSError, RuntimeError, TypeError, ValueError) as error:
        print(json.dumps({'ready': False, 'error': str(error)}))
        return 1
    print(json.dumps(result))
    return 2 if args.require_nominal and not result['ready'] else 0


if __name__ == '__main__':
    raise SystemExit(main())
