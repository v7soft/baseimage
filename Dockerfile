FROM scratch

MAINTAINER V7Soft <mkostrikin@gmail.com>
ENV HOME /root
ADD https://github.com/tianon/docker-brew-ubuntu-core/raw/dist/trusty/ubuntu-trusty-core-cloudimg-amd64-root.tar.gz /
ADD src /tmp

RUN 	chmod -v +x /tmp/*sh && sync && sleep 1 \
	&& /tmp/prepare.sh \
	&& /tmp/system_services.sh \
	&& /tmp/utilities.sh \
	&& /tmp/consul.sh \
	&& /tmp/users_and_access.sh \
	&& /tmp/cleanup.sh

ENTRYPOINT ["/sbin/my_init","--"]
