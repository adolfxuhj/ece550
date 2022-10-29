module mux_2_to_1(
	input a,
	input b,
	input s,
	output out
	);
	
	assign out = s ? a : b;

endmodule