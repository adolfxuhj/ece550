module CSA_16bit(
	input [15:0] A,
	input [15:0] B,
	input Ci,
	output [15:0] S,
	output Co,
	output overflow
	);
	wire cout, cout1, cout2, o1, o2;
	wire [7:0] S1, S2, S3, S4;
	
	//p7-p0
	RCA_8bit rca7_0(.a(A[7:0]), .b(B[7:0]), .ci(Ci), .Sum(S1), .Cout(cout)); 
	
	//p15-p8
	RCA_8bit rca15_8_0(.a(A[15:8]), .b(B[15:8]), .ci(1'b0), .Sum(S2), .Cout(cout1), .overflow(o1));
	RCA_8bit rca15_8_1(.a(A[15:8]), .b(B[15:8]), .ci(1'b1), .Sum(S3), .Cout(cout2), .overflow(o2));
	
	//mux_8bit mux_1(.A(S3), .B(S2), .sel(cout), .out(S4));
	assign S4 = cout ? S3 : S2;
	//mux_1bit mux_2(.A(cout2), .B(cout1), .sel(cout), .out(Co));
	assign Co = cout ? cout2 : cout1;
	
	assign overflow = cout ? o2 : o1;
	
	assign S = {S4, S1}; 
	
endmodule 