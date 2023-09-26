#!/bin/sh

bin/jekyll build --incremental
aws s3 sync ./files s3://dnd.metaspot.org/files --cache-control='max-age=60'
rsync --delete -avzr www/ admin@metaspot.org:/var/www/dnd.metaspot.org

