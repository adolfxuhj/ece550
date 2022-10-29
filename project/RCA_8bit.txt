module RCA_8bit(
	input [7:0] a,
	input [7:0] b,
	input ci,
	output [7:0] Sum,
	output Cout
	);
	
	wire [7:0] cout;

	adder a0(.A(a[0]), .B(b[0]), .Cin(ci), .Sum(Sum[0]), .Cout(cout[0]));
	adder a1(.A(a[1]), .B(b[1]), .Cin(cout[0]), .Sum(Sum[1]), .Cout(cout[1]));
	adder a2(.A(a[2]), .B(b[2]), .Cin(cout[1]), .Sum(Sum[2]), .Cout(cout[2]));
	adder a3(.A(a[3]), .B(b[3]), .Cin(cout[2]), .Sum(Sum[3]), .Cout(cout[3]));
	adder a4(.A(a[4]), .B(b[4]), .Cin(cout[3]), .Sum(Sum[4]), .Cout(cout[4]));
	adder a5(.A(a[5]), .B(b[5]), .Cin(cout[4]), .Sum(Sum[5]), .Cout(cout[5]));
	adder a6(.A(a[6]), .B(b[6]), .Cin(cout[5]), .Sum(Sum[6]), .Cout(cout[6]));
	adder a7(.A(a[7]), .B(b[7]), .Cin(cout[6]), .Sum(Sum[7]), .Cout(cout[7]));
	
	assign Cout = cout[7];	
	
endmodule

module adder(
	input A, 
	input B, 
	input Cin, 
	output Sum, 
	output Cout
	);
	
	wire X1;
	xor (X1, A, B);
	
	wire A1, A2;
	and (A1, A, B);
	and (A2, X1, Cin);
	
	xor (Sum, X1, Cin);
	or (Cout, A1, A2);
	
endmodule
