[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history

# sourse
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

#set -o vi

# plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
#plug "zsh-users/zsh-syntax-highlighting"

# Example install completion
#plug "esc/conda-zsh-completion"

