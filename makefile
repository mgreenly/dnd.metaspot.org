
.PHONY: render
docs:
	quarto render

.PHONY: clean
clean:
	rm -rf _site

.PHONY: serve
serve:
	serve _site

.PHONY: publish
publish:
	rsync \
  	--copy-links \
  	--delete \
  	-avzr _site/ \
  	--exclude www/files/images \
  	admin@metaspot.org:/var/www/dnd.metaspot.org

.PHONY: sso
sso:
	aws sso login --no-browser

.PHONY: backup
backup:
	aws s3 sync assets s3://dnd.metaspot.org/assets

.PHONY: restore
restore:
	aws s3 sync s3://dnd.metaspot.org/assets assets
