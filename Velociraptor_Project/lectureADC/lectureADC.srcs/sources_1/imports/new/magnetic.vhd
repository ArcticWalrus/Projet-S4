library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity magnetic is
    Port (  --Generaux
            i_clk           : in    std_logic;
            i_reset         : in    std_logic;
            i_str_tampon    : in    std_logic;
            i_ech_valid     : in std_logic;
            i_ech           : in   std_logic_vector (11 downto 0);
            --Controle ADC
            --i_Data          : in    std_logic; -- bit arrivant de l'adc
            --i_Strobe_ADC    : in    std_logic; -- strobe debut conversion 380KHz??

            --Traitement de signal
            o_vitesse       : out   unsigned(5 downto 0);
            o_calorie       : out   unsigned(10 downto 0);
            o_distance      : out   unsigned(10 downto 0);
            i_poid_Kg       : in    unsigned(7 downto 0);
            i_taille_cm     : in    unsigned(7 downto 0)
    );     
end magnetic;

architecture Behavioral of magnetic is

--    component Ctrl_AD1 is 
--        port (  
--                clk_AD          : in    std_logic; --clk
--                i_DO            : in    std_logic;  --data in
--                i_Strobe_AD     : in    std_logic; --strobe 380MHz
--                reset           : in    std_logic; 
--                o_dav_strobe    : out   std_logic; --data ready
--                o_ech           : out   signed (11 downto 0) --data complete
--        );
--    end  component;
   
    component compteur_signal
        Port ( 
                line_in          : in std_logic_vector(11 downto 0);
                i_clk, i_reset   : in std_logic;
                i_ech_valid      : in std_logic;
                o_nb_items       : out unsigned(5 downto 0);
                i_stb_tampon     : in std_logic;
                o_high           : out std_logic;
                o_nb_items_total : out unsigned(31 downto 0);
                
                o_signe_x : out std_logic
        );
    end component;
    
    component Traitement is
        Port ( 
                i_clk               : in std_logic;
                i_reset             : in std_logic;
                o_vitesse           : out unsigned(5 downto 0);
                o_calorie           : out unsigned(10 downto 0);
                o_distance          : out unsigned(10 downto 0);
                i_nb_items_total    : in unsigned(31 downto 0);
                i_poid_Kg           : in unsigned(7 downto 0);
                i_taille_cm         : in unsigned(7 downto 0);
                i_tours_en_2sec     : in unsigned(5 downto 0)
        );
    end component;
          
    --ADC
    signal d_data_ready     : std_logic;
    --signal d_echantillon    : signed(11 downto 0); 
    
    --Compteur Signal
    --signal s_line_in        : signed(11 downto 0);
    signal s_nb_items       : unsigned(5 downto 0);
    signal s_nb_items_total : unsigned(31 downto 0);
    signal s_detect         : std_logic;
    
    --Traitement
    

begin

    entity_compteur_signal : compteur_signal
        Port map( 
            line_in         => i_ech, 
            i_clk           => i_clk,
            i_ech_valid     => i_ech_valid,
            i_stb_tampon    => i_str_tampon,
            i_reset         => i_reset,
            o_nb_items      => s_nb_items,
--            o_high          => s_detect,
            o_nb_items_total => s_nb_items_total, 
            
            o_signe_x =>    o_vitesse(0),
            o_high          => o_calorie(0)
        );

--    Controleur :  Ctrl_AD1 
--        port map(
--            clk_AD         => i_clk,            -- pour horloge externe du convertisseur (variable logique ne passant pas par bufg)
--            i_DO           => i_Data,           -- bit de données provenant du convertisseur (via um mux)
--            i_Strobe_AD    => i_Strobe_ADC,     -- synchronisation: déclencheur de la conversion
--            reset          => i_reset,
--            o_dav_strobe   => d_data_ready,     -- indicateur de conversion complete
--            o_ech          => d_echantillon     -- valeur de l'échantillon lu
--        );
      
    inst_traitement : Traitement
        Port map ( 
              i_clk             => i_clk, 
              i_reset           => i_reset,
--              o_vitesse         => o_vitesse,
--              o_calorie         => o_calorie,
              o_vitesse         => open,
              o_calorie         => open,
              o_distance        => o_distance,
              i_nb_items_total  => s_nb_items_total ,
              i_poid_Kg         => i_poid_Kg,
              i_taille_cm       => i_taille_cm,
              i_tours_en_2sec   => s_nb_items        --temporaire
        );
        
    o_vitesse(5 downto 1) <= (others => '0');
    o_calorie(10 downto 1) <= (others => '0');
end Behavioral;
