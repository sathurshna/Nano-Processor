----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sathurshna U.
-- 
-- Create Date: 05/10/2025 06:59:29 PM
-- Design Name: 
-- Module Name: TB_HA - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_HA is
--  Port ( );
end TB_HA;

architecture Behavioral of TB_HA is

COMPONENT HA
PORT(
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        S : OUT STD_LOGIC;
        C : OUT STD_LOGIC
    );
END COMPONENT;

-- Signal Declaration
SIGNAL a, b, s, c : STD_LOGIC;

    
begin
 UUT: HA PORT MAP(
       A => a,
       B => b,
       S => s,
       C => c
   );

   -- Process for generating input stimuli
   PROCESS
   BEGIN
       -- Test case 1: a = 0, b = 0
       a <= '0';
       b <= '0';
       WAIT FOR 100 ns;

       -- Test case 2: a = 1, b = 0
       a <= '1';
       b <= '0';
       WAIT FOR 100 ns;
       
       -- Test case 3: a = 0, b = 1
               a <= '0';
               b <= '1';
               WAIT FOR 100 ns;
       
               -- Test case 4: a = 1, b = 1
               a <= '1';
               b <= '1';
               WAIT FOR 100 ns;
       
               -- End the simulation
               WAIT;
           END PROCESS;




end Behavioral;
