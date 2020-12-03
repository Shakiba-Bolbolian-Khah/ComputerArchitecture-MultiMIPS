`timescale 1ns/1ns
module Datapath(input clk, rst, iord, srcA, srcB, pcSrc, pcWrite, memRead, memWrite, irWrite, tos, push, pop, pcWriteCond, mtos, ldA, ldB, input [1:0] ALUop, output [2:0] opcode , output [7:0] processorOut);
  wire zero;
  wire [4:0] PCin, PCout, address;
  wire [7:0] ir, mdr, readData, din, stackOut, ARegOut, BRegOut, AinputALU, BinputALU, ALUResult, ALURegOut;
  
  PC pc( PCin, clk, rst, (zero && pcWrtieCond)||pcWrite , PCout );
  Mux5bit2to1 memoryMux( iord, ir[4:0], PCout, address);
  Memory memory( address, ARegOut, memRead, memWrite, readData);
  register IR( readData, clk, rst, irWrite, ir);
  register MDR(readData, clk, rst, 1'b1 , mdr);
  Mux8bit2to1 stackMux( mtos, mdr , ALURegOut , din);
  Stack stack( din, push, pop, tos, clk, rst, stackOut);
  register A(stackOut, clk, rst, ldA, ARegOut);
  register B(stackOut, clk, rst, ldB, BRegOut);
  Zero zeroReg(stackOut, clk, rst, zero);
  Mux8bit2to1 AMux(srcA,{3'b0,PCout},ARegOut, AinputALU);
  Mux8bit2to1 BMux(srcB, 8'b00000001 , BRegOut, BinputALU);
  ALU Alu(ALUop, AinputALU, BinputALU, ALUResult);
  ALUReg ALUReg(ALUResult, clk, rst, ALURegOut);
  Mux5bit2to1 PCMux(pcSrc, ir[4:0],ALUResult[4:0], PCin);
  assign processorOut = readData;
  assign opcode = ir[7:5];
endmodule

  