vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_protocol_checker_v2_0_3
vlib questa_lib/msim/axi_vip_v1_1_3
vlib questa_lib/msim/processing_system7_vip_v1_0_5
vlib questa_lib/msim/dist_mem_gen_v8_0_12
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/fifo_generator_v13_2_2
vlib questa_lib/msim/lib_fifo_v1_0_11
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_quad_spi_v3_2_16
vlib questa_lib/msim/axi_gpio_v2_0_19
vlib questa_lib/msim/proc_sys_reset_v5_0_12
vlib questa_lib/msim/xlslice_v1_0_1
vlib questa_lib/msim/xlconcat_v2_1_1
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_17
vlib questa_lib/msim/axi_data_fifo_v2_1_16
vlib questa_lib/msim/axi_crossbar_v2_1_18
vlib questa_lib/msim/axi_protocol_converter_v2_1_17

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_3 questa_lib/msim/axi_protocol_checker_v2_0_3
vmap axi_vip_v1_1_3 questa_lib/msim/axi_vip_v1_1_3
vmap processing_system7_vip_v1_0_5 questa_lib/msim/processing_system7_vip_v1_0_5
vmap dist_mem_gen_v8_0_12 questa_lib/msim/dist_mem_gen_v8_0_12
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap fifo_generator_v13_2_2 questa_lib/msim/fifo_generator_v13_2_2
vmap lib_fifo_v1_0_11 questa_lib/msim/lib_fifo_v1_0_11
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_quad_spi_v3_2_16 questa_lib/msim/axi_quad_spi_v3_2_16
vmap axi_gpio_v2_0_19 questa_lib/msim/axi_gpio_v2_0_19
vmap proc_sys_reset_v5_0_12 questa_lib/msim/proc_sys_reset_v5_0_12
vmap xlslice_v1_0_1 questa_lib/msim/xlslice_v1_0_1
vmap xlconcat_v2_1_1 questa_lib/msim/xlconcat_v2_1_1
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_17 questa_lib/msim/axi_register_slice_v2_1_17
vmap axi_data_fifo_v2_1_16 questa_lib/msim/axi_data_fifo_v2_1_16
vmap axi_crossbar_v2_1_18 questa_lib/msim/axi_crossbar_v2_1_18
vmap axi_protocol_converter_v2_1_17 questa_lib/msim/axi_protocol_converter_v2_1_17

vlog -work xilinx_vip -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0 -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_3 -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/03a9/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_3 -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/b9a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_5 -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_3 -L axi_vip_v1_1_3 -L processing_system7_vip_v1_0_5 -L xilinx_vip "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_pmod_bridge_0_0/src/pmod_concat.v" \
"../../../bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_pmod_bridge_0_0/sim/PmodOLED_pmod_bridge_0_0.v" \

vlog -work dist_mem_gen_v8_0_12 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/simulation/dist_mem_gen_v8_0.v" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_2 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -64 -93 \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_11 -64 -93 \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_16 -64 -93 \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_quad_spi_0_0/sim/PmodOLED_axi_quad_spi_0_0.vhd" \

vcom -work axi_gpio_v2_0_19 -64 -93 \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_gpio_0_0/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_PmodOLED_0_0/src/PmodOLED_axi_gpio_0_0/sim/PmodOLED_axi_gpio_0_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/43ae/src/PmodOLED.v" \
"../../../bd/design_1/ip/design_1_PmodOLED_0_0/sim/design_1_PmodOLED_0_0.v" \

vcom -work proc_sys_reset_v5_0_12 -64 -93 \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_rst_ps7_0_50M_0/sim/design_1_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_pmod_bridge_0_0/sim/PmodGPIO_pmod_bridge_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_axi_gpio_0_0/sim/PmodGPIO_axi_gpio_0_0.vhd" \

vlog -work xlslice_v1_0_1 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_xlslice_0_0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_xlslice_0_0/sim/PmodGPIO_xlslice_0_0.v" \
"../../../bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_xlslice_0_1/sim/PmodGPIO_xlslice_0_1.v" \
"../../../bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_xlslice_0_2/sim/PmodGPIO_xlslice_0_2.v" \
"../../../bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_xlslice_t_0_0/sim/PmodGPIO_xlslice_t_0_0.v" \

vlog -work xlconcat_v2_1_1 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_xlconcat_0_0/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_PmodGPIO_0_0/src/PmodGPIO_xlconcat_0_0/sim/PmodGPIO_xlconcat_0_0.v" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/86fc/src/PmodGPIO.v" \
"../../../bd/design_1/ip/design_1_PmodGPIO_0_0/sim/design_1_PmodGPIO_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ip/design_1_axi_gpio_0_0/sim/design_1_axi_gpio_0_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_gpio_1_0/sim/design_1_axi_gpio_1_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_17 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/6020/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_16 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/247d/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_18 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/15a3/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/design_1/ipshared/339b/hdl/myip_v1_0_S00_AXI.vhd" \
"../../../bd/design_1/ipshared/339b/hdl/myip_v1_0.vhd" \
"../../../bd/design_1/ip/design_1_myip_0_1/sim/design_1_myip_0_1.vhd" \
"../../../bd/design_1/sim/design_1.vhd" \
"../../../bd/design_1/ipshared/667b/hdl/myIO_IP_v1_0_S00_AXI.vhd" \
"../../../bd/design_1/ipshared/667b/hdl/myIO_IP_v1_0.vhd" \
"../../../bd/design_1/ip/design_1_myIO_IP_0_0/sim/design_1_myIO_IP_0_0.vhd" \
"../../../bd/design_1/ip/design_1_myIO_IP_1_0/sim/design_1_myIO_IP_1_0.vhd" \
"../../../bd/design_1/ip/design_1_myIO_IP_2_0/sim/design_1_myIO_IP_2_0.vhd" \
"../../../bd/design_1/ip/design_1_myIO_IP_3_0/sim/design_1_myIO_IP_3_0.vhd" \
"../../../bd/design_1/ip/design_1_myIO_IP_4_0/sim/design_1_myIO_IP_4_0.vhd" \

vlog -work axi_protocol_converter_v2_1_17 -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ccfb/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/5bb9/hdl/verilog" "+incdir+../../../../lectureADC.srcs/sources_1/bd/design_1/ipshared/70fd/hdl" "+incdir+C:/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

