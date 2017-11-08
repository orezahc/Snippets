# RHEL(CentOS) Environment Setup 
## Install Python

```cat /etc/redhat-release
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm
yum install https://centos7.iuscommunity.org/ius-release.rpm
yum install python36u
python3.6 -V
yum install python36u-pip python36u-devel -y
```

## Install Docker
```
yum install -y device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager --enable docker-ce-edge
yum-config-manager --enable docker-ce-test

subscription-manager repos --enable rhel-7-server-extras-rpms
yum update
yum install docker-ce
systemctl start docker
sudo usermod -aG docker {user-name}
```
