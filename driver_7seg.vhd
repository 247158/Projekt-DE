library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity driver_7seg is
      port (
        clk    : in  std_logic;                           
        rst    : in  std_logic;
        cipher_en : in std_logic;
        encoding : in std_logic;
        code_decode : in std_logic;                     
        data0  : in  std_logic_vector(5 downto 0);        
        data1  : in  std_logic_vector(5 downto 0);        
        data2  : in  std_logic_vector(5 downto 0);        
        data3  : in  std_logic_vector(5 downto 0);
        data4  : in  std_logic_vector(5 downto 0);        
        data5  : in  std_logic_vector(5 downto 0);        
        data6  : in  std_logic_vector(5 downto 0);        
        data7  : in  std_logic_vector(5 downto 0);      
        seg    : out std_logic_vector(6 downto 0);        
        dig    : out std_logic_vector(7 downto 0)         
    );
end entity driver_7seg;

architecture Behavioral of driver_7seg is                     
    signal sig_cnt_3bit : std_logic_vector(2 downto 0);
    signal decode_in : std_logic_vector(5 downto 0);
    signal sig_cnt : std_logic_vector(15 downto 0);

    component simple_counter is
        generic (
            NBIT : integer := 16
        );
        port (
            clk    : in  std_logic;
            rst    : in  std_logic;
            en     : in  std_logic;
            count  : out std_logic_vector(NBIT - 1 downto 0)
        );
    end component;
    
    component bin2seg is
        port (
            clear : in    std_logic;                    --! Clear the display
            bin   : in    std_logic_vector(5 downto 0); --! Binary representation of one hexadecimal symbol
            seg   : out   std_logic_vector(6 downto 0)  --! Seven active-low segments from A to G    
        );
    end component;
    
    component caesar_cipher is
        Port (
            en: in std_logic;
            code_decode : in std_logic;
            input  : in  std_logic_vector(5 downto 0);
            output : out std_logic_vector(5 downto 0)
        );
    end component;

begin

    -- Инстанциация simple_counter
    cnt: component simple_counter
        port map (
            clk   => clk,
            rst   => rst,
            en    => '1',
            count => sig_cnt
        );
        
    sig_cnt_3bit <= sig_cnt(15 downto 13);
        
    decoder : component bin2seg
        port map (
            clear => rst,
            bin => decode_in,
            seg => seg
        );
    
    -- Мультиплексирование и декодирование цифр на 7-сегментном индикаторе
    p_mux: process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                decode_in <= (others => '0');
                dig     <= (others => '1');
            else
                case sig_cnt_3bit is
                    when "000" =>
                        decode_in <= data0;
                        dig    <= "01111111";
                    when "001" =>
                        decode_in <= data1;
                        dig    <= "10111111";
                    when "010" =>
                        decode_in <= data2;
                        dig    <= "11011111";
                    when "011" =>
                        decode_in <= data3;
                        dig    <= "11101111";
                    when "100" =>
                        decode_in <= data4;
                        dig    <= "11110111";                
                    when "101" =>
                        decode_in <= data5;
                        dig    <= "11111111";                
                    when "110" =>
                        decode_in <= data6;
                        dig    <= "10111111";             
                    when "111" =>
                        decode_in <= data7;
                        dig    <= "01111111";
                    when others =>
                        decode_in <= (others => '0');
                end case;
            end if;
        end if;
    end process p_mux;
end Behavioral;
