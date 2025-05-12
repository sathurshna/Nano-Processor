----------------------------------------------------------------------------------
-- Create Date: 04/13/2024 06:27:43 PM
-- Module Name: Decoder_3_to_8 - Behavioral
-- Description: 
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8_to_1 is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end MUX_8_to_1;

architecture Behavioral of MUX_8_to_1 is
component Decoder_3_to_8
port ( I : IN STD_LOGIC_VECTOR (2 downto 0);
       EN : IN STD_LOGIC ;
       Y : OUT STD_LOGIC_VECTOR (7 downto 0) );
end component;
SIGNAL DY : STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
    Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP(
        I => S,
        EN => EN,
        Y => DY
    );
    Y <= (
            (D(0) AND DY(0)) OR
            (D(1) AND DY(1)) OR
            (D(2) AND DY(2)) OR
            (D(3) AND DY(3)) OR
            (D(4) AND DY(4)) OR
            (D(5) AND DY(5)) OR
            (D(6) AND DY(6)) OR
            (D(7) AND DY(7))
                );
 end Behavioral;