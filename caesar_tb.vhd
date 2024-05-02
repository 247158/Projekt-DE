library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_caesar_cipher is
end tb_caesar_cipher;

architecture behavior of tb_caesar_cipher is
    -- Component Declaration for the Unit Under Test (UUT)
    component caesar_cipher
        port (
            en          : in std_logic;
            code_decode : in std_logic;
            input       : in std_logic_vector(5 downto 0);
            output      : out std_logic_vector(5 downto 0)
        );
    end component;

    -- Inputs
    signal en          : std_logic := '0';
    signal code_decode : std_logic := '0';
    signal input       : std_logic_vector(5 downto 0) := (others => '0');

    -- Outputs
    signal output      : std_logic_vector(5 downto 0);

    -- Test vectors and expected results
    type test_vector is record
        data         : std_logic_vector(5 downto 0);
        expected_enc : std_logic_vector(5 downto 0);
        expected_dec : std_logic_vector(5 downto 0);
    end record;

    type test_vector_array is array (natural range <>) of test_vector;
    constant test_data : test_vector_array := (
        (data => "000001", expected_enc => "000100", expected_dec => "000001"),
        (data => "000010", expected_enc => "000101", expected_dec => "000010"),
        (data => "000011", expected_enc => "000110", expected_dec => "000011"),
        -- Add more test vectors as needed
        (data => "111100", expected_enc => "111111", expected_dec => "111100")
    );

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: caesar_cipher port map (
        en          => en,
        code_decode => code_decode,
        input       => input,
        output      => output
    );

    -- Test process
    test_proc: process
        variable idx : integer := 0;
    begin
        for i in test_data'range loop
            -- Test encryption
            input <= test_data(i).data;  -- Set input data
            code_decode <= '0';  -- Set to encrypt mode
            en <= '1';  -- Enable the cipher
            wait for 20 ns;  -- Wait for the output to stabilize

            -- Check encryption result
            assert output = test_data(i).expected_enc
            report "Encryption error: output does not match expected value for input " & 
                   integer'image(i) severity error;

            -- Test decryption using the encrypted output
            input <= output;  -- Feed the encrypted output back
            code_decode <= '1';  -- Set to decrypt mode
            wait for 20 ns;  -- Wait for the output to stabilize

            -- Check decryption result
            assert output = test_data(i).expected_dec
            report "Decryption error: output does not match original value for input " & 
                   integer'image(i) severity error;
        end loop;

        -- Finish simulation after tests
        report "All tests completed successfully.";
        wait;
    end process;
end behavior;
