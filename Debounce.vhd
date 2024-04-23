    library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;
    
    entity debounce is
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               btn_in : in STD_LOGIC;
               btn_out : out STD_LOGIC);
    end debounce;
    
    architecture Behavioral of debounce is
        signal btn_int : STD_LOGIC := '0';
        signal counter : INTEGER range 0 to 500000 := 0; -- Примерное значение для FPGA с частотой 50MHz
    begin
    
        process(clk, rst)
        begin
            if rst = '1' then
                btn_int <= '0';
                counter <= 0;
            elsif rising_edge(clk) then
                if btn_in = '1' and btn_int = '0' then
                    if counter >= 500000 then -- Примерное значение для задержки около 10 мс
                        btn_int <= '1';
                        counter <= 0;
                    else
                        counter <= counter + 1;
                    end if;
                elsif btn_in = '0' then
                    btn_int <= '0';
                    counter <= 0;
                end if;
            end if;
        end process;
    
        btn_out <= btn_int;
    end Behavioral;
