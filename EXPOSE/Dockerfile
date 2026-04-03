FROM almalinux:9
RUN dnf install nginx -y

LABEL COURSE="Docker for Beginners" \
      AUTHOR="MAHESH BABU"

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
