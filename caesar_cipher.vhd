library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity caesar_cipher is
    Port (
        en: in std_logic;
        code_decode : in std_logic;
        input  : in  std_logic_vector(5 downto 0);
        output : out std_logic_vector(5 downto 0)
    );
end caesar_cipher;

architecture Behavioral of caesar_cipher is
begin
    process(input, code_decode, en)
        variable temp_out : integer;
    begin
    temp_out := TO_INTEGER(unsigned(input));
    if en = '1' then
        if code_decode = '0' then
            temp_out := (temp_out + 3) mod 8;
        else
            temp_out := (temp_out - 3) mod 8;
        end if;
    end if;
    output <= std_logic_vector(TO_UNSIGNED(temp_out, 6));
    end process;
end Behavioral;
