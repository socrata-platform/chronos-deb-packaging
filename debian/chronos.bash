#!/bin/bash
###############################################################################
# Chronos run script
###############################################################################

me=$(readlink -n -f $0)
bin=$(dirname $me)
process=$(basename $me)

##- JAVA OPTIONS ==============================================================
HEAP=${HEAP:-1024M}
PERMGEN=${HEAP:-256M}

#- Heap space -----------------------------------------------------------------
echo "==> HEAP memory used: $HEAP"
JAVA_OPTS="$JAVA_OPTS -Xmx$HEAP -Xms$HEAP"
#
#- PermGen space --------------------------------------------------------------
echo "==> PERMGEN memory used: $PERMGEN"
JAVA_OPTS="$JAVA_OPTS -XX:PermSize=$PERMGEN -XX:MaxPermSize=$PERMGEN"
#
#- CLASSPATH ------------------------------------------------------------------
JAVA_OPTS="$JAVA_OPTS -Djava.library.path=${JAVA_LIBPATH:-/usr/lib/} -cp /etc/chronos:/opt/chronos/lib/chronos.jar:/usr/lib/chronos/lib/*"
#
#- SpyMemcached logging implementation ----------------------------------------
JAVA_OPTS="$JAVA_OPTS -Dnet.spy.log.LoggerImpl=net.spy.memcached.compat.log.Log4JLogger"
#
#- Java Management eXtensions -------------------------------------------------
JMX_PORT=${JMX_PORT:-9004}
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=$JMX_PORT"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
#
##-============================================================================

echo "========================================================================"
echo

##- Launch Viadeo platform ====================================================
#
echo -e "Launch Chronos"
exec -a $process -- java $JAVA_OPTS com.airbnb.scheduler.Main $@
#
##-============================================================================
