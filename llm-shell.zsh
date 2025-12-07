# LLM Shell Command Generator
# Source this file in your .zshrc

# Path to the llm-command script
LLM_COMMAND_PATH="${LLM_COMMAND_PATH:-$HOME/tmp/llm-shell-commands/llm-command}"

# Zsh widget that converts natural language to shell command
llm-generate-command() {
    if [[ -n "$BUFFER" ]]; then
        local _old=$BUFFER
        BUFFER+="⌛"
        zle -I && zle redisplay
        BUFFER=$("$LLM_COMMAND_PATH" "$_old" 2>/dev/null)
        # Add original input to history so up-arrow retrieves it
        print -s "$_old"
        zle end-of-line
    fi
}

# Register the widget
zle -N llm-generate-command

# Bind to Ctrl-S
bindkey '^S' llm-generate-command
