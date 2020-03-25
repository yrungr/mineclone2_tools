#!/bin/sh

logfile='/home/mineclone2/backup.log'
datetime=$(date '+%Y%m%d_%H%M%S')
cd /home/mineclone2/.minetest/worlds

# backup directory
if [ -d "backup" ]; then
	rm -rf backup
fi
mkdir backup

# copy everything except the sqlite files
echo $(date '+%Y/%m/%d %H:%M:%S')" rsycing non-database files" >> $logfile
rsync -avr --exclude='auth.sqlite' --exclude='players.sqlite' --exclude='map.sqlite' mineclone2/ backup
echo $(date '+%Y/%m/%d %H:%M:%S')" done" >> $logfile


echo $(date '+%Y/%m/%d %H:%M:%S')" backing up auth.sqlite" >> $logfile
backup='false'
while [ $backup = 'false' ]
do
	if sqlite3 mineclone2/auth.sqlite ".backup backup/auth.sqlite"
	then
		echo $(date '+%Y/%m/%d %H:%M:%S')" backup complete" >> $logfile
		backup='true'
	else
		echo $(date '+%Y/%m/%d %H:%M:%S')" backup failed, retrying" >> $logfile
	fi
done

echo $(date '+%Y/%m/%d %H:%M:%S')" backing up map.sqlite" >> $logfile
backup='false'
while [ $backup = 'false' ]
do
	if sqlite3 mineclone2/map.sqlite ".backup backup/map.sqlite"
	then
		echo $(date '+%Y/%m/%d %H:%M:%S')" backup complete" >> $logfile
		backup='true'
	else
		echo $(date '+%Y/%m/%d %H:%M:%S')" backup failed, retrying" >> $logfile
	fi
done

echo $(date '+%Y/%m/%d %H:%M:%S')" backing up players.sqlite" >> $logfile
backup='false'
while [ $backup = 'false' ]
do
	if sqlite3 mineclone2/players.sqlite ".backup backup/players.sqlite"
	then
		echo $(date '+%Y/%m/%d %H:%M:%S')" backup complete" >> $logfile
		backup='true'
	else
		echo $(date '+%Y/%m/%d %H:%M:%S')" backup failed, retrying" >> $logfile
	fi
done


# compress
echo $(date '+%Y/%m/%d %H:%M:%S')" creating tar.gz" >> $logfile
tar -zcvf /home/mineclone2/minetest_backups/$datetime.tar.gz backup

# clean up
echo $(date '+%Y/%m/%d %H:%M:%S')" deleting temporary files" >> $logfile
rm -rf backup


echo $(date '+%Y/%m/%d %H:%M:%S')" done" >> $logfile
