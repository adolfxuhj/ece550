module and_array(
	input [31:0] A,
	input [31:0] B,
	output [31:0] res
	);
	
	and and_arrays[31:0](res, A, B);
	
endmodule
