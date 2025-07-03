----------------------------------------------------------------------------------
-- Design Name: 2-Way 3-Bit Multiplexer
-- Module Name: Mux_2_way_3_bit - Behavioral

-- Description: 
--   This module selects between two 3-bit inputs based on a control signal (Jump_flag).
--   If Jump_flag = '1', Jump_to_addr is selected.
--   If Jump_flag = '0', Incremented_addr is selected.

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2_way_3_bit is
    Port ( 
        Incremented_addr : in  STD_LOGIC_VECTOR (2 downto 0); -- Next sequential address (e.g., PC + 1)
        Jump_to_addr     : in  STD_LOGIC_VECTOR (2 downto 0); -- Target address to jump to
        Jump_flag        : in  STD_LOGIC;                     -- Control signal (1 = jump, 0 = increment)
        Out_addr         : out STD_LOGIC_VECTOR (2 downto 0)  -- Final address output
    );
end Mux_2_way_3_bit;

architecture Behavioral of Mux_2_way_3_bit is
begin

    -- Mux logic for each bit:
    -- If Jump_flag = '1', select Jump_to_addr
    -- If Jump_flag = '0', select Incremented_addr
    Out_addr(0) <= (not Jump_flag and Incremented_addr(0)) or (Jump_flag and Jump_to_addr(0));
    Out_addr(1) <= (not Jump_flag and Incremented_addr(1)) or (Jump_flag and Jump_to_addr(1));
    Out_addr(2) <= (not Jump_flag and Incremented_addr(2)) or (Jump_flag and Jump_to_addr(2));

end Behavioral;