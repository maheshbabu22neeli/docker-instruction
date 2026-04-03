# docker-instruction
This repo explains each instruction from the docker file


## Pre-requisites
1. We will use EC2 instance to run our docker containers. `./docker-ec2.sh` will create an EC2 instance.
2. Now install docker in Ec2 instance 

## Increase /var for docker
```shell
lsblk  -> to see the available disks and partitions
sudo growpart /dev/nvme0n1 4  -> to resize the existing partition to fill the available space
sudo lvextend -L +30G /dev/RootVG/varVol  -> to extend the /var logical volume by 30GB
sudo xfs_growfs /var  -> to resize the /var filesystem to utilize the additional space
df -hT -> to verify the new size of /var
```
```bash
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker ec2-user   # add ec2-user to docker group to run docker without sudo
Now logout and login again to apply the group changes

[ ec2-user@ip-172-31-73-171 ~ ]$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
`````


