# !/bin/bash/

# links to sounds

printf "Linking sounds.\n"

ln -svf "$(pwd)/sounds/Softdelay.ogg" "$HOME/Softdelay.ogg"
ln -svf "$(pwd)/sounds/Mallet.ogg" "$HOME/Mallet.ogg"
ln -svf "$(pwd)/sounds/sonar.ogg" "$HOME/sonar.ogg"

printf "Done.\n"
