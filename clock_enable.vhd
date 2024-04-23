library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_enable is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           enable : out STD_LOGIC);
end clock_enable;

architecture Behavioral of clock_enable is
    constant divider : integer := 50000000; -- 1 секунда для 50 МГц
    signal counter : integer range 0 to divider := 0;
begin

    process(clk, rst)
    begin
        if rst = '1' then
            counter <= 0;
            enable <= '0';
        elsif rising_edge(clk) then
            if counter = divider - 1 then
                counter <= 0;
                enable <= '0';
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

end Behavioral;
