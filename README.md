# llm-shell-commands

Convert natural language to shell commands using OpenAI API.

## Installation

1. Ensure `OPENAI_API_KEY` is set in your environment
2. Source the zsh plugin in your `.zshrc`:

```zsh
source /path/to/llm-shell.zsh
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

## Requirements

- Python 3
- zsh
- OpenAI API key
