module register(
	input [31:0] d,
	input clk,
	input en,
	input clr,
	output [31:0] q
	);
	
	my_dffe dffe_array[31:0](q,d,clk,en,clr);
	
endmodule
