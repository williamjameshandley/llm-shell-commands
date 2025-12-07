# llm-shell-commands

Convert natural language to shell commands using OpenAI API.

## Installation

1. Ensure `OPENAI_API_KEY` is set in your environment
2. Source the appropriate plugin for your shell:

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

## Requirements

- Python 3
- zsh, bash, or fish
- OpenAI API key
