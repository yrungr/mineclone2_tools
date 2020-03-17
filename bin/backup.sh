#!/bin/sh

datetime=$(date '+%Y%m%d_%H%M%S')
cd ~/.minetest/worlds

# backup directory
if [ -d "backup" ]; then
  rm -rf backup
  mkdir backup
fi

# copy everything except the sqlite files
rsync -avr --exclude='auth.sqlite' --exclude='players.sqlite' --exclude='map.sqlite' mineclone2/ backup

# copy the sqlite files
sqlite3 mineclone2/auth.sqlite ".backup backup/auth.sqlite"
sqlite3 mineclone2/map.sqlite ".backup backup/map.sqlite"
sqlite3 mineclone2/players.sqlite ".backup backup/players.sqlite"

# compress
tar -zcvf ~/minetest_backups/$datetime.tar.gz --exclude='auth.sqlite' backup

# copy just the map sqlite to http://178.62.65.106/mineclone2_backups/
backupfile="/var/www/html/mineclone2_backups/"$datetime"_map.sqlite"
cp backup/map.sqlite $backupfile
