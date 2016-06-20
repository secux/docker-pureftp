FROM debian:jessie
MAINTAINER Mircea Itu  "decemvre@gmail.com"

RUN apt-get update && apt-get install -y --no-install-recommends vsftpd
RUN apt-get clean

RUN useradd secu \
	&& echo secu:secu | chpasswd \
	&& usermod -a -G www-data secu \
	&& usermod -a -G ftp secu \
	&& mkdir /home/secu \
	&& chown -R secu:secu /home/secu

COPY ./conf/vsftpd.conf /etc

RUN mkdir -p /var/run/vsftpd/empty

VOLUME /etc

EXPOSE 21 30000 30001 30002 30003 30004 30005 30006 30007 30008 30009 30010 

CMD /usr/sbin/vsftpd