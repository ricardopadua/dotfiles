# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search kubectl aws podman extract)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
. "$HOME/Development/lab/dotfiles/tmux/aliases.sh"

export AWS_PROFILE="devops"
export PATH=$HOME/.local/bin:$PATH

alias k=kubectl

# alias
aws_ecr_url() { export ECR_REPO_URL=$(aws ecr describe-repositories --region "${1:-sa-east-1}" --query 'repositories[0].repositoryUri' --output text | cut -d/ -f1); }
aws_ecr_login() { local r="${1:-sa-east-1}"; aws_ecr_url "$r"; aws ecr get-login-password --region "$r" | podman login --username AWS --password-stdin "$ECR_REPO_URL"; }
kbash() { k exec -it $(k get pods -o name | grep "$1" | head -n 1) -- /bin/bash }
kcommand() { k exec -it $(k get pods -o name | grep "$1" | head -n 1) -- "${@:2}"; }
kscp() { k cp $(k get pods -o name | grep "$1" | head -n 1 | cut -d/ -f2):"$2" "${2##*/}" }
load_env() { export $(grep -v '^#' .env | xargs) }