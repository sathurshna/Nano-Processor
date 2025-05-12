library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is

begin
    Y(0) <= (NOT I(0)) AND (NOT I(1)) AND (NOT I(2)) AND EN;
    Y(1) <= I(0) AND (NOT I(1)) AND (NOT I(2)) AND EN;
    Y(2) <= (NOT I(0)) AND I(1) AND (NOT I(2)) AND EN;
    Y(3) <= I(0) AND I(1) AND (NOT I(2))  AND EN;
    Y(4) <= (NOT I(0)) AND (NOT I(1)) AND I(2) AND EN;
    Y(5) <= I(0) AND (NOT I(1)) AND I(2)  AND EN;
    Y(6) <= (NOT I(0)) AND I(1) AND I(2) AND EN;
    Y(7) <= I(0) AND I(1) AND I(2)  AND EN;

end Behavioral;