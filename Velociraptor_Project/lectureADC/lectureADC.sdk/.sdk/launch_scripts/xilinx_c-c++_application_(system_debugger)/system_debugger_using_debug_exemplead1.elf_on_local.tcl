connect -url tcp:127.0.0.1:3121
source C:/Users/raf_0/Documents/Projet_Kraken_Local/Projet-S4/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.sdk/Top_hw_platform_2/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A77E4EA"} -index 0
loadhw -hw C:/Users/raf_0/Documents/Projet_Kraken_Local/Projet-S4/Projet-S4/Velociraptor_Project/lectureADC/lectureADC.sdk/Top_hw_platform_2/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo Z7 210351A77E4EA"} -index 0
stop
ps7_init
ps7_post_config
configparams force-mem-access 0