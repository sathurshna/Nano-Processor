library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Test Bench Entity
entity TB_Add_Sub is
-- No ports in a test bench
end TB_Add_Sub;

-- Test Bench Architecture
architecture Behavioral of TB_Add_Sub is

    -- Component declaration of the Unit Under Test (UUT)
    component Add_Sub_Unit
        Port ( RegA : in STD_LOGIC_VECTOR (3 downto 0);
               RegB : in STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC;
               Output : out STD_LOGIC_VECTOR (3 downto 0);
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC);
    end component;

    -- Signals to connect to the UUT
    signal RegA     : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal RegB     : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal Sel      : STD_LOGIC := '0';
    signal Output   : STD_LOGIC_VECTOR (3 downto 0);
    signal Overflow : STD_LOGIC;
    signal Zero     : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Add_Sub_Unit Port map (
        RegA => RegA,
        RegB => RegB,
        Sel => Sel,
        Output => Output,
        Overflow => Overflow,
        Zero => Zero
    );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test 1: 3 + 2 = 5
        RegA <= "0011"; -- 3
        RegB <= "0010"; -- 2
        Sel  <= '0';    -- Add
        wait for 10 ns;

        -- Test 2: 5 - 3 = 2
        RegA <= "0101"; -- 5
        RegB <= "0011"; -- 3
        Sel  <= '1';    -- Sub
        wait for 10 ns;

        -- Test 3: 7 - 7 = 0 (check zero flag)
        RegA <= "0111"; -- 7
        RegB <= "0111"; -- 7
        Sel  <= '1';    -- Sub
        wait for 10 ns;

        -- Test 4: 8 + 9 = 17 (overflow should occur in 4-bit result)
        RegA <= "1000"; -- 8
        RegB <= "1001"; -- 9
        Sel  <= '0';    -- Add
        wait for 10 ns;

        -- Test 5: 0 - 1 = -1 (check overflow and two's complement result)
        RegA <= "0000"; -- 0
        RegB <= "0001"; -- 1
        Sel  <= '1';    -- Sub
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;