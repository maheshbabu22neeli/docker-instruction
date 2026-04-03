FROM almalinux:9
RUN dnf install nginx -y

LABEL COURSE="Docker for Beginners" \
      AUTHOR="MAHESH BABU"

ENV APP_ENV=dev \
    APP_DEBUG=false \
    DOCKER=true

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
