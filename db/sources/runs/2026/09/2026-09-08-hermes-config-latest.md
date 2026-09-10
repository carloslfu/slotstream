---
type: run
id: 01m222dxx36yfzwyd8z8cn99r8
created: 2026-09-09T03:12:21.410767+00:00
updated: 2026-09-09T03:12:46.545856+00:00
summary: Hermes latest configuration regression gate
binary: Hermes 4a39a3ff8bea45ab5a6b646ce26ced88a8fed079; synthetic HTTP
captured_at: 2026-09-08
command: Hermes Python Tools/hermes_config_gate.py hermes-latest config-output
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Hermes latest configuration regression gate
tool: Tools/hermes_config_gate.py
---
Synthetic HTTP regression gate through unmodified Hermes CLI initialization. No model inference or real HTTP calls. The request captures below contain parameters and timeouts; message contents, tools and headers are excluded by the gate.

Hermes commit: `4a39a3ff8bea45ab5a6b646ce26ced88a8fed079`.

```json
{
  "passed": true,
  "cases": [
    {
      "case": "clean",
      "passed": true,
      "error": null
    },
    {
      "case": "conflicting_custom",
      "passed": true,
      "error": null
    },
    {
      "case": "reasoning_medium",
      "passed": true,
      "error": null
    },
    {
      "case": "changed_limit",
      "passed": true,
      "error": null
    },
    {
      "case": "missing_provider",
      "passed": true,
      "error": null
    },
    {
      "case": "disabled_provider",
      "passed": true,
      "error": null
    },
    {
      "case": "unavailable",
      "passed": true,
      "error": null
    },
    {
      "case": "unauthorized",
      "passed": true,
      "error": null
    },
    {
      "case": "truncated_summary",
      "passed": true,
      "error": null
    },
    {
      "case": "empty_summary",
      "passed": true,
      "error": null
    },
    {
      "case": "sticky_profile_override",
      "passed": true,
      "error": null
    }
  ]
}
```

### clean

```json
{
  "case": "clean",
  "passed": true,
  "runtime": {
    "base_url": "http://localhost:11434/v1",
    "context": 65536,
    "reasoning": {
      "enabled": false
    },
    "overrides": {
      "extra_body": {
        "max_tokens": 4096
      }
    }
  },
  "requests": [
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/v1/models",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 404
    },
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/tags",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 200
    },
    {
      "phase": "startup",
      "method": "POST",
      "url": "http://127.0.0.1:11434/api/show",
      "parameters": {
        "name": "qwen3.8-flash-next:4bit"
      },
      "tools_count": 0,
      "timeout": {
        "connect": 3.0,
        "read": 3.0,
        "write": 3.0,
        "pool": 3.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    }
  ]
}

```

### conflicting_custom

```json
{
  "case": "conflicting_custom",
  "passed": true,
  "runtime": {
    "base_url": "http://localhost:11434/v1",
    "context": 65536,
    "reasoning": {
      "enabled": false
    },
    "overrides": {
      "extra_body": {
        "max_tokens": 4096
      }
    }
  },
  "requests": [
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/v1/models",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 404
    },
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/tags",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 200
    },
    {
      "phase": "startup",
      "method": "POST",
      "url": "http://127.0.0.1:11434/api/show",
      "parameters": {
        "name": "qwen3.8-flash-next:4bit"
      },
      "tools_count": 0,
      "timeout": {
        "connect": 3.0,
        "read": 3.0,
        "write": 3.0,
        "pool": 3.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    }
  ]
}

```

### reasoning_medium

```json
{
  "case": "reasoning_medium",
  "passed": true,
  "runtime": {
    "base_url": "http://localhost:11434/v1",
    "context": 65536,
    "reasoning": {
      "enabled": true,
      "effort": "medium"
    },
    "overrides": {
      "extra_body": {
        "max_tokens": 4096
      }
    }
  },
  "requests": [
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/v1/models",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 404
    },
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/tags",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 200
    },
    {
      "phase": "startup",
      "method": "POST",
      "url": "http://127.0.0.1:11434/api/show",
      "parameters": {
        "name": "qwen3.8-flash-next:4bit"
      },
      "tools_count": 0,
      "timeout": {
        "connect": 3.0,
        "read": 3.0,
        "write": 3.0,
        "pool": 3.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "medium",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "max_tokens": 4096
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 200
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    }
  ]
}

```

### changed_limit

```json
{
  "case": "changed_limit",
  "passed": true,
  "runtime": {
    "base_url": "http://localhost:11434/v1",
    "context": 65536,
    "reasoning": {
      "enabled": false
    },
    "overrides": {
      "extra_body": {
        "max_tokens": 2048
      }
    }
  },
  "requests": [
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/v1/models",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 404
    },
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/tags",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 200
    },
    {
      "phase": "startup",
      "method": "POST",
      "url": "http://127.0.0.1:11434/api/show",
      "parameters": {
        "name": "qwen3.8-flash-next:4bit"
      },
      "tools_count": 0,
      "timeout": {
        "connect": 3.0,
        "read": 3.0,
        "write": 3.0,
        "pool": 3.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 2048
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    }
  ]
}

```

### missing_provider

```json
{
  "case": "missing_provider",
  "passed": true,
  "requests": []
}

```

### disabled_provider

```json
{
  "case": "disabled_provider",
  "passed": true,
  "requests": []
}

```

### unavailable

```json
{
  "case": "unavailable",
  "passed": true,
  "runtime": {
    "base_url": "http://localhost:11434/v1",
    "context": 65536,
    "reasoning": {
      "enabled": false
    },
    "overrides": {
      "extra_body": {
        "max_tokens": 4096
      }
    }
  },
  "requests": [
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/v1/models",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 404
    },
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/tags",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 200
    },
    {
      "phase": "startup",
      "method": "POST",
      "url": "http://127.0.0.1:11434/api/show",
      "parameters": {
        "name": "qwen3.8-flash-next:4bit"
      },
      "tools_count": 0,
      "timeout": {
        "connect": 3.0,
        "read": 3.0,
        "write": 3.0,
        "pool": 3.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 503
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 503
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 503
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 503
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 503
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 503
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 503
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 503
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 503
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 503
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 503
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 503
    }
  ]
}

```

### unauthorized

```json
{
  "case": "unauthorized",
  "passed": true,
  "runtime": {
    "base_url": "http://localhost:11434/v1",
    "context": 65536,
    "reasoning": {
      "enabled": false
    },
    "overrides": {
      "extra_body": {
        "max_tokens": 4096
      }
    }
  },
  "requests": [
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/v1/models",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 404
    },
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/tags",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 200
    },
    {
      "phase": "startup",
      "method": "POST",
      "url": "http://127.0.0.1:11434/api/show",
      "parameters": {
        "name": "qwen3.8-flash-next:4bit"
      },
      "tools_count": 0,
      "timeout": {
        "connect": 3.0,
        "read": 3.0,
        "write": 3.0,
        "pool": 3.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 401
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 401
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 401
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 401
    }
  ]
}

```

### truncated_summary

```json
{
  "case": "truncated_summary",
  "passed": true,
  "runtime": {
    "base_url": "http://localhost:11434/v1",
    "context": 65536,
    "reasoning": {
      "enabled": false
    },
    "overrides": {
      "extra_body": {
        "max_tokens": 4096
      }
    }
  },
  "failed_summary_preserved_history": true,
  "requests": [
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/v1/models",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 404
    },
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/tags",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 200
    },
    {
      "phase": "startup",
      "method": "POST",
      "url": "http://127.0.0.1:11434/api/show",
      "parameters": {
        "name": "qwen3.8-flash-next:4bit"
      },
      "tools_count": 0,
      "timeout": {
        "connect": 3.0,
        "read": 3.0,
        "write": 3.0,
        "pool": 3.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 200
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    }
  ]
}

```

### empty_summary

```json
{
  "case": "empty_summary",
  "passed": true,
  "runtime": {
    "base_url": "http://localhost:11434/v1",
    "context": 65536,
    "reasoning": {
      "enabled": false
    },
    "overrides": {
      "extra_body": {
        "max_tokens": 4096
      }
    }
  },
  "failed_summary_preserved_history": true,
  "requests": [
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/v1/models",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 404
    },
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/tags",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 200
    },
    {
      "phase": "startup",
      "method": "POST",
      "url": "http://127.0.0.1:11434/api/show",
      "parameters": {
        "name": "qwen3.8-flash-next:4bit"
      },
      "tools_count": 0,
      "timeout": {
        "connect": 3.0,
        "read": 3.0,
        "write": 3.0,
        "pool": 3.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 200
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    }
  ]
}

```

### sticky_profile_override

```json
{
  "case": "sticky_profile_override",
  "passed": true,
  "runtime": {
    "base_url": "http://localhost:11434/v1",
    "context": 65536,
    "reasoning": {
      "enabled": false
    },
    "overrides": {
      "extra_body": {
        "max_tokens": 4096
      }
    }
  },
  "requests": [
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/v1/models",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 404
    },
    {
      "phase": "startup",
      "method": "GET",
      "url": "http://127.0.0.1:11434/api/tags",
      "parameters": {},
      "tools_count": 0,
      "timeout": {
        "connect": 2.0,
        "read": 2.0,
        "write": 2.0,
        "pool": 2.0
      },
      "status": 200
    },
    {
      "phase": "startup",
      "method": "POST",
      "url": "http://127.0.0.1:11434/api/show",
      "parameters": {
        "name": "qwen3.8-flash-next:4bit"
      },
      "tools_count": 0,
      "timeout": {
        "connect": 3.0,
        "read": 3.0,
        "write": 3.0,
        "pool": 3.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "reasoning_effort": "none",
        "stream": true,
        "stream_options": {
          "include_usage": true
        },
        "options": {
          "num_ctx": 65536
        },
        "think": false,
        "max_tokens": 4096
      },
      "tools_count": 4,
      "timeout": {
        "connect": 30.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 30.0
      },
      "status": 200
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "main",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64,
        "response_format": {
          "type": "json_schema",
          "json_schema": {
            "name": "session_title",
            "strict": true,
            "schema": {
              "type": "object",
              "properties": {
                "title": {
                  "type": "string"
                }
              },
              "required": [
                "title"
              ],
              "additionalProperties": false
            }
          }
        }
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 400
    },
    {
      "phase": "title",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "temperature": 0.3,
        "max_tokens": 64
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    },
    {
      "phase": "compression",
      "method": "POST",
      "url": "http://localhost:11434/v1/chat/completions",
      "parameters": {
        "model": "qwen3.8-flash-next:4bit",
        "max_tokens": 4096,
        "presence_penalty": 0,
        "temperature": 0.2
      },
      "tools_count": 0,
      "timeout": {
        "connect": 1800.0,
        "read": 1800.0,
        "write": 1800.0,
        "pool": 1800.0
      },
      "status": 200
    }
  ]
}

```
