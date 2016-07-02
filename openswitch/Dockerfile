FROM scratch
ADD openswitch-appliance-image.tar.gz /

# Customizations for GNS3 container environment
RUN  rm -Rf /etc/systemd/system/getty.target.wants/

# This is the configuration partition
VOLUME /var/local

CMD ["/sbin/init"]

