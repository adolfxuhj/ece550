module isLessThanOrNot(
	input A,
	input B,
	input R,
	output out
	);
	
	wire w1, w2, w3, w4;
	wire n1, n2, n3;
	
	not (n1, A);
	not (n2, B);
	not (n3, R);
	
	and (w1, n1, n2, R);
	and (w2, A, n2, R);
	and (w3, A, B, R);
	and (w4, A, n2, n3);
	
	or (out, w1, w2, w3, w4);
		
endmodule