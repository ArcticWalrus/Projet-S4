---------------------------------------------------------------------------------------------
-- Labo_adder4b.vhd   
---------------------------------------------------------------------------------------------
-- Université de Sherbrooke - Département de GEGI
-- Version         : 2.0
-- Nomenclature    : 0.8 GRAMS
-- Date            : 4 décembre 2018
-- Auteur(s)       : Réjean Fontaine, Daniel Dalle
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--                   peripheriques: Pmod8LD PmodSSD
--
-- Outils          : vivado 2018.2 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Circuit utilitaire pour le laboratoire de logique combinatoire
--
-- Revision:  3 décembre 2018,  R. Fontaine, D. Dalle ; Développement sur carte ZYBO-Z7
--
---------------------------------------------------------------------------------------------
-- À faire :
-- Voir le guide de l'APP
--    Insérer les modules additionneurs ("components" et "instances")
--
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity labo_adder4b is
  port ( 
          i_btn       : in    std_logic_vector (3 downto 0); -- Boutons de la carte Zybo
          i_sw        : in    std_logic_vector (3 downto 0); -- Interrupteurs de la carte Zybo
          sysclk      : in    std_logic;                     -- horloge systeme
          o_pmodled   : out   std_logic_vector (7 downto 0)  -- vers connecteur pmod 8 DELs
          );
end labo_adder4b;
 
architecture BEHAVIORAL of labo_adder4b is

   constant freq_sys_MHz    : integer := 125;  -- 125 MHz 
   
   signal d_s_1Hz           : std_logic;
   signal clk_5MHz          : std_logic;
   --
   signal d_opa             : std_logic_vector (3 downto 0):= "0000";   -- operande A
   signal d_opb             : std_logic_vector (3 downto 0):= "0000";   -- operande B
 
   
 component synchro_module_v2 is
   generic (const_CLK_syst_MHz: integer := freq_sys_MHz);
      Port ( 
           clkm        : in  STD_LOGIC;  -- Entrée  horloge maitre
           o_CLK_5MHz  : out STD_LOGIC;  -- horloge divise utilise pour le circuit             
           o_S_1Hz     : out  STD_LOGIC  -- Signal temoin 1 Hz
            );
      end component;  
component deportation is
          Port ( 
                 i_clk: in std_ulogic;
                 microproceseur : in STD_LOGIC_VECTOR (7 downto 0);
                 led8 : out STD_LOGIC_VECTOR (7 downto 0)
                 );
      end component;
begin
  
    inst_synch : synchro_module_v2
     generic map (const_CLK_syst_MHz => freq_sys_MHz)
         port map (
            clkm         => sysclk,
            o_CLK_5MHz   => clk_5MHz,
            o_S_1Hz      => d_S_1Hz
        );  
      
     inst_deportation : deportation 
        port map(
             i_clk          =>  sysclk,
             microproceseur =>  ja,     --- valeur random
             led8           =>  o_pmodled
             );
   d_opa               <=  i_sw;                        -- operande A sur interrupteurs
   d_opb               <=  i_btn;                       -- operande B sur boutons

   o_pmodled           <=  d_opa & d_opb;               -- Les opérandes d'entrés reproduits combinés sur Pmod8LD      
   
   
end BEHAVIORAL;


