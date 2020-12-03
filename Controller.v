`timescale 1ns/1ns
module Controller(input clk, rst, input [2:0] Opcode, output iord, srcA, srcB, pcSrc, pcWrite, memRead, memWrite, irWrite, tos, push, pop, pcWriteCond, mtos, ldA, ldB, output [1:0] ALUop);
	
	reg IorD, SrcA, SrcB, PcSrc, PcWrite, MemRead, MemWrite, IRWrite, Tos, Push, Pop, PcWriteCond, MtoS, LdA, LdB;
	reg [1:0] ALUOP;
	reg [3:0] ns, ps;
	
	always@(ps,Opcode)begin
		ns = 4'b0;
		case(ps)
			4'b0000: begin
				ns = 4'b0001;
			  end
			4'b0001: begin
				ns = ((Opcode==3'b110) ? 4'b0010 :
				       (Opcode==3'b111) ? 4'b0011 :
				       (Opcode==3'b100) ? 4'b1100 : 4'b0100);
				end
			4'b0010: begin
				ns = 4'b0000;
				end
			4'b0011: begin
				ns = 4'b0000;
				end
			4'b0100: begin
				ns = 4'b0101;
				end
			4'b0101: begin
				ns = ((Opcode==3'b101) ? 4'b0110 :
				       (Opcode==3'b011) ? 4'b1010 : 4'b0111);
				end
			4'b0110: begin
				ns = 4'b0000;
				end
			4'b0111: begin
				ns = 4'b1000;
				end
			4'b1000: begin
				ns = 4'b1001;
				end
			4'b1001: begin
				ns = 4'b1011;
				end
			4'b1010: begin
				ns = 4'b1011;
				end
			4'b1011: begin
			  ns = 4'b0000;
			  end
			4'b1100: begin
			  ns = 4'b1101;
			  end
			4'b1101: begin
			  ns = 4'b0000;
			  end
			default: ns = 4'b0000;
		endcase
	end
	
	always@(ps)begin
		{IorD, SrcA, SrcB, PcSrc, PcWrite, MemRead, MemWrite, IRWrite, Tos, Push, Pop, PcWriteCond, MtoS, LdA, LdB} = 15'b0;
		ALUOP = 2'b0;
		case(ps)
			4'b0000: begin
				IorD = 0;
				SrcA = 1;
				SrcB = 1;
				ALUOP = 2'b0;
				PcSrc = 0;
				PcWrite = 1;
				MemRead = 1;
				IRWrite = 1;
			  end
			4'b0001: begin
				Tos = 1;
				end
			4'b0010: begin
				PcSrc = 1;
				PcWrite = 1;
				end
			4'b0011: begin
				PcWriteCond = 1;
				PcSrc = 1;
				end
			4'b0100: begin
				Pop = 1;
				end
			4'b0101: begin
			  LdA = 1;
				end
			4'b0110: begin
				IorD = 1;
				MemWrite = 1;
				end
			4'b0111: begin
			  Pop = 1;
				end
			4'b1000: begin
				LdB = 1;
				end
			4'b1001: begin
				ALUOP = Opcode[1:0];
				end
			4'b1010: begin
			  ALUOP = 2'b11;
				end
			4'b1011: begin
			  Push = 1;
			  end
			4'b1100: begin
			  IorD = 1;
			  MemRead = 1;
			  end
			4'b1101: begin
			  MtoS = 1;
			  Push = 1;
			  end
		endcase
	end
	
	always@(posedge clk,posedge rst)begin
		if(rst) ps <= 4'b0000;
		else ps <= ns;
	end
	
  assign iord = IorD;
  assign srcA = SrcA;
  assign srcB = SrcB;
  assign pcSrc = PcSrc;
  assign pcWrite = PcWrite;
  assign memRead = MemRead;
  assign memWrite = MemWrite;
  assign irWrite = IRWrite;
  assign tos = Tos;
  assign push = Push;
  assign pop = Pop;
  assign pcWriteCond = PcWriteCond;
  assign mtos = MtoS;
  assign ldA = LdA;
  assign ldB = LdB;
  assign ALUop = ALUOP;
  
endmodule

