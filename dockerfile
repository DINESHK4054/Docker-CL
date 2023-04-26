FROM registry.redhat.io/rhscl/httpd-24-rhel7
USER root
#USER 1001

# Create a working directory
#RUN mkdir /app
#WORKDIR /app
RUN mkdir -p /etc/httpd/cert
# Copy web application
#COPY myapp.war /app/myapp.war
COPY server.crt /etc/httpd/cert
COPY server.key /etc/httpd/cert
COPY ca-bundle.crt /etc/httpd/cert
# Copy configuration files
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY ssl.conf /etc/httpd/conf.d/ssl.conf

# Expose ports 80 and 443 for Apache
EXPOSE 80
EXPOSE 443

#CMD ["/opt/rh/httpd24/root/usr/sbin/httpd", "-D", "FOREGROUND"]
