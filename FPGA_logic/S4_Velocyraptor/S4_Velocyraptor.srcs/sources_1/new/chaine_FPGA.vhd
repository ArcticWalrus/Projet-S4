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
    in_values_ADC : in    STD_LOGIC;   -- I²S (Record Data)
    in_btn       : in    std_logic_vector (3 downto 0);
    in_sw        : in    std_logic_vector (3 downto 0)
    );    
end chaine_FPGA;

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

architecture Behavioral of chaine_FPGA is
  
component decodeur_Velocyraptor is
  Port ( 
    in_run_clk      : in std_logic;
    in_reset     : in    std_logic;  -- 
    in_low_clk       : in std_logic;
    in_value       : in std_logic;
    out_values  : out  std_logic_vector(11 downto 0)
);
end component;
 
---------------------------------------------------------------------------------
-- Signaux
----------------------------------------------------------------------------------
signal decoded_values : std_logic_vector(11 downto 0);


begin
             
end Behavioral;
