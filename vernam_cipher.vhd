library ieee;
use ieee.std_logic_1164.all;

entity vernam_cipher is
    Port (
        clk : in  std_logic;
        rst : in  std_logic;
        sw  : in  std_logic_vector(7 downto 0);
        led : out std_logic_vector(7 downto 0)
    );
end vernam_cipher;

architecture Behavioral of vernam_cipher is
    -- Ключ шифрования Вернама
    constant key : std_logic_vector(7 downto 0) := "10101010"; -- Пример ключа
    signal led_internal : std_logic_vector(7 downto 0);
begin
    -- Процесс обработки входного clk и выполнения XOR для шифрования
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                led_internal <= (others => '0'); -- Сброс выходных данных
            else
                led_internal <= sw xor key; -- Применяем XOR с ключом
            end if;
        end if;
    end process;

    led <= led_internal; -- Присваиваем внутренний сигнал к выходному порту
end Behavioral;
