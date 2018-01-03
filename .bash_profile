# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Add sbin to path, as per `brew doctor`
export PATH="/usr/local/sbin:$PATH"

# Add postgres app to the `$PATH`
PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# Add homebrew php to `$PATH`
PATH="/usr/local/Cellar/php70/7.0.19_11/bin:$PATH"

# BELOW THIS LINE CAME LARGELY FROM dev-setup (https://github.com/kalbir/dev-setup) and is specific to that process)
# --------------------------------------------------

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# BACK TO ME DOING THINGS
# ---------------------------------------------

# Add rbenv to path
export PATH="/usr/local/rbenv/bin:$PATH"

# Add this coz rbenv told me to!
eval "$(rbenv init -)"
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"

# Add the brew version of asdf
source /usr/local/opt/asdf/asdf.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/kalbirsohi/.sdkman"
[[ -s "/Users/kalbirsohi/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/kalbirsohi/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/sbin:$PATH"
