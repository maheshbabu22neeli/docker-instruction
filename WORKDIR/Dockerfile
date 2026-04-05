FROM almalinux:9

# root access is required to run any install packages or create user
RUN dnf install nginx -y

RUN mkdir /app
#RUN cd /app # In docker cd command will not work, we have to use WORKDIR to change the directory
WORKDIR /app

RUN useradd roboshop
# switch user atleast one step before running the application
USER roboshop
CMD ["nginx", "-g", "daemon off;"]
