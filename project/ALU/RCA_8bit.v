module RCA_8bit(
	input [7:0] a,
	input [7:0] b,
	input ci,
	output [7:0] Sum,
	output Cout,
	output overflow
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
	assign overflow = cout[6];
	
endmodule