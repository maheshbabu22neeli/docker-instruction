FROM nginx

EXPOSE 80

ADD https://raw.githubusercontent.com/maheshbabu22neeli/docker-instruction/refs/heads/main/README.md /tmp/

ADD sample.tar /tmp/

CMD ["nginx", "-g", "daemon off;"]