module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	
	wire [31:0] write_en; 
	write_port wp(.ctrl_writeReg(ctrl_writeReg), .ctrl_writeEnable(ctrl_writeEnable), .sel(write_en));
	
	wire [31:0] q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16;
	wire [31:0] q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31;
	
	//assign q0 = 32'b0;
	register r0(.d(data_writeReg), .clk(clock), .en(write_en[0]), .clr(ctrl_reset), .q(q0));
	register r1(.d(data_writeReg), .clk(clock), .en(write_en[1]), .clr(ctrl_reset), .q(q1));
	register r2(.d(data_writeReg), .clk(clock), .en(write_en[2]), .clr(ctrl_reset), .q(q2));
	register r3(.d(data_writeReg), .clk(clock), .en(write_en[3]), .clr(ctrl_reset), .q(q3));
	register r4(.d(data_writeReg), .clk(clock), .en(write_en[4]), .clr(ctrl_reset), .q(q4));
	register r5(.d(data_writeReg), .clk(clock), .en(write_en[5]), .clr(ctrl_reset), .q(q5));
	register r6(.d(data_writeReg), .clk(clock), .en(write_en[6]), .clr(ctrl_reset), .q(q6));
	register r7(.d(data_writeReg), .clk(clock), .en(write_en[7]), .clr(ctrl_reset), .q(q7));
	register r8(.d(data_writeReg), .clk(clock), .en(write_en[8]), .clr(ctrl_reset), .q(q8));
	register r9(.d(data_writeReg), .clk(clock), .en(write_en[9]), .clr(ctrl_reset), .q(q9));
	register r10(.d(data_writeReg), .clk(clock), .en(write_en[10]), .clr(ctrl_reset), .q(q10));
	register r11(.d(data_writeReg), .clk(clock), .en(write_en[11]), .clr(ctrl_reset), .q(q11));
	register r12(.d(data_writeReg), .clk(clock), .en(write_en[12]), .clr(ctrl_reset), .q(q12));
	register r13(.d(data_writeReg), .clk(clock), .en(write_en[13]), .clr(ctrl_reset), .q(q13));
	register r14(.d(data_writeReg), .clk(clock), .en(write_en[14]), .clr(ctrl_reset), .q(q14));
	register r15(.d(data_writeReg), .clk(clock), .en(write_en[15]), .clr(ctrl_reset), .q(q15));
	register r16(.d(data_writeReg), .clk(clock), .en(write_en[16]), .clr(ctrl_reset), .q(q16));
	register r17(.d(data_writeReg), .clk(clock), .en(write_en[17]), .clr(ctrl_reset), .q(q17));
	register r18(.d(data_writeReg), .clk(clock), .en(write_en[18]), .clr(ctrl_reset), .q(q18));
	register r19(.d(data_writeReg), .clk(clock), .en(write_en[19]), .clr(ctrl_reset), .q(q19));
	register r20(.d(data_writeReg), .clk(clock), .en(write_en[20]), .clr(ctrl_reset), .q(q20));
	register r21(.d(data_writeReg), .clk(clock), .en(write_en[21]), .clr(ctrl_reset), .q(q21));
	register r22(.d(data_writeReg), .clk(clock), .en(write_en[22]), .clr(ctrl_reset), .q(q22));
	register r23(.d(data_writeReg), .clk(clock), .en(write_en[23]), .clr(ctrl_reset), .q(q23));
	register r24(.d(data_writeReg), .clk(clock), .en(write_en[24]), .clr(ctrl_reset), .q(q24));
	register r25(.d(data_writeReg), .clk(clock), .en(write_en[25]), .clr(ctrl_reset), .q(q25));
	register r26(.d(data_writeReg), .clk(clock), .en(write_en[26]), .clr(ctrl_reset), .q(q26));
	register r27(.d(data_writeReg), .clk(clock), .en(write_en[27]), .clr(ctrl_reset), .q(q27));
	register r28(.d(data_writeReg), .clk(clock), .en(write_en[28]), .clr(ctrl_reset), .q(q28));
	register r29(.d(data_writeReg), .clk(clock), .en(write_en[29]), .clr(ctrl_reset), .q(q29));
	register r30(.d(data_writeReg), .clk(clock), .en(write_en[30]), .clr(ctrl_reset), .q(q30));
	register r31(.d(data_writeReg), .clk(clock), .en(write_en[31]), .clr(ctrl_reset), .q(q31));
	
	read_port read_port_A(32'b0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, ctrl_readRegA, data_readRegA);
	read_port read_port_B(32'b0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, ctrl_readRegB, data_readRegB);
	
endmodule
