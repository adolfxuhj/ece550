module add_subtract(
	input [31:0] A,
	input [31:0] B,
	input sel,
	output Cout,
	output [31:0] Sum
	);
	
	wire [31:0] w1,w2,w3,w4,w5;
	wire cout, cout_add, cout_sub, o1;
	
	assign w1 = ~B;
	//not not_array[31:0](w1,B);
	
	//mux_32bit mux_5(.A(w1), .B(B), .sel(sel), .out(w2));
	assign w2 = sel ? w1 : B;
	
	CSA_32bit csa_1(.A(A), .B(w2), .Ci(sel), .S(w5), .Co(cout), .overflow_ci(o1));
	
	assign Sum = w5;
	
	xor (Cout, o1, cout);
	
	//assign Cout = sel ? cout_sub : cout_add;
	
	
endmodule