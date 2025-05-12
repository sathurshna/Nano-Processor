library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_FA is
end TB_FA;

architecture Behavioral of TB_FA is
    COMPONENT FA
        PORT(
            A, B, C_in : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            C_out : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Signal declarations
    SIGNAL A, B, C_in, S, C_out : STD_LOGIC;

begin
    -- Unit Under Test (UUT) instantiation
    UUT: FA PORT MAP(
        A => A,
        B => B,
        C_in => C_in,
        S => S,
        C_out => C_out
    );

    -- Test process
    PROCESS
    BEGIN
        -- Test case 1: A = 0, B = 0, C_in = 0
        A <= '0';
        B <= '0';
        C_in <= '0';
        WAIT FOR 100 ns;

        -- Test case 2: A = 1, B = 0, C_in = 0
        A <= '1';
        B <= '0';
        C_in <= '0';
        WAIT FOR 100 ns;

        -- Test case 3: A = 0, B = 0, C_in = 1
        A <= '0';
        B <= '0';
        C_in <= '1';
        WAIT FOR 100 ns;

        -- Test case 4: A = 1, B = 0, C_in = 1
        A <= '1';
        B <= '0';
        C_in <= '1';
        WAIT FOR 100 ns;

        -- Test case 5: A = 0, B = 1, C_in = 0
        A <= '0';
        B <= '1';
        C_in <= '0';
        WAIT FOR 100 ns;

        -- Test case 6: A = 1, B = 1, C_in = 0
        A <= '1';
        B <= '1';
        C_in <= '0';
        WAIT FOR 100 ns;

        -- Test case 7: A = 0, B = 1, C_in = 1
        A <= '0';
        B <= '1';
        C_in <= '1';
        WAIT FOR 100 ns;

        -- Test case 8: A = 1, B = 1, C_in = 1
        A <= '1';
        B <= '1';
        C_in <= '1';
        WAIT FOR 100 ns;

        -- End the simulation
        WAIT;
    END PROCESS;

end Behavioral;