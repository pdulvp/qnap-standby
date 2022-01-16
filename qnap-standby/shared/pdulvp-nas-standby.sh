#!/bin/sh
CONF=/etc/config/qpkg.conf
QPKG_NAME="pdulvp-nas-standby"
QPKG_ROOT=`/sbin/getcfg $QPKG_NAME Install_Path -f ${CONF}`
APACHE_ROOT=`/sbin/getcfg SHARE_DEF defWeb -d Qweb -f /etc/config/def_share.info`
export QNAP_QPKG=$QPKG_NAME


case "$1" in
  start)
    ENABLED=$(/sbin/getcfg $QPKG_NAME Enable -u -d FALSE -f $CONF)
    if [ "$ENABLED" != "TRUE" ]; then
        echo "$QPKG_NAME is disabled."
        exit 1
    fi
    : ADD START ACTIONS HERE
    echo "Start $QPKG_NAME.sh" 					>>/tmp/$QPKG_NAME.log
    echo "\nCurrent directory: `pwd`\n" 		>>/tmp/$QPKG_NAME.log
    echo "\nCurrent QPKG_ROOT: \n$QPKG_ROOT\n" 	>>/tmp/$QPKG_NAME.log
    [ -p /tmp/HD_Station.ServicePipe ] && echo "$QPKG_NAME start" > /tmp/HD_Station.ServicePipe
    ;;

  stop)
    : ADD STOP ACTIONS HERE
    echo "Stop $QPKG_NAME.sh" 					>>/tmp/$QPKG_NAME.log
    [ -p /tmp/HD_Station.ServicePipe ] && echo "$QPKG_NAME stop" > /tmp/HD_Station.ServicePipe &
    ;;

  restart)
    $0 stop
    $0 start
    ;;

  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac

exit 0
