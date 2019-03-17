---------------------------------------------------------------------------------------------
-- clock_generate.vhd
---------------------------------------------------------------------------------------------
-- Auteur(s)       : Kate-Lys Phaneuf Michaud
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
-- Outils          : vivado 2018.2
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_generate is
port  (
   in_reset    : in STD_LOGIC;
   in_master_clk    : in STD_LOGIC;
   out_run_clk   : out  STD_LOGIC;
   out_low_clk : out  STD_LOGIC
  );
end clock_generate;

architecture Behavioral of clock_generate is

    signal run_clk       : std_logic := '0';
    signal low_clk     : std_logic := '0';
    signal sink_sig     : std_logic;
    signal compteur_low : std_logic_vector (7 downto 0) := "00000000";  
    signal compteur_run   : std_logic_vector (1 downto 0) := "00"; 
    
    begin

low_clk_process : process(in_master_clk)
       begin
           if rising_edge(in_master_clk) then
              if in_reset = '1' then
                 low_clk <= '0';
                 compteur_low  <= "00000000"; 
              else
                 if compteur_low = 128 then -- minimum 175 à 105 ici : 256/2
                    compteur_low <= "00000000"; 
                    low_clk <= not low_clk;
                 else
                    compteur_low <= compteur_low + 1;
                 end if;
              end if;
           end if;
        end process low_clk_process;
  
run_clk_process : process(in_master_clk)    
       begin
           if rising_edge(in_master_clk) then
              if in_reset = '1' then
                 run_clk <= '0';
                 compteur_run <= "00"; 
              else
                 if compteur_run = 01 then -- minimum 7 à 10 ici 
                    compteur_run <= "00"; 
                    run_clk <= not run_clk;
                 else
                    compteur_run <= compteur_run + 1;
                 end if;
              end if;
           end if;
        end process run_clk_process;
  
  sinkro_low : process(run_clk)    
    begin
       if falling_edge(run_clk) then
              sink_sig <= low_clk;  
          end if;
       end process sinkro_low; 
 
  out_low_clk <= sink_sig;    
  
--  ClockBufer1: bufg           -- revision 9 janvier 2018
--      port map(
--          I    => d_bclk,
--          O    => o_bclk
--          );
        
end Behavioral;
