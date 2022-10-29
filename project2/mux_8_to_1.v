module mux_8_to_1(
	input [31:0] d0, d1, d2, d3, d4, d5, d6, d7,
	input [2:0] s,
	output [31:0] out
	);
	
	wire [31:0] w1, w2;
	
   mux_4_to_1 mux_1(d0, d1, d2, d3, s[1:0], w1);
   mux_4_to_1 mux_2(d4, d5, d6, d7, s[1:0], w2);
	
	assign out = s[2] ? w2 : w1;
    
endmodule

module mux_4_to_1(
	input [31:0] d0,d1,d2,d3,
	input [1:0] s,
	output [31:0] out
	);
	
	wire [31:0] w1, w2;
	
	assign w1 = s[0] ? d1 : d0;
	assign w2 = s[0] ? d3 : d2;
	
	assign out = s[1] ? w2 : w1;

endmodule



