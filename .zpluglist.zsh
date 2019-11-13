zplug "mollifier/anyframe"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions", defer:2
# binaries (from GitHub Releases)
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:fzf
# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after cominit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "mollifier/cd-bookmark"
