FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd && \
    yum search wget && \
    yum install wget -y && \
    yum install unzip -y

# change directory
RUN cd /var/www/html

# download webfiles
RUN wget https://github.com/moazelgandy2/Live-gamal-main.zip

# unzip folder
RUN unzip Live-gamal-main.zip

# copy files into html directory
RUN cp -r Live-gamal-main/* /var/www/html/

# remove unwanted folder
RUN rm -rf Live-gamal-main Live-gamal-main.zip

# exposes port 80 on the container
EXPOSE 80

# set the default application that will start when the container start
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]