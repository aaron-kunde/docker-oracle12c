#!/bin/sh

set -e

sqlplus / as sysdba <<-EOF |
	shutdown immediate;
	exit 0
EOF

# Monitoring the output of sqlplus is important, to avoid race condition.
# This way it is ensured, the above sqlplus command is done.
# Alternative could be a sleep of 1 sec.
while read line; do echo -e "sqlplus: $line"; done
