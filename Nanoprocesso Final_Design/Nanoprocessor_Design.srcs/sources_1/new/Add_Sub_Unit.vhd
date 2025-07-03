library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_Sub_Unit is
    Port ( RegA : in STD_LOGIC_VECTOR (3 downto 0);
           RegB : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC; -- Sel = 0 for addition, Sel = 1 for subtraction
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub_Unit;

architecture Behavioral of Add_Sub_Unit is

-- Component declaration for the 4-bit Ripple Carry Adder (RCA)
component RCA_4
    Port ( A0, A1, A2, A3 : in STD_LOGIC;       -- Individual bits of input A
           B0, B1, B2, B3 : in STD_LOGIC;       -- Individual bits of input B
           C_in : in STD_LOGIC;                 -- Carry input (used for subtraction)
           S0, S1, S2, S3 : out STD_LOGIC;      -- Individual sum bits of the result
           C_out, FA2_Cout : out STD_LOGIC);              -- Carry output for overflow detection
end component;

-- Intermediate signals for the RCA inputs and outputs
SIGNAL A_0, A_1, A_2, A_3, B_0, B_1, B_2, B_3 : std_logic;
SIGNAL OutSig : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL CarryIn, FA2_C, Cout : STD_LOGIC;

begin
-- Prepare the inputs for addition/subtraction
-- A remains unchanged; B is negated if subtraction (Sel=1)
A_0 <= RegA(0);
A_1 <= RegA(1);
A_2 <= RegA(2);
A_3 <= RegA(3);

B_0 <= RegB(0) xor Sel; -- XOR with Sel to negate B for subtraction
B_1 <= RegB(1) xor Sel;
B_2 <= RegB(2) xor Sel;
B_3 <= RegB(3) xor Sel;

CarryIn <= Sel; -- Carry in is 1 for subtraction, 0 for addition

-- Instantiate the RCA component for addition/subtraction
RCA_4_A : RCA_4
     port map (
     A0 => A_0,
     A1 => A_1,
     A2 => A_2,
     A3 => A_3,
     B0 => B_0,
     B1 => B_1,
     B2 => B_2,
     B3 => B_3,
     C_in => CarryIn, -- Carry in for addition/subtraction
     S0 => OutSig(0),
     S1 => OutSig(1),
     S2 => OutSig(2),
     S3 => OutSig(3),
     FA2_Cout => FA2_C, -- Carry out from the last full adder
     C_out => Cout -- Final carry out for overflow detection
    
);

-- Output the result of the addition/subtraction
Output <= OutSig;
Overflow <= Cout xor FA2_C;

-- Set the Zero flag if all output bits are 0
Zero <= (not OutSig(0)) and (not OutSig(1)) and (not OutSig(2)) and (not OutSig(3));

end Behavioral;