# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.cache/wt [current_project]
set_property parent.project_path D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_repo_paths {
  d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/ip_repo/myIO_IP_1.0
  d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/ip_repo/myip_1.0
  d:/DEV/Git_Kraken/demo1701/Downloads/FichiersAtelier1/Pmod_vivado-library-2018.2-1
  d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/Pmod_vivado-library-2018.2-1
} [current_project]
set_property ip_output_repo d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/imports/AD1/AD7476_mef.vhd
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/imports/AD1/Ctrl_AD1.vhd
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/imports/AD1/Synchro_Horloges.vhd
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/imports/new/Velocyraptor_package.vhd
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/imports/new/Traitement.vhd
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/imports/new/compteur_signal.vhd
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.vhd
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/imports/new/detectzero.vhd
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/imports/new/magnetic.vhd
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/imports/new/tamponcirc.vhd
  D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/imports/AD1/Top.vhd
}
add_files D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/design_1.bd
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_processing_system7_0_0/design_1_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_pmod_bridge_0_0/PmodOLED_pmod_bridge_0_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_pmod_bridge_0_0/src/pmod_concat_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/PmodOLED_axi_quad_spi_0_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/PmodOLED_axi_quad_spi_0_0.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/PmodOLED_axi_quad_spi_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/PmodOLED_axi_quad_spi_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_gpio_0_0/PmodOLED_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_gpio_0_0/PmodOLED_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_gpio_0_0/PmodOLED_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/design_1_PmodOLED_0_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_rst_ps7_0_50M_0/design_1_rst_ps7_0_50M_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_rst_ps7_0_50M_0/design_1_rst_ps7_0_50M_0.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_pmod_bridge_0_0/PmodGPIO_pmod_bridge_0_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_pmod_bridge_0_0/src/pmod_concat_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_axi_gpio_0_0/PmodGPIO_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_axi_gpio_0_0/PmodGPIO_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_axi_gpio_0_0/PmodGPIO_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodGPIO_0_0/design_1_PmodGPIO_0_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_1_0/design_1_axi_gpio_1_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_1_0/design_1_axi_gpio_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_axi_gpio_1_0/design_1_axi_gpio_1_0.xdc]
set_property used_in_implementation false [get_files -all d:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/ip/design_1_auto_pc_0/design_1_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/sources_1/bd/design_1/design_1_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/constrs_1/imports/AD1/Atelier3_Constraintes.xdc
set_property used_in_implementation false [get_files D:/DEV/Git_Kraken/Velociraptor/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.srcs/constrs_1/imports/AD1/Atelier3_Constraintes.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Top -part xc7z010clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
