FROM almalinux:9

RUN dnf install nginx -y

RUN rm -rf /usr/share/nginx/html/index.html

# This instruction runs when someone use this image
ONBUILD COPY index.html /usr/share/nginx/html/index.html

CMD ["nginx", "-g", "daemon off;"]

## Ibuild the images as `docker build -t onbuild:1.0.0 .`