FROM centos

# Copy in CSD bits
WORKDIR /tmp/install
ADD csd-bits /tmp/install
RUN yum -y update
RUN yum -y install sysvinit-tools
RUN ./install.sh

# Run install.  This creates user and group

# Create your own account and add it to group nfast
RUN adduser sctemme
RUN usermod -a -G nfast sctemme

# Expost host-side source tree to container

# Command so the container stays up
CMD ["/opt/nfast/sbin/hardserver"]
