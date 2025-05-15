----------------------------------------------------------------------------------
-- Create Date: 04/13/2024 07:32:10 PM
-- Module Name: Mux_8_to_1_Sim - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8_to_1_Sim is
--  Port ( );
end Mux_8_to_1_Sim;

architecture Behavioral of Mux_8_to_1_Sim is

COMPONENT MUX_8_to_1
    PORT( D : in STD_LOGIC_VECTOR (7 downto 0);
          S : in STD_LOGIC_VECTOR (2 downto 0);
          EN : in STD_LOGIC;
          Y : out STD_LOGIC     );
end component;
SIGNAL D : STD_LOGIC_VECTOR (7 downto 0);
SIGNAL S : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL EN : STD_LOGIC;
SIGNAL Y : STD_LOGIC;
begin
UUT : MUX_8_to_1
port map (
    D => D,
    S => S,
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
D  <= "11001010" ;
S <= "000";
WAIT FOR 100ns;
S <= "001";
WAIT FOR 100ns;
S <= "010";
WAIT FOR 100ns;
S <= "011";
WAIT FOR 100ns;
D  <= "11111011" ;
S <= "100";
WAIT FOR 100ns;
S <= "101";
WAIT FOR 100ns;
S <= "110";
WAIT FOR 100ns;
S <= "111";
D  <= "11001111" ;
WAIT FOR 100ns;
EN <= '0';
WAIT FOR 100ns;
D  <= "11000110" ;
S <= "100";
WAIT FOR 100ns;
end process;  
end Behavioral;