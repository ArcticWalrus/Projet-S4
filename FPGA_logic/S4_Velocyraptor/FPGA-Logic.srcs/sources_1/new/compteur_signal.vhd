library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compteur_signal is
  Port ( 
        line_in         : in signed(11 downto 0);
        i_clk, i_reset  : in std_logic;
        o_nb_items      : out unsigned(5 downto 0);
        o_high          : out std_logic
  );
end compteur_signal;

architecture Behavioral of compteur_signal is

component tamponcirc is
    Port (
            i_clk, it_reset     : in std_ulogic;
            i_WR                : in std_ulogic;
            o_plein, o_vide     : out std_ulogic;
            o_nb_items : out unsigned( 5 downto 0 )
    );
end component;

component detectzero is
    Port ( 
            i_clk, id_reset     : in std_ulogic;
            i_x                 : in signed(11 downto 0);
            o_s, o_z            : out std_ulogic
    );
end component;

    signal s_nb_items : std_logic_vector(7 downto 0);
    signal s_detect : std_logic;
    
    signal s_plein, s_vide: std_ulogic;
    signal s_s, s_z: std_ulogic;

begin

iteration_tampon : tamponcirc
    Port map(
            i_clk => i_clk,
            it_reset => i_reset,
            i_WR => s_z,
            o_plein => s_plein,
            o_vide => s_vide,
            o_nb_items => o_nb_items
    );

iteration_detect :  detectzero
    Port map ( 
            i_clk => i_clk,
            id_reset => i_reset,
            i_x => line_in,
            o_s => s_s, --Used for debugging purposes
            o_z => s_z
    );

o_high <= s_z;
end Behavioral;
