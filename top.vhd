library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    Port (
        CLK100MHZ   : in  std_logic;
        BTNC        : in  std_logic;
        BTNU        : in  std_logic;
        SW          : in  std_logic_vector(7 downto 0);
        LED         : out std_logic_vector(7 downto 0);
        C           : out std_logic_vector(6 downto 0);
        DP          : out std_logic;
        AN          : out std_logic_vector(7 downto 0)
    );
end top;

architecture Behavioral of top is
    component driver_7seg is 
        port (
            clk    : in  std_logic;                           
            rst    : in  std_logic;
            encoding : in std_logic;
            code_decode : in std_logic;
            cipher_en : in std_logic;                    
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
    end component;
begin
    DP <= '1';
    
    display: component driver_7seg 
        port map (
            clk => CLK100MHZ,
            rst => BTNC,
            cipher_en => BTNU,
            encoding => SW(7),
            code_decode => SW(6),
            data0 => "000000",
            data1 => "000001",
            data2 => "000010",
            data3 => "000011",
            data4 => "000100",
            data5 => "000101",
            data6 => "000110",
            data7 => "000111",
            seg => C,
            dig => AN
        );
    
end Behavioral;
