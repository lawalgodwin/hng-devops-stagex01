#!/usr/bin/env bash
# A script that automates user and group management

# generate random a password for users
create_default_password () {
    openssl rand -base64 12
}

# A function that creates a user
create_user () {
    username="$1"
    # check if user already exists
    if id "$username" &>/dev/null; then
      echo "User: $username already exist"
      return 1
    else
    # create the user if it does not exist
      if useradd -m -U "$username"; then
        echo "User: $username created successfully"
        return 0
      else
    # could not creat user
        echo "Error creating user: $username"
        return 1
      fi
    fi
}


# A function that creates a user
# create_group () {
#     # check if the group already exist
#     group="$1"
#     if getent group "$group" &>/dev/null; then
#       echo "Group: $group already exist"
#     fi
# }

# set up the file for storing users and password
mkdir -p /var/secure

# Ensure the input file is supplied as argument to the script
if [[ "$#" -lt 1 ]]; then
  echo "Usage: $0 INPUT_FILE"
  exit 1
fi

# Ensure the given input file exists before reading the content
input_file="$1"
if [[ -f "$input_file" ]]; then
# Read the content line by line
  while read -r line; do
# Extract the username and groups on every line
    username=$(echo "$line" | cut -d ";" -f 1)
    # usergroups=$(echo "$line" | cut -d ";" -f 2 | sed -e s/","/" "/g)
    # create the user
    create_user "$username"
    # set user password and save user->password pairs to a file
    password=$(create_default_password)
    echo "$username:$password" | sudo chpasswd
    echo "$username,$password" >> /var/secure/user_passwords.txt
    # Set the file permission to read only for the owner
    chmod 400 /var/secure/user_passwords.txt
    # assign user to the respective group
    # for group in "${usergroups[@]}"; do
    #   echo ""
    # done
  done < "$input_file"
fi

