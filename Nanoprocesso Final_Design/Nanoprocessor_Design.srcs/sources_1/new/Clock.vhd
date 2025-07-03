library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity for slow clock generation
entity Clock is
    Port ( Clk_in : in STD_LOGIC := '0';           -- Fast input clock signal
           Clk_out : out STD_LOGIC := '1');        -- Slow output clock signal
end Clock;

architecture Behavioral of Clock is

signal count : integer := 1;                      -- Counter for frequency division
signal clk_status : std_logic := '0';              -- Internal clock signal state

begin
    -- Process to divide the clock frequency
    process (Clk_in) begin
        if (rising_edge(Clk_in)) then
            count <= count + 1;
            if (count = 50000000) then   -- Toggle output every 50M cycles (adjust for simulation)
                clk_status <= not clk_status;
                Clk_out <= clk_status;
                count <= 1;
            end if;
        end if;
    end process;

end Behavioral;