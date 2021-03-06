`timescale 1ns/1ns
module processor(input clk, rst, output [7:0] processorOut);
  wire iord, srcA, srcB, pcSrc, pcWrite, memRead, memWrite, irWrite, tos, push, pop, pcWriteCond, mtos, ldA, ldB;
  wire [1:0] ALUop;
  wire [2:0] opcode;
  Datapath dp( clk, rst, iord, srcA, srcB, pcSrc, pcWrite, memRead, memWrite, irWrite, tos, push, pop, pcWriteCond, mtos, ldA, ldB, ALUop, opcode, processorOut);
  Controller ctrl(clk, rst, opcode, iord, srcA, srcB, pcSrc, pcWrite, memRead, memWrite, irWrite, tos, push, pop, pcWriteCond, mtos, ldA, ldB, ALUop);

endmodule