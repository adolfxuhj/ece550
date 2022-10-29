module mux(
	input [7:0] A,
	input [7:0] B,
	input sel,
	output [7:0] out
	);
	
	assign out = sel ? A : B;
	
endmodule 