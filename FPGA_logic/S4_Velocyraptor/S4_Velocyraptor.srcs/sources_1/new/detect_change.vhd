----------------------------------------------------------------------------------------------
-- decodeur_Velocyraptor.vhd
---------------------------------------------------------------------------------------------
-- Auteur(s)       : Kate-Lys Phaneuf Michaud
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
-- Outils          : vivado 2018.2
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity detect_change is
  port ( 
    in_run_clk      : in std_logic;
    in_reset     : in std_logic;
    in_low_clk       : in std_logic;
    in_value       : std_logic_vector(11 downto 0);
    out_result  : out  std_logic_vector(11 downto 0) -- no idea of this output tho
);
end detect_change;

architecture Behavioral of detect_change is


begin

        -- temporaire
        out_result <=  (others =>'0');


end Behavioral;
