run:
	/home/mperry/src/jank/compiler+runtime/build/jank \
		$(shell gdal-config --libs) \
		$(shell gdal-config --cflags) \
		--module-path src run-main main

.PHONY: run
