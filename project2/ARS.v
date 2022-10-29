module ARS(
	input [31:0] A,
	input [4:0] shamt,
	output [31:0] out
	);
	
	wire [32:0] in, in2, in3, in4, in5;
	wire [31:0] im1, im2, im3, im4, im5;
	
	genvar bit_size;
	
	assign in = {A[31], A};
	//round1
	generate 
		for(bit_size = 32; bit_size > 0; bit_size = bit_size - 1)
		begin: label1
			mux_2_to_1 mux_1(in[bit_size], in[bit_size - 1], shamt[0], im1[bit_size - 1]);
		end
	endgenerate
	
	//round2
	assign in2 = {A[31], im1};
	assign im2[31] = shamt[1] ? A[31] : im1[31];
	
	generate 
		for(bit_size = 32; bit_size > 1; bit_size = bit_size - 1)
		begin: label2
			mux_2_to_1 mux_2(in2[bit_size], in2[bit_size - 2], shamt[1], im2[bit_size - 2]);
		end
	endgenerate	
	
	//round3
	assign in3 = {A[31], im2};
	assign im3[31] = shamt[2] ? A[31] : im2[31];
	assign im3[30] = shamt[2] ? A[31] : im2[30];
	assign im3[29] = shamt[2] ? A[31] : im2[29];
	generate 
		for(bit_size = 32; bit_size > 3; bit_size = bit_size - 1)
		begin: label3
			mux_2_to_1 mux_3(in3[bit_size], in3[bit_size - 4], shamt[2], im3[bit_size - 4]);
		end
	endgenerate
	
	//round4
	assign in4 = {A[31], im3};
	assign im4[31] = shamt[3] ? A[31] : im3[31];
	assign im4[30] = shamt[3] ? A[31] : im3[30];
	assign im4[29] = shamt[3] ? A[31] : im3[29];
	assign im4[28] = shamt[3] ? A[31] : im3[28];
	assign im4[27] = shamt[3] ? A[31] : im3[27];
	assign im4[26] = shamt[3] ? A[31] : im3[26];
	assign im4[25] = shamt[3] ? A[31] : im3[25];
	generate 
		for(bit_size = 32; bit_size > 7; bit_size = bit_size - 1)
		begin: label4
			mux_2_to_1 mux_4(in4[bit_size], in4[bit_size - 8], shamt[3], im4[bit_size - 8]);
		end
	endgenerate

	//round5
	assign in5 = {A[31], im4};
	assign im5[31] = shamt[4] ? A[31] : im4[31];
	assign im5[30] = shamt[4] ? A[31] : im4[30];
	assign im5[29] = shamt[4] ? A[31] : im4[29];
	assign im5[28] = shamt[4] ? A[31] : im4[28];
	assign im5[27] = shamt[4] ? A[31] : im4[27];
	assign im5[26] = shamt[4] ? A[31] : im4[26];
	assign im5[25] = shamt[4] ? A[31] : im4[25];
	assign im5[24] = shamt[4] ? A[31] : im4[24];
	assign im5[23] = shamt[4] ? A[31] : im4[23];
	assign im5[22] = shamt[4] ? A[31] : im4[22];
	assign im5[21] = shamt[4] ? A[31] : im4[21];
	assign im5[20] = shamt[4] ? A[31] : im4[20];
	assign im5[19] = shamt[4] ? A[31] : im4[19];
	assign im5[18] = shamt[4] ? A[31] : im4[18];
	assign im5[17] = shamt[4] ? A[31] : im4[17];
	generate 
		for(bit_size = 32; bit_size > 15; bit_size = bit_size - 1)
		begin: label5
			mux_2_to_1 mux_5(in5[bit_size], in5[bit_size - 16], shamt[4], im5[bit_size - 16]);
		end
	endgenerate
	
	assign out = im5;
	
endmodule
