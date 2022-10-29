module decoder_2_4(
	input [1:0] d,
	output [3:0] out
	);
	
	wire n1, n2;
	
	not (n1, d[0]);
	not (n2, d[1]);
	
	and (out[0], n2, n1);
	and (out[1], n2, d[0]);
	and (out[2], d[1], n1);
	and (out[3], d[1], d[0]);
	
endmodule