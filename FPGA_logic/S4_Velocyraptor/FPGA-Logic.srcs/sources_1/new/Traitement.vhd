

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Traitement is
    Port ( 
            i_clk           : in std_logic;
            i_reset         : in std_logic;
            o_vitesse       : out std_logic;
            o_calories      : out std_logic;
            o_distance      : out std_logic;
            i_poid_Kg       : in std_logic;
            i_taille_m      : in std_logic;
            i_tours_par_t   : in std_logic
    );
end Traitement;

architecture Behavioral of Traitement is

begin


end Behavioral;
