library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration: Defines ports for the decoder
entity Decoder_2_to_4 is
    Port (
        I  : in STD_LOGIC_VECTOR (1 downto 0);  -- 2-bit input
        EN : in STD_LOGIC;                      -- Enable signal
        Y  : out STD_LOGIC_VECTOR (3 downto 0)  -- 4-bit output
    );
end Decoder_2_to_4;

-- Architecture: Implements the decoding logic
architecture Behavioral of Decoder_2_to_4 is
begin
    -- Output Y(0) is active when I = "00" and EN = '1'
    Y(0) <= EN AND (NOT(I(0)) AND NOT(I(1)));

    -- Output Y(1) is active when I = "01" and EN = '1'
    Y(1) <= EN AND (I(0) AND NOT(I(1)));

    -- Output Y(2) is active when I = "10" and EN = '1'
    Y(2) <= EN AND (NOT(I(0)) AND I(1));

    -- Output Y(3) is active when I = "11" and EN = '1'
    Y(3) <= EN AND (I(0) AND I(1));
end Behavioral;