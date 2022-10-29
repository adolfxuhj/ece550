module decoder_5_32(
	input [4:0] d,
	output [31:0] out
	);	
	
	wire [3:0] en;
	decoder_2_4 decoder_2_4_1(.d(d[4:3]), .out(en));
	
	decoder_3_8 decoder_3_8_1(.d(d[2:0]), .en(en[0]), .out(out[7:0]));
	decoder_3_8 decoder_3_8_2(.d(d[2:0]), .en(en[1]), .out(out[15:8]));
	decoder_3_8 decoder_3_8_3(.d(d[2:0]), .en(en[2]), .out(out[23:16]));
	decoder_3_8 decoder_3_8_4(.d(d[2:0]), .en(en[3]), .out(out[31:24]));
	
endmodule