## Testing installation
Easist start is to run an ubuntu docker container
`docker run -it ubuntu`

You will need to install the sudo command
`apt-get update && apt-get install -y sudo git`

Set a root password
`passwd` (a prompt will as you to set a root password)

Create a user and give them the correct persmissions
`useradd -m username` (some user configuration will follow)
`usermod -aG sudo username` (allow the user to run sudo commands)
su - username
