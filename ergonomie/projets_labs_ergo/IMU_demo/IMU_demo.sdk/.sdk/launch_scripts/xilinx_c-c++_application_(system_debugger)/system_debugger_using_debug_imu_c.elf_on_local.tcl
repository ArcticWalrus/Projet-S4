connect -url tcp:127.0.0.1:3121
source D:/Projet-S4/ergonomie/projets_labs_ergo/IMU_demo/IMU_demo.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A77C2BA"} -index 0
loadhw -hw D:/Projet-S4/ergonomie/projets_labs_ergo/IMU_demo/IMU_demo.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A77C2BA"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo Z7 210351A77C2BA"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo Z7 210351A77C2BA"} -index 0
dow D:/Projet-S4/ergonomie/projets_labs_ergo/IMU_demo/IMU_demo.sdk/imu_c/Debug/imu_c.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo Z7 210351A77C2BA"} -index 0
con
