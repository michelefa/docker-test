
#Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
#FROM ubuntu:16.04
From nginx

# Install Nginx.
#RUN add-apt-repository -y ppa:nginx/stable 
RUN apt-get update
RUN apt-get install -y nginx
RUN rm -rf /var/lib/apt/lists/*
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
#RUN chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]
copy ./index.html /usr/share/nginx/html/index.html

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
