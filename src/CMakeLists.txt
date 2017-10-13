set(SRCS
  starspan2.cc
	starspan_grass.cc
	starspan_rasterize.cc
	starspan_dup_pixel.cc
	starspan_csv2.cc
	starspan_minirasters2.cc
	starspan_minirasterstrip2.cc
	starspan_stats.cc
	starspan_countbyclass.cc
	starspan_update_csv.cc
	starspan_csv.cc
	starspan_csv_raster_field.cc
	starspan_gen_envisl.cc
	starspan_minirasters.cc
	starspan_jtstest.cc
	starspan_util.cc
	starspan_dump.cc
	starspan_tuct2.cc
	csv/Csv.cc
	csv/CsvOutput.cc
	jts/jts.cc
	raster/Raster_gdal.cc
	rasterizers/LineRasterizer.cc
	stats/Stats.cc
	traverser/traverser.cc
	traverser/polyqt.cc
	traverser/pixset.cc
	util/Progress.cc
  vector/Vector_ogr.cc
      )

# the following snippet assigns the local filename to __SRCNAME__
# for each of the files contained in the 'SRCS' list
#
# i.e. rather than using __FILE__, which might expand to
# d:/Some_dir/some_subdir/filename.F90, we can use
# __SRCNAME__, which expands to 'filename.F90'
#
foreach(f IN LISTS SRCS)
  get_filename_component(b ${f} NAME)
  set_source_files_properties(${f} PROPERTIES
    COMPILE_DEFINITIONS "__SRCNAME__=\"${b}\"")
endforeach()

add_executable(starspan ${SRCS})

set_target_properties(starspan
      PROPERTIES COMPILE_DEFINITIONS "${PREPROCESSOR_DEFINES}")
