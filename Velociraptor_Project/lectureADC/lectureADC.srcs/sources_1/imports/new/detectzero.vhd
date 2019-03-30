library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity detectzero is
    Port ( 
        i_clk, id_reset: in std_ulogic;
        i_ech_valid     : in std_logic;
        i_x: in std_logic_vector(11 downto 0);
        o_s, o_z: out std_ulogic
    );
end detectzero;

architecture comport of detectzero is
    type detect_seq_type is (init, p0, p1, p2, p3, n0, n1, n2, n3);
    signal etat_courant, etat_suivant: detect_seq_type;
    signal signe_x: std_ulogic;
    signal so_z : std_ulogic;
begin
    registre: process( i_clk, id_reset )
    begin
        if (id_reset = '1') then
            etat_courant <= init;
        elsif (i_clk = '1' and i_clk'event) then
            etat_courant <= etat_suivant;
        end if;
    end process;
    
--    returnLow : process (i_clk)
--    begin
--        if (i_clk = '0'and i_clk'event) then
--            if (so_z = '1') then
--                so_z <= '0';
--            end if;
--        end if;
--    end process;
    
    o_z <= so_z;
    signe : process(i_ech_valid)
    begin
        if (i_ech_valid = '1' and i_ech_valid'event) then
            if (i_x < x"3E1") then 
                signe_x <= '0';
            else
                signe_x <= '1';
            end if;
        end if;
        
    end process;
    
    --signe_x <= i_x(11) xor '1';   -- signe_x = 1 si i_x positif ou nul, 0 autrement
    
    decodeur: process( i_ech_valid, etat_courant )
    begin
        case etat_courant is
            when init =>
                --o_s <= '0';
                so_z <= '0';
                if signe_x = '1' then 
                    etat_suivant <= p1;
                else
                    etat_suivant <= n1;
                end if;
            when p0 =>
                --o_s <= '0';
                so_z <= '0';
                if signe_x = '1' then
                    etat_suivant <= p1;
                else
                    etat_suivant <= p0;
                end if;
            when p1 =>
                --o_s <= '0';
                so_z <= '0';
                if signe_x = '1' then
                    etat_suivant <= p2;
                else
                    etat_suivant <= p0;
                end if;
            when p2 =>
                --o_s <= '0';
                so_z <= '0';
                if signe_x = '1' then
                    etat_suivant <= p3;
                else
                    etat_suivant <= p0;
                end if;
            when p3 =>
                --o_s <= '1';
                so_z <= '0';
                if signe_x = '1' then
                    etat_suivant <= n0;
                else
                    etat_suivant <= n1;
                end if;
            when n0 =>
                --o_s <= '1';
                so_z <= '0';
                if signe_x = '1' then
                    etat_suivant <= n0;
                else
                    etat_suivant <= n1;
                end if;
            when n1 =>
                --o_s <= '1';
                so_z <= '0';
                if signe_x = '1' then
                    etat_suivant <= n0;
                else
                    etat_suivant <= n2;
                end if;
            when n2 =>
                --o_s <= '1';
                so_z <= '0';
                if signe_x = '1' then
                    etat_suivant <= n0;
                else
                    etat_suivant <= n3;
                end if;
            when n3 =>
                --o_s <= '0';
                so_z <= '1';
                if signe_x = '1' then
                    etat_suivant <= p1;
                else
                    etat_suivant <= p0;
                end if;
        end case;
    end process;  
    
    o_s <= signe_x;       
end comport;
