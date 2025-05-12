----------------------------------------------------------------------------------
-- Module Name: MUX_8_to_1_4 - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_to_1_4 is
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
    R1 : in STD_LOGIC_VECTOR (3 downto 0);
    R2 : in STD_LOGIC_VECTOR (3 downto 0);
    R3 : in STD_LOGIC_VECTOR (3 downto 0);
    R4 : in STD_LOGIC_VECTOR (3 downto 0);
    R5 : in STD_LOGIC_VECTOR (3 downto 0);
    R6 : in STD_LOGIC_VECTOR (3 downto 0);
    R7 : in STD_LOGIC_VECTOR (3 downto 0);
    S : in STD_LOGIC_VECTOR (2 downto 0);
    --EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_to_1_4;

architecture Behavioral of MUX_8_to_1_4 is
component MUX_8_to_1
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
    S : in STD_LOGIC_VECTOR (2 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC);
end component;
signal Enable : STD_LOGIC := '1';

begin
    MUX_0 : MUX_8_to_1
        Port map(
            D(0) => R0(0),
            D(1) => R1(0),
            D(2) => R2(0),
            D(3) => R3(0),
            D(4) => R4(0),
            D(5) => R5(0),
            D(6) => R6(0),
            D(7) => R7(0),
            EN => Enable,
            S => S,
            Y => Y(0)
            );
    MUX_1 : MUX_8_to_1
        Port map(
            D(0) => R0(1),
            D(1) => R1(1),
            D(2) => R2(1),
            D(3) => R3(1),
            D(4) => R4(1),
            D(5) => R5(1),
            D(6) => R6(1),
            D(7) => R7(1),
            EN => Enable,
            S => S,
            Y => Y(1)
            );
    MUX_2 : MUX_8_to_1
        Port map(
            D(0) => R0(2),
            D(1) => R1(2),
            D(2) => R2(2),
            D(3) => R3(2),
            D(4) => R4(2),
            D(5) => R5(2),
            D(6) => R6(2),
            D(7) => R7(2),
            EN => Enable,
            S => S,
            Y => Y(2)
            );
    MUX_3 : MUX_8_to_1
        Port map(
            D(0) => R0(3),
            D(1) => R1(3),
            D(2) => R2(3),
            D(3) => R3(3),
            D(4) => R4(3),
            D(5) => R5(3),
            D(6) => R6(3),
            D(7) => R7(3),
            EN => Enable,
            S => S,
            Y => Y(3)
            );
end Behavioral;