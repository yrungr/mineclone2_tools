#!/bin/sh

executable="/home/yrungr/minetest-stable/bin/minetestserver"
configfile="/home/yrungr/minetest_mineclone2/mineclone2.conf"
logfile="/home/yrungr/mineclone2.log"

$executable --config $configfile --logfile $logfile
