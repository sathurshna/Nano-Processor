library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter_3_bits is
    Port (
        in_addr  : in  STD_LOGIC_VECTOR(2 downto 0);
        reset    : in  STD_LOGIC;
        clk      : in  STD_LOGIC;
        out_addr : out STD_LOGIC_VECTOR(2 downto 0)
    );
end Program_Counter_3_bits;

architecture Behavioral of Program_Counter_3_bits is

    -- Declare the Reg component
    component Reg
        generic (
            N : integer := 3
        );
        Port (
            D   : in  STD_LOGIC_VECTOR(N-1 downto 0);
            Res : in  STD_LOGIC;
            En  : in  STD_LOGIC;
            Clk : in  STD_LOGIC;
            Q   : out STD_LOGIC_VECTOR(N-1 downto 0)
        );
    end component;

begin

    -- Instantiate the Reg component to act as a program counter
    PC_Reg : Reg
        generic map (N => 3)
        port map (
            D   => in_addr,
            Res => reset,
            En  => '1',         -- Always enabled
            Clk => clk,
            Q   => out_addr
        );

end Behavioral;
