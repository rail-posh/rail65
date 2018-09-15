# Verify the placement and routing
save_mw_cel
verify_lvs

# Export the GDS-II file
set_write_stream_options -child_depth 0 -skip_ref_lib_cells \
			 -map_layer $MAP_PATH
write_stream -format gds -cells  $MODULE_NAME $GDS_PATH

close_mw_cel
