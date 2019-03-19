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
            
            --Controle ADC
            i_Data          : in    std_logic; -- bit arrivant de l'adc
            i_Strobe_ADC    : in    std_logic; -- strobe debut conversion 380KHz??

            --Traitement de signal
            o_vitesse       : out   std_logic;
            o_calories      : out   std_logic;
            o_distance      : out   std_logic;
            i_poid_Kg       : in    std_logic;
            i_taille_m      : in    std_logic
    );     
end magnetic;

architecture Behavioral of magnetic is

    component Ctrl_AD1 is 
        port (  
                clk_AD          : in    std_logic; --clk
                i_DO            : in    std_logic;  --data in
                i_Strobe_AD     : in    std_logic; --strobe 200Hz
                reset           : in    std_logic; 
                o_dav_strobe    : out   std_logic; --data ready
                o_ech           : out   std_logic_vector (11 downto 0) --data complete
        );
    end  component;
   
    component compteur_signal
        Port ( 
                line_in         : in signed(11 downto 0);
                i_clk, i_reset  : in std_logic;
<<<<<<< HEAD
                o_nb_items      : out unsigned(5 downto 0);
=======
                i_stb_tampon    : in std_logic;
                o_nb_items      : out std_logic_vector(7 downto 0);
>>>>>>> 7c7830c72c186f62f6254ff1dda31b405bb50668
                o_high          : out std_logic
        );
    end component;
    
    component Traitement is
        Port ( 
                i_clk               : in std_logic;
                i_reset             : in std_logic;
                o_vitesse           : out std_logic;
                o_calories          : out std_logic;
                o_distance          : out std_logic;
                i_poid_Kg           : in std_logic;
                i_taille_m          : in std_logic;
                i_tours_en_2sec     : in unsigned(5 downto 0)
        );
    end component;
      
    signal s_clk            : std_logic;
    signal s_reset          : std_logic; 
    
    --ADC
    signal d_Strobe_ADC     : std_logic;
    signal d_data_ready     : std_logic;
    signal d_bit_in         : std_logic; 
    signal d_echantillon    : std_logic_vector (11 downto 0); 
    
    --Compteur Signal
    signal s_line_in        : signed(11 downto 0);
    signal s_nb_items       : unsigned(5 downto 0);
    signal s_detect         : std_logic;
    
    --Traitement
    

begin

    entity_compteur_signal : compteur_signal
        Port map( 
            line_in         => s_line_in,
            i_clk           => s_clk,
            i_stb_tampon    => i_str_tampon,
            i_reset         => s_reset,
            o_nb_items      => s_nb_items,
            o_high          => s_detect
        );

    Controleur :  Ctrl_AD1 
        port map(
            clk_AD         => s_clk,            -- pour horloge externe du convertisseur (variable logique ne passant pas par bufg)
            i_DO           => d_bit_in,         -- bit de données provenant du convertisseur (via um mux)
            i_Strobe_AD    => d_Strobe_ADC,     -- synchronisation: déclencheur de la conversion
            reset          => s_reset,
            o_dav_strobe   => d_data_ready,     -- indicateur de conversion complete
            o_ech          => d_echantillon     -- valeur de l'échantillon lu
        );
      
    inst_traitement : Traitement
        Port map ( 
              i_clk             => s_clk, 
              i_reset           => s_reset,
              o_vitesse         => o_vitesse,
              o_calories        => o_calories,
              o_distance        => o_distance,
              i_poid_Kg         => i_poid_Kg,
              i_taille_m        => i_taille_m,
              i_tours_en_2sec   => s_nb_items        --temporaire
        );

end Behavioral;
