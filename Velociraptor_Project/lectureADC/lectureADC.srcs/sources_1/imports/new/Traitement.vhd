library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity Traitement is
    Port ( 
            i_clk               : in std_logic; --10 MHz (100ns)
            i_reset             : in std_logic;
            o_vitesse           : out unsigned(5 downto 0);
            o_calorie           : out unsigned(10 downto 0);
            o_distance          : out unsigned(31 downto 0);
            i_nb_items_total    : in unsigned(31 downto 0);
            i_poid_Kg           : in unsigned(7 downto 0);
            i_taille_cm         : in unsigned(7 downto 0);
            i_tours_en_2sec     : in unsigned(5 downto 0);
            i_stb               : in std_logic
    );
end Traitement;

architecture Behavioral of Traitement is

--constant rayon_roue: natural := natural(0.336); --diamètre de la roue = 67.2 cm -> rayon de 33.6 cm

type weight_category is (less_65, between_65_75, above_75);
signal current_weight : weight_category;

type etat_compteur is (init, counting, reached_10ms);
signal compteur_etat : etat_compteur;
signal compteur_next_state : etat_compteur;

signal s_u_vitesse : unsigned(5 downto 0);
--constant circonference: natural := natural(2 * natural(MATH_PI) * rayon_roue);
constant circ: integer := 211; --(m*100)
signal calorie, constante_calorie : integer;
signal s_vitesse : integer;
signal compteur : unsigned(31 downto 0);

begin

    process(i_reset, i_tours_en_2sec, s_vitesse, i_nb_items_total, calorie)
    begin
    	if i_reset = '1' then
            s_vitesse   <= 0; --m/s
            
            s_u_vitesse <= (others => '0');
            o_distance  <= (others => '0');
            o_calorie   <= (others => '0');
    	else 
            s_vitesse <= circ * to_integer(i_tours_en_2sec) / 200; --m/s
            
            s_u_vitesse <= to_unsigned(s_vitesse * 360 / 100, 6); --(km/h) à vérifier l'allure de la valeur 
            o_distance <= to_unsigned(circ * to_integer(i_nb_items_total) / 100, 32); --à vérifier l'allure de la valeur facteur 100 -> 2 décimales
            --o_distance(7 downto 0) <= i_poid_Kg;
            --o_distance(31 downto 8) <= (others => '0');
            o_calorie  <= to_unsigned(calorie / 360000, 11); --temporaire, il faut accumuler les valeurs facteur 10 pour 1 décimale	
    	end if;
    
    end process;
    
    process(i_clk, i_reset)
    begin
        if (i_reset = '1') then --compteur pour chaque 10 ms reset
            compteur_etat <= init;
        elsif (i_clk = '1' and i_clk'event) then
            compteur_etat <= compteur_next_state;
        end if;
    end process;
    
    process(i_reset, i_stb)
    begin
    if (i_reset = '1') then
        calorie <= 0;     
    elsif i_stb = '1' and i_stb'event then
        calorie <= calorie + constante_calorie;
    end if;  
    end process;
    
    process(i_poid_Kg)
    begin
        if i_poid_Kg < 65 then -- <65 kg
            current_weight <= less_65;
        elsif i_poid_Kg > 75 then -- >75 kg
            current_weight <= above_75;
        else 
            current_weight <= between_65_75;
        end if;
    end process;
    
process(s_u_vitesse) -- défini la constante de calories / 10 ms
        begin    
            if (s_u_vitesse < "001011") then -- < 11km/h (pas assez précis pour calculer calories)
                    constante_calorie <= 17 * to_integer(s_u_vitesse);
            elsif (current_weight = less_65) then --Less than 65 kg
                constante_calorie     <= 40 * to_integer(s_u_vitesse) - 412 ;      
            elsif (current_weight = between_65_75) then --Between 65 and 75 kg  
                constante_calorie <= 48 * to_integer(s_u_vitesse) - 493;          
            elsif (current_weight = above_75) then -- Above 75 kg  
                constante_calorie <= 59 * to_integer(s_u_vitesse) - 603;                                                                                            
            else
                constante_calorie <= 563;   -- valeur moyenne   
            end if;
        
        end process;

	
	o_vitesse <= s_u_vitesse; --(km/h) à vérifier l'allure de la valeur facteur 100 pour garder 2 décimales
    --o_vitesse(5 downto 0) <= i_tours_en_2sec;
end Behavioral;
