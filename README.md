# hng-devops-stagex01

### Introduction
This script automates the creation of users and placement of users in their respective groups

### Prerequisites
- A Linux Ubuntu enironment
- A user with admin privilages
- A text file containing the users to be created and their groups

### Running the script
``` bash 
# make the file executable
chmod +x create_users.sh
# run the script
sudo ./create_users.sh text_file.txt
```

The content of the text file should be of the format:
```html
light; sudo,dev,www-data
idimma; sudo
mayowa; dev,www-data
```
For the first line, **light** is username and groups are **sudo, dev, www-data**

For further info, please visit [automate user and group creation](https://godwinlawal.hashnode.dev/linux-users-and-groups-creation)