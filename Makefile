_default:
	@echo "Usage: make clean|check|compile|repl|run"

run:
	/usr/local/bin/jank \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags) \
		--module-path src \
		run-main gdal-tutorial.raster
 
clean:
	rm -rf ./target

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
