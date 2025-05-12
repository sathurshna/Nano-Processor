----------------------------------------------------------------------------------
-- Create Date: 30.04.2024 14:43:25
-- Design Name: 
-- Module Name: TB_MUX_2_to_1_12 - Behavioral

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_2_to_1_4 is
-- Port ( );
end TB_MUX_2_to_1_4;
architecture Behavioral of TB_MUX_2_to_1_4 is

component MUX_2_to_1_4
    Port (  D0 : in STD_LOGIC_VECTOR(3 downto 0);
            D1 : in STD_LOGIC_VECTOR(3 downto 0);
            S : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal D0,D1,Y : std_logic_vector(3 downto 0);
signal S : std_logic;

begin
UUT: MUX_2_to_1_4
    port map(
        D0 => D0,
        D1 => D1,
        S => S,
        Y => Y
    );

process
begin
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
    D0 <= "1010";
    D1 <= "1100";
    S <= '0';
    wait for 100 ns;
    S <= '1';
    wait for 100 ns;
    D0 <= "1111";
    D1 <= "1100";
    S <= '0';
    wait for 100 ns;
    S <= '1';
    wait for 100 ns;
    D0 <= "1011";
    D1 <= "1111";
    S <= '0';
    wait for 100 ns;
    S <= '1';
    wait for 100 ns;
    D0 <= "0110";
    D1 <= "1100";
    S <= '0';
    wait for 100 ns;
    S <= '1';
    wait for 100 ns;
    D0 <= "1010";
    D1 <= "1100";
    S <= '0';
    wait for 100 ns;
    S <= '1';
    wait;
end process;
end Behavioral;