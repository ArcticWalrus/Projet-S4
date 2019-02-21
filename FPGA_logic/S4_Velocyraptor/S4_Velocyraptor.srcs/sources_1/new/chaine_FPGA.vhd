---------------------------------------------------------------------------------------------
-- chaine_FPGA.vhd
---------------------------------------------------------------------------------------------
-- Auteur(s)       : Kate-Lys Phaneuf Michaud
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
-- Outils          : vivado 2018.2
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;   
USE ieee.numeric_std.ALL;
--Library UNISIM;
--use UNISIM.vcomponents.all;

----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------
entity chaine_FPGA is
    Port (
    in_values_ADC : in    STD_LOGIC;
    in_btn       : in    std_logic_vector (3 downto 0);
    in_sw        : in    std_logic_vector (3 downto 0);
    sysclk : in STD_LOGIC;
    out_trigger_ADC : out STD_LOGIC
    );    
end chaine_FPGA;

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

architecture Behavioral of chaine_FPGA is
  
component decodeur_Velocyraptor is
    port ( 
        in_run_clk_dec      : in std_logic;
        in_reset_dec     : in    std_logic;  -- 
        in_low_clk_dec       : in std_logic;
        in_value_dec       : in std_logic;
        out_values_dec  : out  std_logic_vector(11 downto 0)
    );
end component;

component detect_change is
  port ( 
    in_run_clk_cha      : in std_logic;
    in_reset_cha     : in std_logic;
    in_low_clk_cha       : in std_logic;
    in_value_cha       : std_logic_vector(11 downto 0);
    out_result_cha  : out  std_logic_vector(11 downto 0) -- no idea of this output tho
);
end component;
 
component clock_generate is
    port  (
       in_reset    : in STD_LOGIC;
       in_master_clk    : in STD_LOGIC;
       out_run_clk   : out  STD_LOGIC;
       out_low_clk : out  STD_LOGIC
      );
end component;
---------------------------------------------------------------------------------
-- Signaux
----------------------------------------------------------------------------------
signal decoded_values : std_logic_vector(11 downto 0);
signal run_clk : std_logic;
signal low_clk : std_logic;
signal s_reset : std_logic;


begin

inst_clock_generate : clock_generate
    port map(
        in_reset => s_reset,
        in_master_clk => sysclk,
        out_run_clk => run_clk,
        out_low_clk => low_clk
    );
      
inst_decodeur : decodeur_Velocyraptor
    port map( 
        in_run_clk_dec => run_clk,
        in_reset_dec => s_reset,
        in_low_clk_dec => low_clk,
        in_value_dec => in_values_ADC,
        out_values_dec => decoded_values
    );
      
inst_detect : detect_change
      port map( 
        in_run_clk_cha => run_clk,
        in_reset_cha => s_reset,
        in_low_clk_cha => low_clk,
        in_value_cha => decoded_values
        -- out_result_cha  : out  std_logic_vector(11 downto 0) -- no idea of this output tho
    );
             
end Behavioral;
