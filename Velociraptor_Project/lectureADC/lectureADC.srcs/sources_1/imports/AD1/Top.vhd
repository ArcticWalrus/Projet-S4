----------------------------------------------------------------------------------
-- Exercice1 Atelier #3 S4 info H19
-- Larissa Njejimana
-- v.1 20-02-2019
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Velocyraptor_package.all;

library UNISIM;
use UNISIM.VComponents.all;

entity Top is
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
   o_AD_CLK         : out std_logic;
   
   -- Connection IMU
   
   
   -- Echange Serveur/FPGA
--   o_ergonomie     : out std_logic_vector ( 2 downto 0 );
--   o_vitesse       : out unsigned(5 downto 0);
--   o_calories      : out unsigned(10 downto 0);
--   o_distance      : out unsigned(8 downto 0);
--   i_poid_Kg       : in    unsigned(7 downto 0);
--   i_taille_cm      : in    unsigned(7 downto 0);
--   i_signal        : in std_logic;
               
   -- ports Block Design
   
   DDR_addr            : inout STD_LOGIC_VECTOR ( 14 downto 0 );
   DDR_ba              : inout STD_LOGIC_VECTOR ( 2 downto 0 );
   DDR_cas_n           : inout STD_LOGIC;
   DDR_ck_n            : inout STD_LOGIC;
   DDR_ck_p            : inout STD_LOGIC;
   DDR_cke             : inout STD_LOGIC;
   DDR_cs_n            : inout STD_LOGIC;
   DDR_dm              : inout STD_LOGIC_VECTOR ( 3 downto 0 );
   DDR_dq              : inout STD_LOGIC_VECTOR ( 31 downto 0 );
   DDR_dqs_n           : inout STD_LOGIC_VECTOR ( 3 downto 0 );
   DDR_dqs_p           : inout STD_LOGIC_VECTOR ( 3 downto 0 );
   DDR_odt             : inout STD_LOGIC;
   DDR_ras_n           : inout STD_LOGIC;
   DDR_reset_n         : inout STD_LOGIC;
   DDR_we_n            : inout STD_LOGIC;
   FIXED_IO_ddr_vrn    : inout STD_LOGIC;
   FIXED_IO_ddr_vrp    : inout STD_LOGIC;
   FIXED_IO_mio        : inout STD_LOGIC_VECTOR ( 53 downto 0 );
   FIXED_IO_ps_clk     : inout STD_LOGIC;
   FIXED_IO_ps_porb    : inout STD_LOGIC;
   FIXED_IO_ps_srstb   : inout STD_LOGIC
   
  );
end Top;

architecture Behavioral of Top is

constant freq_sys_MHz: integer := 125;  -- MHz

 component Ctrl_AD1 is
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
            o_S_10MHz    : out std_logic;  -- source horloge divisee          (clkm MHz / (2*constante_diviseur_p +2) devrait donner 5 MHz soit 200 ns)
            o_clk_10MHz  : out std_logic;
            o_stb_380kHz   : out  std_logic; -- source horloge 100 Hz : out  std_logic;   -- (100  Hz approx:  99,952 Hz) 
            o_stb_200Hz : out  std_logic; -- strobe 100Hz synchro sur clk_5MHz 
            o_S_1Hz     : out  std_logic  -- Signal temoin 1 Hz
        );
       end component;  
  
  component magnetic is
       Port (  --Generaux
           i_clk           : in std_logic;
           i_reset         : in std_logic;
           i_str_tampon    : in std_logic;
           i_ech_valid     : in std_logic;
           --Controle ADC
--           i_Data          : in    std_logic; -- bit arrivant de l'adc
--           i_Strobe_ADC    : in    std_logic; -- strobe debut conversion 380KHz??
           i_ech           : in   std_logic_vector (11 downto 0);
            
           --Traitement de signal
           o_vitesse       : out unsigned(5 downto 0);
           o_calorie      : out unsigned(10 downto 0);
           o_distance      : out unsigned(10 downto 0);                  
           i_poid_Kg       : in  unsigned(7 downto 0);
           i_taille_cm      : in  unsigned(7 downto 0)               
       );               
   end component;
           
--    component memory_block is
--    Port (
--        reset           : in    std_logic;
        
--        -- data qui provient de l'ergonomie
--        i_strb_ergo     : in    std_logic;
--        i_data_ergo     : in    std_logic_vector (31 downto 0);
        
--        -- data qui provient du capteur magnétique
--        --i_strb_mag      : in    std_logic;
--        i_data_speed    : in    unsigned (31 downto 0);
--        i_data_dist     : in    unsigned (31 downto 0);
--        i_data_cals     : in    unsigned (31 downto 0);
        
--        -- signal du serveur
--        i_serv_sig      : in    std_logic;
        
--        -- data out
--        o_data_ergo     : out   ERGO_MEM; 
--        o_data_speed    : out   SPEED_MEM;
--        o_data_dist     : out   DIST_MEM; 
--        o_data_cals     : out   CALS_MEM
--    );               
--    end component;
         
  component design_1_wrapper is 
       Port (
           DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
           DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
           DDR_cas_n : inout STD_LOGIC;
           DDR_ck_n : inout STD_LOGIC;
           DDR_ck_p : inout STD_LOGIC;
           DDR_cke : inout STD_LOGIC;
           DDR_cs_n : inout STD_LOGIC;
           DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
           DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
           DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
           DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
           DDR_odt : inout STD_LOGIC;
           DDR_ras_n : inout STD_LOGIC;
           DDR_reset_n : inout STD_LOGIC;
           DDR_we_n : inout STD_LOGIC;
           FIXED_IO_ddr_vrn : inout STD_LOGIC;
           FIXED_IO_ddr_vrp : inout STD_LOGIC;
           FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
           FIXED_IO_ps_clk : inout STD_LOGIC;
           FIXED_IO_ps_porb : inout STD_LOGIC;
           FIXED_IO_ps_srstb : inout STD_LOGIC;
           Pmod_8LD_pin10_io : inout STD_LOGIC;
           Pmod_8LD_pin1_io : inout STD_LOGIC;
           Pmod_8LD_pin2_io : inout STD_LOGIC;
           Pmod_8LD_pin3_io : inout STD_LOGIC;
           Pmod_8LD_pin4_io : inout STD_LOGIC;
           Pmod_8LD_pin7_io : inout STD_LOGIC;
           Pmod_8LD_pin8_io : inout STD_LOGIC;
           Pmod_8LD_pin9_io : inout STD_LOGIC;
           Pmod_OLED_pin10_io : inout STD_LOGIC;
           Pmod_OLED_pin1_io : inout STD_LOGIC;
           Pmod_OLED_pin2_io : inout STD_LOGIC;
           Pmod_OLED_pin3_io : inout STD_LOGIC;
           Pmod_OLED_pin4_io : inout STD_LOGIC;
           Pmod_OLED_pin7_io : inout STD_LOGIC;
           Pmod_OLED_pin8_io : inout STD_LOGIC;
           Pmod_OLED_pin9_io : inout STD_LOGIC;
           
           -- Input des blocs de communication fpga/serveur
           i_data_echantillon : in STD_LOGIC_VECTOR ( 11 downto 0 );    -- Input du bloc myip (non utilisé)
           i_data_vitesse   : in std_logic_vector (31 downto 0);
           i_data_distance   : in std_logic_vector (31 downto 0);
           i_data_calorie   : in std_logic_vector (31 downto 0);
           i_sw_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
           
           -- Output des blocs de communication fpga/serveur
           o_data_out : out STD_LOGIC_VECTOR ( 31 downto 0 ); -- Output du bloc myip (non utilisé)
           o_data_vitesse   : out std_logic_vector (31 downto 0);
           o_data_distance   : out std_logic_vector (31 downto 0);
           o_data_calorie   : out std_logic_vector (31 downto 0);
           o_leds_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 )
       );
       end component;
   
      signal clk_10MHz        : std_logic;
      signal d_strobe_380kHz  : std_logic := '0';  -- est utile pour debounce et cadence echantillonnage AD1
      signal d_strobe_200Hz   : std_logic := '0';  -- est utile pour debounce et cadence echantillonnage AD1
           
      signal reset           : std_logic; 
      
      signal d_davs          : std_logic;
      signal d_AD_Dselect    : std_logic; 
      signal d_echantillon   : std_logic_vector (11 downto 0); 
    
      signal s_line_in       : std_logic_vector(31 downto 0);
      signal s_nb_items      : std_logic_vector(7 downto 0);
      signal s_detect        : std_logic;
      
      --  Signaux de liaison 
      signal s_vitesse       : unsigned(5 downto 0);
      signal s_distance      : unsigned(10 downto 0);
      signal s_calorie      : unsigned(10 downto 0);
begin
    reset    <= i_btn(0);    
        
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
        clk_AD         => clk_10MHz,         -- pour horloge externe du convertisseur (variable logique ne passant pas par bufg)
        i_DO           => d_AD_Dselect,     -- bit de données provenant du convertisseur (via um mux)
        i_Strobe_AD    => d_strobe_200Hz,   -- synchronisation: déclencheur de la conversion
        RESET          => reset,
        o_dav_strobe   => d_davs,           -- indicateur de conversion complete
        o_ech          => d_echantillon,    -- valeur de l'échantillon lu
        o_ncs_adc      => o_AD_NCS          -- chip select pour le convertisseur
      );
      
   Synchronisation : Synchro_Horloges
    port map (
           clkm         => sys_clock,
           o_S_10MHz     => o_AD_CLK,
           o_clk_10MHz   => clk_10MHz,
           o_stb_380kHz  => d_strobe_380kHz,
           o_stb_200Hz  => d_strobe_200Hz,
           o_S_1Hz      => o_ledtemoin_b
    );
    
    insta_magnetic : magnetic
        Port map(  --Generaux
                i_clk           => clk_10MHz,
                i_reset         => reset,
                i_str_tampon    => d_strobe_380kHz,
                
                i_ech_valid     => d_davs,
                --Controle ADC
                --i_Data          =>  i_ADC_Data,
                --i_Strobe_ADC    =>  d_strobe_100Hz,
                i_ech           => d_echantillon,
                
                --Traitement de signal
                o_vitesse       => s_vitesse,
                o_calorie      => s_calorie,
                o_distance      => s_distance,
--                i_poid_Kg       => i_poid_Kg,
--                i_taille_cm      => i_taille_cm
                i_poid_Kg       => "00000000",
                i_taille_cm      => "00000000"
    );
        
--    insta_memory : memory_block
--        Port map( 
--             reset          =>  reset,
             
--             -- data qui provient de l'ergonomie
--             i_strb_ergo    =>  '0',
--             i_data_ergo    =>  x"00000000",
             
--             -- data qui provient du capteur magnétique
--             --i_strb_mag     =>  '0',
--             i_data_speed   =>  s_vitesse,
--             i_data_cals    =>  s_calories,
--             i_data_dist    =>  s_distance,
             
--             -- signal du serveur
--             i_serv_sig     =>  '0',
             
--             -- data out
--             o_data_ergo    =>  o_ergonomie,
--             o_data_speed   =>  o_vitesse,
--             o_data_cals    =>  o_calories,
--             o_data_dist    =>  o_distance                 
--    );
    
    Design :  design_1_wrapper
          Port map (
              DDR_addr           => DDR_addr,
              DDR_ba             => DDR_ba,
              DDR_cas_n          => DDR_cas_n,
              DDR_ck_n           => DDR_ck_n,
              DDR_ck_p           => DDR_ck_p,
              DDR_cke            => DDR_cke,
              DDR_cs_n           => DDR_cs_n,
              DDR_dm             => DDR_dm,
              DDR_dq             => DDR_dq,
              DDR_dqs_n          => DDR_dqs_n,
              DDR_dqs_p          => DDR_dqs_p,
              DDR_odt            => DDR_odt,
              DDR_ras_n          => DDR_ras_n,
              DDR_reset_n        => DDR_reset_n,
              DDR_we_n           => DDR_we_n,
              FIXED_IO_ddr_vrn   => FIXED_IO_ddr_vrn,
              FIXED_IO_ddr_vrp   => FIXED_IO_ddr_vrp,
              FIXED_IO_mio       => FIXED_IO_mio,
              FIXED_IO_ps_clk    => FIXED_IO_ps_clk,
              FIXED_IO_ps_porb   => FIXED_IO_ps_porb,
              FIXED_IO_ps_srstb  => FIXED_IO_ps_srstb,
              
              Pmod_8LD_pin1_io   => Pmod_8LD(0),
              Pmod_8LD_pin2_io   => Pmod_8LD(1),
              Pmod_8LD_pin3_io   => Pmod_8LD(2),
              Pmod_8LD_pin4_io   => Pmod_8LD(3),
              Pmod_8LD_pin7_io   => Pmod_8LD(4),
              Pmod_8LD_pin8_io   => Pmod_8LD(5),
              Pmod_8LD_pin9_io   => Pmod_8LD(6),
              Pmod_8LD_pin10_io  => Pmod_8LD(7),
              
              Pmod_OLED_pin1_io  => Pmod_OLED(0),
              Pmod_OLED_pin2_io  => Pmod_OLED(1),
              Pmod_OLED_pin3_io  => Pmod_OLED(2),
              Pmod_OLED_pin4_io  => Pmod_OLED(3),
              Pmod_OLED_pin7_io  => Pmod_OLED(4),
              Pmod_OLED_pin8_io  => Pmod_OLED(5),
              Pmod_OLED_pin9_io  => Pmod_OLED(6),
              Pmod_OLED_pin10_io => Pmod_OLED(7),
              ----------------------------------------
              i_data_echantillon            => d_echantillon,
              i_data_vitesse(5 downto 0)    => std_logic_vector(s_vitesse),
              i_data_vitesse(31 downto 6)   => (others => '0'), 
              i_data_distance(10 downto 0)  => std_logic_vector(s_distance),
              i_data_distance(31 downto 11) => (others => '0'), 
              i_data_calorie(10 downto 0)   => std_logic_vector(s_calorie),
              i_data_calorie(31 downto 11)  => (others => '0'), 
              i_sw_tri_i                    => i_sw,
              ----------------------------------------
              o_data_out        => open,
              o_data_vitesse    => open,
              o_data_distance   => open,
              o_data_calorie    => open,
              o_leds_tri_o      => o_leds
          );
         
    --o_AD_NCS <= d_strobe_200Hz;
  
end Behavioral;

