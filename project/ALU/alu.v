module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
	input [31:0] data_operandA, data_operandB;
	input [4:0] ctrl_ALUopcode, ctrl_shiftamt;
	output [31:0] data_result;
	output isNotEqual, isLessThan, overflow;
	
	add_subtract add_1(.A(data_operandA), .B(data_operandB), .sel(ctrl_ALUopcode[0]), .Cout(overflow), .Sum(data_result));
	
endmodule
