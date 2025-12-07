# LLM Shell Command Generator for Bash
# Source this file in your .bashrc

# Path to the llm-command script
LLM_COMMAND_PATH="${LLM_COMMAND_PATH:-$HOME/tmp/llm-shell-commands/llm-command}"

# Bash function that converts natural language to shell command
_llm_generate_command() {
    if [[ -n "$READLINE_LINE" ]]; then
        local _old="$READLINE_LINE"
        READLINE_LINE="${_old}⌛"
        READLINE_POINT=${#READLINE_LINE}

        # Force redraw
        bind '"\e[0n": redraw-current-line'
        printf '\e[5n'

        READLINE_LINE=$("$LLM_COMMAND_PATH" "$_old" 2>/dev/null)
        READLINE_POINT=${#READLINE_LINE}

        # Add original input to history
        history -s "$_old"
    fi
}

# Bind to Ctrl-S
bind -x '"\C-s": _llm_generate_command'
