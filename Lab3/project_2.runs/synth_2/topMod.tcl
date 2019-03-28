# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/dnguy105/Desktop/Lab3/project_2/project_2.cache/wt [current_project]
set_property parent.project_path C:/Users/dnguy105/Desktop/Lab3/project_2/project_2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/dnguy105/Desktop/Lab3/project_2/project_2.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/dnguy105/Desktop/Lab3/project_2/project_2.srcs/sources_1/new/m4_1e.v
  C:/Users/dnguy105/Desktop/Lab3/project_2/project_2.srcs/sources_1/new/fullAdd.v
  C:/Users/dnguy105/Desktop/Lab3/project_2/project_2.srcs/sources_1/new/segAdd.v
  C:/Users/dnguy105/Desktop/Lab3/project_2/project_2.srcs/sources_1/new/m2_1x8.v
  C:/Users/dnguy105/Desktop/Lab3/project_2/project_2.srcs/sources_1/new/m8_1e.v
  C:/Users/dnguy105/Desktop/Lab3/project_2/lab3_digsel.v
  C:/Users/dnguy105/Desktop/Lab3/project_2/project_2.srcs/sources_1/new/AddSub8.v
  C:/Users/dnguy105/Desktop/Lab3/project_2/project_2.srcs/sources_1/new/hex7seg.v
  C:/Users/dnguy105/Desktop/Lab3/project_2/project_2.srcs/sources_1/new/topMod.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/dnguy105/Desktop/Lab3/project_2/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/dnguy105/Desktop/Lab3/project_2/Basys3_Master.xdc]


synth_design -top topMod -part xc7a35tcpg236-1


write_checkpoint -force -noxdef topMod.dcp

catch { report_utilization -file topMod_utilization_synth.rpt -pb topMod_utilization_synth.pb }