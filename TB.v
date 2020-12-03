`timescale 1ns/1ns
module tb();
  wire [7:0] data;
  reg clk = 0, rst = 0;
  processor uut(clk, rst, data);
  initial begin
    repeat(120) #10 clk = ~clk;
  end
  initial begin
    rst = 1;
    #5
    rst = 0;
  end
endmodule