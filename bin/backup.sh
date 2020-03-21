#!/bin/sh

datetime=$(date '+%Y%m%d_%H%M%S')
cd /home/mineclone2/.minetest/worlds

# backup directory
if [ -d "backup" ]; then
	rm -rf backup
fi
	mkdir backup

# copy everything except the sqlite files
rsync -avr --exclude='auth.sqlite' --exclude='players.sqlite' --exclude='map.sqlite' mineclone2/ backup

# copy the sqlite files
while [ ! -f backup/auth.sqlite ]
do
	sqlite3 mineclone2/auth.sqlite ".backup backup/auth.sqlite"
done
while [ ! -f backup/map.sqlite ]
do
	sqlite3 mineclone2/map.sqlite ".backup backup/map.sqlite"
done
while [ ! -f backup/players.sqlite ]
do
	sqlite3 mineclone2/players.sqlite ".backup backup/players.sqlite"
done

# compress
tar -zcvf /home/mineclone2/minetest_backups/$datetime.tar.gz backup

# clean up
rm -rf backup
