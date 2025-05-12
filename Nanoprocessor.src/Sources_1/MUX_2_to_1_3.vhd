----------------------------------------------------------------------------------
-- Create Date: 20.04.2024 13:20:10
-- Module Name: MUX_2_to_1_3 - Behavioral
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2_to_1_3 is
    Port ( D0 : in STD_LOGIC_VECTOR (2 downto 0);
    D1 : in STD_LOGIC_VECTOR (2 downto 0);
    S : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2_to_1_3;

architecture Behavioral of MUX_2_to_1_3 is
begin
    Y <= D0 when (S = '0') else D1;
end Behavioral;