
 # Create the library, if already exist can open it
create_mw_lib \
	-technology $TECHFILE_PATH \
	-mw_reference_library  $REFLIB_PATH \
	-open $LIBR_PATH

set_tlu_plus_files 	-max_tluplus $TLUMAX_PATH \
			-min_tluplus $TLUMIN_PATH \
		 	-tech2itf_map $TECH2ITF_PATH

lappend search_path $STDCELL_DB_PATH
lappend search_path $RAILIB_DB_PATH

# For simplicty we choose the typical case
set_app_var target_library "tcbn65lptc.db"
set_app_var link_library "tcbn65lptc.db rail65.db"

read_verilog -top $MODULE_NAME -allow_black_box $RTL_PATH
create_floorplan -control_type width_and_height \
		 -core_width  $CORE_WD \
		 -core_height $CORE_HT \
		 -bottom_io2core 0.1 -top_io2core 0.1 -left_io2core 0.2
set_ignored_layers -min_routing M2 -max_routing_layer $TOP_RT_METAL

check_legality
