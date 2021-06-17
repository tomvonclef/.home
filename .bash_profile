if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
      . ~/.bashrc
  fi
fi

# revoke non-user write permissions
mesg n

. "$HOME/.cargo/env"
