`timescale 1ns/1ns
module Zero(input[7:0] in, input clk, rst, output zero);
	reg outZero;
	assign zero = outZero;
	always@(posedge clk, posedge rst)begin
		if(rst) outZero <= 0;
		else
			outZero = ~(|{in});
	end
endmodule

