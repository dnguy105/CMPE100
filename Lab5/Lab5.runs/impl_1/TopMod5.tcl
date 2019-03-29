proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7a35tcpg236-1
  set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/dnguy105/Desktop/Lab5/Lab5.cache/wt [current_project]
  set_property parent.project_path C:/Users/dnguy105/Desktop/Lab5/Lab5.xpr [current_project]
  set_property ip_output_repo C:/Users/dnguy105/Desktop/Lab5/Lab5.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet C:/Users/dnguy105/Desktop/Lab5/Lab5.runs/synth_1/TopMod5.dcp
  read_xdc C:/Users/dnguy105/Desktop/Lab5/Lab5.srcs/constrs_1/imports/lab4/Basys3_master.xdc
  link_design -top TopMod5 -part xc7a35tcpg236-1
  write_hwdef -file TopMod5.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force TopMod5_opt.dcp
  report_drc -file TopMod5_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force TopMod5_placed.dcp
  report_io -file TopMod5_io_placed.rpt
  report_utilization -file TopMod5_utilization_placed.rpt -pb TopMod5_utilization_placed.pb
  report_control_sets -verbose -file TopMod5_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force TopMod5_routed.dcp
  report_drc -file TopMod5_drc_routed.rpt -pb TopMod5_drc_routed.pb -rpx TopMod5_drc_routed.rpx
  report_methodology -file TopMod5_methodology_drc_routed.rpt -rpx TopMod5_methodology_drc_routed.rpx
  report_timing_summary -warn_on_violation -max_paths 10 -file TopMod5_timing_summary_routed.rpt -rpx TopMod5_timing_summary_routed.rpx
  report_power -file TopMod5_power_routed.rpt -pb TopMod5_power_summary_routed.pb -rpx TopMod5_power_routed.rpx
  report_route_status -file TopMod5_route_status.rpt -pb TopMod5_route_status.pb
  report_clock_utilization -file TopMod5_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force TopMod5_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force TopMod5.mmi }
  write_bitstream -force -no_partial_bitfile TopMod5.bit 
  catch { write_sysdef -hwdef TopMod5.hwdef -bitfile TopMod5.bit -meminfo TopMod5.mmi -file TopMod5.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

