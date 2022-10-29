module decoder_3_8(
	input [2:0] d,
	input en,
	output [7:0] out
	);
	
	wire n1, n2, n3;
	
	not (n1, d[0]);
	not (n2, d[1]);
	not (n3, d[2]);
	
	wire [7:0] t;
	
	and (t[0], n3, n2, n1);
	and (t[1], n3, n2, d[0]);
	and (t[2], n3, d[1], n1);
	and (t[3], n3, d[1], d[0]);
	and (t[4], d[2], n2, n1);
	and (t[5], d[2], n2, d[0]);
	and (t[6], d[2], d[1], n1);
	and (t[7], d[2], d[1], d[0]);
	
	assign out = en ? t : 8'b00000000; 
	

endmodule