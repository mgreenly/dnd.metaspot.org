
.PHONY: docs render clean serve publish sso backup restore list

docs:
	quarto render

clean:
	rm -rf _site

serve:
	serve _site

publish:
	rsync \
  	--copy-links \
  	--delete \
  	-avzr _site/ \
  	--exclude www/files/images \
  	admin@metaspot.org:/var/www/dnd.metaspot.org

sso:
	aws sso login --no-browser

backup:
	aws s3 sync assets s3://dnd.metaspot.org/assets

restore:
	aws s3 sync s3://dnd.metaspot.org/assets assets
