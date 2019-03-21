library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity Traitement is
    Port ( 
            i_clk               : in std_logic; --10 MHz (100ns)
            i_reset             : in std_logic;
            o_vitesse           : out unsigned(31 downto 0);
            o_calories          : out unsigned(31 downto 0);
            o_distance          : out unsigned(31 downto 0);
            i_nb_items_total    : in unsigned(31 downto 0);
            i_poid_Kg           : in unsigned(7 downto 0);
            i_taille_cm         : in unsigned(7 downto 0);
            i_tours_en_2sec     : in unsigned(7 downto 0)
    );
end Traitement;

architecture Behavioral of Traitement is

constant rayon_roue: real := 0.336; --diamètre de la roue = 67.2 cm -> rayon de 33.6 cm

type weight_category is (less_65, between_65_75, above_75);
signal current_weight : weight_category;

type etat_compteur is (init, counting, reached_10ms);
signal compteur_etat : etat_compteur;
signal compteur_next_state : etat_compteur;

signal s_u_vitesse : unsigned(31 downto 0);
signal circonference: real := 2.0 * MATH_PI * rayon_roue;
signal s_vitesse, calories, constante_calories : real;
signal compteur : unsigned(31 downto 0);

begin

    process(i_reset, i_tours_en_2sec, s_vitesse, i_nb_items_total, calories)
    begin
    	if i_reset = '1' then
            s_vitesse <= 0.0; --m/s
            
            s_u_vitesse <= (others => '0');
            o_distance <= (others => '0');
            o_calories <= (others => '0');
    	else 
            s_vitesse <= circonference * Real(to_integer(i_tours_en_2sec)) / 2.0; --m/s
            
            s_u_vitesse <= to_unsigned(natural(s_vitesse * 3.6), 32); --(km/h) à vérifier l'allure de la valeur 
            o_distance <= to_unsigned(natural(circonference * Real(to_integer(i_nb_items_total)) * 100.0), 32); --à vérifier l'allure de la valeur facteur 100 -> 2 décimales
            o_calories <= to_unsigned(natural(calories*10.0), 32); --temporaire, il faut accumuler les valeurs facteur 10 pour 1 décimale	
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
    
    process(i_reset, compteur_etat, i_clk)
    begin
    if (i_reset = '1') then
        compteur_next_state <= init;
        compteur <= x"00000000";
        calories <= 0.0;     
    elsif i_clk = '1' then
        case compteur_etat is
            when init =>
                compteur_next_state <= counting;
                compteur <= x"00000000";
                calories <= calories;
            when counting =>
                if compteur < x"0001869D" then --en bas de 100000 coups d'horloges
                    compteur_next_state <= counting;
                    calories <= calories;
                else
                    compteur_next_state <= reached_10ms;
                    calories <= calories;
                end if;
                compteur <= compteur + x"00000001";
            when reached_10ms =>
                compteur_next_state <= init;
                calories <= calories + constante_calories/2.0; --on rajoute le nombre de calories selon la constante
                                                               -- à la vitesse actuelle selon le poids (2 est un hotfix
                                                               --lié que la constante est additionnée 2 fois
                compteur <= x"00000000";
            when others =>
                compteur_next_state <= init;   
                calories <= calories;     
                compteur <= x"00000000";  
        end case;
    end if;  
    end process;
    
    process(i_poid_Kg)
    begin
        if i_poid_Kg < x"00000041" then -- <65 kg
            current_weight <= less_65;
        elsif i_poid_Kg > x"0000004b" then -- >75 kg
            current_weight <= above_75;
        else 
            current_weight <= between_65_75;
        end if;
    end process;
    
    process(s_u_vitesse) -- défini la constante de calories / 10 ms
    begin
    --Less than 65 kg
        if (s_u_vitesse < x"00000010" and current_weight = less_65) then -- < 16km/h
            constante_calories <= 236.0/360000;
        elsif (s_u_vitesse >= x"00000010" and s_u_vitesse < x"00000013" and current_weight = less_65) then -- 16<= < 19km/h
            constante_calories     <= 354.0/360000; 
        elsif (s_u_vitesse >= x"00000013" and s_u_vitesse < x"00000016" and current_weight = less_65) then -- 19<= < 22km/h
            constante_calories     <= 472.0/360000; 
        elsif (s_u_vitesse >= x"00000016" and s_u_vitesse < x"00000019" and current_weight = less_65) then -- 22<= < 25km/h
            constante_calories     <= 590.0/360000; 
        elsif (s_u_vitesse >= x"00000019" and s_u_vitesse < x"0000001e" and current_weight = less_65) then -- 25<= < 30km/h
            constante_calories     <= 708.0/360000;    
        elsif (s_u_vitesse >= x"0000001d" and current_weight = less_65) then -- > 30km/h
            constante_calories     <= 944.0/360000;   
           
    --Between 65 and 75 kg        
        elsif (s_u_vitesse < x"00000010" and current_weight = between_65_75) then -- < 16km/h
            constante_calories <= 281.0/360000;
        elsif (s_u_vitesse >= x"00000010" and s_u_vitesse < x"00000013" and current_weight = between_65_75) then -- 16<= < 19km/h
            constante_calories     <= 422.0/360000; 
        elsif (s_u_vitesse >= x"00000013" and s_u_vitesse < x"00000016" and current_weight = between_65_75) then -- 19<= < 22km/h
            constante_calories     <= 563.0/360000; 
        elsif (s_u_vitesse >= x"00000016" and s_u_vitesse < x"00000019" and current_weight = between_65_75) then -- 22<= < 25km/h
            constante_calories     <= 704.0/360000; 
        elsif (s_u_vitesse >= x"00000019" and s_u_vitesse < x"0000001e" and current_weight = between_65_75) then -- 25<= < 30km/h
            constante_calories     <= 844.0/360000;    
        elsif (s_u_vitesse >= x"0000001d" and current_weight = between_65_75) then -- > 30km/h
            constante_calories     <= 1126.0/360000;  
    -- Above 75 kg            
        elsif (s_u_vitesse < x"00000010" and current_weight = above_75) then -- < 16km/h
            constante_calories <= 345.0/360000;
        elsif (s_u_vitesse >= x"00000010" and s_u_vitesse < x"00000013" and current_weight = above_75) then -- 16<= < 19km/h
            constante_calories     <= 518.0/360000; 
        elsif (s_u_vitesse >= x"00000013" and s_u_vitesse < x"00000016" and current_weight = above_75) then -- 19<= < 22km/h
            constante_calories     <= 690.0/360000; 
        elsif (s_u_vitesse >= x"00000016" and s_u_vitesse < x"00000019" and current_weight = above_75) then -- 22<= < 25km/h
            constante_calories     <= 863.0/360000; 
        elsif (s_u_vitesse >= x"00000019" and s_u_vitesse < x"0000001e" and current_weight = above_75) then -- 25<= < 30km/h
            constante_calories     <= 1035.0/360000;    
        elsif (s_u_vitesse >= x"0000001d" and current_weight = above_75) then -- > 30km/h
            constante_calories     <= 1380.0/360000;                                                                                                 
        else
            constante_calories <= 563.0/360000; -- valeur médiane      
        end if;
    
    end process;

	
	o_vitesse <= to_unsigned(natural(s_vitesse * 360.0), 32); --(km/h) à vérifier l'allure de la valeur facteur 100 pour garder 2 décimales

end Behavioral;
