# the prompt-- most important of all
export PS1="π \W/ "

# Add `~/bin` to the `$PATH`
#export PATH="$HOME/bin:$PATH"
export PATH=/usr/local/share/npm/bin/:~/lib/node_modules/.bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# If possible, add tab completion for many more commands
#[ -f /etc/bash_completion ] && source /etc/bash_completion

# z-- jump to often-used directories and stuff
source ~/lib/z/z.sh

#export GOPATH=`which go`
export GOPATH=/usr/local/lib/go
export JAVA_HOME="$(/usr/libexec/java_home)"

#testar for ansible
export ANSIBLE_HOSTS=~/ansible_hosts
