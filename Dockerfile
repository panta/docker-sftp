FROM ubuntu:bionic
MAINTAINER Marco Pantaleoni <marco.pantaleoni@gmail.com>

ENV LANG=C.UTF-8
ENV LC_ALL=C
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -q update && \
	apt-get install -q -y --no-install-recommends \
		openssh-server mcrypt \
	&& mkdir /var/run/sshd \
	&& chmod 0755 /var/run/sshd \
	&& mkdir -p /data/uploads \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& mkdir /ssh/

ADD start.sh /usr/local/bin/start.sh
ADD sshd_config /etc/ssh/sshd_config

VOLUME ["/data/uploads"]
EXPOSE 22

CMD ["/bin/bash", "/usr/local/bin/start.sh"]
