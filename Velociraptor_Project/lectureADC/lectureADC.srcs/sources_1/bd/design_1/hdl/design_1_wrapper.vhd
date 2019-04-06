--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
--Date        : Sat Apr  6 13:49:49 2019
--Host        : DESKTOP-L2Q9UI1 running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    Pmod_8LD_pin10_io : inout STD_LOGIC;
    Pmod_8LD_pin1_io : inout STD_LOGIC;
    Pmod_8LD_pin2_io : inout STD_LOGIC;
    Pmod_8LD_pin3_io : inout STD_LOGIC;
    Pmod_8LD_pin4_io : inout STD_LOGIC;
    Pmod_8LD_pin7_io : inout STD_LOGIC;
    Pmod_8LD_pin8_io : inout STD_LOGIC;
    Pmod_8LD_pin9_io : inout STD_LOGIC;
    Pmod_OLED_pin10_io : inout STD_LOGIC;
    Pmod_OLED_pin1_io : inout STD_LOGIC;
    Pmod_OLED_pin2_io : inout STD_LOGIC;
    Pmod_OLED_pin3_io : inout STD_LOGIC;
    Pmod_OLED_pin4_io : inout STD_LOGIC;
    Pmod_OLED_pin7_io : inout STD_LOGIC;
    Pmod_OLED_pin8_io : inout STD_LOGIC;
    Pmod_OLED_pin9_io : inout STD_LOGIC;
    i_data_calorie : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_data_deportation : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_data_distance : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_data_echantillon : in STD_LOGIC_VECTOR ( 11 downto 0 );
    i_data_poids : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_data_vitesse : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_sw_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    o_data_calorie : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_data_deportation : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_data_distance : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_data_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_data_poids : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_data_vitesse : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_leds_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    i_sw_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    o_leds_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Pmod_8LD_pin1_o : out STD_LOGIC;
    Pmod_8LD_pin7_i : in STD_LOGIC;
    Pmod_8LD_pin2_o : out STD_LOGIC;
    Pmod_8LD_pin8_i : in STD_LOGIC;
    Pmod_8LD_pin3_o : out STD_LOGIC;
    Pmod_8LD_pin9_i : in STD_LOGIC;
    Pmod_8LD_pin10_o : out STD_LOGIC;
    Pmod_8LD_pin4_o : out STD_LOGIC;
    Pmod_8LD_pin3_i : in STD_LOGIC;
    Pmod_8LD_pin4_i : in STD_LOGIC;
    Pmod_8LD_pin1_i : in STD_LOGIC;
    Pmod_8LD_pin2_i : in STD_LOGIC;
    Pmod_8LD_pin10_t : out STD_LOGIC;
    Pmod_8LD_pin8_t : out STD_LOGIC;
    Pmod_8LD_pin9_t : out STD_LOGIC;
    Pmod_8LD_pin4_t : out STD_LOGIC;
    Pmod_8LD_pin9_o : out STD_LOGIC;
    Pmod_8LD_pin10_i : in STD_LOGIC;
    Pmod_8LD_pin7_t : out STD_LOGIC;
    Pmod_8LD_pin1_t : out STD_LOGIC;
    Pmod_8LD_pin2_t : out STD_LOGIC;
    Pmod_8LD_pin7_o : out STD_LOGIC;
    Pmod_8LD_pin3_t : out STD_LOGIC;
    Pmod_8LD_pin8_o : out STD_LOGIC;
    Pmod_OLED_pin1_o : out STD_LOGIC;
    Pmod_OLED_pin7_i : in STD_LOGIC;
    Pmod_OLED_pin2_o : out STD_LOGIC;
    Pmod_OLED_pin8_i : in STD_LOGIC;
    Pmod_OLED_pin3_o : out STD_LOGIC;
    Pmod_OLED_pin9_i : in STD_LOGIC;
    Pmod_OLED_pin10_o : out STD_LOGIC;
    Pmod_OLED_pin4_o : out STD_LOGIC;
    Pmod_OLED_pin3_i : in STD_LOGIC;
    Pmod_OLED_pin4_i : in STD_LOGIC;
    Pmod_OLED_pin1_i : in STD_LOGIC;
    Pmod_OLED_pin2_i : in STD_LOGIC;
    Pmod_OLED_pin10_t : out STD_LOGIC;
    Pmod_OLED_pin8_t : out STD_LOGIC;
    Pmod_OLED_pin9_t : out STD_LOGIC;
    Pmod_OLED_pin4_t : out STD_LOGIC;
    Pmod_OLED_pin9_o : out STD_LOGIC;
    Pmod_OLED_pin10_i : in STD_LOGIC;
    Pmod_OLED_pin7_t : out STD_LOGIC;
    Pmod_OLED_pin1_t : out STD_LOGIC;
    Pmod_OLED_pin2_t : out STD_LOGIC;
    Pmod_OLED_pin7_o : out STD_LOGIC;
    Pmod_OLED_pin3_t : out STD_LOGIC;
    Pmod_OLED_pin8_o : out STD_LOGIC;
    o_data_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    i_data_echantillon : in STD_LOGIC_VECTOR ( 11 downto 0 );
    i_data_vitesse : in STD_LOGIC_VECTOR ( 31 downto 0 );
    o_data_vitesse : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_data_distance : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_data_calorie : out STD_LOGIC_VECTOR ( 31 downto 0 );
    i_data_distance : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_data_calorie : in STD_LOGIC_VECTOR ( 31 downto 0 );
    o_data_deportation : out STD_LOGIC_VECTOR ( 31 downto 0 );
    o_data_poids : out STD_LOGIC_VECTOR ( 31 downto 0 );
    i_data_poids : in STD_LOGIC_VECTOR ( 31 downto 0 );
    i_data_deportation : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal Pmod_8LD_pin10_i : STD_LOGIC;
  signal Pmod_8LD_pin10_o : STD_LOGIC;
  signal Pmod_8LD_pin10_t : STD_LOGIC;
  signal Pmod_8LD_pin1_i : STD_LOGIC;
  signal Pmod_8LD_pin1_o : STD_LOGIC;
  signal Pmod_8LD_pin1_t : STD_LOGIC;
  signal Pmod_8LD_pin2_i : STD_LOGIC;
  signal Pmod_8LD_pin2_o : STD_LOGIC;
  signal Pmod_8LD_pin2_t : STD_LOGIC;
  signal Pmod_8LD_pin3_i : STD_LOGIC;
  signal Pmod_8LD_pin3_o : STD_LOGIC;
  signal Pmod_8LD_pin3_t : STD_LOGIC;
  signal Pmod_8LD_pin4_i : STD_LOGIC;
  signal Pmod_8LD_pin4_o : STD_LOGIC;
  signal Pmod_8LD_pin4_t : STD_LOGIC;
  signal Pmod_8LD_pin7_i : STD_LOGIC;
  signal Pmod_8LD_pin7_o : STD_LOGIC;
  signal Pmod_8LD_pin7_t : STD_LOGIC;
  signal Pmod_8LD_pin8_i : STD_LOGIC;
  signal Pmod_8LD_pin8_o : STD_LOGIC;
  signal Pmod_8LD_pin8_t : STD_LOGIC;
  signal Pmod_8LD_pin9_i : STD_LOGIC;
  signal Pmod_8LD_pin9_o : STD_LOGIC;
  signal Pmod_8LD_pin9_t : STD_LOGIC;
  signal Pmod_OLED_pin10_i : STD_LOGIC;
  signal Pmod_OLED_pin10_o : STD_LOGIC;
  signal Pmod_OLED_pin10_t : STD_LOGIC;
  signal Pmod_OLED_pin1_i : STD_LOGIC;
  signal Pmod_OLED_pin1_o : STD_LOGIC;
  signal Pmod_OLED_pin1_t : STD_LOGIC;
  signal Pmod_OLED_pin2_i : STD_LOGIC;
  signal Pmod_OLED_pin2_o : STD_LOGIC;
  signal Pmod_OLED_pin2_t : STD_LOGIC;
  signal Pmod_OLED_pin3_i : STD_LOGIC;
  signal Pmod_OLED_pin3_o : STD_LOGIC;
  signal Pmod_OLED_pin3_t : STD_LOGIC;
  signal Pmod_OLED_pin4_i : STD_LOGIC;
  signal Pmod_OLED_pin4_o : STD_LOGIC;
  signal Pmod_OLED_pin4_t : STD_LOGIC;
  signal Pmod_OLED_pin7_i : STD_LOGIC;
  signal Pmod_OLED_pin7_o : STD_LOGIC;
  signal Pmod_OLED_pin7_t : STD_LOGIC;
  signal Pmod_OLED_pin8_i : STD_LOGIC;
  signal Pmod_OLED_pin8_o : STD_LOGIC;
  signal Pmod_OLED_pin8_t : STD_LOGIC;
  signal Pmod_OLED_pin9_i : STD_LOGIC;
  signal Pmod_OLED_pin9_o : STD_LOGIC;
  signal Pmod_OLED_pin9_t : STD_LOGIC;
begin
Pmod_8LD_pin10_iobuf: component IOBUF
     port map (
      I => Pmod_8LD_pin10_o,
      IO => Pmod_8LD_pin10_io,
      O => Pmod_8LD_pin10_i,
      T => Pmod_8LD_pin10_t
    );
Pmod_8LD_pin1_iobuf: component IOBUF
     port map (
      I => Pmod_8LD_pin1_o,
      IO => Pmod_8LD_pin1_io,
      O => Pmod_8LD_pin1_i,
      T => Pmod_8LD_pin1_t
    );
Pmod_8LD_pin2_iobuf: component IOBUF
     port map (
      I => Pmod_8LD_pin2_o,
      IO => Pmod_8LD_pin2_io,
      O => Pmod_8LD_pin2_i,
      T => Pmod_8LD_pin2_t
    );
Pmod_8LD_pin3_iobuf: component IOBUF
     port map (
      I => Pmod_8LD_pin3_o,
      IO => Pmod_8LD_pin3_io,
      O => Pmod_8LD_pin3_i,
      T => Pmod_8LD_pin3_t
    );
Pmod_8LD_pin4_iobuf: component IOBUF
     port map (
      I => Pmod_8LD_pin4_o,
      IO => Pmod_8LD_pin4_io,
      O => Pmod_8LD_pin4_i,
      T => Pmod_8LD_pin4_t
    );
Pmod_8LD_pin7_iobuf: component IOBUF
     port map (
      I => Pmod_8LD_pin7_o,
      IO => Pmod_8LD_pin7_io,
      O => Pmod_8LD_pin7_i,
      T => Pmod_8LD_pin7_t
    );
Pmod_8LD_pin8_iobuf: component IOBUF
     port map (
      I => Pmod_8LD_pin8_o,
      IO => Pmod_8LD_pin8_io,
      O => Pmod_8LD_pin8_i,
      T => Pmod_8LD_pin8_t
    );
Pmod_8LD_pin9_iobuf: component IOBUF
     port map (
      I => Pmod_8LD_pin9_o,
      IO => Pmod_8LD_pin9_io,
      O => Pmod_8LD_pin9_i,
      T => Pmod_8LD_pin9_t
    );
Pmod_OLED_pin10_iobuf: component IOBUF
     port map (
      I => Pmod_OLED_pin10_o,
      IO => Pmod_OLED_pin10_io,
      O => Pmod_OLED_pin10_i,
      T => Pmod_OLED_pin10_t
    );
Pmod_OLED_pin1_iobuf: component IOBUF
     port map (
      I => Pmod_OLED_pin1_o,
      IO => Pmod_OLED_pin1_io,
      O => Pmod_OLED_pin1_i,
      T => Pmod_OLED_pin1_t
    );
Pmod_OLED_pin2_iobuf: component IOBUF
     port map (
      I => Pmod_OLED_pin2_o,
      IO => Pmod_OLED_pin2_io,
      O => Pmod_OLED_pin2_i,
      T => Pmod_OLED_pin2_t
    );
Pmod_OLED_pin3_iobuf: component IOBUF
     port map (
      I => Pmod_OLED_pin3_o,
      IO => Pmod_OLED_pin3_io,
      O => Pmod_OLED_pin3_i,
      T => Pmod_OLED_pin3_t
    );
Pmod_OLED_pin4_iobuf: component IOBUF
     port map (
      I => Pmod_OLED_pin4_o,
      IO => Pmod_OLED_pin4_io,
      O => Pmod_OLED_pin4_i,
      T => Pmod_OLED_pin4_t
    );
Pmod_OLED_pin7_iobuf: component IOBUF
     port map (
      I => Pmod_OLED_pin7_o,
      IO => Pmod_OLED_pin7_io,
      O => Pmod_OLED_pin7_i,
      T => Pmod_OLED_pin7_t
    );
Pmod_OLED_pin8_iobuf: component IOBUF
     port map (
      I => Pmod_OLED_pin8_o,
      IO => Pmod_OLED_pin8_io,
      O => Pmod_OLED_pin8_i,
      T => Pmod_OLED_pin8_t
    );
Pmod_OLED_pin9_iobuf: component IOBUF
     port map (
      I => Pmod_OLED_pin9_o,
      IO => Pmod_OLED_pin9_io,
      O => Pmod_OLED_pin9_i,
      T => Pmod_OLED_pin9_t
    );
design_1_i: component design_1
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      Pmod_8LD_pin10_i => Pmod_8LD_pin10_i,
      Pmod_8LD_pin10_o => Pmod_8LD_pin10_o,
      Pmod_8LD_pin10_t => Pmod_8LD_pin10_t,
      Pmod_8LD_pin1_i => Pmod_8LD_pin1_i,
      Pmod_8LD_pin1_o => Pmod_8LD_pin1_o,
      Pmod_8LD_pin1_t => Pmod_8LD_pin1_t,
      Pmod_8LD_pin2_i => Pmod_8LD_pin2_i,
      Pmod_8LD_pin2_o => Pmod_8LD_pin2_o,
      Pmod_8LD_pin2_t => Pmod_8LD_pin2_t,
      Pmod_8LD_pin3_i => Pmod_8LD_pin3_i,
      Pmod_8LD_pin3_o => Pmod_8LD_pin3_o,
      Pmod_8LD_pin3_t => Pmod_8LD_pin3_t,
      Pmod_8LD_pin4_i => Pmod_8LD_pin4_i,
      Pmod_8LD_pin4_o => Pmod_8LD_pin4_o,
      Pmod_8LD_pin4_t => Pmod_8LD_pin4_t,
      Pmod_8LD_pin7_i => Pmod_8LD_pin7_i,
      Pmod_8LD_pin7_o => Pmod_8LD_pin7_o,
      Pmod_8LD_pin7_t => Pmod_8LD_pin7_t,
      Pmod_8LD_pin8_i => Pmod_8LD_pin8_i,
      Pmod_8LD_pin8_o => Pmod_8LD_pin8_o,
      Pmod_8LD_pin8_t => Pmod_8LD_pin8_t,
      Pmod_8LD_pin9_i => Pmod_8LD_pin9_i,
      Pmod_8LD_pin9_o => Pmod_8LD_pin9_o,
      Pmod_8LD_pin9_t => Pmod_8LD_pin9_t,
      Pmod_OLED_pin10_i => Pmod_OLED_pin10_i,
      Pmod_OLED_pin10_o => Pmod_OLED_pin10_o,
      Pmod_OLED_pin10_t => Pmod_OLED_pin10_t,
      Pmod_OLED_pin1_i => Pmod_OLED_pin1_i,
      Pmod_OLED_pin1_o => Pmod_OLED_pin1_o,
      Pmod_OLED_pin1_t => Pmod_OLED_pin1_t,
      Pmod_OLED_pin2_i => Pmod_OLED_pin2_i,
      Pmod_OLED_pin2_o => Pmod_OLED_pin2_o,
      Pmod_OLED_pin2_t => Pmod_OLED_pin2_t,
      Pmod_OLED_pin3_i => Pmod_OLED_pin3_i,
      Pmod_OLED_pin3_o => Pmod_OLED_pin3_o,
      Pmod_OLED_pin3_t => Pmod_OLED_pin3_t,
      Pmod_OLED_pin4_i => Pmod_OLED_pin4_i,
      Pmod_OLED_pin4_o => Pmod_OLED_pin4_o,
      Pmod_OLED_pin4_t => Pmod_OLED_pin4_t,
      Pmod_OLED_pin7_i => Pmod_OLED_pin7_i,
      Pmod_OLED_pin7_o => Pmod_OLED_pin7_o,
      Pmod_OLED_pin7_t => Pmod_OLED_pin7_t,
      Pmod_OLED_pin8_i => Pmod_OLED_pin8_i,
      Pmod_OLED_pin8_o => Pmod_OLED_pin8_o,
      Pmod_OLED_pin8_t => Pmod_OLED_pin8_t,
      Pmod_OLED_pin9_i => Pmod_OLED_pin9_i,
      Pmod_OLED_pin9_o => Pmod_OLED_pin9_o,
      Pmod_OLED_pin9_t => Pmod_OLED_pin9_t,
      i_data_calorie(31 downto 0) => i_data_calorie(31 downto 0),
      i_data_deportation(31 downto 0) => i_data_deportation(31 downto 0),
      i_data_distance(31 downto 0) => i_data_distance(31 downto 0),
      i_data_echantillon(11 downto 0) => i_data_echantillon(11 downto 0),
      i_data_poids(31 downto 0) => i_data_poids(31 downto 0),
      i_data_vitesse(31 downto 0) => i_data_vitesse(31 downto 0),
      i_sw_tri_i(3 downto 0) => i_sw_tri_i(3 downto 0),
      o_data_calorie(31 downto 0) => o_data_calorie(31 downto 0),
      o_data_deportation(31 downto 0) => o_data_deportation(31 downto 0),
      o_data_distance(31 downto 0) => o_data_distance(31 downto 0),
      o_data_out(31 downto 0) => o_data_out(31 downto 0),
      o_data_poids(31 downto 0) => o_data_poids(31 downto 0),
      o_data_vitesse(31 downto 0) => o_data_vitesse(31 downto 0),
      o_leds_tri_o(3 downto 0) => o_leds_tri_o(3 downto 0)
    );
end STRUCTURE;
