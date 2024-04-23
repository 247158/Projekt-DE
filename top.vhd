library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    Port (
        CLK100MHZ   : in  std_logic;
        BTNC        : in  std_logic;
        SW          : in  std_logic_vector(7 downto 0);
        LED         : out std_logic_vector(7 downto 0);
        CA          : out std_logic; -- Катоды семисегментного индикатора
        AN          : out std_logic_vector(3 downto 0);
        caesar_sel  : in  std_logic;
        vernam_sel  : in  std_logic
    );
end top;

architecture Behavioral of top is
    signal caesar_data   : std_logic_vector(7 downto 0) := (others => '0');
    signal vernam_data   : std_logic_vector(7 downto 0) := (others => '0');
    signal caesar_output : std_logic_vector(7 downto 0);
    signal vernam_output : std_logic_vector(7 downto 0);
    signal selected_output : std_logic_vector(7 downto 0);

    -- Объявления компонентов шифров...

begin

    -- Инстанцирование шифра Цезаря...
    caesar_inst: entity work.caesar_cipher
        port map(
            clk => CLK100MHZ,
            rst => BTNC,
            sw  => caesar_data,
            led => caesar_output
        );

    -- Инстанцирование шифра Вернама...
    vernam_inst: entity work.vernam_cipher
        port map(
            clk => CLK100MHZ,
            rst => BTNC,
            sw  => vernam_data,
            led => vernam_output
        );

    -- Управляющая логика...
    process(CLK100MHZ, BTNC)
    begin
        if rising_edge(CLK100MHZ) then
            if BTNC = '1' then  -- Сброс
                caesar_data <= (others => '0');
                vernam_data <= (others => '0');
                selected_output <= (others => '0');
            else
                if caesar_sel = '1' then
                    caesar_data <= SW;
                    selected_output <= caesar_output;
                elsif vernam_sel = '1'  then
                    vernam_data <= SW;
                    selected_output <= vernam_output;
                else
                    selected_output <= SW; -- Default output if no cipher is selected.
                end if;
            end if;
        end if;
    end process;

    LED <= selected_output;

    -- Инициализация семисегментного дисплея (это только пример)
    AN <= "1110"; -- Активация только первого сегмента
    CA <= not SW(0); -- Простой пример вывода значения первого переключателя
end Behavioral;
