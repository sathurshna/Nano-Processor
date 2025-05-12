library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity TB_Decoder_2_to_4 is
end TB_Decoder_2_to_4;
architecture Behavioral of TB_Decoder_2_to_4 is
component Decoder_2_to_4
port( I : in STD_LOGIC_VECTOR (1 downto 0);
EN : in STD_LOGIC;
Y : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;
signal I : STD_LOGIC_VECTOR (1 downto 0);
signal EN : STD_LOGIC;
signal Y : STD_LOGIC_VECTOR (3 downto 0);
begin
UUT: Decoder_2_to_4
PORT MAP(
I => I,
EN => EN,
Y => Y
);
process
begin
EN <='1';
I <="00";
WAIT FOR 20ns;
I <="01";
WAIT FOR 20ns;
I <="10";
WAIT FOR 20ns;
I <="11";
wait;
end process;
end Behavioral;