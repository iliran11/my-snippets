# If you come from bash you might have to change your $PATH.

export PATH=~/bin:$PATH

ZSH_THEME=robbyrussell
# Path to your oh-my-zsh installation.
export ZSH="/Users/lirancohen/.oh-my-zsh"

ZSH_THEM=E"robbyrussell"

fpath+=($ZSH/plugins/docker)
#autoload -U compinit && compinit
# Plugin
plugins=(
    colored-man-pages
    zsh-syntax-highlighting
    kubectl
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
# aliases
export NPM_TOKEN="8e235053-8f6b-45f7-acd8-e1e10620d77c"
export BW_INSTALL_PATH="/Users/lirancohen/Projects/bookaway-platform"
export GOOGLE_APPLICATION_CREDENTIALS=/Users/lirancohen/.config/gcloud/application_default_credentials.json
export NODE_ENV=development
export PAYMENT_PORT=3004
export PAYMENT_DEBUG_PORT=4004
export N_PREFIX=~/n
export PATH=$N_PREFIX/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin"
alias 1='cd ~/Projects/bookaway-platform/'
alias bo='git branch --sort=-committerdate'
alias z_edit='vim  ~/.zshrc'
alias z_source='source ~/.zshrc'
alias z_copy_source='cat ~/.zshrc | pbcopy'
alias h_browse='hub browse'
alias h_watch='watch -g hub ci-status; say Done Circle CI'
alias kubetoken='sh kube_token'
alias kubeproxy='kubectl proxy'
alias dockerkillall='docker kill $(docker ps -q)'
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
alias dockerclean='dockercleanc || true && dockercleani'
alias hwatch='watch -g hub ci-status; say Done Circle CI'
alias hbrowse='hub browse'
alias hstatus='hub ci-status'
alias portforwardredisstage='kubectl port-forward --namespace stage svc/bw-redis-stage-master 7000:6379'
alias portforwardredisprod='kubectl port-forward --namespace bookaway svc/bw-redis-master 8000:6379'
alias copylastcommit='git log -1 --pretty=%H | pbcopy'

runJob () {
   temp_job_name=$1-$(date +%s)
   kubectl create job --from=cronjobs/$1 $temp_job_name -n stage &&
    echo kubectl delete job $temp_job_name
}
