----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2019 03:33:20 PM
-- Design Name: 
-- Module Name: deportation - Behavioral
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
 USE ieee.numeric_std.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity deportation is
    Port ( 
           i_clk: in std_ulogic;
           microproceseur : in STD_LOGIC_VECTOR (7 downto 0);
           led8 : out STD_LOGIC_VECTOR (7 downto 0)
           );
end deportation;

architecture Behavioral of deportation is
SIGNAL moye : signed (7 downto 0);

type etats is (
      debut,
      donnee1,
      donnee2,
      donnee3,
      donnee4
);
    
signal etatCourant, prochainEtat : etats;

signal don1 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal don2 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal don3 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal don4 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
begin
etatCourant <= debut;
    registre: process(i_clk)
    begin
      if (i_clk='1' and i_clk'event) then
            etatCourant <= prochainEtat;
      end if;
    end process registre;

    decodeur : process(etatCourant)
    begin
        case etatCourant is
            when debut =>
                if (microproceseur = "00000000") then           -- Si on a pas de valeur
                    prochainEtat <= debut;
                    
                    
                else
                prochainEtat <= donnee1;
                don1 <= microproceseur;
                end if;
                
                when donnee1 =>

                        prochainEtat <= donnee1;
                        don1 <= microproceseur;
                        
                when donnee2 =>

                        prochainEtat <= donnee1;
                        don2 <= microproceseur;
                        
                when donnee3 =>
  
                        prochainEtat <= donnee1;
                        don3 <= microproceseur;
                        
                when donnee4 =>

                        prochainEtat <= donnee1;
                        don4 <= microproceseur;
                        moye <= (signed(don1) + signed(don2) + signed(don3) + signed(don4))/4;
                        
                        if (moye <= -70) then
                            led8 <= "11110000";
                        elsif (moye > -70 and moye <= -50) then
                            led8 <= "01110000";
                        elsif (moye > -50 and moye <= -35) then
                            led8 <= "00110000";                           
                        elsif (moye > -35 and moye <= -20) then
                                led8 <= "00010000";                        
                        elsif (moye >= 70) then
                            led8 <= "00001111";
                        elsif (moye < 70 and moye >= 50) then
                            led8 <= "00001110";
                        elsif (moye < 50 and moye >= 35) then
                            led8 <= "00001100";                           
                        elsif (moye < 35 and moye >= 20) then
                            led8 <= "00001000"; 
                        else 
                            led8 <= "00000000";
                        end if;
                  don1 <= "00000000";
                  don2 <= "00000000";
                  don3 <= "00000000";
                  don4 <= "00000000";
                  moye <= "00000000";
        end case;
     end process;
end Behavioral;
