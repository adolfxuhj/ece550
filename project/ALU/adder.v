module adder(
	input A, 
	input B, 
	input Cin, 
	output Sum, 
	output Cout
	);
	
	wire X1, A1, A2;
	
	xor (X1, A, B);
	
	and (A1, A, B);
	and (A2, X1, Cin);
	
	xor (Sum, X1, Cin);
	or (Cout, A1, A2);
	
endmodule