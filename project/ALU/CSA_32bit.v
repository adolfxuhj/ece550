module CSA_32bit(
	input [31:0] A,
	input [31:0] B,
	input Ci,
	output [31:0] S,
	output Co,
	output overflow_ci
	);
	wire cout, cout1, cout2, o1, o2;
	wire [15:0] S1, S2, S3, S4;
	
	//p15-p0
	CSA_16bit csa15_0(.A(A[15:0]), .B(B[15:0]), .Ci(Ci), .S(S1), .Co(cout)); 
	
	//p31-p16
	CSA_16bit csa31_16_0(.A(A[31:16]), .B(B[31:16]), .Ci(1'b0), .S(S2), .Co(cout1), .overflow(o1));
	CSA_16bit csa31_16_1(.A(A[31:16]), .B(B[31:16]), .Ci(1'b1), .S(S3), .Co(cout2), .overflow(o2));
	
	//mux_16bit mux_3(.A(S3), .B(S2), .sel(cout), .out(S4));
	assign S4 = cout ? S3 : S2;
	//mux_1bit mux_4(.A(cout2), .B(cout1), .sel(cout), .out(Co));
	assign Co = cout ? cout2 : cout1;
	assign overflow_ci = cout ? o2 : o1;
	
	assign S = {S4, S1};
	
endmodule