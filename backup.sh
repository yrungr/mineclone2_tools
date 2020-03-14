#!/bin/sh

cd /home/yrungr/.minetest/worlds

# make copies of the live databases
sqlite3 world/auth.sqlite ".backup world/auth.sqlite.backup"
sqlite3 world/map.sqlite ".backup world/map.sqlite.backup"
sqlite3 world/players.sqlite ".backup world/players.sqlite.backup"

# backup everything except the live databases
name=$(date '+%Y-%m-%d_%H:%M:%S')
tar -zcvf /var/www/html/minetest/$name.tar.gz --exclude='auth.sqlite' --exclude='map.sqlite' --exclude='players.sqlite' world
