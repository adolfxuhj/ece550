module write_port(
	input [4:0] ctrl_writeReg,
	input ctrl_writeEnable,
	output [31:0] sel
	);
	
	wire [31:0] sel_raw;
	
	decoder_5_32 decoder_1(.d(ctrl_writeReg), .out(sel_raw));
	
	and and_array[31:0](sel, ctrl_writeEnable, sel_raw);
	
endmodule
	