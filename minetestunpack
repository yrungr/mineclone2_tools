#!/bin/sh
if [ -z $1 ]; then
    echo "this script needs to be given a thing to unpack"
	exit
fi

cp $1 /home/user/.minetest/worlds
cd /home/user/.minetest/worlds/
rm -rf mineclone2
tar -xvf $1
mv mineclone2/auth.sqlite.backup mineclone2/auth.sqlite
mv mineclone2/map.sqlite.backup mineclone2/map.sqlite
mv mineclone2/players.sqlite.backup mineclone2/players.sqlite
