`timescale 1ns/1ns
module Stack( input [7:0]in, input push, pop, tos, clk, rst, output [7:0] out);
  reg [4:0] top;  
  reg [7:0] dataOut;
  reg [7:0] stackData[0:31];
  always @(posedge clk, posedge rst)begin
    if(rst) begin
      top <= 5'b00000;
      dataOut <= 8'b0;
    end
    else begin
      if(push) begin
        stackData[top] <= in;
        top <= top + 1;
      end
      if(pop) begin
        top <= top - 1;
        dataOut <= stackData[top-1];
      end
      if(tos)
        dataOut <= stackData[top-1];        
    end
  end
  assign out = dataOut;
endmodule