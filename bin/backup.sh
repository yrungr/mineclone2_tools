#!/bin/sh

cd ~/.minetest/worlds/mineclone2
datetime=$(date '+%Y%m%d_%H%M%S')
backupfile="/var/www/html/mineclone2_backups/map_$datetime.sqlite"
sqlite3 map.sqlite ".backup $backupfile"
