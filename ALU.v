`timescale 1ns/1ns
module ALU(input [1:0]ALUOp, input [7:0]in1,in2, output [7:0]ALUResult);
 	reg [7:0] aluResult;
 	always@(ALUOp,in1,in2) begin
    aluResult = 8'b0;
    case(ALUOp)
			  2'b00: begin //add
				  aluResult = in1 + in2;
			  end
			  2'b01: begin //sub
				  aluResult = in1 - in2;
			  end
			  2'b10: begin //and
				  aluResult = in1 & in2;
			  end
			  2'b11: begin //not
				  aluResult = ~in1;
			  end
			  default: begin
			    aluResult = 8'b0;
			  end
		endcase
	end
	assign ALUResult = aluResult;
endmodule


