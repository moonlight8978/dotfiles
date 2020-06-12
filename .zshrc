alias deb="docker-compose exec api bash"
alias der="docker-compose exec api rails c"
alias drb="docker-compose run --rm api bash"
alias drr="docker-compose run --rm api rails c"

alias grmbr='(git branch | grep -v "master\|develop" | xargs git branch -D); git remote prune origin'
alias release-ios='npx react-native run-ios --configuration Release'

defaults write com.apple.finder ShowPathbar -bool true
