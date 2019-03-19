library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Velocyraptor_package is

    --Constantes pour le Tampon Circulaire
    constant max: natural := 400;
    constant taille_tampon: natural := 63;
    
    --Constantes pour le traitement
    constant rayon_roue: real := 0.336;

    -- Types
    type ERGO_MEM  is array (255 downto 0) of std_logic_vector (31 downto 0);
    type SPEED_MEM is array (255 downto 0) of std_logic_vector (31 downto 0);
    type DIST_MEM  is array (255 downto 0) of std_logic_vector (31 downto 0);
    type CALS_MEM  is array (255 downto 0) of std_logic_vector (31 downto 0);

end Velocyraptor_package;