FROM ubuntu:14.04
MAINTAINER Stéphane Croze <admin@lesderniersdelaclasse.pw>

ADD .gnupg /root/.gnupg

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive && \
	apt-get install -y 	pass \
						oathtool
	
ADD ./src /opt/src

RUN cp /opt/src/password-store.sh /usr/bin/pass
RUN cp /opt/src/completion/pass.bash-completion /etc/bash_completion.d/password-store


CMD ["bash"]
