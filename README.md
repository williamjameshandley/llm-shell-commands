# llm-shell-commands

Convert natural language to shell commands using LLM APIs.

Supports multiple providers: OpenAI, Claude, Groq, and Gemini.

## Installation

1. Set the API key for your chosen provider:
   - `OPENAI_API_KEY` for OpenAI (default)
   - `ANTHROPIC_API_KEY` for Claude
   - `GROQ_API_KEY` for Groq
   - `GEMINI_API_KEY` for Gemini

2. Optionally set `LLM_PROVIDER` to choose provider (default: `openai`)

3. Source the appropriate plugin for your shell:

**zsh** (in `~/.zshrc`):
```zsh
source /path/to/llm-shell.zsh
```

**bash** (in `~/.bashrc`):
```bash
source /path/to/llm-shell.bash
```

**fish** (in `~/.config/fish/config.fish`):
```fish
source /path/to/llm-shell.fish
```

## Usage

Type a natural language description at the command line, then press `Ctrl-S` to convert it to a shell command.

```
$ find all python files containing "foo"
[Ctrl-S]
$ grep -rl "foo" --include="*.py" .
```

Press up arrow to retrieve your original input if you want to refine it.

## Context

The tool automatically includes:
- Current working directory
- OS/distro (detected from `/etc/os-release` on Linux)
- Shell type
- Files in current directory (up to 20)

## Providers

| Provider | Env Variable | Default Model |
|----------|--------------|---------------|
| openai   | `OPENAI_API_KEY` | gpt-4o-mini |
| claude   | `ANTHROPIC_API_KEY` | claude-3-5-haiku-20241022 |
| groq     | `GROQ_API_KEY` | llama-3.3-70b-versatile |
| gemini   | `GEMINI_API_KEY` | gemini-2.5-flash |

Override the model with `LLM_MODEL` environment variable.

## Requirements

- Python 3
- zsh, bash, or fish
- API key for at least one provider
