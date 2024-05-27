
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
