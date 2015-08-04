FROM ubuntu:14.04
MAINTAINER Stéphane Croze <admin@lesderniersdelaclasse.pw>

ADD .gnupg /root/.gnupg

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive && \
	apt-get install -y 	pass \
						oathtool
	
ADD ./password-store /opt/password-store

RUN cp /opt/password-store/src/password-store.sh /usr/bin/pass
RUN cp /opt/password-store/src/completion/pass.bash-completion /etc/bash_completion.d/password-store


CMD ["bash"]
