library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.Velocyraptor_package.all;

entity memory_block is
    Port (
            reset           : in    std_logic;
            
            -- data qui provient de l'ergonomie
            i_strb_ergo     : in    std_logic;
            i_data_ergo     : in    std_logic_vector (31 downto 0);
            
            -- data qui provient du capteur magnétique
            --i_strb_mag      : in    std_logic;
            i_data_speed    : in    unsigned (31 downto 0);
            i_data_cals     : in    unsigned (31 downto 0);
            i_data_dist     : in    unsigned (31 downto 0);
            
            -- signal du serveur
            i_serv_sig      : in    std_logic;
            
            -- data out
            o_data_ergo     : out   ERGO_MEM; 
            o_data_speed    : out   unsigned (31 downto 0); --SPEED_MEM; 
            o_data_cals     : out   unsigned (31 downto 0); --CALS_MEM;
            o_data_dist     : out   unsigned (31 downto 0) --DIST_MEM

    );
end memory_block;

architecture Behavioral of memory_block is

signal mem_ergo         :   ERGO_MEM    :=((others=> (others=>'0')));
signal mem_ergo_index   :   natural     := 0;

--signal mem_speed        :   SPEED_MEM   :=((others=> (others=>'0')));
--signal mem_speed_index  :   natural     := 0;

--signal mem_cals         :   CALS_MEM    :=((others=> (others=>'0')));
--signal mem_cals_index   :   natural     := 0;

--signal mem_dist         :   DIST_MEM    :=((others=> (others=>'0')));
--signal mem_dist_index   :   natural     := 0;


begin

    -- gestion du tampon ergo.
    process(i_strb_ergo,reset,i_serv_sig)
    begin
        if i_strb_ergo = '1' and reset = '0' then
        
            mem_ergo(mem_ergo_index) <= i_data_ergo;
            mem_ergo_index <= mem_ergo_index + 1;
        
        elsif  reset = '1' or falling_edge(i_serv_sig) then
        
            mem_ergo  <= (( others=> ( others =>'0' )));

            mem_ergo_index <= 0;
            
        end if;
    end process;
    
--    -- gestion du tampon magnétique.
--    process(i_strb_mag,reset,i_serv_sig)
--    begin
--        if i_strb_mag = '1' and reset = '0' then
        
--            mem_speed(mem_speed_index) <= i_data_speed;
--            mem_speed_index <= (mem_speed_index + 1);
            
--            mem_cals(mem_cals_index) <= i_data_cals;
--            mem_cals_index <= (mem_cals_index + 1);
            
--            mem_dist(mem_dist_index) <= i_data_dist;
--            mem_dist_index <= (mem_dist_index + 1);

--        elsif  reset = '1' or falling_edge(i_serv_sig) then
        
--        mem_speed <= (( others=> ( others =>'0' )));
--        mem_cals  <= (( others=> ( others =>'0' )));
--        mem_dist  <= (( others=> ( others =>'0' )));

--        mem_speed_index <= 0;                                                                                                             
--        mem_cals_index <= 0;
--        mem_dist_index <= 0;
        
--        end if;
--    end process;
    
    -- gestion de la sortie au serveur.
    process(i_serv_sig)
    begin
        if rising_edge(i_serv_sig) then -- i_serv_sig passe de 0 à 1
        
            o_data_ergo  <= mem_ergo;
            o_data_speed <= i_data_speed;
            o_data_cals  <= i_data_cals;
            o_data_dist  <= i_data_dist;
            
        end if;
    end process;

end Behavioral;