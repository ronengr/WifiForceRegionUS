#!/system/bin/sh
MODDIR=${0%/*}

CONTRY_COUDE="US"
RETRY_INTERVAL=2 #in seconds
MAX_RETRY=20

retry=${MAX_RETRY}
while [[ "$retry" -gt "0" ]] && [[ "$(cmd wifi get-country-code)" != *$CONTRY_COUDE ]]; do
    sleep ${RETRY_INTERVAL}
    #echo "currert $(cmd wifi get-country-code) boot $(getprop sys.boot_completed) retry $retry" >> $MODDIR/log.txt
    cmd wifi force-country-code enabled $CONTRY_COUDE
    let retry--
done
