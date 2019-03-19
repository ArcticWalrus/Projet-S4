library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity Traitement is
    Port ( 
            i_clk               : in std_logic;
            i_reset             : in std_logic;
            o_vitesse_real      : out real;
            o_vitesse           : out unsigned(31 downto 0);
            o_calories          : out unsigned(31 downto 0);
            o_distance          : out unsigned(31 downto 0);
            i_nb_items_total    : in unsigned(31 downto 0);
            i_poid_Kg           : in unsigned(7 downto 0);
            i_taille_cm         : in unsigned(7 downto 0);
            i_tours_en_2sec     : in unsigned(7 downto 0)
    );
end Traitement;

architecture Behavioral of Traitement is

constant rayon_roue: real := 0.336; --diamètre de la roue = 67.2 cm -> rayon de 33.6 cm

signal circonference: real := 2.0 * MATH_PI * rayon_roue;
signal s_vitesse : real;

begin

o_vitesse_real <= s_vitesse;
s_vitesse <= circonference * Real(to_integer(i_tours_en_2sec)) / 2.0; --m/s

o_vitesse <= to_unsigned(natural(s_vitesse * 3.6), 32); --(km/h) à vérifier l'allure de la valeur 
o_distance <= to_unsigned(natural(circonference * Real(to_integer(i_nb_items_total))), 32); --à vérifier l'allure de la valeur
o_calories <= to_unsigned(natural(s_vitesse), 32); --temporaire, il faut accumuler les valeurs

end Behavioral;
