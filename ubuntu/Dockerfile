FROM ubuntu:xenial

# Customizations for GNS3 environment
RUN	echo 'Dpkg::Progress-Fancy "1";' | tee -a /etc/apt/apt.conf.d/99progressbar && \
        export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update && apt-get install -y \
	   isc-dhcp-client kbd xkb-data vim-common bzip2 keyboard-configuration \
           net-tools iptables apt-utils add-apt-key software-properties-common \
           inetutils-tools \
	\
	&& add-apt-repository -y ppa:ansible/ansible && apt-get update && \
	   apt-get install -y ansible sshpass
	&& useradd -s /bin/bash -U -G sudo -m -d /home/ubuntu -p ubuntu ubuntu \
	\
	&& rm -Rf /etc/systemd/system/getty.target.wants/ \

CMD ["/sbin/init"]

