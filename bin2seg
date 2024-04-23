library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bin2seg is
    Port ( bin_in : in STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out STD_LOGIC_VECTOR (6 downto 0));
end bin2seg;

architecture Behavioral of bin2seg is
begin
    seg_out <= "0000001" when bin_in = "0000" else -- 0
               "1001111" when bin_in = "0001" else -- 1
               "0010010" when bin_in = "0010" else -- 2
               "0000110" when bin_in = "0011" else -- 3
               "1001100" when bin_in = "0100" else -- 4
               "0100100" when bin_in = "0101" else -- 5
               "0100000" when bin_in = "0110" else -- 6
               "0001111" when bin_in = "0111" else -- 7
               "0000000" when bin_in = "1000" else -- 8
               "0000100" when bin_in = "1001" else -- 9
               "0001000"; -- A, по умолчанию
end Behavioral;
