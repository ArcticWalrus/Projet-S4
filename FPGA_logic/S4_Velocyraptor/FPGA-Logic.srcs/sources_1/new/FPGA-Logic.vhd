library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity FPGA_Logic is
    port (  --Onboard
            sysclk          : in std_logic;
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
                    o_clk_10MHz     : out  STD_LOGIC;    -- horlgoe via bufg
                    o_stb_380kHz    : out  STD_LOGIC;    -- source horloge 380 Hz : out  STD_LOGIC;  
                    o_stb_200Hz     : out  STD_LOGIC;    -- strobe durée 1/clk_5mHz aligne sur front 100Hz
                    o_S_1Hz         : out  STD_LOGIC     -- Signal temoin 1 Hz
            );
    end component;
       
    component magnetic is
            Port (  --Generaux
                    i_clk           : in std_logic;
                    i_reset         : in std_logic;
                    i_str_tampon    : in std_logic;
                    
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
    signal d_stb_380kHz    : std_logic := '0';  -- est utile pour debounce et cadence echantillonnage AD1
    signal d_stb_200Hz     : std_logic;
    
    signal reset           : std_logic; 
    
    signal d_davs          : std_logic;
    signal d_AD_Dselect    : std_logic; 
    signal d_echantillon   : std_logic_vector (11 downto 0); 
    
    signal s_nb_items      : std_logic_vector(7 downto 0);
    signal s_detect        : std_logic;

begin
    reset    <= i_btn(0);    
 
    Synchronisation : Synchro_Horloges
        port map (
                clkm         =>  sysclk,
                o_S_10MHz    =>  o_AD_CLK,
                o_CLK_10MHz  => clk_10MHz,
                o_stb_380kHz => d_stb_380kHz,
                o_stb_200Hz  => d_stb_200Hz,
                o_S_1Hz      => o_ledtemoin_b
        );
    
    insta_magnetic : magnetic
        Port map(  --Generaux
                i_clk           =>  d_S_10MHz,
                i_reset         =>  reset,
                i_str_tampon    =>  d_stb_200Hz,
                
                --Controle ADC
                i_Data          =>  i_ADC_Data,
                i_Strobe_ADC    =>  d_stb_380kHz,

                --Traitement de signal
                o_vitesse       =>  o_vitesse,
                o_calories      =>  o_calories,
                o_distance      =>  o_distance,
                i_poid_Kg       =>  i_poid_Kg,
                i_taille_m      =>  i_taille_m
        );
  
  o_AD_NCS <= d_stb_380kHz;
  o_AD_CLK <= d_S_10MHz;
  
end Behavioral;

