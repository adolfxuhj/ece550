module or_array(
	input [31:0] A,
	input [31:0] B,
	output [31:0] res
	);
	
	or or_arrays[31:0](res, A, B);
	
endmodule
