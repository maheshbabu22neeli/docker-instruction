FROM almalinux:9

# root access is required to run any install packages or create user
RUN dnf install nginx -y
RUN useradd roboshop

# switch user atleast one step before running the application
USER roboshop
CMD ["nginx", "-g", "daemon off;"]
