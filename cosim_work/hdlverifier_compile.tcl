# catch errors using try/on error
try {

# ======== Create Project ======== 
create_project -force wizprj hdlverifier_wizard_project


# ======== Add source files to project ========
set SRC1 {C:/demo/nexty_basic_simulink/hdl_src}
add_file "$SRC1/fir4_legacy.v"


# ======== Elaboration options ========
set_property -name {xelab.snapshot} -value {mwcosim_query} -objects [get_filesets sim_1]

# ======== Compile and Elaborate ========
# Compile, elaborate, and start a sim image in order to auto determine
# the top module and its interface information.
set_property source_mgmt_mode All [current_project]
set_property SOURCE_SET sources_1 [get_filesets sim_1]
update_compile_order -fileset sim_1
launch_simulation

# ======== Gather Design Info ========
# DO NOT EDIT.  Needed for gathering top-level design information.
set TOP_MODULE [get_property top [get_fileset sim_1]]
set INPORT_NAMES [get_objects -filter { type == in_port }]
set OUTPORT_NAMES [get_objects -filter { type == out_port }]
report_scope [current_scope] > hdlverifier_tcl_query_info.txt
foreach {port} [concat $INPORT_NAMES $OUTPORT_NAMES] { report_object $port >> hdlverifier_tcl_query_info.txt}

} on error { errMsg errDetails } {
    puts "CAUGHT ERROR: $errMsg, $errDetails"
    exit 11
}

exit
