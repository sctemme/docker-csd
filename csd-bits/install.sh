#! /bin/sh -x

echo "Working in `pwd` " | tee /tmp/logfile

find . -type f -name \*.tar -print -exec tar -C / -xf {} \; | tee -a /tmp/logfile

inst=/opt/nfast/sbin/install

[ -x $inst ] && $inst | tee -a /tmp/logfile

exit 0
