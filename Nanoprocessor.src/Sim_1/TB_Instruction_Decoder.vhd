----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.04.2024 14:18:57
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
-- Port ( );
end TB_Instruction_Decoder;
architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder
    Port ( --Clk : in STD_LOGIC;
            Ins : in STD_LOGIC_VECTOR (11 downto 0);
            Reg_Che_For_Jump : in STD_LOGIC_VECTOR (3 downto 0);
            Reg_En : out STD_LOGIC_VECTOR(2 downto 0);
            Load_Im : out STD_LOGIC;
            Im_Val : out STD_LOGIC_VECTOR(3 downto 0);
            MuxA_Sel : out STD_LOGIC_VECTOR (2 downto 0);
            MuxB_Sel : out STD_LOGIC_VECTOR (2 downto 0);
            Sub_Sel : out STD_LOGIC;
            Jump : out STD_LOGIC;
            Address_Jump : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Load_Im,sub_sel,jump : std_logic;
signal Reg_Che_For_Jump,Im_Val : STD_LOGIC_VECTOR(3 downto 0);
signal Reg_En,MuxA_Sel,MuxB_Sel,Address_Jump : STD_LOGIC_VECTOR (2 downto 0);
signal Ins : STD_LOGIC_VECTOR (11 downto 0);

begin
UUT : Instruction_Decoder
    port map (
        Ins => Ins,
        Reg_Che_For_Jump => Reg_Che_For_Jump,
        Reg_En => Reg_En,
        Load_Im => Load_Im,
        Im_Val => Im_Val,
        MuxA_Sel => MuxA_Sel,
        MuxB_Sel => MuxB_Sel,
        Sub_Sel => Sub_Sel,
        Jump => Jump,
        Address_Jump => Address_Jump
    );
process
begin
--220618A  11 0101 1101 1100 1010
--220623J  11 0101 1101 1100 1111
--220411H  11 0101 1100 1111 1011
--220614H  11 0101 1101 1100 0110
    Ins <= "110111001010";
    wait for 100ns;
    Ins <= "110111001111";
    wait for 100ns;
    Ins <= "110011111011";
    wait for 100ns;
    Ins <= "110111000110";
    wait for 100ns;
    Reg_Che_For_Jump<="0000";
    Ins <= "110111001010";
    wait for 100ns;
    Ins <= "110111001111";
    wait for 100ns;
    Ins <= "110011111011";
    wait for 100ns;
end process;
end Behavioral;