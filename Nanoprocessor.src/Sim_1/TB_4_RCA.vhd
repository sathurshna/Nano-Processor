library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_4_RCA is
end TB_4_RCA;

architecture Behavioral of TB_4_RCA is

    -- Component Declaration for 4-bit Ripple Carry Adder (RCA_4)
    COMPONENT RCA_4
        PORT(
            A0, A1, A2, A3, B0, B1, B2, B3, C_in : IN STD_LOGIC;
            S0, S1, S2, S3, C_out : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Signal Declarations for inputs and outputs
    SIGNAL A0, A1, A2, A3, B0, B1, B2, B3, C_in : STD_LOGIC;
    SIGNAL S0, S1, S2, S3, C_out : STD_LOGIC;

begin

    -- Unit Under Test (UUT) instantiation for RCA_4
    UUT: RCA_4
        PORT MAP(
            A0 => A0,
            A1 => A1,
            A2 => A2,
            A3 => A3,
            B0 => B0,
            B1 => B1,
            B2 => B2,
            B3 => B3,
            C_in => C_in,
            S0 => S0,
            S1 => S1,
            S2 => S2,
            S3 => S3,
            C_out => C_out
        );

    -- Test Process
    PROCESS
    BEGIN
        -- Test case 1
        A0 <= '1'; A1 <= '0'; A2 <= '0'; A3 <= '1';
        B0 <= '1'; B1 <= '1'; B2 <= '1'; B3 <= '1';
        C_in <= '0';
        WAIT FOR 100 ns;

        -- Test case 2
        A0 <= '1'; A1 <= '0'; A2 <= '1'; A3 <= '0';
        B0 <= '1'; B1 <= '1'; B2 <= '0'; B3 <= '0';
        C_in <= '0';
        WAIT FOR 100 ns;

        -- Test case 3
        A0 <= '1'; A1 <= '0'; A2 <= '1'; A3 <= '0';
        B0 <= '1'; B1 <= '1'; B2 <= '0'; B3 <= '1';
        WAIT FOR 100 ns;

        -- Test case 4
        A0 <= '1'; A1 <= '1'; A2 <= '1'; A3 <= '0';
        B0 <= '1'; B1 <= '1'; B2 <= '1'; B3 <= '1';
        C_in <= '0';
        WAIT FOR 100 ns;

        -- Test case 5 (arbitrary values)
        A0 <= '1'; A1 <= '0'; A2 <= '1'; A3 <= '0';
        B0 <= '1'; B1 <= '1'; B2 <= '1'; B3 <= '1';
        C_in <= '0';
        WAIT FOR 100 ns;

        -- Test case 6
        A0 <= '1'; A1 <= '1'; A2 <= '1'; A3 <= '0';
        B0 <= '0'; B1 <= '1'; B2 <= '0'; B3 <= '1';
        C_in <= '0';
        WAIT FOR 100 ns;

        -- Test case 7
        A0 <= '0'; A1 <= '1'; A2 <= '0'; A3 <= '1';
        B0 <= '0'; B1 <= '1'; B2 <= '0'; B3 <= '1';
        C_in <= '0';
        WAIT FOR 100 ns;

        -- Test case 8
        A0 <= '0'; A1 <= '1'; A2 <= '1'; A3 <= '1';
        B0 <= '1'; B1 <= '1'; B2 <= '1'; B3 <= '1';
        C_in <= '0';
        WAIT;

    END PROCESS;

end Behavioral;