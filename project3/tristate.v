module tristate(
	input [31:0] q,
	input sel,
	output [31:0] out
	);
		
	
	assign out = sel ? q : 32'bz;
	
endmodule