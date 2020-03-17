#!/bin/sh

cd ~/.minetest/worlds/mineclone2
backupfile=map_$(date '+%Y%m%d_%H%M%S').sqlite
sqlite3 mineclone2/map.sqlite ".backup $backupfile"
