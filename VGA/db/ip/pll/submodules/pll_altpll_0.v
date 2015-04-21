//altpll_avalon avalon_use_separate_sysclk="NO" CBX_SINGLE_OUTPUT_FILE="ON" CBX_SUBMODULE_USED_PORTS="altpll:areset,clk,locked,inclk" address areset c0 clk locked phasedone read readdata reset write writedata clk0_divide_by=7 clk0_duty_cycle=50 clk0_multiply_by=19 clk0_phase_shift="0" compensate_clock="CLK0" device_family="CYCLONEII" inclk0_input_frequency=41666 intended_device_family="Cyclone II" operation_mode="normal" port_clk0="PORT_USED" port_clk1="PORT_UNUSED" port_clk2="PORT_UNUSED" port_clk3="PORT_UNUSED" port_clk4="PORT_UNUSED" port_clk5="PORT_UNUSED" port_extclk0="PORT_UNUSED" port_extclk1="PORT_UNUSED" port_extclk2="PORT_UNUSED" port_extclk3="PORT_UNUSED" port_inclk1="PORT_UNUSED" port_phasecounterselect="PORT_UNUSED" port_phasedone="PORT_UNUSED" port_scandata="PORT_UNUSED" port_scandataout="PORT_UNUSED"
//VERSION_BEGIN 13.0 cbx_altclkbuf 2013:06:12:18:03:40:SJ cbx_altiobuf_bidir 2013:06:12:18:03:40:SJ cbx_altiobuf_in 2013:06:12:18:03:40:SJ cbx_altiobuf_out 2013:06:12:18:03:40:SJ cbx_altpll 2013:06:12:18:03:40:SJ cbx_altpll_avalon 2013:06:12:18:03:40:SJ cbx_cycloneii 2013:06:12:18:03:40:SJ cbx_lpm_add_sub 2013:06:12:18:03:40:SJ cbx_lpm_compare 2013:06:12:18:03:40:SJ cbx_lpm_counter 2013:06:12:18:03:40:SJ cbx_lpm_decode 2013:06:12:18:03:40:SJ cbx_lpm_mux 2013:06:12:18:03:40:SJ cbx_lpm_shiftreg 2013:06:12:18:03:40:SJ cbx_mgl 2013:06:12:18:04:42:SJ cbx_stratix 2013:06:12:18:03:40:SJ cbx_stratixii 2013:06:12:18:03:40:SJ cbx_stratixiii 2013:06:12:18:03:40:SJ cbx_stratixv 2013:06:12:18:03:40:SJ cbx_util_mgl 2013:06:12:18:03:40:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2013 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.




//altera_std_synchronizer CBX_SINGLE_OUTPUT_FILE="ON" clk din dout reset_n
//VERSION_BEGIN 13.0 cbx_mgl 2013:06:12:18:04:42:SJ cbx_stratixii 2013:06:12:18:03:40:SJ cbx_util_mgl 2013:06:12:18:03:40:SJ  VERSION_END


//dffpipe CBX_SINGLE_OUTPUT_FILE="ON" DELAY=3 WIDTH=1 clock clrn d q ALTERA_INTERNAL_OPTIONS=AUTO_SHIFT_REGISTER_RECOGNITION=OFF
//VERSION_BEGIN 13.0 cbx_mgl 2013:06:12:18:04:42:SJ cbx_stratixii 2013:06:12:18:03:40:SJ cbx_util_mgl 2013:06:12:18:03:40:SJ  VERSION_END

//synthesis_resources = reg 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF"} *)
module  pll_altpll_0_dffpipe_l2c
	( 
	clock,
	clrn,
	d,
	q) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   clrn;
	input   [0:0]  d;
	output   [0:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   clock;
	tri1   clrn;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[0:0]	dffe4a;
	reg	[0:0]	dffe5a;
	reg	[0:0]	dffe6a;
	wire ena;
	wire prn;
	wire sclr;

	// synopsys translate_off
	initial
		dffe4a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe4a <= {1{1'b1}};
		else if (clrn == 1'b0) dffe4a <= 1'b0;
		else if  (ena == 1'b1)   dffe4a <= (d & (~ sclr));
	// synopsys translate_off
	initial
		dffe5a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe5a <= {1{1'b1}};
		else if (clrn == 1'b0) dffe5a <= 1'b0;
		else if  (ena == 1'b1)   dffe5a <= (dffe4a & (~ sclr));
	// synopsys translate_off
	initial
		dffe6a = 0;
	// synopsys translate_on
	always @ ( posedge clock or  negedge prn or  negedge clrn)
		if (prn == 1'b0) dffe6a <= {1{1'b1}};
		else if (clrn == 1'b0) dffe6a <= 1'b0;
		else if  (ena == 1'b1)   dffe6a <= (dffe5a & (~ sclr));
	assign
		ena = 1'b1,
		prn = 1'b1,
		q = dffe6a,
		sclr = 1'b0;
endmodule //pll_altpll_0_dffpipe_l2c

//synthesis_resources = reg 3 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  pll_altpll_0_stdsync_sv6
	( 
	clk,
	din,
	dout,
	reset_n) /* synthesis synthesis_clearbox=1 */;
	input   clk;
	input   din;
	output   dout;
	input   reset_n;

	wire  [0:0]   wire_dffpipe3_q;

	pll_altpll_0_dffpipe_l2c   dffpipe3
	( 
	.clock(clk),
	.clrn(reset_n),
	.d(din),
	.q(wire_dffpipe3_q));
	assign
		dout = wire_dffpipe3_q;
endmodule //pll_altpll_0_stdsync_sv6


//altpll CBX_SINGLE_OUTPUT_FILE="ON" clk0_divide_by=7 clk0_duty_cycle=50 clk0_multiply_by=19 clk0_phase_shift="0" compensate_clock="CLK0" device_family="CYCLONEII" inclk0_input_frequency=41666 intended_device_family="Cyclone II" operation_mode="normal" port_clk0="PORT_USED" port_clk1="PORT_UNUSED" port_clk2="PORT_UNUSED" port_clk3="PORT_UNUSED" port_clk4="PORT_UNUSED" port_clk5="PORT_UNUSED" port_extclk0="PORT_UNUSED" port_extclk1="PORT_UNUSED" port_extclk2="PORT_UNUSED" port_extclk3="PORT_UNUSED" port_inclk1="PORT_UNUSED" port_phasecounterselect="PORT_UNUSED" port_phasedone="PORT_UNUSED" port_scandata="PORT_UNUSED" port_scandataout="PORT_UNUSED" areset clk inclk locked
//VERSION_BEGIN 13.0 cbx_altclkbuf 2013:06:12:18:03:40:SJ cbx_altiobuf_bidir 2013:06:12:18:03:40:SJ cbx_altiobuf_in 2013:06:12:18:03:40:SJ cbx_altiobuf_out 2013:06:12:18:03:40:SJ cbx_altpll 2013:06:12:18:03:40:SJ cbx_cycloneii 2013:06:12:18:03:40:SJ cbx_lpm_add_sub 2013:06:12:18:03:40:SJ cbx_lpm_compare 2013:06:12:18:03:40:SJ cbx_lpm_counter 2013:06:12:18:03:40:SJ cbx_lpm_decode 2013:06:12:18:03:40:SJ cbx_lpm_mux 2013:06:12:18:03:40:SJ cbx_mgl 2013:06:12:18:04:42:SJ cbx_stratix 2013:06:12:18:03:40:SJ cbx_stratixii 2013:06:12:18:03:40:SJ cbx_stratixiii 2013:06:12:18:03:40:SJ cbx_stratixv 2013:06:12:18:03:40:SJ cbx_util_mgl 2013:06:12:18:03:40:SJ  VERSION_END

//synthesis_resources = altpll 1 reg 5 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  pll_altpll_0
	( 
	address,
	areset,
	c0,
	clk,
	locked,
	phasedone,
	read,
	readdata,
	reset,
	write,
	writedata) /* synthesis synthesis_clearbox=1 */;
	input   [1:0]  address;
	input   areset;
	output   c0;
	input   clk;
	output   locked;
	output   phasedone;
	input   read;
	output   [31:0]  readdata;
	input   reset;
	input   write;
	input   [31:0]  writedata;

	wire  wire_stdsync2_dout;
	wire  [5:0]   wire_sd1_clk;
	wire  wire_sd1_locked;
	(* ALTERA_ATTRIBUTE = {"POWER_UP_LEVEL=HIGH"} *)
	reg	pfdena_reg;
	wire	wire_pfdena_reg_ena;
	reg	prev_reset;
	wire  w_locked;
	wire  w_pfdena;
	wire  w_phasedone;
	wire  w_pll_areset_in;
	wire  w_reset;
	wire  w_select_control;
	wire  w_select_status;

	pll_altpll_0_stdsync_sv6   stdsync2
	( 
	.clk(clk),
	.din(wire_sd1_locked),
	.dout(wire_stdsync2_dout),
	.reset_n((~ reset)));
	altpll   sd1
	( 
	.activeclock(),
	.areset((w_pll_areset_in | areset)),
	.clk(wire_sd1_clk),
	.clkbad(),
	.clkloss(),
	.enable0(),
	.enable1(),
	.extclk(),
	.fbout(),
	.fref(),
	.icdrclk(),
	.inclk({{1{1'b0}}, clk}),
	.locked(wire_sd1_locked),
	.phasedone(),
	.scandataout(),
	.scandone(),
	.sclkout0(),
	.sclkout1(),
	.vcooverrange(),
	.vcounderrange()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clkena({6{1'b1}}),
	.clkswitch(1'b0),
	.configupdate(1'b0),
	.extclkena({4{1'b1}}),
	.fbin(1'b1),
	.pfdena(1'b1),
	.phasecounterselect({4{1'b1}}),
	.phasestep(1'b1),
	.phaseupdown(1'b1),
	.pllena(1'b1),
	.scanaclr(1'b0),
	.scanclk(1'b0),
	.scanclkena(1'b1),
	.scandata(1'b0),
	.scanread(1'b0),
	.scanwrite(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		sd1.clk0_divide_by = 7,
		sd1.clk0_duty_cycle = 50,
		sd1.clk0_multiply_by = 19,
		sd1.clk0_phase_shift = "0",
		sd1.compensate_clock = "CLK0",
		sd1.inclk0_input_frequency = 41666,
		sd1.operation_mode = "normal",
		sd1.port_clk0 = "PORT_USED",
		sd1.port_clk1 = "PORT_UNUSED",
		sd1.port_clk2 = "PORT_UNUSED",
		sd1.port_clk3 = "PORT_UNUSED",
		sd1.port_clk4 = "PORT_UNUSED",
		sd1.port_clk5 = "PORT_UNUSED",
		sd1.port_extclk0 = "PORT_UNUSED",
		sd1.port_extclk1 = "PORT_UNUSED",
		sd1.port_extclk2 = "PORT_UNUSED",
		sd1.port_extclk3 = "PORT_UNUSED",
		sd1.port_inclk1 = "PORT_UNUSED",
		sd1.port_phasecounterselect = "PORT_UNUSED",
		sd1.port_phasedone = "PORT_UNUSED",
		sd1.port_scandata = "PORT_UNUSED",
		sd1.port_scandataout = "PORT_UNUSED",
		sd1.intended_device_family = "Cyclone II",
		sd1.lpm_type = "altpll";
	// synopsys translate_off
	initial
		pfdena_reg = {1{1'b1}};
	// synopsys translate_on
	always @ ( posedge clk or  posedge reset)
		if (reset == 1'b1) pfdena_reg <= {1{1'b1}};
		else if  (wire_pfdena_reg_ena == 1'b1)   pfdena_reg <= writedata[1];
	assign
		wire_pfdena_reg_ena = (write & w_select_control);
	// synopsys translate_off
	initial
		prev_reset = 0;
	// synopsys translate_on
	always @ ( posedge clk or  posedge reset)
		if (reset == 1'b1) prev_reset <= 1'b0;
		else  prev_reset <= w_reset;
	assign
		c0 = wire_sd1_clk[0],
		locked = wire_sd1_locked,
		phasedone = 1'b0,
		readdata = {{30{1'b0}}, (read & ((w_select_control & w_pfdena) | (w_select_status & w_phasedone))), (read & ((w_select_control & w_pll_areset_in) | (w_select_status & w_locked)))},
		w_locked = wire_stdsync2_dout,
		w_pfdena = pfdena_reg,
		w_phasedone = 1'b1,
		w_pll_areset_in = prev_reset,
		w_reset = ((write & w_select_control) & writedata[0]),
		w_select_control = ((~ address[1]) & address[0]),
		w_select_status = ((~ address[1]) & (~ address[0]));
endmodule //pll_altpll_0
//VALID FILE
