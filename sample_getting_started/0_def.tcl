# The milkyway lib path and input/output path
set LIBR_PATH mw_proj/rail_getting_start
set RTL_PATH    rtl/swbk01.v
set MODULE_NAME SW_BANK_01
set VERSION     _v1
set GDS_PATH aprout/$MODULE_NAME$VERSION.gds

# The backend files provided by foundry
set TECHFILE_PATH /homes/lab.apps/vlsiapps/kits/tsmc/N65LP/digital/Back_End/milkyway/tcbn65lp_200a/techfiles/tsmcn65_9lmT2.tf
set REFLIB_PATH  {/homes/lab.apps/vlsiapps/kits/tsmc/N65LP/digital/Back_End/milkyway/tcbn65lp_200a/cell_frame/tcbn65lp \
                 /home/cxchen2/workspace/MKW_RAIL/mw_lib/rail65}
set TLUMAX_PATH /home/lab.apps/vlsiapps/kits/tsmc/N65LP/digital/Back_End/milkyway/tcbn65lp_200a/techfiles/tluplus/cln65lp_1p09m+alrdl_rcbest_top2.tluplus
set TLUMIN_PATH /home/lab.apps/vlsiapps/kits/tsmc/N65LP/digital/Back_End/milkyway/tcbn65lp_200a/techfiles/tluplus/cln65lp_1p09m+alrdl_rcworst_top2.tluplus
set TECH2ITF_PATH /home/lab.apps/vlsiapps/kits/tsmc/N65LP/digital/Back_End/milkyway/tcbn65lp_200a/techfiles/tluplus/star.map_9M
set STDCELL_DB_PATH /home/lab.apps/vlsiapps/kits/tsmc/N65LP/digital/Front_End/timing_power_noise/NLDM/tcbn65lp_200a
set RAILIB_DB_PATH /home/cxchen2/workspace/MKW_RAIL/mw_db
set MAP_PATH /home/lab.apps/vlsiapps/kits/tsmc/N65LP/digital/Back_End/milkyway/tcbn65lp_200a/gdsout_6X2Z.map

# The physical information set, including floorplan area and allowed routing metal
set TILE_HT 1.8
set TILE_WD 0.2
set CORE_ROW 7
set CORE_COL 39
set CORE_HT [expr {$TILE_HT * $CORE_ROW}]
set CORE_WD [expr {$TILE_WD * $CORE_COL}]
set TOP_RT_METAL M5

