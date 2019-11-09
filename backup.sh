#!/bin/bash
DIRECTORY="/home/nick/library/minecraft/world backups"
USER="nick"
SESSION="minecraft-0"


DATE=$(date +”%d-%b-%Y-%R”)
FOLDERNAME=$DATE

sudo mkdir $DIRECTORY$FOLDERNAME
sudo -u $USER tmux send-keys -t $SESSION "say Backing up server... Expect some (more) lag..." ENTER
sudo -u $USER tmux send-keys -t $SESSION "save-all" ENTER
sudo -u $USER tmux send-keys -t $SESSION "save-off" ENTER
sudo rsync -a /home/nick/minecraft/vanilla/worl* /home/nick/library/minecraft/world\ backups/$FOLDERNAME
sudo -u $USER tmux send-keys -t $SESSION "save-on" ENTER
sudo -u $USER tmux send-keys -t $SESSION "say Backup complete." ENTER

