build:
	@./bin/builder
	@component build

install:
	@npm install
	# npm shits a brick when trying to install scribe, so we'll do it by hand
	@mkdir -p node_modules/scribe
	@curl -L https://github.com/guardian/scribe/archive/v0.1.4.tar.gz | tar zx --strip 1 -C node_modules/scribe

dist: build dist-build dist-minify

dist-build:
	@component build -s scribe -o dist -n scribe

dist-minify: dist/scribe.js
	@curl -s \
		-d compilation_level=SIMPLE_OPTIMIZATIONS \
		-d output_format=text \
		-d output_info=compiled_code \
		--data-urlencode "js_code@$<" \
		http://closure-compiler.appspot.com/compile \
		> $<.tmp
	@mv $<.tmp dist/scribe.min.js

clean: node_modules/
	rm -rf node_modules

.PHONY: build
