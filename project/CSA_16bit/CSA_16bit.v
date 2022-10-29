module CSA_16bit(
	input [15:0] A,
	input [15:0] B,
	input Ci,
	output [15:0] S,
	output Co
	);
	wire cout, cout1, cout2;
	wire [7:0] S1, S2, S3, S4;
	
	//p7-p0
	RCA_8bit rca7_0(.a(A[7:0]), .b(B[7:0]), .ci(Ci), .Sum(S1), .Cout(cout)); 
	
	//p15-p8
	RCA_8bit rca15_8_0(.a(A[15:8]), .b(B[15:8]), .ci(1'b0), .Sum(S2), .Cout(cout1));
	RCA_8bit rca15_8_1(.a(A[15:8]), .b(B[15:8]), .ci(1'b1), .Sum(S3), .Cout(cout2));
	
	mux_8bit mux1(.A(S3), .B(S2), .sel(cout), .out(S4));
	mux_1bit mux2(.A(cout2), .B(cout1), .sel(cout), .out(Co));
	
	assign S = {S4, S1}; //从最高位到最低位
	
endmodule 

module RCA_8bit(
	input [7:0] a,
	input [7:0] b,
	input ci,
	output [7:0] Sum,
	output Cout
	);
	
	wire [7:0] cout;

	adder p0(.A(a[0]), .B(b[0]), .Cin(ci), .Sum(Sum[0]), .Cout(cout[0]));
	adder p1(.A(a[1]), .B(b[1]), .Cin(cout[0]), .Sum(Sum[1]), .Cout(cout[1]));
	adder p2(.A(a[2]), .B(b[2]), .Cin(cout[1]), .Sum(Sum[2]), .Cout(cout[2]));
	adder p3(.A(a[3]), .B(b[3]), .Cin(cout[2]), .Sum(Sum[3]), .Cout(cout[3]));
	adder p4(.A(a[4]), .B(b[4]), .Cin(cout[3]), .Sum(Sum[4]), .Cout(cout[4]));
	adder p5(.A(a[5]), .B(b[5]), .Cin(cout[4]), .Sum(Sum[5]), .Cout(cout[5]));
	adder p6(.A(a[6]), .B(b[6]), .Cin(cout[5]), .Sum(Sum[6]), .Cout(cout[6]));
	adder p7(.A(a[7]), .B(b[7]), .Cin(cout[6]), .Sum(Sum[7]), .Cout(cout[7]));
	
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

module mux_8bit(
	input [7:0] A,
	input [7:0] B,
	input sel,
	output [7:0] out
	);
	
	assign out = sel ? A : B;
	
endmodule 

module mux_1bit(
	input A,
	input B,
	input sel,
	output out
	);
	
	assign out = sel ? A : B;
	
endmodule 
