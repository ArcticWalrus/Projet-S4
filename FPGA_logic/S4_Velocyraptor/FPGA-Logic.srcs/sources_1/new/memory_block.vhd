library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Velocyraptor_package.all;

entity memory_block is
    Port (
            -- data qui provient de l'ergonomie
            i_strb_ergo     : in    std_logic;
            i_data_ergo     : in    std_logic_vector (31 downto 0);
            
            -- data qui provient du capteur magn�tique
            i_strb_mag      : in    std_logic;
            i_data_speed    : in    std_logic_vector (31 downto 0);
            i_data_dist     : in    std_logic_vector (31 downto 0);
            i_data_cals     : in    std_logic_vector (31 downto 0);
            
            -- signal du serveur
            i_serv_sig      : in    std_logic;
            
            -- data out
            o_data_ergo     : out   ERGO_MEM; 
            o_data_speed    : out   SPEED_MEM;
            o_data_dist     : out   DIST_MEM; 
            o_data_cals     : out   CALS_MEM 
    );
end memory_block;

architecture Behavioral of memory_block is

signal mem_ergo         :   ERGO_MEM    :=((others=> (others=>'0')));
signal mem_ergo_index   :   integer     := 0;

signal mem_speed        :   SPEED_MEM   :=((others=> (others=>'0')));
signal mem_speed_index  :   integer     := 0;

signal mem_dist         :   DIST_MEM    :=((others=> (others=>'0')));
signal mem_dist_index   :   integer     := 0;

signal mem_cals         :   CALS_MEM    :=((others=> (others=>'0')));
signal mem_cals_index   :   integer     := 0;


begin

    -- gestion du tampon ergo.
    process(i_strb_ergo)
    begin
        if i_strb_ergo = '1' then
        
            mem_ergo(mem_ergo_index) <= i_data_ergo;
            mem_ergo_index <= (mem_ergo_index + 1);
        
        end if;
    end process;
    
    -- gestion du tampon magn�tique.
    process(i_strb_mag)
    begin
        if i_strb_mag = '1' then
        
            mem_speed(mem_speed_index) <= i_data_speed;
            mem_speed_index <= (mem_speed_index + 1);
            
            mem_dist(mem_dist_index) <= i_data_dist;
            mem_dist_index <= (mem_dist_index + 1);
            
            mem_cals(mem_cals_index) <= i_data_cals;
            mem_cals_index <= (mem_cals_index + 1);
        
        end if;
    end process;
    
    -- gestion de la sortie au serveur.
    process(i_serv_sig)
    begin
        if rising_edge(i_serv_sig) then -- i_serv_sig passe de 0 � 1
        
            o_data_ergo  <= mem_ergo;
            o_data_speed <= mem_speed;
            o_data_dist  <= mem_dist;
            o_data_cals  <= mem_cals;
        
        elsif falling_edge(i_serv_sig) then -- i_serv_sig passe de 1 � 0 -> reset tampon
        
            mem_ergo  <= (( others=> ( others =>'0' )));
            mem_speed <= (( others=> ( others =>'0' )));
            mem_dist  <= (( others=> ( others =>'0' )));
            mem_cals  <= (( others=> ( others =>'0' )));
            
            mem_ergo_index <= 0; 
            mem_speed_index <= 0;
            mem_dist_index <= 0; 
            mem_cals_index <= 0; 

        end if;
    end process;

end Behavioral;