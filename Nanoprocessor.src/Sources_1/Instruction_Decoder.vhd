----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2025 09:36:50 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Che_For_Jump : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Im : out STD_LOGIC;
           Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
           MuxA_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           MuxB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
           Sub_Sel : out STD_LOGIC;
           Jump : out STD_LOGIC;
           Address_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
signal SUB, JZR : std_logic;
signal Op : std_logic_vector(1 downto 0);
signal Reg_A, Reg_B : std_logic_vector(2 downto 0);
signal Im_Val_Temp, R : std_logic_vector(3 downto 0);

begin
    Im_Val <= Ins(3 downto 0);
    Reg_En <= Ins(9 downto 7);
    Address_Jump <= Ins(2 downto 0);
    R <= Reg_Che_For_Jump;
    Load_Im <= Ins(11) and not(Ins(10));
    SUB <= not(Ins(11)) and Ins(10);
    JZR <= Ins(11) and Ins(10);
    MuxA_Sel <= Ins(9 downto 7);
    MuxB_Sel <= Ins(6 downto 4);
    Sub_Sel <= SUB;
    Jump <= JZR and (not(R(0) or R(1) or R(2) or R(3)));


end Behavioral;
