#!/bin/bash
cd ~/Pictures/nordic-wallpapers/wallpapers/
ls |sort -R |tail -n1 | while read file; do
    # Something involving $file, or you can leave
    # off the while to just get the filenames
    cp $file ~/.config/kitty/background_image.png
done
