#!/bin/sh

cd ~/.minetest/worlds/mineclone2
datetime=$(date '+%Y%m%d_%H%M%S')
sqlite3 map.sqlite ".backup /var/www/html/mineclone2_backups/$datetime_map.sqlite"
