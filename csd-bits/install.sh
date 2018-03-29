#! /bin/sh

echo "Working in `pwd` " | tee /tmp/logfile

find . -type f -name \*.tar -print -exec tar -C / -xf {} \; | tee -a /tmp/logfile

/opt/nfast/sbin/install
