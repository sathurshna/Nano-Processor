library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.buses.all;

entity TB_Register_Bank is
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

    -- DUT component
    component Register_Bank
        Port (
            Reg_En     : in  register_address;
            Res        : in  STD_LOGIC;
            Clk        : in  STD_LOGIC;
            Data       : in  data_bus;
            Data_Buses : out data_buses
        );
    end component;

    -- Signals to connect to DUT
    signal Reg_En     : register_address := (others => '0');
    signal Res        : STD_LOGIC := '0';
    signal Clk        : STD_LOGIC := '0';
    signal Data       : data_bus := (others => '0');
    signal Data_Buses : data_buses;

begin

    -- DUT instantiation
    UUT: Register_Bank
        port map (
            Reg_En     => Reg_En,
            Res        => Res,
            Clk        => Clk,
            Data       => Data,
            Data_Buses => Data_Buses
        );

    -- Clock generation
    process
    begin
        while now < 500 ns loop
            Clk <= '0'; wait for 5 ns;
            Clk <= '1'; wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        -- Apply reset
        Res <= '1'; wait for 10 ns;
        Res <= '0'; wait for 10 ns;

        -- Write values to registers 1 to 7
        for i in 1 to 7 loop
            Reg_En <= std_logic_vector(to_unsigned(i, 3));
            Data <= std_logic_vector(to_unsigned(i * 3, 4)); -- Example data
            wait until rising_edge(Clk);
            wait for 10 ns;
        end loop;

        -- Hold Reg_En low, verify data persists
        Reg_En <= "000";
        Data <= "1111";
        wait for 40 ns;

        wait;
    end process;

end Behavioral;
