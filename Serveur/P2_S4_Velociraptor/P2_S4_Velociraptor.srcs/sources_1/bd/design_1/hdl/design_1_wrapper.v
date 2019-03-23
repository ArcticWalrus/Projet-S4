//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Sat Mar 23 16:31:01 2019
//Host        : DESKTOP-L2Q9UI1 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    Pmod_8LD_pin10_io,
    Pmod_8LD_pin1_io,
    Pmod_8LD_pin2_io,
    Pmod_8LD_pin3_io,
    Pmod_8LD_pin4_io,
    Pmod_8LD_pin7_io,
    Pmod_8LD_pin8_io,
    Pmod_8LD_pin9_io,
    Pmod_OLED_pin10_io,
    Pmod_OLED_pin1_io,
    Pmod_OLED_pin2_io,
    Pmod_OLED_pin3_io,
    Pmod_OLED_pin4_io,
    Pmod_OLED_pin7_io,
    Pmod_OLED_pin8_io,
    Pmod_OLED_pin9_io,
    i_data_echantillon_0,
    i_sw_tri_i,
    o_data_out_0,
    o_leds_tri_o,
    o_rgb_led_tri_o);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  inout Pmod_8LD_pin10_io;
  inout Pmod_8LD_pin1_io;
  inout Pmod_8LD_pin2_io;
  inout Pmod_8LD_pin3_io;
  inout Pmod_8LD_pin4_io;
  inout Pmod_8LD_pin7_io;
  inout Pmod_8LD_pin8_io;
  inout Pmod_8LD_pin9_io;
  inout Pmod_OLED_pin10_io;
  inout Pmod_OLED_pin1_io;
  inout Pmod_OLED_pin2_io;
  inout Pmod_OLED_pin3_io;
  inout Pmod_OLED_pin4_io;
  inout Pmod_OLED_pin7_io;
  inout Pmod_OLED_pin8_io;
  inout Pmod_OLED_pin9_io;
  input [11:0]i_data_echantillon_0;
  input [3:0]i_sw_tri_i;
  output [31:0]o_data_out_0;
  output [3:0]o_leds_tri_o;
  output [2:0]o_rgb_led_tri_o;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire Pmod_8LD_pin10_i;
  wire Pmod_8LD_pin10_io;
  wire Pmod_8LD_pin10_o;
  wire Pmod_8LD_pin10_t;
  wire Pmod_8LD_pin1_i;
  wire Pmod_8LD_pin1_io;
  wire Pmod_8LD_pin1_o;
  wire Pmod_8LD_pin1_t;
  wire Pmod_8LD_pin2_i;
  wire Pmod_8LD_pin2_io;
  wire Pmod_8LD_pin2_o;
  wire Pmod_8LD_pin2_t;
  wire Pmod_8LD_pin3_i;
  wire Pmod_8LD_pin3_io;
  wire Pmod_8LD_pin3_o;
  wire Pmod_8LD_pin3_t;
  wire Pmod_8LD_pin4_i;
  wire Pmod_8LD_pin4_io;
  wire Pmod_8LD_pin4_o;
  wire Pmod_8LD_pin4_t;
  wire Pmod_8LD_pin7_i;
  wire Pmod_8LD_pin7_io;
  wire Pmod_8LD_pin7_o;
  wire Pmod_8LD_pin7_t;
  wire Pmod_8LD_pin8_i;
  wire Pmod_8LD_pin8_io;
  wire Pmod_8LD_pin8_o;
  wire Pmod_8LD_pin8_t;
  wire Pmod_8LD_pin9_i;
  wire Pmod_8LD_pin9_io;
  wire Pmod_8LD_pin9_o;
  wire Pmod_8LD_pin9_t;
  wire Pmod_OLED_pin10_i;
  wire Pmod_OLED_pin10_io;
  wire Pmod_OLED_pin10_o;
  wire Pmod_OLED_pin10_t;
  wire Pmod_OLED_pin1_i;
  wire Pmod_OLED_pin1_io;
  wire Pmod_OLED_pin1_o;
  wire Pmod_OLED_pin1_t;
  wire Pmod_OLED_pin2_i;
  wire Pmod_OLED_pin2_io;
  wire Pmod_OLED_pin2_o;
  wire Pmod_OLED_pin2_t;
  wire Pmod_OLED_pin3_i;
  wire Pmod_OLED_pin3_io;
  wire Pmod_OLED_pin3_o;
  wire Pmod_OLED_pin3_t;
  wire Pmod_OLED_pin4_i;
  wire Pmod_OLED_pin4_io;
  wire Pmod_OLED_pin4_o;
  wire Pmod_OLED_pin4_t;
  wire Pmod_OLED_pin7_i;
  wire Pmod_OLED_pin7_io;
  wire Pmod_OLED_pin7_o;
  wire Pmod_OLED_pin7_t;
  wire Pmod_OLED_pin8_i;
  wire Pmod_OLED_pin8_io;
  wire Pmod_OLED_pin8_o;
  wire Pmod_OLED_pin8_t;
  wire Pmod_OLED_pin9_i;
  wire Pmod_OLED_pin9_io;
  wire Pmod_OLED_pin9_o;
  wire Pmod_OLED_pin9_t;
  wire [11:0]i_data_echantillon_0;
  wire [3:0]i_sw_tri_i;
  wire [31:0]o_data_out_0;
  wire [3:0]o_leds_tri_o;
  wire [2:0]o_rgb_led_tri_o;

  IOBUF Pmod_8LD_pin10_iobuf
       (.I(Pmod_8LD_pin10_o),
        .IO(Pmod_8LD_pin10_io),
        .O(Pmod_8LD_pin10_i),
        .T(Pmod_8LD_pin10_t));
  IOBUF Pmod_8LD_pin1_iobuf
       (.I(Pmod_8LD_pin1_o),
        .IO(Pmod_8LD_pin1_io),
        .O(Pmod_8LD_pin1_i),
        .T(Pmod_8LD_pin1_t));
  IOBUF Pmod_8LD_pin2_iobuf
       (.I(Pmod_8LD_pin2_o),
        .IO(Pmod_8LD_pin2_io),
        .O(Pmod_8LD_pin2_i),
        .T(Pmod_8LD_pin2_t));
  IOBUF Pmod_8LD_pin3_iobuf
       (.I(Pmod_8LD_pin3_o),
        .IO(Pmod_8LD_pin3_io),
        .O(Pmod_8LD_pin3_i),
        .T(Pmod_8LD_pin3_t));
  IOBUF Pmod_8LD_pin4_iobuf
       (.I(Pmod_8LD_pin4_o),
        .IO(Pmod_8LD_pin4_io),
        .O(Pmod_8LD_pin4_i),
        .T(Pmod_8LD_pin4_t));
  IOBUF Pmod_8LD_pin7_iobuf
       (.I(Pmod_8LD_pin7_o),
        .IO(Pmod_8LD_pin7_io),
        .O(Pmod_8LD_pin7_i),
        .T(Pmod_8LD_pin7_t));
  IOBUF Pmod_8LD_pin8_iobuf
       (.I(Pmod_8LD_pin8_o),
        .IO(Pmod_8LD_pin8_io),
        .O(Pmod_8LD_pin8_i),
        .T(Pmod_8LD_pin8_t));
  IOBUF Pmod_8LD_pin9_iobuf
       (.I(Pmod_8LD_pin9_o),
        .IO(Pmod_8LD_pin9_io),
        .O(Pmod_8LD_pin9_i),
        .T(Pmod_8LD_pin9_t));
  IOBUF Pmod_OLED_pin10_iobuf
       (.I(Pmod_OLED_pin10_o),
        .IO(Pmod_OLED_pin10_io),
        .O(Pmod_OLED_pin10_i),
        .T(Pmod_OLED_pin10_t));
  IOBUF Pmod_OLED_pin1_iobuf
       (.I(Pmod_OLED_pin1_o),
        .IO(Pmod_OLED_pin1_io),
        .O(Pmod_OLED_pin1_i),
        .T(Pmod_OLED_pin1_t));
  IOBUF Pmod_OLED_pin2_iobuf
       (.I(Pmod_OLED_pin2_o),
        .IO(Pmod_OLED_pin2_io),
        .O(Pmod_OLED_pin2_i),
        .T(Pmod_OLED_pin2_t));
  IOBUF Pmod_OLED_pin3_iobuf
       (.I(Pmod_OLED_pin3_o),
        .IO(Pmod_OLED_pin3_io),
        .O(Pmod_OLED_pin3_i),
        .T(Pmod_OLED_pin3_t));
  IOBUF Pmod_OLED_pin4_iobuf
       (.I(Pmod_OLED_pin4_o),
        .IO(Pmod_OLED_pin4_io),
        .O(Pmod_OLED_pin4_i),
        .T(Pmod_OLED_pin4_t));
  IOBUF Pmod_OLED_pin7_iobuf
       (.I(Pmod_OLED_pin7_o),
        .IO(Pmod_OLED_pin7_io),
        .O(Pmod_OLED_pin7_i),
        .T(Pmod_OLED_pin7_t));
  IOBUF Pmod_OLED_pin8_iobuf
       (.I(Pmod_OLED_pin8_o),
        .IO(Pmod_OLED_pin8_io),
        .O(Pmod_OLED_pin8_i),
        .T(Pmod_OLED_pin8_t));
  IOBUF Pmod_OLED_pin9_iobuf
       (.I(Pmod_OLED_pin9_o),
        .IO(Pmod_OLED_pin9_io),
        .O(Pmod_OLED_pin9_i),
        .T(Pmod_OLED_pin9_t));
  design_1 design_1_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .Pmod_8LD_pin10_i(Pmod_8LD_pin10_i),
        .Pmod_8LD_pin10_o(Pmod_8LD_pin10_o),
        .Pmod_8LD_pin10_t(Pmod_8LD_pin10_t),
        .Pmod_8LD_pin1_i(Pmod_8LD_pin1_i),
        .Pmod_8LD_pin1_o(Pmod_8LD_pin1_o),
        .Pmod_8LD_pin1_t(Pmod_8LD_pin1_t),
        .Pmod_8LD_pin2_i(Pmod_8LD_pin2_i),
        .Pmod_8LD_pin2_o(Pmod_8LD_pin2_o),
        .Pmod_8LD_pin2_t(Pmod_8LD_pin2_t),
        .Pmod_8LD_pin3_i(Pmod_8LD_pin3_i),
        .Pmod_8LD_pin3_o(Pmod_8LD_pin3_o),
        .Pmod_8LD_pin3_t(Pmod_8LD_pin3_t),
        .Pmod_8LD_pin4_i(Pmod_8LD_pin4_i),
        .Pmod_8LD_pin4_o(Pmod_8LD_pin4_o),
        .Pmod_8LD_pin4_t(Pmod_8LD_pin4_t),
        .Pmod_8LD_pin7_i(Pmod_8LD_pin7_i),
        .Pmod_8LD_pin7_o(Pmod_8LD_pin7_o),
        .Pmod_8LD_pin7_t(Pmod_8LD_pin7_t),
        .Pmod_8LD_pin8_i(Pmod_8LD_pin8_i),
        .Pmod_8LD_pin8_o(Pmod_8LD_pin8_o),
        .Pmod_8LD_pin8_t(Pmod_8LD_pin8_t),
        .Pmod_8LD_pin9_i(Pmod_8LD_pin9_i),
        .Pmod_8LD_pin9_o(Pmod_8LD_pin9_o),
        .Pmod_8LD_pin9_t(Pmod_8LD_pin9_t),
        .Pmod_OLED_pin10_i(Pmod_OLED_pin10_i),
        .Pmod_OLED_pin10_o(Pmod_OLED_pin10_o),
        .Pmod_OLED_pin10_t(Pmod_OLED_pin10_t),
        .Pmod_OLED_pin1_i(Pmod_OLED_pin1_i),
        .Pmod_OLED_pin1_o(Pmod_OLED_pin1_o),
        .Pmod_OLED_pin1_t(Pmod_OLED_pin1_t),
        .Pmod_OLED_pin2_i(Pmod_OLED_pin2_i),
        .Pmod_OLED_pin2_o(Pmod_OLED_pin2_o),
        .Pmod_OLED_pin2_t(Pmod_OLED_pin2_t),
        .Pmod_OLED_pin3_i(Pmod_OLED_pin3_i),
        .Pmod_OLED_pin3_o(Pmod_OLED_pin3_o),
        .Pmod_OLED_pin3_t(Pmod_OLED_pin3_t),
        .Pmod_OLED_pin4_i(Pmod_OLED_pin4_i),
        .Pmod_OLED_pin4_o(Pmod_OLED_pin4_o),
        .Pmod_OLED_pin4_t(Pmod_OLED_pin4_t),
        .Pmod_OLED_pin7_i(Pmod_OLED_pin7_i),
        .Pmod_OLED_pin7_o(Pmod_OLED_pin7_o),
        .Pmod_OLED_pin7_t(Pmod_OLED_pin7_t),
        .Pmod_OLED_pin8_i(Pmod_OLED_pin8_i),
        .Pmod_OLED_pin8_o(Pmod_OLED_pin8_o),
        .Pmod_OLED_pin8_t(Pmod_OLED_pin8_t),
        .Pmod_OLED_pin9_i(Pmod_OLED_pin9_i),
        .Pmod_OLED_pin9_o(Pmod_OLED_pin9_o),
        .Pmod_OLED_pin9_t(Pmod_OLED_pin9_t),
        .i_data_echantillon_0(i_data_echantillon_0),
        .i_sw_tri_i(i_sw_tri_i),
        .o_data_out_0(o_data_out_0),
        .o_leds_tri_o(o_leds_tri_o),
        .o_rgb_led_tri_o(o_rgb_led_tri_o));
endmodule
