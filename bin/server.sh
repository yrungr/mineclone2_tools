#!/bin/sh

executable="/home/yrungr/minetest-stable/bin/minetestserver"
configfile="/home/yrungr/minetest_mineclone2/mineclone2.conf"
logfile="/var/www/html/mineclone2.txt"

$executable --config $configfile --logfile $logfile --world mineclone2
