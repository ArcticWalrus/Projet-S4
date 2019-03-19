----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2019 01:50:53 PM
-- Design Name: 
-- Module Name: FPGA-Logic_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
          o_ech           : out   std_logic_vector (11 downto 0)
    );
end component;

signal clk: std_ulogic := '0';
signal reset: std_ulogic;
signal strobe: std_ulogic;

constant clk_demi_periode: time := 50 ns;   -- f = 10 MHz
constant stb_demi_periode: time := 2631579 ps; --f=380kHz

begin
    clk <= not clk after clk_demi_periode;
    reset <= '1', '0' after clk_demi_periode * 1.2;
    strobe <= not strobe after stb_demi_periode;
    
--    dut: entity work.Ctrl_AD1 port map (
--            clk_AD         => clk,
--            i_DO           => reset,
--            i_Strobe_AD    => strobe,
--            reset          => reset,
--            o_dav_strobe   => s_distance,
--            o_ech          => x"00000012"
--        );

end Behavioral;
