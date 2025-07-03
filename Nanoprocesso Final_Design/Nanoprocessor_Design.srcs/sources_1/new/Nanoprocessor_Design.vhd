----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 11:15:39 PM
-- Design Name: 
-- Module Name: Nanoprocessor_Design - Behavioral
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
use work.buses.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nanoprocessor_Design is
    Port ( Clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Register7 : out STD_LOGIC_VECTOR (3 downto 0);
           OverflowFlag : out STD_LOGIC;
           ZeroFlag : out STD_LOGIC;
           To7Segment : out STD_LOGIC_VECTOR (6 downto 0);
           Display : out STD_LOGIC_VECTOR (3 downto 0));
end Nanoprocessor_Design;

architecture Behavioral of Nanoprocessor_Design is

-- Clock Component Interface
COMPONENT Clock
    PORT( Clk_in : IN STD_LOGIC;
          Clk_out : OUT STD_LOGIC);
END COMPONENT;


-- Program_Counter_3_bits Component Interface
component Program_Counter_3_bits
    Port ( in_addr : in STD_LOGIC_VECTOR (2 downto 0);
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           out_addr : out STD_LOGIC_VECTOR (2 downto 0));
end component;


-- register_bank Component Interface
component Register_Bank
    Port (
        Reg_En     : in  STD_LOGIC_VECTOR (2 downto 0);
        Res        : in  STD_LOGIC;
        Clk        : in  STD_LOGIC;
        Data       : in  STD_LOGIC_VECTOR (3 downto 0);
        Data_Buses : out data_buses  -- array (0 to 7) of std_logic_vector(3 downto 0)
    );
end component;



-- Program_ROM Component Interface
Component Program_ROM
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           instruction_code : out STD_LOGIC_VECTOR (11 downto 0));
    END COMPONENT;


-- 3_bit_Adder Component Interface
component Adder_3_Bit 
    Port ( Input : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0) );
end component;


-- Mux_2_way_3_bit Component Interface
component Mux_2_way_3_bit
    Port ( Incremented_addr : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_to_addr : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_flag : in STD_LOGIC;
           Out_addr : out STD_LOGIC_VECTOR (2 downto 0));
end component;


-- Mux_8_way_4_bit Component Interface
component Mux_8_way_4_bit
    Port ( in0 : in STD_LOGIC_VECTOR (3 downto 0);
           in1 : in STD_LOGIC_VECTOR (3 downto 0);
           in2 : in STD_LOGIC_VECTOR (3 downto 0);
           in3 : in STD_LOGIC_VECTOR (3 downto 0);
           in4 : in STD_LOGIC_VECTOR (3 downto 0);
           in5 : in STD_LOGIC_VECTOR (3 downto 0);
           in6 : in STD_LOGIC_VECTOR (3 downto 0);
           in7 : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC_VECTOR (2 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end component;


-- 4-bit_Add_Sub_Unit Component Interface
component Add_Sub_Unit
    Port ( RegA : in STD_LOGIC_VECTOR (3 downto 0);
           RegB : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

-- Mux_2_way_4_bit Component Interface
component mux_2_way_4_bit
    Port ( input_num : in STD_LOGIC_VECTOR (3 downto 0);
           immediate_value : in STD_LOGIC_VECTOR (3 downto 0);
           load_select : in STD_LOGIC;
           out_to_reg_bank : out STD_LOGIC_VECTOR (3 downto 0));
end component;


-- Instruction_Decoder Component Interface
component Instruction_Decoder 
    Port ( instruction_code : in STD_LOGIC_VECTOR (11 downto 0);
           reg_value : in STD_LOGIC_VECTOR (3 downto 0); -- This should be fed in to the AU.
           operation : out STD_LOGIC_VECTOR (1 downto 0);
           immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           RegA_addr, RegB_addr : out STD_LOGIC_VECTOR (2 downto 0); --This should be fed in to the two 8 way 4 bit muxes.
           jump_address : out STD_LOGIC_VECTOR (2 downto 0);
           register_EN : out STD_LOGIC_VECTOR (2 downto 0);
           add_sub_sel : out STD_LOGIC;
           load_sel : out STD_LOGIC;
           jump_flag : out STD_LOGIC);
end component;


component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;


SIGNAL Clk_Sig : STD_LOGIC;
SIGNAL PC_Out_Addr : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);
SIGNAL Immediate_Value : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL RegA_Addr : STD_LOGIC_VECTOR (2 downto 0); 
SIGNAL RegB_Addr : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Jump_Addr : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Register_EN : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Add_Sub_Sel : STD_LOGIC;
SIGNAL Load_Sel : STD_LOGIC;
SIGNAL Data_Bus_0, Data_Bus_1, Data_Bus_2, Data_Bus_3, Data_Bus_4, Data_Bus_5, Data_Bus_6, Data_Bus_7 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
SIGNAL RegA_Value : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL RegB_Value : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Add_Sub_Unit_Output : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Reg_Bank_Input : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Overflow_Flag : STD_LOGIC;
SIGNAL Zero_Flag : STD_LOGIC;
SIGNAL Adder_Ouput : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Next_Addr : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Jump_Flag : STD_LOGIC;
SIGNAL Operation : STD_LOGIC_VECTOR (1 downto 0);
SIGNAL To_7_Segment : STD_LOGIC_VECTOR (6 downto 0);
SIGNAL All_Registers : data_buses;


begin

SlowClk : Clock 
    Port map(
        Clk_in => Clk,
        Clk_out => Clk_Sig );

ProgramCounter : Program_Counter_3_bits
    Port map( 
           in_addr => Next_Addr,
           reset => reset,
           clk => Clk_Sig,
           out_addr => PC_Out_Addr );


ProgramROM : Program_ROM
    Port map(
           address => PC_Out_Addr,
           instruction_code => Instruction_Bus );
           
InstructionDecoder : Instruction_Decoder 
    Port map( 
           instruction_code => Instruction_Bus,
           reg_value => RegA_Value,
           operation => Operation,
           immediate_value => Immediate_Value,
           RegA_addr => RegA_Addr, 
           RegB_addr => RegB_Addr,
           jump_address => Jump_Addr,
           register_EN => Register_EN,
           add_sub_sel => Add_Sub_Sel,
           load_sel => Load_Sel,
           jump_flag => Jump_Flag );

OverflowFlag <= Overflow_Flag;
ZeroFlag <=  Zero_Flag;

Mux8Way4BitA : Mux_8_way_4_bit
    Port map(
           in0 => Data_Bus_0,
           in1 => Data_Bus_1,
           in2 => Data_Bus_2,
           in3 => Data_Bus_3,
           in4 => Data_Bus_4,
           in5 => Data_Bus_5,
           in6 => Data_Bus_6,
           in7 => Data_Bus_7,
           RegSel => RegA_Addr,
           Output => RegA_Value);

Mux8Way4BitB : Mux_8_way_4_bit
    Port map(
           in0 => Data_Bus_0,
           in1 => Data_Bus_1,
           in2 => Data_Bus_2,
           in3 => Data_Bus_3,
           in4 => Data_Bus_4,
           in5 => Data_Bus_5,
           in6 => Data_Bus_6,
           in7 => Data_Bus_7,
           RegSel => RegB_Addr,
           Output => RegB_Value);

AddSubUnit : Add_Sub_Unit
    Port map( 
           RegA => RegA_Value,
           RegB => RegB_Value,
           Sel => Add_Sub_Sel,
           Output => Add_Sub_Unit_Output,
           Overflow => Overflow_Flag,
           Zero => Zero_Flag);

Mux2Way4Bit : mux_2_way_4_bit
    Port map(
           input_num => Add_Sub_Unit_Output,
           immediate_value => Immediate_Value,
           load_select => Load_Sel,
           out_to_reg_bank => Reg_Bank_Input);

RegisterBank : Register_Bank
    Port map (
        Reg_En     => Register_EN,
        Res        => reset,
        Clk        => Clk_Sig,
        Data       => Reg_Bank_Input,
        Data_Buses => All_Registers
    );

Data_Bus_0 <= All_Registers(0);
Data_Bus_1 <= All_Registers(1);
Data_Bus_2 <= All_Registers(2);
Data_Bus_3 <= All_Registers(3);
Data_Bus_4 <= All_Registers(4);
Data_Bus_5 <= All_Registers(5);
Data_Bus_6 <= All_Registers(6);
Data_Bus_7 <= All_Registers(7);

           
SevenSegments : LUT_16_7
    Port map( 
        address => Data_Bus_1,
        data => To_7_Segment );

To7Segment <= To_7_Segment;

Adder : Adder_3_Bit 
    Port map( 
           Input => PC_Out_Addr,
           C_in => '1',
           Output => Adder_Ouput );


Mux2Way3Bit : Mux_2_way_3_bit
    Port map(
           Incremented_addr => Adder_Ouput,
           Jump_to_addr => Jump_Addr,
           Jump_flag => Jump_Flag,
           Out_addr => Next_Addr );

Register7 <= Data_Bus_1;
Display <="1110";
end Behavioral;
