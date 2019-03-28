--------------------------------------------------------------------------------
-- Controle du module pmod AD1
-- D. Dalle septembre 2018 PMOD AD1
-- Ctrl_AD1.vhd
-- ref: http://www.analog.com/media/cn/technical-documentation/evaluation-documentation/AD7476A_7477A_7478A.pdf 

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Ctrl_AD1 is
   port ( clk_AD          : in    std_logic; 
          i_DO            : in    std_logic; 
          i_Strobe_AD     : in    std_logic; 
          reset           : in    std_logic; 
          o_dav_strobe    : out   std_logic; 
          o_ech           : out   std_logic_vector (11 downto 0); 
          o_ncs_adc       : out   std_logic);
end Ctrl_AD1;

architecture BEHAVIORAL of Ctrl_AD1 is
  
    component AD7476_mef
    port ( clk_AD           : in    std_logic; 
           reset          : in    std_logic; 
           i_Strobe_AD  : in    std_logic; 
           o_AdcNcs       : out   std_logic; 
           o_BitAv        : out   std_logic; 
           o_DAV          : out   std_logic);
     end component;  
    
    signal d_BITAV_mef      : std_logic;
    signal d_DAV            : std_logic;
    signal q_DAV            : std_logic;
    signal q_ech            : std_logic_vector (11 downto 0); 
    signal d_reinitialise   : std_logic;
    
    signal d_strobe_AD    : std_logic;
    
    
begin

--  Machine a etats finis pour le controle du AD7476
    MEF : AD7476_mef
     port map (
               clk_AD         => clk_AD,
               reset          => d_reinitialise,
               i_Strobe_AD    => d_strobe_AD,
               o_AdcNcs       => o_ncs_adc,     -- X
               o_BitAv        => d_BITAV_mef,
               o_DAV          => d_DAV
               );
   
                
 -- registre a decalage pour former ECHreg a partir de i_DO
    reg_decalage : process (clk_AD,  d_BITAV_mef, d_reinitialise )
    begin
        if (d_reinitialise = '1') then
            q_ech <= (others =>'0');
        else
            if (rising_edge(clk_AD) AND ( d_BITAV_mef = '1')) then
                q_ech <= q_ech(10 downto 0) & i_DO;
            end if;
        end if;
    end process;


    gen_str_DAV: process(clk_AD,d_DAV, q_DAV)   
    begin
        if(clk_AD'event and clk_AD = '1') then
            q_DAV <= d_DAV;
        end if;
        o_dav_strobe <= d_DAV and not(q_DAV);
    end process;

  d_strobe_AD  <=  i_Strobe_AD;
  o_ech <= q_ech;
  d_reinitialise <= reset;

end BEHAVIORAL;
