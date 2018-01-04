#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

WALLPAPER=$( ls $WALLPAPER_DIR | sort -R | head -1 )
WALLPAPER="$WALLPAPER_DIR/$WALLPAPER"

feh -u --no-fehbg --big-fill "$WALLPAPER" > /dev/null 2>&1
wal -c -i "$WALLPAPER"
