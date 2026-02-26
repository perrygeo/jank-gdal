_default:
	@echo "Usage: make clean|check|compile|repl|run"

run: raster vector

raster:
	/usr/local/bin/jank \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags) \
		--module-path src \
		run-main gdal-tutorial.raster

vector:
	/usr/local/bin/jank \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags) \
		--module-path src \
		run-main gdal-tutorial.vector
 
clean:
	rm -rf ./target
	rm -rf /home/mperry/.cache/jank/*

check:
	/usr/local/bin/jank check-health \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags)

compile: clean
	/usr/local/bin/jank \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags) \
		--module-path src \
		compile gdal-tutorial.raster -o ./target/test

repl:
	/usr/local/bin/jank \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags) \
		--module-path src \
		repl

.PHONY: clean check compile repl run
