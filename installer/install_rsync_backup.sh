#!/bin/sh
#
########################################################################
# rsync backup setup script
#
#  Maintainer: id774 <idnanashi@gmail.com>
#
#  v1.7 5/11,2012
#       Remove obsolete scripts.
#  v1.6 8/9,2010
#       Setup github-arc script.
#  v1.5 4/11,2010
#       Erase rsync_backup2.
#  v1.4 1/22,2009
#       Fix script path.
#  v1.3 9/11,2008
#       Split.
########################################################################

# Make Directory
test -d /etc/cron.weekday || sudo mkdir /etc/cron.weekday
test -d /etc/cron.weekend || sudo mkdir /etc/cron.weekend
test -d /var/log/sysadmin || sudo mkdir /var/log/sysadmin
sudo chmod 750 /var/log/sysadmin
sudo chown root:adm /var/log/sysadmin

# Rsync Backup Job
sudo cp $SCRIPTS/cron/bin/rsync_backup.sh /root/bin/rsync_backup.sh
sudo vi /root/bin/rsync_backup.sh
sudo chmod 700 /root/bin/rsync_backup.sh
sudo cp $SCRIPTS/cron/bin/rsync_backup /etc/cron.hourly/rsync_backup
sudo vi /etc/cron.hourly/rsync_backup
sudo chmod 750 /etc/cron.hourly/rsync_backup
sudo chown root:adm /etc/cron.hourly/rsync_backup
sudo touch /var/log/sysadmin/rsync_backup
sudo chmod 640 /var/log/sysadmin/rsync_backup
sudo chown root:adm /var/log/sysadmin/rsync_backup
sudo cp $SCRIPTS/cron/etc/logrotate.d/rsync_backup /etc/logrotate.d/rsync_backup
sudo chmod 644 /etc/logrotate.d/rsync_backup
sudo chown root:root /etc/logrotate.d/rsync_backup

# Edit crontab
# 50 23 * * 1-5 root cd / && run-parts --report /etc/cron.weekday
# 55 6  * * 6   root cd / && run-parts --report /etc/cron.weekend
sudo vi /etc/crontab

