`timescale 1ns/1ns
module Memory(input[4:0] address, input[7:0] writeData, input memRead, memWrite, output[7:0] readData);
  reg[7:0] data;
  reg [7:0] memoryData[0:31];
  initial begin
    memoryData[0] = 8'b10011001;
    memoryData[1] = 8'b10011010;
    memoryData[2] = 8'b10011011;
    memoryData[3] = 8'b10011100;
    memoryData[4] = 8'b10011101;
    memoryData[5] = 8'b00000000;
    memoryData[6] = 8'b00000000;
    memoryData[7] = 8'b00000000;
    memoryData[8] = 8'b00000000;
    memoryData[9] = 8'b10111110;
    memoryData[25] = 8'b00000001;
    memoryData[26] = 8'b00000010;
    memoryData[27] = 8'b00000011;
    memoryData[28] = 8'b00000100;
    memoryData[29] = 8'b00000101;
  end
  always@(posedge memRead,posedge memWrite)begin
    if(memRead)
      data = memoryData[address];
    if(memWrite)
      memoryData[address] = writeData;
  end
  assign readData = data;
endmodule
