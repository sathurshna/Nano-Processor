library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Program_ROM is
end TB_Program_ROM;

architecture Behavioral of TB_Program_ROM is

    component Program_ROM
        Port (
            address           : in  STD_LOGIC_VECTOR (2 downto 0);
            instruction_code  : out STD_LOGIC_VECTOR (11 downto 0)
        );
    end component;

    signal address          : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal instruction_code : STD_LOGIC_VECTOR (11 downto 0);

begin

    uut: Program_ROM
        port map (
            address => address,
            instruction_code => instruction_code
        );

    stimulus: process
    begin
        for i in 0 to 7 loop
            address <= std_logic_vector(to_unsigned(i, 3));
            wait for 10 ns;
        end loop;
        wait;
    end process;

end Behavioral;
