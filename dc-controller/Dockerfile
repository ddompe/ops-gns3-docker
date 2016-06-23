FROM ubuntu:xenial

# Customizations for GNS3 environment
RUN	echo 'Dpkg::Progress-Fancy "1";' | tee -a /etc/apt/apt.conf.d/99progressbar && \
        export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update && apt-get install -y \
	   isc-dhcp-client kbd xkb-data nano bzip2 keyboard-configuration \
           net-tools iptables apt-utils add-apt-key software-properties-common \
           inetutils-tools inetutils-ping inetutils-telnet inetutils-traceroute \
           inetutils-ftp knot-dnsutils dnsmasq isc-dhcp-server ifupdown sudo wget curl \
           openssh-client openssh-server iptables-persistent git \
	\
	&& add-apt-repository -y ppa:ansible/ansible && apt-get update && \
	   apt-get install -y ansible sshpass \
	&& useradd -s /bin/bash -U -G sudo -m -d /home/ubuntu -p $(echo "ubuntu" | openssl passwd -1 -stdin) ubuntu \
	\
        && echo 'export DEBIAN_FRONTEND=noninteractive'  >> /etc/profile.d/containers.sh \
        && echo '%sudo   ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers \
	&& mkdir -p /etc/network \
	&& sed -i -e 's/apparmor.service//g' /lib/systemd/system/ifup\@.service \
	&& systemctl enable ifup@eth0.service && systemctl enable ifup@eth1.service \
	&& rm -Rf /etc/systemd/system/getty.target.wants/
ADD dhcpd.conf /etc/dhcp/dhcpd.conf

CMD ["/sbin/init"]

