----------------------------------------------------------------------------------
-- Design Name: 2-Way 4-Bit Multiplexer
-- Module Name: mux_2_way_4_bit - Behavioral 
-- Description: 
--   This module implements a 2-way, 4-bit multiplexer. It selects between
--   an immediate value and an input value based on the control signal
--   'load_select'. The selected 4-bit value is sent to the register bank.

-- Additional Comments:
--   If load_select = '1', data from input_num is forwarded.
--   If load_select = '0', data from immediate_value is forwarded.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_way_4_bit is
    Port ( 
        immediate_value   : in  STD_LOGIC_VECTOR (3 downto 0); -- 4-bit immediate constant value
        input_num         : in  STD_LOGIC_VECTOR (3 downto 0); -- 4-bit value from computation or register
        load_select       : in  STD_LOGIC;                     -- Control signal to select input
        out_to_reg_bank   : out STD_LOGIC_VECTOR (3 downto 0)  -- Output sent to register bank
    );
end mux_2_way_4_bit;

architecture Behavioral of mux_2_way_4_bit is
begin

    -- Multiplexer Logic:
    -- If load_select = '1', choose input_num
    -- If load_select = '0', choose immediate_value
    out_to_reg_bank <= input_num
                       when (load_select = '0') 
                       else immediate_value;

end Behavioral;