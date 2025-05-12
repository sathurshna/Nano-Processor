----------------------------------------------------------------------------------

-- Create Date: 30.04.2024 14:42:42
-- Design Name: 
-- Module Name: MUX_2_to_1_12 - Behavioral

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity MUX_2_to_1_12 is
    Port (  D0 : in STD_LOGIC_VECTOR(11 downto 0);
            D1 : in STD_LOGIC_VECTOR(11 downto 0);
            S : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(11 downto 0));
end MUX_2_to_1_12;

architecture Behavioral of MUX_2_to_1_12 is

begin
    Y <= D0 when (S = '0') else D1;
end Behavioral;