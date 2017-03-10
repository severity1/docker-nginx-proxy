FROM nginx

COPY conf.d/default.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install -y \
  telnet \
  curl \
  htop \
  vim

EXPOSE 80 8080 7080
