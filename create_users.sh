#!/bin/bash


if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

INPUT_FILE=$1
LOG_FILE="/var/log/user_management.log"
PASSWORD_FILE="/var/secure/user_passwords.csv"

mkdir -p /var/secure

> $LOG_FILE
> $PASSWORD_FILE

create_user() {
    local username=$1
    local groups=$2

    if id "$username" &>/dev/null; then
        echo "User $username already exists." | tee -a $LOG_FILE
    else
        useradd -m -s /bin/bash "$username"
        groupadd "$username"
        usermod -aG "$username" "$username"

      
        IFS=',' read -ra ADDR <<< "$groups"
        for group in "${ADDR[@]}"; do
            groupadd "$group"
            usermod -aG "$group" "$username"
        done

       
        PASSWORD=$(openssl rand -base64 12)
        echo "$username:$PASSWORD" | chpasswd

        echo "Created user $username with groups $groups." | tee -a $LOG_FILE

        echo "$username,$PASSWORD" >> $PASSWORD_FILE

        chown root:root $PASSWORD_FILE
        chmod 600 $PASSWORD_FILE
    fi
}

while IFS=';' read -r username groups; do
    username=$(echo "$username" | xargs)
    groups=$(echo "$groups" | xargs)
    create_user "$username" "$groups"
done < "$INPUT_FILE"

echo "User creation process completed." | tee -a $LOG_FILE
