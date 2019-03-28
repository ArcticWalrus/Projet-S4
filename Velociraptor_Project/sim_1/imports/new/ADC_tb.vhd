
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ADC_tb is --incomplete tb
--  Port ( );
end ADC_tb;

architecture Behavioral of ADC_tb is

component Ctrl_AD1 is
   port ( clk_AD          : in    std_logic; 
          i_DO            : in    std_logic; 
          i_Strobe_AD     : in    std_logic; 
          reset           : in    std_logic; 
          o_dav_strobe    : out   std_logic; 
          o_ech           : out   signed (11 downto 0)
    );
end component;

signal clk: std_ulogic := '0';
signal reset: std_ulogic;
signal strobe: std_ulogic := '0';
signal data_ready : std_logic;
signal outputfinal : signed( 11 downto 0 );
signal randomEntry : std_logic := '0';

constant clk_demi_periode: time := 50 ns;   -- f = 10 MHz
constant stb_demi_periode: time := 2631579 ps; --f=380kHz
constant technically_a_random_entry : time := 200 ns;

begin
    clk <= not clk after clk_demi_periode;
    reset <= '1', '0' after clk_demi_periode * 1.2;
    strobe <= not strobe after stb_demi_periode;
    randomEntry <= not randomEntry after technically_a_random_entry;
    
    dut: entity work.Ctrl_AD1 port map (
            clk_AD         => clk,
            i_DO           => randomEntry,
            i_Strobe_AD    => strobe,
            reset          => reset,
            o_dav_strobe   => data_ready,
            o_ech          => outputfinal
        );

end Behavioral;
