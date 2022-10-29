module isEqualOrNot(
	input [31:0] res_sub,
	output out
	);
	
	wire [30:0] notEqual;
	or (notEqual[0], res_sub[0], res_sub[1]);
	
	genvar bit_size;
	
	generate 
		for(bit_size = 1; bit_size < 31; bit_size = bit_size + 1)
		begin: label
			or (notEqual[bit_size], res_sub[bit_size + 1], notEqual[bit_size - 1]);
		end
	endgenerate
	
	assign out = notEqual[30];
	
endmodule