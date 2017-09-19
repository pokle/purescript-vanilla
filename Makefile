
JSBUNDLE   := output/index.js
HTMLBUNDLE := output/index.html
PULP_OPTS := 

build: $(JSBUNDLE) $(HTMLBUNDLE)

watch:
	rm -f $(JSBUNDLE)
	make build PULP_OPTS='--watch --then "say good; osascript -e \"tell application \\\"Google Chrome\\\" to reload active tab of window 1\"" --else "say bad"'

$(JSBUNDLE): bower_components $(shell find src)
	pulp $(PULP_OPTS) browserify --optimise --source-map m --to $@

$(HTMLBUNDLE): src/index.html
	cp $^ $@

bower_components: bower.json
	bower install
	touch $@

clean:
	rm -rf output

deepclean: clean
	rm -rf bower_components

.PHONY: clean deepclean build