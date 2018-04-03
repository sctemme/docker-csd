FROM centos:7

ENV container docker

# Copy in CSD bits
WORKDIR /tmp/install
ADD csd-bits /tmp/install
RUN yum -y update
RUN yum -y install sysvinit-tools

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done ); \
rm -f /lib/systemd/system/multi-user.target.wants/*; \
rm -f /etc/systemd/system/*.wants/*; \
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*; \
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]

RUN ./install.sh

# Run install.  This creates user and group

# Create your own account and add it to group nfast
RUN adduser sctemme
RUN usermod -a -G nfast sctemme

# Expost host-side source tree to container

# Command so the container stays up
CMD ["/usr/sbin/init"]
