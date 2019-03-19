library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity Traitement is
    Port ( 
            i_clk               : in std_logic;
            i_reset             : in std_logic;
            o_vitesse           : out unsigned(31 downto 0);
            o_calories          : out unsigned(31 downto 0);
            o_distance          : out unsigned(31 downto 0);
            i_poid_Kg           : in std_logic;
            i_taille_m          : in std_logic;
            i_tours_en_2sec     : in unsigned(5 downto 0)
    );
end Traitement;

architecture Behavioral of Traitement is

constant rayon_roue: real := 33.6; --diamètre de la roue = 67.2 cm -> rayon de 33.6 cm

signal circonference: real := 2.0 * MATH_PI * rayon_roue;

begin





end Behavioral;
