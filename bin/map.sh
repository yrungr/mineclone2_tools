#!/bin/sh

# copy files to /tmp
while [ ! -f /tmp/map.sqlite ]
do
	sqlite3 /home/mineclone2/.minetest/worlds/mineclone2/map.sqlite ".backup /tmp/map.sqlite"
done
cp /home/mineclone2/.minetest/worlds/mineclone2/world.mt /tmp

# generate map
/home/mineclone2/minetestmapper/minetestmapper -i /tmp/ -o /var/www/html/mineclone2_map/map.png --colors /home/mineclone2/minetestmapper/mineclone2mapper/colors.txt --zoom 1
