
JSBUNDLE   := output/index.js
HTMLBUNDLE := output/index.html

build: $(JSBUNDLE) $(HTMLBUNDLE)

$(JSBUNDLE): bower_components $(shell find src)
	pulp browserify --optimise --source-map m --to $@

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