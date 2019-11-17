#contas utilizadores 2
#!/bin/bash

sudo vipw
sudo vigr
sudo mkdir /home/$1
sudo cp /etc/skel/.* /home/$1
sudo chown $1:$1 /home/$1/.*
sudo passwd $1
