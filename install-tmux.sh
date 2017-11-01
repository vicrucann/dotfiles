# tmux plugins
read -p "Do you want to install tmux plugin manager? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  printf "Clonning the manager git repo.\n"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  printf "Reloading tmux environment so TPM is sourced."
  tmux source ~/.tmux.conf
fi
printf "DONE: tmux plugin managed.\n\n"
