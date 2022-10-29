module LLS(
	input [31:0] A,
	input [4:0] shamt,
	output [31:0] out
	);
	
	wire [32:0] in, in2, in3, in4, in5;
	assign in = {A, 1'b0};
	
	wire [31:0] im1, im2, im3, im4, im5;
	
	genvar bit_size;
	//round1
	generate 
		for(bit_size = 0; bit_size < 32; bit_size = bit_size + 1)
		begin: label1
			mux_2_to_1 mux_1(in[bit_size], in[bit_size + 1], shamt[0], im1[bit_size]);
		end
	endgenerate
	
	//round2
	assign in2 = {im1, 1'b0};
	assign im2[0] = shamt[1] ? 1'b0 : im1[0];
	
	generate 
		for(bit_size = 0; bit_size < 31; bit_size = bit_size + 1)
		begin: label2
			mux_2_to_1 mux_2(in2[bit_size], in2[bit_size + 2], shamt[1], im2[bit_size + 1]);
		end
	endgenerate	
	
	//round3
	assign in3 = {im2, 1'b0};
	assign im3[0] = shamt[2] ? 1'b0 : im2[0];
	assign im3[1] = shamt[2] ? 1'b0 : im2[1];
	assign im3[2] = shamt[2] ? 1'b0 : im2[2];
	generate 
		for(bit_size = 0; bit_size < 29; bit_size = bit_size + 1)
		begin: label3
			mux_2_to_1 mux_3(in3[bit_size], in3[bit_size + 4], shamt[2], im3[bit_size + 3]);
		end
	endgenerate	
	
	
	//round4
	assign in4 = {im3, 1'b0};
	assign im4[0] = shamt[3] ? 1'b0 : im3[0];
	assign im4[1] = shamt[3] ? 1'b0 : im3[1];
	assign im4[2] = shamt[3] ? 1'b0 : im3[2];
	assign im4[3] = shamt[3] ? 1'b0 : im3[3];
	assign im4[4] = shamt[3] ? 1'b0 : im3[4];
	assign im4[5] = shamt[3] ? 1'b0 : im3[5];
	assign im4[6] = shamt[3] ? 1'b0 : im3[6];
	generate 
		for(bit_size = 0; bit_size < 25; bit_size = bit_size + 1)
		begin: label4
			mux_2_to_1 mux_4(in4[bit_size], in4[bit_size + 8], shamt[3], im4[bit_size + 7]);
		end
	endgenerate

	//round5
	assign in5 = {im4, 1'b0};
	assign im5[0] = shamt[4] ? 1'b0 : im4[0];
	assign im5[1] = shamt[4] ? 1'b0 : im4[1];
	assign im5[2] = shamt[4] ? 1'b0 : im4[2];
	assign im5[3] = shamt[4] ? 1'b0 : im4[3];
	assign im5[4] = shamt[4] ? 1'b0 : im4[4];
	assign im5[5] = shamt[4] ? 1'b0 : im4[5];
	assign im5[6] = shamt[4] ? 1'b0 : im4[6];
	assign im5[7] = shamt[4] ? 1'b0 : im4[7];
	assign im5[8] = shamt[4] ? 1'b0 : im4[8];
	assign im5[9] = shamt[4] ? 1'b0 : im4[9];
	assign im5[10] = shamt[4] ? 1'b0 : im4[10];
	assign im5[11] = shamt[4] ? 1'b0 : im4[11];
	assign im5[12] = shamt[4] ? 1'b0 : im4[12];
	assign im5[13] = shamt[4] ? 1'b0 : im4[13];
	assign im5[14] = shamt[4] ? 1'b0 : im4[14];
	generate 
		for(bit_size = 0; bit_size < 17; bit_size = bit_size + 1)
		begin: label5
			mux_2_to_1 mux_5(in5[bit_size], in5[bit_size + 16], shamt[4], im5[bit_size + 15]);
		end
	endgenerate		
	
	assign out = im5;
	
endmodule
