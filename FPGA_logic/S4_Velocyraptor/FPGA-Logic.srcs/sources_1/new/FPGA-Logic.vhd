library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity FPGA_Logic is
  port (
    sys_clock       : in std_logic;
    o_leds          : out std_logic_vector ( 3 downto 0 );
    i_sw            : in std_logic_vector ( 3 downto 0 );
    i_btn           : in std_logic_vector ( 3 downto 0 );
    o_ledtemoin_b   : out std_logic;
    
    Pmod_8LD        : inout std_logic_vector ( 7 downto 0 );  -- port JD
    Pmod_OLED       : inout std_logic_vector ( 7 downto 0 );  -- port_JE
    
    -- Pmod_AD1 - port_JC haut
   o_AD_NCS         : out std_logic;  
   i_AD_D0          : in std_logic;
   i_AD_D1          : in std_logic;
   o_AD_CLK         : out std_logic
   
  );
end FPGA_Logic;

architecture Behavioral of FPGA_Logic is

constant freq_sys_MHz: integer := 125;  -- MHz

 component Ctrl_AD1 is -- remplacer par un décodeur de l'app 3 ajusté sur 32 bits ou le nombre de bits requi
      port ( clk_AD          : in    std_logic; 
             i_DO            : in    std_logic;  
             i_Strobe_AD     : in    std_logic; 
             reset           : in    std_logic; 
             o_dav_strobe    : out   std_logic; 
             o_ech           : out   std_logic_vector (11 downto 0); 
             o_ncs_adc       : out   std_logic);
   end  component;
   
  component Synchro_Horloges is
     generic (const_CLK_syst_MHz: integer := freq_sys_MHz);
       Port ( 
            clkm        : in  std_logic;  -- Entrée  horloge maitre   (50 MHz soit 20 ns ou 100 MHz soit 10 ns)
            o_S_5MHz    : out std_logic;  -- source horloge divisee          (clkm MHz / (2*constante_diviseur_p +2) devrait donner 5 MHz soit 200 ns)
            o_CLK_5MHz  : out std_logic;
            o_S_100Hz   : out  std_logic; -- source horloge 100 Hz : out  std_logic;   -- (100  Hz approx:  99,952 Hz) 
            o_stb_100Hz : out  std_logic; -- strobe 100Hz synchro sur clk_5MHz 
            o_S_1Hz     : out  std_logic  -- Signal temoin 1 Hz
        );
       end component;
       
       component compteur_signal
         Port ( 
               line_in : in std_logic_vector(31 downto 0);
               i_clk, i_reset : in std_logic;
               o_nb_items : out std_logic_vector(7 downto 0);
               o_high : out std_logic
         );
       end component;
   
      signal clk_5MHz        : std_logic;
      signal d_S_5MHz        : std_logic;
      signal d_strobe_100Hz  : std_logic := '0';  -- est utile pour debounce et cadence echantillonnage AD1
     
      signal reset           : std_logic; 
      
      signal d_davs          : std_logic;
      signal d_AD_Dselect    : std_logic; 
      signal d_echantillon   : std_logic_vector (11 downto 0); 
      
      signal s_line_in : std_logic_vector(31 downto 0);
      signal s_nb_items : std_logic_vector(7 downto 0);
      signal s_detect : std_logic;

begin
    reset    <= i_btn(0);    
    
    entity_compteur_signal : compteur_signal
      Port map( 
            line_in => s_line_in,
            i_clk => clk_5MHz,
            i_reset => reset,
            o_nb_items => s_nb_items,
            o_high  => s_detect
      );
        
     mux_select_Entree_AD1 : process (i_btn(3), i_AD_D0, i_AD_D1)
     begin
          if (i_btn(3) ='0') then 
            d_AD_Dselect <= i_AD_D0;
          else
            d_AD_Dselect <= i_AD_D1;
          end if;
     end process;
     
   Controleur :  Ctrl_AD1 
     port map(
        clk_AD         => clk_5MHz,         -- pour horloge externe du convertisseur (variable logique ne passant pas par bufg)
        i_DO           => d_AD_Dselect,     -- bit de données provenant du convertisseur (via um mux)
        i_Strobe_AD    => d_strobe_100Hz,   -- synchronisation: déclencheur de la conversion
        RESET          => reset,
        o_dav_strobe   => d_davs,           -- indicateur de conversion complete
        o_ech          => d_echantillon,    -- valeur de l'échantillon lu
        o_ncs_adc      => o_AD_NCS          -- chip select pour le convertisseur
      );
      
   Synchronisation : Synchro_Horloges
    port map (
           clkm         =>  sys_clock,
           o_S_5MHz     =>  o_AD_CLK,
           o_CLK_5MHz   => clk_5MHz,
           o_S_100Hz    => open,
           o_stb_100Hz  => d_strobe_100Hz,
           o_S_1Hz      => o_ledtemoin_b
    );
  
end Behavioral;

