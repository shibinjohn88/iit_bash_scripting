#!/bin/bash

#globals
USERS="../assignment2/roster.txt"
LOG="ga2ex12-log.sh"

while IFS= read -r LINE; do
        NAME="$LINE"
        #check home directory exist for user and create user account if no home directory
        HOME_DIR="/home/$NAME"
        if [ ! -d "$HOME_DIR" ]; then
                echo "$(date '+%Y-%m-%d %H:%M:%S'): Home directory not found creating user account for $NAME" >> "$LOG"
                if id "$NAME" > /dev/null 2>&1; then
                        echo "User '$NAME' already exists. Skipping account creation."| tee -a "$LOG"
                        exit 1
                else
                        sudo useradd -c "Account for $NAME" -s /usr/bin/bash -d "$HOME_DIR" -m "$NAME" >> "$LOG" 2>&1
                        echo "$(date '+%Y-%m-%d %H:%M:%S'): User account successfully created for $NAME"| tee -a "$LOG"
                fi 
        else
                echo "$(date '+%Y-%m-%d %H:%M:%S'): Skipping user account creating home directoy exists for user $NAME"| tee -a "$LOG"
        fi

        # # check .ssh directoy exists for user and generate ssh keys
        SSH_DIR="$HOME_DIR/.ssh"
        SSH_KEY="$SSH_DIR/id_ed25519_$NAME"

        sudo mkdir -p "$SSH_DIR"
        if ! sudo -u "$NAME" test -O "$SSH_DIR"; then
                echo "Changing .SSH directory ownership to user $NAME" >> $LOG 
                sudo chown "$NAME:$NAME" "$SSH_DIR"
        fi

        # # # check SSH key exist
        if ! sudo -u "$NAME" test -f "$SSH_KEY"; then
                echo "$(date '+%Y-%m-%d %H:%M:%S'): Generating SSH keys for user $NAME" >> "$LOG"
                sudo ssh-keygen -t ed25519 -f "$SSH_KEY" -N "" >> "$LOG" 2>&1
                sudo chown "$NAME:$NAME" "$SSH_KEY" "$SSH_KEY.pub"
                echo "$(date '+%Y-%m-%d %H:%M:%S'): SSH keys $SSH_KEY and $SSH_KEY.pub generated for user $NAME" >> "$LOG"
                echo "$(date '+%Y-%m-%d %H:%M:%S'): SSH keys generated for user $NAME"| tee -a "$LOG"
        else
                echo "$(date '+%Y-%m-%d %H:%M:%S'): SSH keys for user $NAME exists, skipping key generation"| tee -a "$LOG"
        fi

done < "$USERS"
