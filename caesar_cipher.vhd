library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity caesar_cipher is
    Port (
        clk : in  std_logic;
        rst : in  std_logic;
        sw  : in  std_logic_vector(7 downto 0);
        led : out std_logic_vector(7 downto 0)
    );
end caesar_cipher;

architecture Behavioral of caesar_cipher is
    signal temp : unsigned(7 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                temp <= (others => '0');
            else
                temp <= unsigned(sw) + 3;  -- Caesar cipher shift by 3
            end if;
        end if;
    end process;

    led <= std_logic_vector(temp);
end Behavioral;
