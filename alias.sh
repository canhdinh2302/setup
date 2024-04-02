ZSH_THEME="muse"
# common
alias remove="sudo apt-get --purge remove"

# git
alias gc.="git checkout ."
alias gcb="git checkout -b"
alias gbm="git branch -m"
alias gdf="git diff --name-only"
alias gaa="git add -A"
alias uncommit="git reset HEAD~"
alias gitr="git reset --hard HEAD~"
alias gcm="git commit -m"
alias gca="git commit --amend --no-edit"
alias gco="git checkout"
alias gst="git status"
alias emulator="~/Library/Android/sdk/emulator/emulator"

gpush() {
  if [ -z "$1" ]; then
    current_branch=$(git branch | grep "*" | awk '{print $2}')
    echo "Push branch [$current_branch] to origin"
    echo "Command: git push origin $current_branch"
    git push origin $current_branch
  else
    echo "Push branch [$1] to origin"
    echo "Command: git push origin $@"
    git push origin $@
  fi
}

gpull() {
  if [ -z "$1" ]; then
    current_branch=$(git branch | grep "*" | awk '{print $2}')
    echo "Pull branch [$current_branch] from origin"
    echo "Command: git pull origin $current_branch"
    git pull origin $current_branch
  else
    echo "Pull branch [$1] from origin"
    echo "Command: git pull origin $@"
    git pull origin $@
  fi
}

gfetch() {
  echo "Fetch branch [$1] from origin and checkout to [$1]"
  echo "Command: git fetch origin $1:$1"
  git fetch origin $1:$1
  gco $1
}

gitg() {
  echo "Config git global [name=$1] [email=$2]"
  git config --global color.ui true
  git config --global user.name "$1"
  git config --global user.email "$2"
  ssh-keygen -t rsa -b 4096 -C "$2" -f ~/.ssh/id_rsa -q -P ''
}

gitl() {
  echo "Config git local [name=$1] [email=$2]"
  git config user.name "$1"
  git config user.email "$2"
}

checkFolder() {
  if [ -d .git ]; then
    echo "[$(pwd)] Git user infos: <$(git config user.name)> <$(git config user.email)>"
  fi

  if [ -f .nvmrc ]; then
    nvm use
  fi
}

cd() {
  builtin cd "$@"
  checkFolder
}

checkFolder
