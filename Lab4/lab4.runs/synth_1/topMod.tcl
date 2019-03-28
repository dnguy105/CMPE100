# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/dnguy105/Desktop/lab4/lab4.cache/wt [current_project]
set_property parent.project_path C:/Users/dnguy105/Desktop/lab4/lab4.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/dnguy105/Desktop/lab4/lab4.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/new/m4_1.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/new/mux2_1.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/new/countUD3L.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/new/countUD5L.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/imports/new/m8_1e.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/new/Selector.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/new/RingCNT.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/imports/lab4/lab4_clks.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/new/edgeDect.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/imports/new/countUD16L.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/imports/new/hex7seg.v
  C:/Users/dnguy105/Desktop/lab4/lab4.srcs/sources_1/new/topMod.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/dnguy105/Desktop/lab4/Basys3_master.xdc
set_property used_in_implementation false [get_files C:/Users/dnguy105/Desktop/lab4/Basys3_master.xdc]


synth_design -top topMod -part xc7a35tcpg236-1


write_checkpoint -force -noxdef topMod.dcp

catch { report_utilization -file topMod_utilization_synth.rpt -pb topMod_utilization_synth.pb }