----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 14:06:25
-- Design Name: 
-- Module Name: TB_MUX_8_to_1_4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_8_to_1_4 is
-- Port ( );
end TB_MUX_8_to_1_4;
architecture Behavioral of TB_MUX_8_to_1_4 is

component MUX_8_to_1_4
    Port (  R0 : in STD_LOGIC_VECTOR (3 downto 0);
            R1 : in STD_LOGIC_VECTOR (3 downto 0);
            R2 : in STD_LOGIC_VECTOR (3 downto 0);
            R3 : in STD_LOGIC_VECTOR (3 downto 0);
            R4 : in STD_LOGIC_VECTOR (3 downto 0);
            R5 : in STD_LOGIC_VECTOR (3 downto 0);
            R6 : in STD_LOGIC_VECTOR (3 downto 0);
            R7 : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC_VECTOR (2 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal R0,R1,R2,R3,R4,R5,R6,R7,Y : std_logic_vector(3 downto 0);
signal S : std_logic_vector(2 downto 0);

begin
UUT: MUX_8_to_1_4
    port map (
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7,
        S => S,
        Y => Y
    );

process
begin
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
    R0 <= "1010";
    R1 <= "1100";
    R2 <= "1111";
    R3 <= "1100";
    R4 <= "1011";
    R5 <= "1111";
    R6 <= "0110";
    R7 <= "1100";
    S <= "000";
    wait for 100 ns;
    S <= "001";
    wait for 100 ns;
    S <= "010";
    wait for 100 ns;
    S <= "011";
    wait for 100 ns;
    S <= "100";
    wait for 100 ns;
    S <= "101";
    wait for 100 ns;
    S <= "110";
    wait for 100 ns;
    S <= "111";
    wait;
end process;
end Behavioral;