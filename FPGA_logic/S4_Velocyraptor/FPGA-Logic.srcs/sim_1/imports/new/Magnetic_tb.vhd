----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2019 03:40:15 PM
-- Design Name: 
-- Module Name: Magnetic_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Magnetic_tb is
--  Port ( );
end Magnetic_tb;

architecture Behavioral of Magnetic_tb is

component magnetic is
    Port (  --Generaux
            i_clk           : in    std_logic;
            i_reset         : in    std_logic;
            i_str_tampon    : in    std_logic;
            
            --Controle ADC
            i_Data          : in    std_logic; -- bit arrivant de l'adc
            i_Strobe_ADC    : in    std_logic; -- strobe debut conversion 380KHz??

            --Traitement de signal
            o_vitesse       : out   unsigned(31 downto 0);
            o_calories      : out   unsigned(31 downto 0);
            o_distance      : out   unsigned(31 downto 0);
            i_poid_Kg       : in    unsigned(7 downto 0);
            i_taille_cm     : in    unsigned(7 downto 0)
    );     
end component;

    signal clk: std_ulogic := '0';
    signal reset: std_ulogic;
    signal str, stb, s_Data, s_Strobe_ADC: std_ulogic;
    signal s_vitesse, s_calories, s_distance: unsigned(31 downto 0);
    
    constant clk_demi_periode: time := 50 us;   -- f = 10 MHz
    constant str_demi_periode: time := 2500 us;   -- f = 200 Hz
    constant stb_ADC_demi_periode: time := 2631579 ps; --f=380kHz
    constant weight: unsigned(7 downto 0) := x"50";
    constant height: unsigned(7 downto 0) := x"B2";
begin

    clk <= not clk after clk_demi_periode;
    reset <= '1', '0' after clk_demi_periode * 1.2;
    str <= not str after str_demi_periode;
    stb <= not stb after stb_ADC_demi_periode;
    
    dut: entity work.magnetic port map (
            i_clk              => clk,
            i_reset            => reset,
            i_str_tampon       => str,
            i_Data             => s_Data, ----manque ça
            i_Strobe_ADC       => stb,
            o_vitesse          => s_vitesse,
            o_calories         => s_calories,
            o_distance         => s_distance,
            i_poid_Kg          => weight,
            i_taille_cm        => height
        );

end Behavioral;
