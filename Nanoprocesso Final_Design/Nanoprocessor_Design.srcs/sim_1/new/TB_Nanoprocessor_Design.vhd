library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Nanoprocessor_Design is
end TB_Nanoprocessor_Design;

architecture Behavioral of TB_Nanoprocessor_Design is

    COMPONENT Nanoprocessor_Design
        Port (
            Clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            Register7 : out STD_LOGIC_VECTOR (3 downto 0);
            OverflowFlag : out STD_LOGIC;
            ZeroFlag : out STD_LOGIC;
            To7Segment : out STD_LOGIC_VECTOR (6 downto 0);
            Display : out STD_LOGIC_VECTOR (3 downto 0)
        );
    END COMPONENT;

    -- Testbench signals
    signal Clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal Register1 : STD_LOGIC_VECTOR (3 downto 0);
    signal OverflowFlag : STD_LOGIC;
    signal ZeroFlag : STD_LOGIC;
    signal To7Segment : STD_LOGIC_VECTOR (6 downto 0);
    signal Display : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Nanoprocessor_Design
        port map (
            Clk => Clk,
            reset => reset,
            Register7 => Register1,
            OverflowFlag => OverflowFlag,
            ZeroFlag => ZeroFlag,
            To7Segment => To7Segment,
            Display => Display
        );

    -- Clock generation process: 10ns period (5ns high + 5ns low)
    clk_process : process
    begin
        while now < 1000 ns loop
            Clk <= '0';
            wait for 5 ns;
            Clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Reset process: Assert reset for the first 20ns
    reset_process : process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait;
    end process;

end Behavioral;
