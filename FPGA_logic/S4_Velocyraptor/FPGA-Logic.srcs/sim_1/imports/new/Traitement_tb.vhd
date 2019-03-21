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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Traitement_tb is
--  Port ( );
end Traitement_tb;

architecture Behavioral of Traitement_tb is

    component  Traitement is
        Port ( 
                i_clk               : in std_logic;
                i_reset             : in std_logic;
                o_vitesse_real      : real;
                o_vitesse           : out unsigned(31 downto 0);
                o_calories          : out unsigned(31 downto 0);
                o_distance          : out unsigned(31 downto 0);
                i_nb_items_total    : in unsigned(31 downto 0);
                i_poid_Kg           : in unsigned(7 downto 0);
                i_taille_m          : in unsigned(7 downto 0);
                i_tours_en_2sec     : in unsigned(7 downto 0)
        );
    end component;

    signal clk: std_ulogic := '0';
    signal reset: std_ulogic;
    signal s_vitesse_real : real;
    signal s_vitesse : unsigned(31 downto 0);
    signal s_calories : unsigned(31 downto 0);
    signal s_distance : unsigned(31 downto 0);
    
    constant clk_demi_periode: time := 50 ns;   -- f = 10 MHz
begin
    clk <= not clk after clk_demi_periode;
    reset <= '1', '0' after clk_demi_periode * 1.2;
    
        
    dut: entity work.Traitement port map (
        i_clk              => clk,
        i_reset            => reset,
        o_vitesse_real     => s_vitesse_real,
        o_vitesse          => s_vitesse,
        o_calories         => s_calories,
        o_distance         => s_distance,
        i_nb_items_total   => x"00000012",
        i_poid_Kg          => x"50",
        i_taille_cm        => x"B2",
        i_tours_en_2sec    => x"05"
    );

end Behavioral;
