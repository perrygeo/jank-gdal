# Jank with libgdal

A demonstration of the [Jank](https://jank-lang.org/) programming language, a Clojure dialect that interoperates with C++.

Demonstrates basic access to raster datasets (e.g. GeoTIFF) 
using the [GDAL Raster API](https://gdal.org/en/stable/tutorials/raster_api_tut.html)
and to vector datasets (e.g. GeoJSON) using 
the [GDAL Vector API](https://gdal.org/en/stable/tutorials/vector_api_tut.html)

```bash
$ nix develop

$ make raster
/usr/local/bin/jank \
	-L/nix/store/cyf2ivklsmdw06lq9rzr5fa928k5pmm6-gdal-3.12.1/lib -lgdal \
	-I/nix/store/cyf2ivklsmdw06lq9rzr5fa928k5pmm6-gdal-3.12.1/include \
	--module-path src \
	run-main gdal-tutorial.raster
{:nbands 1, :height 78, :width 84, :path "data/slope.tif", :driver "GTiff", :projection "PROJCS[\"unnamed\",GEOGCS[\"GRS 1980(IUGG, 1980)\",DATUM[\"unknown\",SPHEROID[\"GRS80\",6378137,298.257222101]],PRIMEM[\"Greenwich\",0],UNIT[\"degree\",0.0174532925199433,AUTHORITY[\"EPSG\",\"9122\"]]],PROJECTION[\"Albers_Conic_Equal_Area\"],PARAMETER[\"latitude_of_center\",34],PARAMETER[\"longitude_of_center\",-120],PARAMETER[\"standard_parallel_1\",43],PARAMETER[\"standard_parallel_2\",48],PARAMETER[\"false_easting\",600000],PARAMETER[\"false_northing\",0],UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH]]"}

$ make vector
/usr/local/bin/jank \
	-L/nix/store/cyf2ivklsmdw06lq9rzr5fa928k5pmm6-gdal-3.12.1/lib -lgdal \
	-I/nix/store/cyf2ivklsmdw06lq9rzr5fa928k5pmm6-gdal-3.12.1/include \
	--module-path src \
	run-main gdal-tutorial.vector
{:nlayers 1, :layers [{:nfields 2, :fields [{:name "prop0", :type "String"} {:name "prop1", :type "String"}]}]}
```

To build `jank` on Linux,
follow the [build instructions](https://github.com/jank-lang/jank/blob/main/compiler+runtime/doc/build.md)
