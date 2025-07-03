library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.all;

entity Register_Bank is
    Port (
        Reg_En     : in  register_address;
        Res        : in  STD_LOGIC;
        Clk        : in  STD_LOGIC;
        Data       : in  data_bus;
        Data_Buses : out data_buses
    );
end Register_Bank;

architecture Behavioral of Register_Bank is

    -- Component declaration for Decoder_3_to_8
    component Decoder_3_to_8
        Port (
            I  : in  STD_LOGIC_VECTOR(2 downto 0);
            EN : in  STD_LOGIC := '1';
            Y  : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Component declaration for Reg (generic N-bit register)
    component Reg
        generic (
            N : integer := 4
        );
        Port (
            D   : in  STD_LOGIC_VECTOR(N-1 downto 0);
            Res : in  STD_LOGIC;
            En  : in  STD_LOGIC;
            Clk : in  STD_LOGIC;
            Q   : out STD_LOGIC_VECTOR(N-1 downto 0)
        );
    end component;

    signal Reg_sel : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Decoder for register enable
    Decoder_3_to_8_0 : Decoder_3_to_8
        port map (
            I  => Reg_En,
            EN => '1',
            Y  => Reg_sel
        );

    -- Register 0: always outputs 0000
    reg_inst0 : Reg
        generic map (N => 4)
        port map (
            D   => "0000",
            Res => Res,
            En  => '1',
            Clk => Clk,
            Q   => Data_Buses(0)
        );

    reg_inst1 : Reg
        generic map (N => 4)
        port map (
            D   => Data,
            Res => Res,
            En  => Reg_sel(1),
            Clk => Clk,
            Q   => Data_Buses(1)
        );
    reg_inst2 : Reg
        generic map (N => 4)
        port map (
            D   => Data,
            Res => Res,
            En  => Reg_sel(2),
            Clk => Clk,
            Q   => Data_Buses(2)
        );
    reg_inst3 : Reg     
        generic map (N => 4)
        port map (
            D   => Data,
            Res => Res,
            En  => Reg_sel(3),
            Clk => Clk,
            Q   => Data_Buses(3)
        );
    reg_inst4 : Reg
        generic map (N => 4)
        port map (
            D   => Data,
            Res => Res,
            En  => Reg_sel(4),
            Clk => Clk,
            Q   => Data_Buses(4)
        );
    reg_inst5 : Reg
        generic map (N => 4)
        port map (
            D   => Data,
            Res => Res,
            En  => Reg_sel(5),
            Clk => Clk,
            Q   => Data_Buses(5)
        );
    reg_inst6 : Reg
        generic map (N => 4)
        port map (
            D   => Data,
            Res => Res,
            En  => Reg_sel(6),
            Clk => Clk,
            Q   => Data_Buses(6)
        );
    reg_inst7 : Reg
        generic map (N => 4)
        port map (
            D   => Data,
            Res => Res,
            En  => Reg_sel(7),
            Clk => Clk,
            Q   => Data_Buses(7)
        );

end Behavioral;
