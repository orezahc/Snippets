# !/bin/bash +x

username=$1

adduser --disabled-password --gecos "" ${username}
chown -R ${username}: /home/${username}
chown -R u+w /home/${username}
usermod -a -G docker ${username}
cp -rf /home/SenzaTemplate/* /home/${username}/
mkdir /home/${username}/.ssh
touch /home/${username}/.ssh/authorized_keys
