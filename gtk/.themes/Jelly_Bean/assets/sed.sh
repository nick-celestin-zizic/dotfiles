#!/bin/sh
sed -i \
         -e 's/#304568/rgb(0%,0%,0%)/g' \
         -e 's/#f7f7f7/rgb(100%,100%,100%)/g' \
    -e 's/#304568/rgb(50%,0%,0%)/g' \
     -e 's/#f7f7f7/rgb(0%,50%,0%)/g' \
     -e 's/#304568/rgb(50%,0%,50%)/g' \
     -e 's/#f7f7f7/rgb(0%,0%,50%)/g' \
	"$@"