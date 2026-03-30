# docker-instruction
This repo explains each instruction from the docker file


## Pre-requisites
1. We will use EC2 instance to run our docker containers. `./docker-ec2.sh` will create an EC2 instance.
2. Now install docker in Ec2 instance
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


## Docker Commands
``` shell
`docker ps` - List all running containers/instances
`docker ps -a` - List all containers/instances (including stopped ones)
`docker images` - List all docker images
`docker pull <image-name>` - Pull a docker image from docker hub, ex: `docker pull nginx`
`docker create <image-name>` - Will not create a running container. It creates a container in a stopped state., ex: `docker create nginx`
`docker start <container-id>` - Start a container, ex: `docker start 1a2b3c4d5e6f`
`docker run <image-name>` - Pull + Create + start a container in one command, ex: `docker run nginx`
`docker rm <container-id>` - Remove the container, ex: `docker rm 1a2b3c4d5e6f`
`docker rm <container-id> -f` - If container already running, Remove it forcefully, ex: `docker rm 1a2b3c4d5e6f -f`
`docker rmi <image-name>` - Remove a docker image, ex: `docker rmi nginx`
```