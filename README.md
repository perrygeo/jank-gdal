# Jank with libgdal

A demonstration of the [Jank](https://jank-lang.org/) programming language, a Clojure dialect that interoperates with C++.
The goal: a reproducible development environment to run a jank application accessing
a raster dataset (GeoTIFF) using the [GDAL Raster API](https://gdal.org/en/stable/tutorials/raster_api_tut.html)

[`src/main.jank`](https://github.com/perrygeo/jank-gdal/blob/main/src/main.jank) contains a Clojure/Jank program which opens the raster and prints metadata to stdout.

The short version

```bash
$ nix develop
$ make
/home/mperry/src/jank/compiler+runtime/build/jank \
	-L/nix/store/pz5k46fv1cv0y4bq3qhcx0s9mwjgf9p0-gdal-3.11.0/lib -lgdal \
	-I/nix/store/pz5k46fv1cv0y4bq3qhcx0s9mwjgf9p0-gdal-3.11.0/include \
	--module-path src run-main main
Raster		data/slope.tif
Size		84 x 78 x 1 band(s)
Projection	PROJCS["unnamed",GEOGCS["GRS 1980(IUGG, 1980)",DATUM["unknown",SPHEROID["GRS80",6378137,298.257222101]],PRIMEM["Greenwich",0],UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]]],PROJECTION["Albers_Conic_Equal_Area"],PARAMETER["latitude_of_center",34],PARAMETER["longitude_of_center",-120],PARAMETER["standard_parallel_1",43],PARAMETER["standard_parallel_2",48],PARAMETER["false_easting",600000],PARAMETER["false_northing",0],UNIT["metre",1,AUTHORITY["EPSG","9001"]],AXIS["Easting",EAST],AXIS["Northing",NORTH]] 
```

Caveat: as you see in the `Makefile` output, I'm using a custom `jank` executable.
Follow the [build instructions](https://github.com/jank-lang/jank/blob/main/compiler+runtime/doc/build.md) 
and hardcode the path for now, eventually Jank will land in nixpkgs!
