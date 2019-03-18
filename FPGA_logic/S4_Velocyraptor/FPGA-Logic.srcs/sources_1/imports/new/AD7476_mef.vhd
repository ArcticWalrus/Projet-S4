
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

---------------------------------------------------------------------------------------------
--	Entity Declaration
---------------------------------------------------------------------------------------------
entity AD7476_mef is
port(
	clk_AD			: in std_logic;
	reset			: in std_logic;
	i_Strobe_AD	    : in std_logic;
	o_BitAv			: out std_logic;
	o_DAV			: out std_logic
	);
end AD7476_mef;

---------------------------------------------------------------------------------------------
--	Object declarations
---------------------------------------------------------------------------------------------
architecture Behavioral of AD7476_mef is

--	Components

--	Convenient constants

type fsm_ADCONV_type is (
	sta_Attente,
	sta_Demarrage1,
	sta_Demarrage2,
	sta_Demarrage3,
	sta_Bit11,
	sta_Bit10,
	sta_Bit9,
	sta_Bit8,
	sta_Bit7,
	sta_Bit6,
	sta_Bit5,
	sta_Bit4,
	sta_Bit3,
	sta_Bit2,
	sta_Bit1,
	sta_Bit0,
	sta_FinSequence
	);

signal fsm_etat_courant, fsm_etat_prochain	: fsm_ADCONV_type;

--	Signals

--	Registers

-- Attributes

begin

-- Assignation du prochain état
process(clk_AD)
begin
	if(clk_AD'event and clk_AD = '1') then
		if (reset = '1') then
			fsm_etat_courant <= sta_Attente;
		-- elsif(i_Strobe200kHz = '1') then
		else 
			fsm_etat_courant <= fsm_etat_prochain;
		end if;
	end if;
end process;

-- Calcul du prochain état
process(i_Strobe_AD, fsm_etat_courant)
begin
   case fsm_etat_courant is
	  when sta_Attente =>
			if(i_Strobe_AD = '1') then
				fsm_etat_prochain <= sta_Demarrage1;
			else
				fsm_etat_prochain <= sta_Attente;
			end if;
	  when sta_Demarrage1 =>
			fsm_etat_prochain <= sta_Demarrage2;
	  when sta_Demarrage2 =>
            fsm_etat_prochain <= sta_Demarrage3;
      when sta_Demarrage3 =>
           fsm_etat_prochain <= sta_Bit11;	
	   when sta_Bit11 =>
           fsm_etat_prochain <= sta_Bit10;
       when sta_Bit10 =>
           fsm_etat_prochain <= sta_Bit9;
       when sta_Bit9 =>
           fsm_etat_prochain <= sta_Bit8;
       when sta_Bit8 =>
           fsm_etat_prochain <= sta_Bit7;	
	   when sta_Bit7 =>
			fsm_etat_prochain <= sta_Bit6;
	   when sta_Bit6 =>
			fsm_etat_prochain <= sta_Bit5;	
		when sta_Bit5 =>
			fsm_etat_prochain <= sta_Bit4;		
		when sta_Bit4 =>
			fsm_etat_prochain <= sta_Bit3;	
		when sta_Bit3 =>
			fsm_etat_prochain <= sta_Bit2;	
		when sta_Bit2 =>
			fsm_etat_prochain <= sta_Bit1;		
		when sta_Bit1 =>
			fsm_etat_prochain <= sta_Bit0;		
		when sta_Bit0 =>
			fsm_etat_prochain <= sta_FinSequence;		
		when sta_FinSequence =>
			fsm_etat_prochain <= sta_Attente;		
	end case;
end process;


-- Calcul des sorties
--with fsm_etat_courant select
--	o_AdcNcs <=	'1' when sta_Attente,
--				'0' when others;				
with fsm_etat_courant select
	o_BitAv	<=	'0' when sta_Attente | sta_Demarrage1 | sta_Demarrage2 | sta_Demarrage3 | sta_FinSequence,
				'1' when others;
with fsm_etat_courant select
	o_DAV	<=	'1' when sta_FinSequence,
				'0' when others;
							
end Behavioral;
