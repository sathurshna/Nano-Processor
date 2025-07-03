library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_LUT_16_7 is
end TB_LUT_16_7;

architecture Behavioral of TB_LUT_16_7 is

    component LUT_16_7
        Port (
            address : in STD_LOGIC_VECTOR (3 downto 0);
            data    : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    signal address : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal data    : STD_LOGIC_VECTOR (6 downto 0);

begin

    uut: LUT_16_7
        port map (
            address => address,
            data    => data
        );

    stimulus: process
    begin
        for i in 0 to 15 loop
            address <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;
        wait;
    end process;

end Behavioral;
