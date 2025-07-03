----------------------------------------------------------------------------------
-- Design Name: 4-bit Ripple Carry Adder
-- Module Name: RCA_4 - Behavioral
-- Description: This is a structural implementation of a 4-bit ripple carry adder
--              using 4 full adders. Inputs are bitwise A and B with a carry-in.
--              Outputs are bitwise sum and final carry-out.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration
entity RCA_4 is
    Port ( 
        A0    : in  STD_LOGIC;  -- Least significant bit of input A
        A1    : in  STD_LOGIC;  -- Bit 1 of input A
        A2    : in  STD_LOGIC;  -- Bit 2 of input A
        A3    : in  STD_LOGIC;  -- Most significant bit of input A
        B0    : in  STD_LOGIC;  -- Least significant bit of input B
        B1    : in  STD_LOGIC;  -- Bit 1 of input B
        B2    : in  STD_LOGIC;  -- Bit 2 of input B
        B3    : in  STD_LOGIC;  -- Most significant bit of input B
        C_in  : in  STD_LOGIC;  -- Initial carry-in
        S0    : out STD_LOGIC;  -- Least significant bit of sum
        S1    : out STD_LOGIC;  -- Bit 1 of sum
        S2    : out STD_LOGIC;  -- Bit 2 of sum
        S3    : out STD_LOGIC;  -- Most significant bit of sum
        C_out : out STD_LOGIC;  -- Final carry-out
        FA2_Cout : out STD_LOGIC   -- Carry from the second full adder
    );
end RCA_4;

-- Architecture Definition
architecture Behavioral of RCA_4 is

    -- Full Adder Component Declaration
    component FA 
        Port ( 
            A      : in  STD_LOGIC; 
            B      : in  STD_LOGIC; 
            C_in   : in  STD_LOGIC; 
            S      : out STD_LOGIC; 
            C_out  : out STD_LOGIC 
        ); 
    end component;

    -- Internal Signals for Sum and Carry from Each Full Adder Stage
    signal FA0_C, FA1_C, FA2_C : STD_LOGIC;

begin

    -- First Full Adder: Adds A0, B0 and initial carry-in (C_in)
    FA_0 : FA 
        port map ( 
            A      => A0, 
            B      => B0, 
            C_in   => C_in,         -- Using input carry from user
            S      => S0, 
            C_out  => FA0_C         -- Carry to next stage
        ); 

    -- Second Full Adder: Adds A1, B1 and carry from previous stage
    FA_1 : FA 
        port map ( 
            A      => A1, 
            B      => B1, 
            C_in   => FA0_C, 
            S      => S1, 
            C_out  => FA1_C         -- Carry to next stage
        );

    -- Third Full Adder: Adds A2, B2 and carry from previous stage
    FA_2 : FA 
        port map ( 
            A      => A2, 
            B      => B2, 
            C_in   => FA1_C, 
            S      => S2, 
            C_out  => FA2_C         -- Carry to next stage
        );

    -- Fourth Full Adder: Adds A3, B3 and carry from previous stage
    FA_3 : FA 
        port map ( 
            A      => A3, 
            B      => B3, 
            C_in   => FA2_C, 
            S      => S3, 
            C_out  => C_out         -- Final carry-out
        ); 

    FA2_Cout <= FA2_C; -- Output carry from the second full adder
end Behavioral;