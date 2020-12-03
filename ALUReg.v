`timescale 1ns/1ns
module ALUReg(input[7:0] in, input clk, rst, output[7:0] out);
	reg [7:0] outData;
	assign out = outData;
	always@(posedge clk, posedge rst)begin
		if(rst) outData <= 8'b0;
		else
			outData <= in;
	end
endmodule
