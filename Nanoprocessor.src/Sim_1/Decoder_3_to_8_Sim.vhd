----------------------------------------------------------------------------------
-- Create Date: 04/13/2024 07:29:22 PM
-- Design Name: 
-- Module Name: Decoder_3_to_8_Sim - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder_3_to_8_Sim is
--  Port ( );
end Decoder_3_to_8_Sim;

architecture Behavioral of Decoder_3_to_8_Sim is

component Decoder_3_to_8 is
port ( I : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
       EN : IN STD_LOGIC;
       Y : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
end component;
SIGNAL I : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL EN : STD_LOGIC;
SIGNAL Y : STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
UUT : Decoder_3_to_8
PORT MAP(
    I => I,
    EN => EN,
    Y => Y
    );
process
begin
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
    EN <= '1';
    I <= "010";
    WAIT FOR 100ns;
    I <= "001";
    WAIT FOR 100ns;
    I <= "111";
    WAIT FOR 100ns;
    I <= "001";
    WAIT FOR 100ns;
    I <= "011";
    WAIT FOR 100ns;
    I <= "110";
    WAIT FOR 100ns;
    I <= "110";
    WAIT FOR 100ns;
    I <= "000";
    WAIT FOR 100ns;
    EN <= '0';
    WAIT FOR 100ns;
    I <= "111";
    WAIT FOR 100ns;
end process;  
end behavioral;