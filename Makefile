PULP_OPTS := 

build: examples

watch:
	make build PULP_OPTS='--watch --then "make $(HTMLBUNDLE); say ok; osascript -e \"tell application \\\"Google Chrome\\\" to reload active tab of window 1\"" --else "say Oops"'

examples: $(shell ls src/Examples/ | sed 's/^/dist\/example-/')
	@echo You can now open one of the following examples: 
	@find dist -name '*.html' | sed 's/^/ - /'

dist/example-%: bower_components $(shell find src)
	mkdir -p "$@"
	cp src/Examples/$*/*.html "$@"
	pulp $(PULP_OPTS) browserify --optimise --source-map m --main Examples.$* --to $@/$*.js

$(HTMLBUNDLE): src/index.html
	mkdir -p $$(dirname "$@")
	cp $^ $@

bower_components: bower.json
	bower install
	touch $@

clean:
	rm -rf output dist

deepclean: clean
	rm -rf bower_components

.PHONY: clean deepclean build examples