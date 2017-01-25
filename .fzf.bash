# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mike/.fzf/bin* ]]; then
  export PATH="$PATH:/home/mike/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/mike/.fzf/man* && -d "/home/mike/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/mike/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mike/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/mike/.fzf/shell/key-bindings.bash"

