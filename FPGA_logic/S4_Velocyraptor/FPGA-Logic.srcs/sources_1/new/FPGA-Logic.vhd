library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity FPGA_Logic is
    port (  --Onboard
            sys_clock       : in std_logic;
            o_leds          : out std_logic_vector ( 3 downto 0 );
            i_sw            : in std_logic_vector ( 3 downto 0 );
            i_btn           : in std_logic_vector ( 3 downto 0 );
            o_ledtemoin_b   : out std_logic;
            
            -- Connection Simple
            o_pmod_8LD      : out std_logic_vector ( 7 downto 0 );  -- port JD
            o_pmod_OLED     : out std_logic_vector ( 7 downto 0 );  -- port_JE
            
            -- Pmod_AD1 - port_JC haut
            o_AD_NCS        : out std_logic;  
            i_ADC_Data      : in std_logic;
            o_AD_CLK        : out std_logic;
            
            -- Connection IMU
            i_IMU_data      : in std_logic;
            
            -- Serveur
            o_ergonomie     : out std_logic_vector ( 2 downto 0 );
            o_vitesse       : out std_logic;
            o_calories      : out std_logic;
            o_distance      : out std_logic;
            i_poid_Kg       : in std_logic;
            i_taille_m      : in std_logic
            
    );
end FPGA_Logic;

architecture Behavioral of FPGA_Logic is

    constant freq_sys_MHz: integer := 125;  -- MHz on utilise 100MHz

    component Synchro_Horloges is
        generic (const_CLK_syst_MHz: integer := freq_sys_MHz);
            Port ( 
                    clkm            : in  std_logic;  -- Entrée  horloge maitre   (50 MHz soit 20 ns ou 100 MHz soit 10 ns)
                    o_S_10MHz       : out std_logic;  -- source horloge divisee          (clkm MHz / (2*constante_diviseur_p +2) devrait donner 5 MHz soit 200 ns)
                    o_CLK_10MHz     : out std_logic;
                    o_S_100Hz       : out  std_logic; -- source horloge 100 Hz : out  std_logic;   -- (100  Hz approx:  99,952 Hz)
                    o_S_380Hz       : out  STD_LOGIC; 
                    o_stb_100Hz     : out  std_logic; -- strobe 100Hz synchro sur clk_5MHz 
                    o_S_1Hz         : out  std_logic  -- Signal temoin 1 Hz
            );
    end component;
       
    component magnetic is
            Port (  --Generaux
                    i_clk           : in std_logic;
                    i_reset         : in std_logic;
                    
                    --Controle ADC
                    i_Data          : in    std_logic; -- bit arrivant de l'adc
                    i_Strobe_ADC    : in    std_logic; -- strobe debut conversion 380KHz??

                    --Traitement de signal
                    o_vitesse       : out std_logic;
                    o_calories      : out std_logic;
                    o_distance      : out std_logic;
                    i_poid_Kg       : in std_logic;
                    i_taille_m      : in std_logic
            );               
    end component;
    
    signal clk_10MHz       : std_logic; --inversée
    signal d_S_10MHz       : std_logic;
    signal d_strobe_380Hz  : std_logic := '0';  -- est utile pour debounce et cadence echantillonnage AD1
    
    signal reset           : std_logic; 
    
    signal d_davs          : std_logic;
    signal d_AD_Dselect    : std_logic; 
    signal d_echantillon   : std_logic_vector (11 downto 0); 
    
    signal s_line_in       : std_logic_vector(31 downto 0);
    signal s_nb_items      : std_logic_vector(7 downto 0);
    signal s_detect        : std_logic;

begin
    reset    <= i_btn(0);    
 
    Synchronisation : Synchro_Horloges
        port map (
                clkm         =>  sys_clock,
                o_S_10MHz    =>  o_AD_CLK,
                o_CLK_10MHz  => clk_10MHz,
                o_S_100Hz    => open,
                o_S_380Hz    => d_strobe_380Hz,
                o_stb_100Hz  => open,
                o_S_1Hz      => o_ledtemoin_b
        );
    
    insta_magnetic : magnetic
        Port map(  --Generaux
                i_clk           =>  d_S_10MHz,
                i_reset         =>  reset,
                
                --Controle ADC
                i_Data          =>  i_ADC_Data,
                i_Strobe_ADC    =>  d_strobe_380Hz,

                --Traitement de signal
                o_vitesse       =>  o_vitesse,
                o_calories      =>  o_calories,
                o_distance      =>  o_distance,
                i_poid_Kg       =>  i_poid_Kg,
                i_taille_m      =>  i_taille_m
        );
  
  o_AD_NCS <= d_strobe_380Hz;
  o_AD_CLK <= d_S_10MHz;
  
end Behavioral;

