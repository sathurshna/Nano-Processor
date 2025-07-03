library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC is
end TB_PC;

architecture Behavioral of TB_PC is

    -- Component Declaration for the Program Counter
    component Program_Counter_3_bits
        Port (
            in_addr  : in  STD_LOGIC_VECTOR(2 downto 0);
            reset    : in  STD_LOGIC;
            clk      : in  STD_LOGIC;
            out_addr : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Signals for simulation
    signal in_addr  : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal reset    : STD_LOGIC := '1';
    signal clk      : STD_LOGIC := '0';
    signal out_addr : STD_LOGIC_VECTOR(2 downto 0);

begin

    -- Instantiate the Program Counter
    PC_UUT : Program_Counter_3_bits
        port map (
            in_addr  => in_addr,
            reset    => reset,
            clk      => clk,
            out_addr => out_addr
        );

    -- Clock Generation: 10ns clock period
    clk_process : process
    begin
        while now < 200 ns loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc : process
    begin
        -- Initially hold reset
        reset <= '1';
        in_addr <= "000";
        wait for 15 ns;

        -- Deassert reset and apply first address
        reset <= '0';
        in_addr <= "001";
        wait for 20 ns;

        -- Apply another address
        in_addr <= "010";
        wait for 20 ns;

        in_addr <= "011";
        wait for 20 ns;

        -- Assert reset again
        reset <= '1';
        wait for 20 ns;

        -- Deassert reset and apply new address
        reset <= '0';
        in_addr <= "101";
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
