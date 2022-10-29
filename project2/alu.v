module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
	input [31:0] data_operandA, data_operandB;
	input [4:0] ctrl_ALUopcode, ctrl_shiftamt;
	output [31:0] data_result;
	output isNotEqual, isLessThan, overflow;
	
	wire [31:0] result_add, result_substract, result_and, result_or, result_sll, result_sra;
	
	wire overflow_add, overflow_sub;
	
	// add
	add_subtract add_1(.A(data_operandA), .B(data_operandB), .sel(1'b0), .Cout(overflow_add), .Sum(result_add));
	
	// substract
	add_subtract add_2(.A(data_operandA), .B(data_operandB), .sel(1'b1), .Cout(overflow_sub), .Sum(result_substract));
	
	//overflow
	assign overflow = ctrl_ALUopcode[0] ? overflow_sub : overflow_add;
	
	//isNotEqual
	isEqualOrNot equal(result_substract, isNotEqual);
	
	//isLessThan
	//out = A'B'R+AB'R+ABR+AB'R'
	isLessThanOrNot lessthan(.A(data_operandA[31]), .B(data_operandB[31]), .R(result_substract[31]), .out(isLessThan));
	
	//OR
	or_array or_bus(.A(data_operandA), .B(data_operandB), .res(result_or));
	
	//AND
	and_array and_bus(.A(data_operandA), .B(data_operandB), .res(result_and));
	
	//Logical left shift
	LLS sll(.A(data_operandA), .shamt(ctrl_shiftamt), .out(result_sll)); 
	
	//Arithmetic right shift
	ARS sra(.A(data_operandA), .shamt(ctrl_shiftamt), .out(result_sra));
	
	//output
	mux_8_to_1 mux1(.d0(result_add), .d1(result_substract), .d2(result_and), .d3(result_or), .d4(result_sll), .d5(result_sra), .s(ctrl_ALUopcode[2:0]), .out(data_result));
	
endmodule
