#!/bin/sh


rsync --delete -avzr www/ admin@metaspot.org:/var/www/dnd.metaspot.org
