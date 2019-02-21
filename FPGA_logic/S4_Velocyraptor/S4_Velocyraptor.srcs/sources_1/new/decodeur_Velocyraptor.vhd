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
  port ( 
    in_run_clk      : in std_logic;
    in_reset     : in std_logic;
    in_low_clk       : in std_logic;
    in_value       : in std_logic;
    out_values  : out  std_logic_vector(11 downto 0)
);
end decodeur_Velocyraptor;

architecture Behavioral of decodeur_Velocyraptor is


-- définition de la MEF de contrôle
    type mef_decodeur is (
        sta_0,
        sta_1,
        sta_2,
        sta_3 -- may need more states
        );
    signal live_state, next_state : mef_decodeur;

begin

-- Assignation du prochain état (à chaque bclk prochain etat vas dans live eta)
    process(in_run_clk, in_reset)
        begin
            if (in_reset ='1') then 
                live_state <= sta_0;
            else
                if rising_edge(in_run_clk) then
                    live_state <= next_state;
                end if;
            end if;
    end process;

        -- temporaire
        out_values <=  (others =>'0');


end Behavioral;
