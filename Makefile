JANK = $(shell which jank)

_default:
	@echo "Usage: make clean|check|compile|repl|run"

run: raster vector

raster:
	$(JANK) \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags) \
		--module-path src \
		run-main gdal-tutorial.raster

vector:
	$(JANK) \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags) \
		--module-path src \
		run-main gdal-tutorial.vector
 
clean:
	rm -rf ./target
	rm -rf /home/mperry/.cache/jank/*

check:
	$(JANK) check-health \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags)

compile: clean
	$(JANK) \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags) \
		--module-path src \
		compile gdal-tutorial.raster -o ./target/test

repl:
	$(JANK) \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags) \
		--module-path src \
		repl

.PHONY: clean check compile repl run
