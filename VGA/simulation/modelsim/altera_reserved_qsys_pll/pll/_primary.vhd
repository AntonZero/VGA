library verilog;
use verilog.vl_types.all;
entity pll is
    port(
        altpll_0_c0_clk : out    vl_logic;
        altpll_0_pll_slave_read: in     vl_logic;
        altpll_0_pll_slave_write: in     vl_logic;
        altpll_0_pll_slave_address: in     vl_logic_vector(1 downto 0);
        altpll_0_pll_slave_readdata: out    vl_logic_vector(31 downto 0);
        altpll_0_pll_slave_writedata: in     vl_logic_vector(31 downto 0);
        altpll_0_inclk_interface_reset_reset: in     vl_logic;
        altpll_0_inclk_interface_clk: in     vl_logic;
        altpll_0_areset_conduit_export: in     vl_logic;
        altpll_0_locked_conduit_export: out    vl_logic;
        altpll_0_phasedone_conduit_export: out    vl_logic
    );
end pll;
