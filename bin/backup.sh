#!/bin/sh

cd /home/yrungr/.minetest/worlds

# make copies of the live databases
sqlite3 mineclone2/auth.sqlite ".backup mineclone2/auth.sqlite.backup"
sqlite3 mineclone2/map.sqlite ".backup mineclone2/map.sqlite.backup"
sqlite3 mineclone2/players.sqlite ".backup mineclone2/players.sqlite.backup"

# backup everything except the live databases
name=$(date '+%Y%m%d_%H%M%S')
tar -zcvf /var/www/html/minetest/$name.tar.gz --exclude='auth.sqlite' --exclude='map.sqlite' --exclude='players.sqlite' mineclone2
