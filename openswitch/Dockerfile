FROM scratch
ADD openswitch-appliance-image.tar.gz /

# Customizations for GNS3 container environment
RUN  rm -Rf /etc/systemd/system/getty.target.wants/

CMD ["/sbin/init"]

