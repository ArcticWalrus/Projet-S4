---------------------------------------------------------------------------------------------
-- decodeur_Velocyraptor.vhd
---------------------------------------------------------------------------------------------
-- Auteur(s)       : Kate-Lys Phaneuf Michaud
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
-- Outils          : vivado 2018.2
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity decodeur_Velocyraptor is
  Port ( 
    in_run_clk      : in std_logic;
    in_reset     : in    std_logic;  -- 
    in_low_clk       : in std_logic;
    in_value       : in std_logic;
    out_values  : out  std_logic_vector(11 downto 0)
);
end decodeur_Velocyraptor;

architecture Behavioral of decodeur_Velocyraptor is


begin

        -- temporaire
        out_values <=  (others =>'0');


end Behavioral;
