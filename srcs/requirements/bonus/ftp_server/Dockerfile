FROM alpine:3.17

WORKDIR /app

ARG FTP_USER \
	FTP_PASSWORD

RUN apk -U upgrade && \
    apk add --no-cache \
	vsftpd \
	dumb-init

RUN	mkdir -p /home/vsftpd/

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN adduser -D -h /home/vsftpd/${FTP_USER} -s /bin/false ${FTP_USER} && \
	echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

RUN	mkdir -p /home/${FTP_USER}/public_ftp && \
	chown -R ${FTP_USER}:${FTP_USER} /home/vsftpd && \
	echo local_root=/home/vsftpd >> /etc/vsftpd/vsftpd.conf && \
	echo ${FTP_USER} >> /etc/vsftpd.chroot_list

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

EXPOSE 21 20

CMD [ "vsftpd" ,"/etc/vsftpd/vsftpd.conf" ]