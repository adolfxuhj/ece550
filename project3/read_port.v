module read_port(
	input [31:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, 
	input [31:0] r17, r18, r19, r20, r21, r22, r23, r24, r25, r26, r27, r28, r29, r30, r31,
	input [4:0] ctrl_readReg,
	output [31:0] data_readReg
	);
	
	wire [31:0] sel;
	
	decoder_5_32 decoder_1(.d(ctrl_readReg), .out(sel));
	
	tristate tri_1(.q(r0), .sel(sel[0]), .out(data_readReg));
	tristate tri_2(.q(r1), .sel(sel[1]), .out(data_readReg));
	tristate tri_3(.q(r2), .sel(sel[2]), .out(data_readReg));
	tristate tri_4(.q(r3), .sel(sel[3]), .out(data_readReg));
	tristate tri_5(.q(r4), .sel(sel[4]), .out(data_readReg));
	tristate tri_6(.q(r5), .sel(sel[5]), .out(data_readReg));
	tristate tri_7(.q(r6), .sel(sel[6]), .out(data_readReg));
	tristate tri_8(.q(r7), .sel(sel[7]), .out(data_readReg));
	tristate tri_9(.q(r8), .sel(sel[8]), .out(data_readReg));
	tristate tri_10(.q(r9), .sel(sel[9]), .out(data_readReg));
	tristate tri_11(.q(r10), .sel(sel[10]), .out(data_readReg));
	tristate tri_12(.q(r11), .sel(sel[11]), .out(data_readReg));
	tristate tri_13(.q(r12), .sel(sel[12]), .out(data_readReg));
	tristate tri_14(.q(r13), .sel(sel[13]), .out(data_readReg));
	tristate tri_15(.q(r14), .sel(sel[14]), .out(data_readReg));
	tristate tri_16(.q(r15), .sel(sel[15]), .out(data_readReg));
	tristate tri_17(.q(r16), .sel(sel[16]), .out(data_readReg));
	tristate tri_18(.q(r17), .sel(sel[17]), .out(data_readReg));
	tristate tri_19(.q(r18), .sel(sel[18]), .out(data_readReg));
	tristate tri_20(.q(r19), .sel(sel[19]), .out(data_readReg));
	tristate tri_21(.q(r20), .sel(sel[20]), .out(data_readReg));
	tristate tri_22(.q(r21), .sel(sel[21]), .out(data_readReg));
	tristate tri_23(.q(r22), .sel(sel[22]), .out(data_readReg));
	tristate tri_24(.q(r23), .sel(sel[23]), .out(data_readReg));
	tristate tri_25(.q(r24), .sel(sel[24]), .out(data_readReg));
	tristate tri_26(.q(r25), .sel(sel[25]), .out(data_readReg));
	tristate tri_27(.q(r26), .sel(sel[26]), .out(data_readReg));
	tristate tri_28(.q(r27), .sel(sel[27]), .out(data_readReg));
	tristate tri_29(.q(r28), .sel(sel[28]), .out(data_readReg));
	tristate tri_30(.q(r29), .sel(sel[29]), .out(data_readReg));
	tristate tri_31(.q(r30), .sel(sel[30]), .out(data_readReg));
	tristate tri_32(.q(r31), .sel(sel[31]), .out(data_readReg));
	
endmodule