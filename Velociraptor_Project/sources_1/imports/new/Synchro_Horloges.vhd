
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;     -- requi pour les constantes  etc.
use IEEE.STD_LOGIC_UNSIGNED.ALL;  -- pour les additions dans les compteurs

Library UNISIM;
use UNISIM.vcomponents.all;


entity Synchro_Horloges is
generic (const_CLK_syst_MHz: integer := 100); 
    Port ( 
            clkm            : in STD_LOGIC;      -- Entrée  horloge maitre   (100 MHz soit 10 ns  Pt clk a 125MHz)
            o_S_10MHz       : out  STD_LOGIC;    -- source horloge divisee   (clkm MHz / (2*constante_diviseur_p +2) devrait donner 10 MHz soit 100 ns)
            o_clk_10MHz     : out  STD_LOGIC;    -- horlgoe via bufg
            o_stb_380kHz    : out  STD_LOGIC;    -- source horloge 380 Hz : out  STD_LOGIC;  
            o_stb_200Hz     : out  STD_LOGIC;    -- strobe durée 1/clk_5mHz aligne sur front 100Hz
            o_S_1Hz         : out  STD_LOGIC     -- Signal temoin 1 Hz
    );                    
end Synchro_Horloges;

architecture Behavioral of Synchro_Horloges is
 
    constant CLKp_MHz_des : integer := 5; --MHz
    constant constante_diviseur_p: integer  :=(const_CLK_syst_MHz/(2*CLKp_MHz_des));   -- quand on fait toggle sur le signal Clkp5MHzint
    constant cdiv1 : std_logic_vector(3  downto 0):= conv_std_logic_vector(constante_diviseur_p, 4);     
    constant cdiv2 : std_logic_vector(4 downto 0):= conv_std_logic_vector   (25, 5) ;     -- overflow a Clkp10MHzint/26 = 380 kHz  soit 5.2 us
    constant cdiv3 : std_logic_vector(15 downto 0):= conv_std_logic_vector (1848, 16) ;   -- overflow a Clk200kHzInt / 1924 = 99.952 = ~200 Hz soit 10.005 ms (t réel)
    constant cdiv4 : std_logic_vector(7 downto 0):= conv_std_logic_vector  (99, 8) ;      -- o_S1Hz = o_clk3 / 100    =  1 Hz soit 1 s
  

    signal ValueCounter10MHz        : std_logic_vector(4 downto 0)   := "00000";
    signal ValueCounter380kHz       : std_logic_vector(4 downto 0)   := "00000";
    signal ValueCounter200Hz        : std_logic_vector(15 downto 0)  := "0000000000000000";
    signal ValueCounter1Hz          : std_logic_vector(7 downto 0)   := "00000000";
    
    signal clk_10MHzInt             : std_logic := '0';
    
    signal q_s10MHzInt              : std_logic := '0';
    signal q_s1HzInt                : std_logic := '0' ;
    signal q_s200HzInt              : std_logic := '0' ;  
    signal q_strobe200HzInt         : std_logic := '0';
    signal q_s200HzInt_5M           : std_logic := '0';
    signal q_s380kHzInt_5M          : std_logic := '0';
    signal q_s380kHzInt             : std_logic := '0';
    signal q_strobe380kHzInt        : std_logic := '0';
 

begin

ClockBuffer: bufg
    port map(
            I	=> q_s10MHzInt,
            O	=> clk_10MHzInt
        );


o_clk_10MHz     <= clk_10MHzInt;
o_S_10MHz       <= q_s10MHzInt;
o_S_1Hz         <= q_s1HzInt;
o_stb_200Hz     <=  q_strobe200HzInt;
o_stb_380kHz    <=  q_strobe380kHzInt;

DiviseurHorloge: process(clkm)
begin
   if(clkm'event and clkm = '1') then
       ValueCounter10MHz <= ValueCounter10MHz + 1;
       if (ValueCounter10MHz = cdiv1) then               -- evenement se produit aux 100 approx ns
            ValueCounter10MHz <= "00000";
            q_s10MHzInt <= Not q_s10MHzInt;	            -- pour generer horloge a exterieur du module (prevoir bufg)	
            ValueCounter380kHz <= ValueCounter380kHz + 1;
            if (ValueCounter380kHz = cdiv2) then        -- evenement se produit aux 5 us approx
                 ValueCounter380kHz <= "00000";
                 q_s380kHzInt <= Not q_s380kHzInt;
                 ValueCounter200Hz <= ValueCounter200Hz + 1;
                 if (ValueCounter200Hz = cdiv3) then    -- evenement se produit aux 5 ms  approx
                      ValueCounter200Hz <= "0000000000000000";
                      q_s200HzInt <= Not q_s200HzInt;
                      ValueCounter1Hz <= ValueCounter1Hz + 1;
                      if (ValueCounter1Hz = cdiv4) then -- evenement se produit aux 500 ms approx
                          ValueCounter1Hz <= "00000000";
                          q_s1HzInt <= Not q_s1HzInt;
                      end if;
                 end if;
            end if;						
		end if;
	end if;
end process;

GenererStrobe380kHz: process(clk_10MHzInt)  
begin
	if(clk_10MHzInt'event and clk_10MHzInt = '1') then
		q_s380kHzInt_5M <= q_s380kHzInt;
		q_strobe380kHzInt <= q_s380kHzInt and not(q_s380kHzInt_5M);
	end if;
end process;

GenererStrobe200Hz: process(clk_10MHzInt)  
begin
	if(clk_10MHzInt'event and clk_10MHzInt = '1') then
		q_s200HzInt_5M <= q_s200HzInt;
		q_strobe200HzInt <= q_s200HzInt and not(q_s200HzInt_5M);
	end if;
end process;

end Behavioral;
