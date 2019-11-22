## git-stash

this ohmyzsh plugin provides a `$(git_stash)` function which returns empty if your git stash is empty, or the count of stashes.

Works best with the default `git-prompt` plugin

## Installation
Copy source to your custom plugins directory:
```commandline
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/wadesherman/git-stash.git
```

Add `git-prompt` and `git-stash` to the enabled plugins in `~/.zshrc`

reload zsh

```commandline
source ~/.zshrc
```


## Use in theme

```commandline
RPROMPT='$(git_super_status)'
RPROMPT+="%F{135}"
RPROMPT+='$(git_stash)'
RPROMPT+="%{${reset_color}%}"
```

![](screenshot.png)
