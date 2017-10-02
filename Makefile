
JSBUNDLE   := output/index.js
HTMLBUNDLE := output/index.html
PULP_OPTS := 

build: $(JSBUNDLE) $(HTMLBUNDLE)

watch:
	rm -f $(JSBUNDLE)
	make build PULP_OPTS='--watch --then "make $(HTMLBUNDLE); say ok; osascript -e \"tell application \\\"Google Chrome\\\" to reload active tab of window 1\"" --else "say Oops"'

$(JSBUNDLE): bower_components $(shell find src)
	pulp $(PULP_OPTS) browserify --optimise --source-map m --to $@

$(HTMLBUNDLE): src/index.html
	mkdir -p $$(dirname "$@")
	cp $^ $@

bower_components: bower.json
	bower install
	touch $@

clean:
	rm -rf output

deepclean: clean
	rm -rf bower_components

.PHONY: clean deepclean build