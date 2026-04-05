# Docker

## Commands
``` shell
`docker ps` - List all running containers/instances
`docker ps -a` - List all containers/instances (including stopped ones)
`docker images` - List all docker images
`docker pull <image-name>` - Pull a docker image from docker hub, ex: `docker pull nginx`
`docker create <image-name>` - Will not create a running container. It creates a container in a stopped state., ex: `docker create nginx`
`docker start <container-id>` - Start a container, ex: `docker start 1a2b3c4d5e6f`
`docker run <image-name>` -  a container in one command, ex: `docker run nginx`
`docker rm <container-id>` - Remove the container, ex: `docker rm 1a2b3c4d5e6f`
`docker rm <container-id> -f` - If container already running, Remove it forcefully, ex: `docker rm 1a2b3c4d5e6f -f`
`docker rmi <image-name>` - Remove a docker image, ex: `docker rmi nginx`
```

## Notes
- `docker run nginx` - This commands will check whether the image is present locally or not. If not present,
it will pull the image from docker hub and then create a container and start it. This command will run in foreground.
- `docker run -d nginx` - This command will run the container in detached mode, which means it will run in the background
and you will get the container ID as output.
- Container is nothing but another process in linux.
- `docker run -p 80:80 nginx` - This command will run the container and map the port 80 of the container to port 80 of the host machine.
So you can access the nginx server running inside the container by accessing `http://localhost:80` on your host machine.
- In the above command, first 80 is host port and second 80 is container port. We can modified host ports as we wish, but 
container port should be same as the port on which the application inside the container is running. For nginx, it is 80.
ex: `docker run -p 8080:80 nginx` will map host port 8080 to container port 80.
- When we opne the browser with `http://3.237.39.73:8080/` we will see the nginx welcome page, which means our nginx server
is running successfully inside the container and we have mapped the port correctly.
- `docker exec -it <container-id> bash` - This command will open an interactive terminal inside the container, ex: `docker exec -it 1a2b3c4d5e6f bash`
- Update any file inside the container `cd /usr/share/nginx/html`
`root@de79fbfe5739:/usr/share/nginx/html# echo "<h1>I am from Docker container</h1>" > index.html` - This command will update the index.html file inside the container with the given content.
Now invoke the same uRL in browser as `http://3.237.39.73:8080/index.html`
- `docker inspect <container-id>` - This command will give you the details of the container, ex: `docker inspect 1a2b3c4d5e6f`
- `docker stats <container-id>` - This command will give you the real-time statistics of the container, like memory, cpu, and etc ex: `docker stats 1a2b3c4d5e6f`
- `docker logs <container-id>` - This command will give you the logs of the container, ex: `docker logs 1a2b3c4d5e6f`
- `docker stop <container-id>` - This command will stop the container, ex: `docker stop 1a2b3c4d5e6f`
- `docker restart <container-id>` - This command will restart the container, ex: `docker restart 1a2b3c4d5e6f`
- `docker run -d -p 80:80 --name frontend nginx` - This command will run the container in detached mode, map port 80 of host to port 80 of container
and give the name "frontend" to the container. So you can access the container using its name instead of container ID, 
ex: `docker exec -it frontend bash`, `docker stop frontend`
- `docker ps -a -q` - This command will list all the container ID's
- `docker rm -f `docker ps -a -q`` - This command will forcefully remove all the containers, ex: `docker rm -f $(docker ps -a -q)`


## Dockerfile
- Dockerfile is a text file that contains the instructions to build our own docker image.
- We can create our own docker image by writing a Dockerfile and then building it using `docker build` command.

- docker hub login `docker login -u <username> -p <password>` - This command will login to docker hub using the provided username and password.

### FROM
- `FROM` is used to specify the base OS for our docker image. It is the first instruction in a Dockerfile.
- `docker build -t from:1.0.0 .` - This command will build a docker image with the name "from" and tag "1.0.0" using the Dockerfile present in the current directory (.)
- `docker tag from:1.0.0 <username>/from:1.0.0` - This command will tag the docker image "from:1.0.0" with the name "<username>/from:1.0.0" so that we can push it to docker hub.
- `docker push <username>/from:1.0.0` - This command will push the docker image "from:1.0.0" to docker hub under the specified username.


### RUN
- `RUN` is used to install packages or configure images and execute a command during the build process of the docker image.
- ex: `RUN apt-get update && apt-get install -y nginx` - This command will update the package list and install nginx inside the docker image during the build process.

### CMD
- `CMD` is used to specify the command that will be executed when a container is run. It will not execute during the build process,
it will execute when we run the container using `docker run` command.


### RUN vs CMD

### LABEL
- `LABEL` is used to add metadata to the docker image. It is a key-value pair that can be used to describe the image, like author, version, description, etc.
- ex: `LABEL maintainer="John Doe" version="1.0.0" description="This is a sample docker image"` - This command will add the specified metadata to the docker image.
- ex: `docker images --filter "LABEL=AUTHOR=MAHESH BABU"` - This command will filter the docker images based on the specified label.


### EXPOSE
- `EXPOSE` is useful to display the port information of the container.
  It will not really open the port, but provides information only to the users about which port the application inside the container is running on, and as a good practise.
- ex when: `EXPOSE 80`
- Build : `docker build -t expose:1.0.0 .`
- Run : `docker run -d -p 80:80 expose:1.0.0`
- Access : `http://localhost:80` or `http://<host-ip>:80`
- Run : `docker run -d -p 8080:80 expose:1.0.0`
- Access : `http://localhost:8080` or `http://<host-ip>:8080`

### ENV
- `ENV` this instruction sets an environment variable that a running container will use.
- `ENV APP_ENV=dev \
    APP_DEBUG=false \
    DOCKER=true`
- After build and run, we can see the env variables by using `docker exec -it f1 bash`
````
ex: [ ec2-user@ip-172-31-65-245 ~/docker-instruction/ENV ]$ docker exec -it f1 bash
  [root@f1341aa3cb8f /]# env
  HOSTNAME=f1341aa3cb8f
  PWD=/
  HOME=/root
  LANG=C.utf8
  APP_ENV=dev
  APP_DEBUG=false
  TERM=xterm
  LESSOPEN=||/usr/bin/lesspipe.sh %s
  SHLVL=1
  DOCKER=true
  DEBUGINFOD_IMA_CERT_PATH=/etc/keys/ima:
  PATH=/root/.local/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin 
  _=/usr/bin/env
  ````

### COPY
- `COPY` this instruction tells the builder to copy files from the host and put them into the container image.
- ex: `COPY index.html /usr/share/nginx/html/` - This command will copy the index.html file from the host machine to container.
```shell
$ docker exec -it b9 bash
root@b9db6cdb126d:/# cd /usr/share/nginx/html/
root@b9db6cdb126d:/usr/share/nginx/html# ls
50x.html  index.html
root@b9db6cdb126d:/usr/share/nginx/html# cat index.html
<h1> I am from COPY instruction </h1>root@b9db6cdb126d:/usr/share/nginx/html#
root@b9db6cdb126d:/usr/share/nginx/html#
```

### ADD
- `ADD` this instruction is similar to COPY, but it has some 2 additional features:
1. It can fetch the content directly from Internet. 
2. It can extract the compressed files (like .tar, .tar.gz) while copying to the container.
```shell

[ ec2-user@ip-172-31-65-245 ~/docker-instruction/ADD ]$ docker exec -it 95 bash
root@950948adace4:/# cd /tmp
root@950948adace4:/tmp# ls -la
total 4
drwxrwxrwt 1 root   root     24 Apr  3 06:48 .
drwxr-xr-x 1 root   root     39 Apr  3 06:48 ..
-rw------- 1 root   root   1209 Jan  1  1970 README.md
drwxr-xr-x 2 197609 197609   40 Apr  3 06:46 sample-dir
root@950948adace4:/tmp# cd sample-dir/
root@950948adace4:/tmp/sample-dir# ls
file1.txt  file2.txt
root@950948adace4:/tmp/sample-dir#

```

### ENTRYPOINT
- `ENTRYPOINT` is used to provide the command executed by the container when it is started.
- It is so similar to CMD command but we can override `CMD` at runtime, where as `ENTRYPOINT` is not overridden at runtime.
- For best results we can use both `ENTRYPOINT` and `CMD` together in a Dockerfile.
The `ENTRYPOINT` will specify the executable to run, and the `CMD` will provide the default arguments to that executable.
This way, we can override the arguments at runtime without changing the executable.
```shell
FROM nginx

# CMD ["ping", "google.com"]
# this CMD can be override by passing the RUN command as `docker run <image_name> ping facebook.com`.

# ENTRYPOINT ["ping", "google.com"]
# this can't be overfide and if we try to override it adds as an argument to the entrypoint.
# For example, `docker run <image_name> ping google.com`
# It will take the ENTRY POINT coomand as `ping google.com ping facebook.com`.

CMD ["google.com"]

ENTRYPOINT ["ping"]
# This will work as the entry point is ping and the CMD is google.com, so it will run `ping google.com`.
# docker run <image_name> facebook.com
# This will run `ping facebook.com` as the entry point is ping and the CMD is facebook.com.
```

### USER
- We never use root user to run the container.
- `USER` this instruction is used to specify the user that will be used to run the container.
- ex: `USER roboshop` - This command will set the user as roboshop to run the container. So all the commands will be executed as nginx user inside the container.
- If we want to switch back to root user, we can use `USER root` command in the Dockerfile.
- This avoids the security risks of running the container as root user, and also it is a good practice to run the container with a non-root user.


### WORKDIR
- `WORKDIR` this instruction is used to set the working directory for the container.
It is the directory where all the commands will be executed inside the container.
- ex: `WORKDIR /app` - This command will set the working directory as /app inside the container.
So all the commands will be executed inside the /app directory of the container.
- If the specified directory does not exist, it will be created automatically. 
So we don't need to worry about creating the directory before setting it as the working directory.


### ARG
- `ARG` this instruction can be first instruction in the docker file to supply the version for base image.
- `ARG` cannot access at runtime, it is only used at build image.
- `ARG` is used to define a variable that can be passed at build time to the Dockerfile.
- ex: `ARG VERSION=1.0.0` - This command will define an argument named VERSION with a default value of 1.0.0
- We can override the default value of the argument at build time by using `--build-arg` flag with the `docker build` command.
- ex: `docker build -t arg:1.0.0 --build-arg VERSION=9 .`
- ex: 
```dockerfile
ARG VERSION
FROM almalinux:${VERSION}
```