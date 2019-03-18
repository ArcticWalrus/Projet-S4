library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tamponcirc is
    Port (
            i_clk, i_reset : in std_ulogic;
            --o_RD_DAT : out unsigned (7 downto 0);
            --i_RD : in std_ulogic;
            i_WR : in std_ulogic;
            --i_WR_DAT: in unsigned (7 downto 0);
            o_plein, o_vide: out std_ulogic;
            o_nb_items : out unsigned( 5 downto 0 )
    );
end tamponcirc;

architecture comport of tamponcirc is
    type RAM is array (natural range <>) of unsigned(7 downto 0);
    constant max: natural := 63;
	signal tampon: RAM(0 to 63) := (others =>  to_unsigned(max,8));
    signal items: unsigned( 5 downto 0 );  -- nombre de donn�es (items) dans le tampon
    signal tete: unsigned( 5 downto 0 ); -- pointeur de t�te (position de lecture)
    signal queue: unsigned (5 downto 0 ); -- pointeur de queue (position d'�criture)
    
    
    -- ** Nouveaux signaux pour tampon circulaire modifi�
    signal actif: std_ulogic_vector(0 to 63);  -- indique les positions "actives" dans le tampon
    signal RD_interne, RD: std_ulogic;  -- commandes de lecture interne et de lecture
    signal underflow: std_ulogic;  -- signal d'underflow
    signal actif_tete: std_ulogic;  -- indicateur "actif" pour la position "tete" dans le tampon
    signal donnee_tete: unsigned (7 downto 0); -- donnee � la position "tete"
begin
    RD <= '0';
    process( i_clk, i_reset )
    begin
        if i_reset='1' then
            tampon <= (others => to_unsigned(max,8));
            items <= (others => '0');
            tete <= (others => '0');
            queue <= (others => '0');
            o_plein <= '0';
            o_vide <= '0';
            
            actif <= (others => '0');  -- **
            
        elsif i_clk='1' and i_clk'event then 
            if i_WR = '1' and RD = '0' then
                if items < to_unsigned(max, 6) then
                    tampon( to_integer( queue )) <= to_unsigned(max,8);
                    queue <= queue + "000001";
                    items <= items + "000001";
                    o_plein <= '0';
                    o_vide <= '0';
                    
                    actif( to_integer( queue ))  <= '1'; -- **

                else
                    o_plein <= '1';
                end if;
--            elsif RD = '1' then 
--                if items > to_unsigned(0, 6) then
--                    o_RD_DAT <= tampon( to_integer( tete ));
--                    tete <= tete + "000001";
--                    items <= items - "000001";
--                    o_vide <= '0';
--                    o_plein <= '0';
                    
--                    actif( to_integer( tete ) )  <= '0'; -- **
            end if;
            if items > to_unsigned(0, 6) then
                 o_vide <= '0';
            else
                o_vide <= '1';
            end if;
            
            for I in 0 to actif'length-1 loop
                if actif(I) = '1'and tampon(I) > "00000000" then
                    tampon(I) <= tampon(I) - "00000001";
                end if;
            end loop;
            if tete = max then 
                tete <= "000000";
            end if;
            
            if donnee_tete = "00000000" then
                tampon(to_integer(tete)) <= to_unsigned(max,8);
                tete <= tete + "000001";
                items <= items - "000001";
                o_vide <= '0';
                o_plein <= '0';
                                    
                actif( to_integer( tete ) )  <= '0'; -- **
            end if;
        end if;
    end process;
    
    -- ** Nouvelles assignations parall�les
    -- g�n�rer signal RD avec une assignation ici
    donnee_tete <= tampon( to_integer( tete ) ); -- ** 
    actif_tete <= actif( to_integer( tete ) ); -- ** 
    o_nb_items <= items;
    -- underflow <= ?
    -- RD <= ? 
            
end comport;
