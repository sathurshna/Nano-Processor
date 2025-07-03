library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Generic N-bit Register
entity Reg is
    generic (
        N : integer := 4
    );
    Port (
        D   : in  STD_LOGIC_VECTOR(N-1 downto 0);
        Res : in  STD_LOGIC;
        En  : in  STD_LOGIC;
        Clk : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR(N-1 downto 0)
    );
end Reg;

architecture Behavioral of Reg is
    -- Internal signal to hold the register value
    signal reg_value : STD_LOGIC_VECTOR(N-1 downto 0);
    begin

    -- Process to model the register behavior
    process (Clk, Res)
    begin
        if Res = '1' then
            -- Reset the register to all zeros
            reg_value <= (others => '0');
        elsif rising_edge(Clk) then
            if En = '1' then
                -- Load the input value into the register
                reg_value <= D;
            end if;
        end if;
    end process;

    -- Assign the internal register value to the output
    Q <= reg_value;

end Behavioral;
