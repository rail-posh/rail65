
# This part place all the cells manually
set_undoable_attribute [get_cells -all sw05] origin {0.200 0.1}
set_undoable_attribute [get_cells -all sw05] is_fixed {1}
set_undoable_attribute [get_cells -all sw03] origin {0.200 3.7}
set_undoable_attribute [get_cells -all sw03] is_fixed {1}
set_undoable_attribute [get_cells -all sw02] origin {0.200 7.3}
set_undoable_attribute [get_cells -all sw02] is_fixed {1}
set_undoable_attribute [get_cells -all sw00] origin {0.200 10.9}
set_undoable_attribute [get_cells -all sw00] is_fixed {1}

set_undoable_attribute [get_cells -all sw04] orientation {FS}
set_undoable_attribute [get_cells -all sw04] is_placed {1}
set_undoable_attribute [get_cells -all sw04] is_fixed {1}
set_undoable_attribute [get_cells -all sw04] origin {0.2 3.700}
set_undoable_attribute [get_cells -all sw01] orientation {FS}
set_undoable_attribute [get_cells -all sw01] is_placed {1}
set_undoable_attribute [get_cells -all sw01] is_fixed {1}
set_undoable_attribute [get_cells -all sw01] origin {0.2 10.900}

set_undoable_attribute [get_cells -all b01] orientation {S}
set_undoable_attribute [get_cells -all b01] is_placed {1}
set_undoable_attribute [get_cells -all b01] is_fixed {1}
set_undoable_attribute [get_cells -all b01] origin {3.2 7.3}

# This part place the PIN manually
set obj [get_terminal {"POS"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {POS}
set_attribute -quiet $obj bbox {{4.6 6.25} {4.7 6.35}}

set obj [get_terminal {"NEG"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {NEG}
set_attribute -quiet $obj bbox {{7.2 6.25} {7.3 6.35}}

set obj [get_terminal {"SW"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW}
set_attribute -quiet $obj bbox {{0 6.25} {0.1 6.35}}

# This part routing the power and analog manually
derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS

create_power_straps  -direction vertical  -start_at 0.700 -nets  {VSS}  -layer M2 -width 0.3 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 1.200 -nets  {VDD}  -layer M2 -width 0.3 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 4.600 -nets  {POS}  -layer M4 -width 0.41 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 7.200 -nets  {NEG}  -layer M4 -width 0.41 -look_inside_std_cells


# This part routes the digital signal automatically
set_route_mode_options -zroute true
set_route_opt_strategy -search_repair_loop 8

set_route_zrt_common_options -post_detail_route_redundant_via_insertion high
 			-concurrent_redundant_via_mode reserve_space
 			-concurrent_redundant_via_effort_level high
  			-eco_route_concurrent_redundant_via_effort_level high 
			-eco_route_concurrent_redundant_via_mode reserve_space
route_detail


# route_opt

# This part label the pins for LVS
create_text {POS} -layer {TEXT4} -height 0.1 -origin {4.6 6.4}
create_text {NEG} -layer {TEXT4} -height 0.1 -origin {7.2 6.4}
create_text {SW} -layer {TEXT3} -height 0.1 -origin {0.2 6.3}

create_text {VSS} -layer {TEXT2} -height 0.3 -origin {0.7 2}
create_text {VDD} -layer {TEXT2} -height 0.3 -origin {1.2 2}

# This part fill the rest area to pass DRC 
insert_stdcell_filler -cell_without_metal "FILL4 FILL2 FILL1"	\
	-respect_keepout 	\
	-connect_to_power VDD  -connect_to_ground VSS
