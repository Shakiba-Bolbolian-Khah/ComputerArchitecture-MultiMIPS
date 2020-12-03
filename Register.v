`timescale 1ns/1ns
module register(input[7:0] in, input clk, rst, ldData, output[7:0] out);
	reg [7:0] outData;
	assign out = outData;
	always@(posedge clk, posedge rst)begin
		if(rst) outData <= 8'b0;
		else
		begin
			if(ldData) outData <= in;
			else outData <= outData;
		end
	end
endmodule
