#!/bin/sh

set -e

alert_log="$ORACLE_BASE/diag/rdbms/orcl/$ORACLE_SID/trace/alert_$ORACLE_SID.log"

monitor() {
    tail -F -n 0 $1 | while read line; do echo -e "$2: $line"; done
}

lsnrctl start
monitor $alert_log alertlog &
MON_ALERT_PID=$!
/scripts/startup_db.sh
trap /scripts/shutdown_db.sh SIGTERM
wait $MON_ALERT_PID

