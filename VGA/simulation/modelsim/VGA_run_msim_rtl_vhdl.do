transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib altera_reserved_qsys_pll
vmap altera_reserved_qsys_pll altera_reserved_qsys_pll
vlog -vlog01compat -work altera_reserved_qsys_pll +incdir+C:/Users/Mein/Desktop/HARDWARE/fpga/VGA/db/ip/pll {C:/Users/Mein/Desktop/HARDWARE/fpga/VGA/db/ip/pll/pll.v}
vlog -vlog01compat -work altera_reserved_qsys_pll +incdir+C:/Users/Mein/Desktop/HARDWARE/fpga/VGA/db/ip/pll/submodules {C:/Users/Mein/Desktop/HARDWARE/fpga/VGA/db/ip/pll/submodules/pll_altpll_0.v}
vcom -93 -work work {C:/Users/Mein/Desktop/HARDWARE/fpga/VGA/VGA.vhd}
vcom -93 -work work {C:/Users/Mein/Desktop/HARDWARE/fpga/VGA/Vhdl2.vhd}

