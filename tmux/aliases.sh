# Function for attaching to an existing session
tmux_attach() {
  if [ -z "$1" ]; then
    tmux attach-session
  else
    tmux attach-session -t "$1"
  fi
}

# Function for detaching to an existing session
tmux_detach() {
  if [ -z "$1" ]; then
    tmux detach-client
  else
    tmux detach-client -t "$1"
  fi
}

# Function for kill to an existing session
tmux_kill() {
  if [ -z "$1" ]; then
    echo "Please provide a session name to kill."
  else
    tmux kill-session -t "$1"
  fi
}

# Function for listing all tmux sessions
tmux_list() {
  tmux list-sessions
}

# Function for creating or attaching to a new session
tmux_new() {
  if [ -z "$1" ]; then
    tmux new -s default
  else
    tmux new -s "$1"
  fi
}

# Function for rename to an existing session
tmux_rename() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: t r <current_session_name> <new_session_name>"
  else
    tmux rename-session -t "$1" "$2"
  fi
}

# Function for switch to an existing session
tmux_switch() {
  case "$1" in
    next|-n)
      tmux switch-client -n
      ;;
    last|-l)
      tmux switch-client -l
      ;;
    *)
      if [ -z "$1" ]; then
        echo "Please provide a session name, 'next', or 'last'."
      else
        tmux switch-client -t "$1"
      fi
      ;;
  esac
}

# Function for close to a current window
tmux_kill_pane() {
  tmux kill-pane
}


# Dispatcher functions
ta() tmux_attach "$@"
td() tmux_detach "$@"
tk() tmux_kill "$@"
tl() tmux_list "$@"
tn() tmux_new "$@"
tr() tmux_rename "$@"
ts() tmux_switch "$@"
tx() tmux_kill_pane "$@"
