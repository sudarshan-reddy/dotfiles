HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

function chpwd() {
    print -Pn "\e]2;%~\a"
     if [ -r $PWD/variables.env ] ; then
        source $PWD/variables.env
    fi
}

autoload -U compinit && compinit
zmodload -i zsh/complist

export RUSTBIN=$HOME/.cargo/bin
export RUST_SRC_PATH="/Users/sudarsan/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/"
export RUSTPATH=$HOME/dev/rust
export GOPATH=$HOME/dev/go
export GOZ=$HOME/dev/go/src/github.com/zalora
export GOSRC=/usr/local/Cellar/go/1.12.5/libexec/
export PATH=$PATH:$RUSTBIN:$GOPATH/bin
export PATH=$PATH:/usr/local/sbin/
export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
export PATH=$PATH:$GOSRC

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/users/sudarsan/bin/:$PATH"

# alias vim=nvim
alias vim=/usr/local/Cellar/vim/8.1.1300/bin/vim
export PATH="/usr/local/opt/node@8/bin:$PATH"

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/sudarsan/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/sudarsan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/sudarsan/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/sudarsan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
export PATH="/usr/local/opt/thrift@0.9.1/bin:$PATH"
