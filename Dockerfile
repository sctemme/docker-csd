FROM centos

# Copy in CSD bits
WORKDIR /tmp/install
ADD csd-bits /tmp/install
RUN ./install.sh

# Run install.  This creates user and group

# Create your own account and add it to group nfast

# Expost host-side source tree to container
