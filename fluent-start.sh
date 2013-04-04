#!/bin/sh
#
########################################################################
# fluent startup script
#  $1 = fluent
#  $2 = fluent-conf path
#
#  Maintainer: id774 <idnanashi@gmail.com>
#
#  v0.1 4/4,2013
#       First.
########################################################################

test -n "$1" && FLUENTD=$1/bin/fluentd
test -n "$1" || FLUENTD=`which fluentd`
test -n "$1" && FLUENT_CAT=$1/bin/fluent-cat
test -n "$1" || FLUENT_CAT=`which fluent-cat`
test -n "$2" && FLUENT_CONF=$2
test -n "$2" || FLUENT_CONF=~/.fluent

$FLUENTD --setup $FLUENT_CONF
$FLUENTD -c $FLUENT_CONF/fluent.conf -vv &
echo '{"json":"message"}' | $FLUENT_CAT debug.test
