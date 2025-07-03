library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
    Port (
        instruction_code : in STD_LOGIC_VECTOR (11 downto 0);
        reg_value        : in STD_LOGIC_VECTOR (3 downto 0);
        operation        : out STD_LOGIC_VECTOR (1 downto 0);
        immediate_value  : out STD_LOGIC_VECTOR (3 downto 0);
        RegA_addr        : out STD_LOGIC_VECTOR (2 downto 0); -- Selects register A for AU
        RegB_addr        : out STD_LOGIC_VECTOR (2 downto 0); -- Selects register B for AU
        jump_address     : out STD_LOGIC_VECTOR (2 downto 0); -- Address to jump to
        register_EN      : out STD_LOGIC_VECTOR (2 downto 0); -- Which register to enable for writing
        add_sub_sel      : out STD_LOGIC;                     -- 0 for ADD, 1 for SUB
        load_sel         : out STD_LOGIC;                     -- 1 for Immediate, 0 for ALU result
        jump_flag        : out STD_LOGIC
    );
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
begin
    process (instruction_code)
    begin
        -- Top 2 bits are operation type
        operation <= instruction_code(11 downto 10);

        -- Default
        RegB_addr <= instruction_code(6 downto 4);
        RegA_addr <= instruction_code(9 downto 7);
        immediate_value <= instruction_code(3 downto 0);
        jump_flag <= '0'; -- Default to no jump

        case instruction_code(11 downto 10) is
            -- MOVI: 10 RRR 000 dddd
            when "10" =>
                register_EN <= instruction_code(9 downto 7);
                load_sel <= '1';         -- Load from immediate
                add_sub_sel <= '0';      -- N/A (don't care)

            -- ADD: 00 Ra Rb 0000
            when "00" =>
                register_EN <= instruction_code(9 downto 7); -- Destination is Ra
                load_sel <= '0';         -- Load from ALU
                add_sub_sel <= '0';      -- ADD

            -- NEG: 01 RRR 00000000
            when "01" =>
                register_EN <= instruction_code(9 downto 7); -- Destination is R
                RegA_addr <= "000";                          -- Force 0 into RegA
                RegB_addr <= instruction_code(9 downto 7);   -- Negate this register
                load_sel <= '0';         -- Load from ALU
                add_sub_sel <= '1';      -- SUB (0 - R) = -R

            -- JZR: 11 RRR 000 ddd
            when "11" =>
                load_sel <= '0';         -- ALU not used
                RegA_addr <= instruction_code(9 downto 7); -- Register to test for zero
                if reg_value = "0000" then
                    jump_flag <= '1'; -- Jump if zero
                    jump_address <= instruction_code(2 downto 0);
                end if;
                
            when others =>
                null;
        end case;
    end process;
end Behavioral;
