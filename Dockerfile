FROM v7soft/ubuntu:trusty

ADD src /tmp

MAINTAINER V7Soft <mkostrikin@gmail.com>

ENV HOME /root

RUN 	chmod -v +x /tmp/*sh && sync && sleep 1 \
	&& /tmp/prepare.sh \
	&& /tmp/system_services.sh \
	&& /tmp/utilities.sh \
	&& /tmp/consul.sh \
	&& /tmp/users_and_access.sh \
	&& /tmp/cleanup.sh

ENTRYPOINT ["/sbin/my_init","--"]
