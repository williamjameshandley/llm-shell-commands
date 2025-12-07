# LLM Shell Command Generator for Fish
# Source this file or add to ~/.config/fish/config.fish

# Path to the llm-command script
set -q LLM_COMMAND_PATH; or set -g LLM_COMMAND_PATH "$HOME/tmp/llm-shell-commands/llm-command"

function _llm_generate_command
    set -l buffer (commandline)
    if test -n "$buffer"
        # Show thinking indicator
        commandline -r "$buffer⌛"
        commandline -f repaint

        # Get command from LLM
        set -l result ($LLM_COMMAND_PATH "$buffer" 2>/dev/null)

        # Replace buffer with result
        commandline -r "$result"
        commandline -f end-of-line

        # Add original to history
        builtin history add "$buffer"
    end
end

# Bind to Ctrl-S
bind \cs _llm_generate_command
