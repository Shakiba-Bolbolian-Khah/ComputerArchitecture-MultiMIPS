`timescale 1ns/1ns
module Mux8bit2to1(input select, input [7:0]in1,in2, output [7:0]MuxOut);
  assign MuxOut = select ? in1 : in2;
endmodule
