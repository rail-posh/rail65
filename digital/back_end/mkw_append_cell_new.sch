; Scheme

; do NOT open the lib for the current step

cmCreateLib
setFormField "Create Library" "Library Name" "CEL_FRAM/rail65"
setFormField "Create Library" "Technology File Name" "/home/lab.apps/vlsiapps/kits/tsmc/N65LP/digital/Back_End/milkyway/tcbn65lp_200a/techfiles/tsmcn65_9lmT2.tf"
setFormField "Create Library" "Set Case Sensitive" "1"
formOK "Create Library"

auStreamIn
; Set gds path
setFormField "Stream In Data File" "Stream File Name" "gds/rail65.gds"
setFormField "Stream In Data File" "Library Name" "CEL_FRAM/rail65"
setFormField "Stream In Data File" "Use Layer for Boundary" "1"
setFormField "Stream In Data File" "Boundary Layer" "108"
formOK "Stream In Data File"

dbSetCellPortTypes "CEL_FRAM/rail65" "*" '(("VDD" "inout" "Power")("VSS" "inout" "Ground")) #f

auExtractBlockagePinVia
setFormField "Extract Blockage" "Library Name" "CEL_FRAM/rail65"
setFormField "Extract Blockage" "Cell Name" "*"
formButton "Extract Blockage" "extractPin"
setFormField "Extract Blockage" "extract connectivity" "1"
setFormField "Extract Blockage" "Metal1 Text" "TEXT1"
setFormField "Extract Blockage" "Metal2 Text" "TEXT2"
setFormField "Extract Blockage" "Metal3 Text" "TEXT3"
setFormField "Extract Blockage" "Metal4 Text" "TEXT4"
formButton "Extract Blockage" "extractVia"
setFormField "Extract Blockage" "Extract Via Region Up To Metal" "6"
formOK "Extract Blockage"

auSetPRBdry
setFormField "Set PR Boundary" "Library Name" "CEL_FRAM/rail65"
setFormField "Set PR Boundary" "Left Boundary" "specify"
setFormField "Set PR Boundary" "Left From" "Origin (0,0)"
setFormField "Set PR Boundary" "Bottom Boundary" "specify"
setFormField "Set PR Boundary" "Bottom From" "Origin (0,0)"
setFormField "Set PR Boundary" "Height" "specify"
setFormField "Set PR Boundary" "Height Value" "1.8"
setFormField "Set PR Boundary" "Multiple (2x, 3x)" "based on marked cell type"
formOK "Set PR Boundary"

cmMarkCellType
setFormField "Mark Cell Type" "Library Name" "CEL_FRAM/rail65"
setFormField "Mark Cell Type" "Cell Name" "*"
setFormField "Mark Cell Type" "Cell Type" "std cell"
formOK "Mark Cell Type"

;---------------------------------------------------
; To check wether the tile information is integrated

cmMasterTilePattern
setFormField "Master Tile Pattern" "Master Name" "VCDP"
setFormField "Master Tile Pattern" "Library Name" "CEL_FRAM/rail65"
formButton "Master Tile Pattern" "find"
;formOK "Master Tile Pattern"

; To check whether the PIN is on track (Digital Pins have to be on track for DRC-free Routing)
geOpenLib
setFormField "Open Library" "Library Path" "CEL_FRAM"
setFormField "Open Library" "Library Name" "rail65"
formOK "Open Library"
axgDefineWireTracks
setFormField "Define Wire Track" "M2 Offset" "0.1000"
formOK "Define Wire Track"
axgCheckWireTrack
setFormField "Check Wire Track" "Library Name" "CEL_FRAM/rail65"
formOK "Check Wire Track"

