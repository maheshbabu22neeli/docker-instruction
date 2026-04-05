ARG VERSION

FROM almalinux:${VERSION:-8}

RUN dnf install nginx -y

LABEL COURSE="Docker for Beginners" \
      AUTHOR="MAHESH BABU"

ENV APP_ENV=dev \
    APP_DEBUG=false \
    DOCKER=true

## These args values cannot be able to view (env) inside the container.
ARG ARG_APP_ENV="dev"
ARG ARG_APP_DEBUG=false
ARG ARG_DOCKER=true

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
