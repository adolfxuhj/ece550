transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/adolf/Desktop/master/550D/project/ALU {C:/Users/adolf/Desktop/master/550D/project/ALU/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/adolf/Desktop/master/550D/project/ALU {C:/Users/adolf/Desktop/master/550D/project/ALU/add_subtract.v}
vlog -vlog01compat -work work +incdir+C:/Users/adolf/Desktop/master/550D/project/ALU {C:/Users/adolf/Desktop/master/550D/project/ALU/CSA_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/adolf/Desktop/master/550D/project/ALU {C:/Users/adolf/Desktop/master/550D/project/ALU/CSA_16bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/adolf/Desktop/master/550D/project/ALU {C:/Users/adolf/Desktop/master/550D/project/ALU/RCA_8bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/adolf/Desktop/master/550D/project/ALU {C:/Users/adolf/Desktop/master/550D/project/ALU/adder.v}

vlog -vlog01compat -work work +incdir+C:/Users/adolf/Desktop/master/550D/project/ALU {C:/Users/adolf/Desktop/master/550D/project/ALU/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
