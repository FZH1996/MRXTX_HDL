


source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project.tcl

localbd_project_create eridan_zc706
adi_project_files eridan_zc706 [list \
  "system_top.v" \
  "system_constr.xdc" ]

adi_project_run eridan_zc706


