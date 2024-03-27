# Various scripts
Random assortment of useful scripts and snippets.

## ssh-keybinds.sh
Adding this to your bashrc (or other rc files)\
will add support for windows input keybinds like CTRL + Backspace or Control + Arrow Keys.\
Especially useful if you use Windows Terminal to ssh into linux systems.

## image_backup.sh
Simple image backup script.\
Used on a raspberry pi, edit line 22 and 31 to stop/start specific services\
Must be run as su\
`sudo crontab -e` -> `0 7 * * 1 /home/pi/scripts/image_backup.sh`

## clear_plex-image-cache.sh
A workaround to fix a plexmediaserver PhotoTranscoder storage leak.\
Should be run in plex usercontext or as su.\
`find "/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Cache/PhotoTranscoder" -name "*.jpg" -type f -mtime +5 -delete`\
Crontab I use: `0 4 * * *`

## Commands I want to remember...
Revert a cloned repo to a previous commit: git reset --hard [hash]
Switch branch: git checkout my-feature (-b creates a new branch.)
