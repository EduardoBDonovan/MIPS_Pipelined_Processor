`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:36:47 PM
// Design Name: 
// Module Name: InstructionDecoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//InstructionDecoder Decode(.inst(InstrD), .opcode(opcode), .rs(RsD), .rt(RtD), .rd(RdD), .shamt(shamt), .funct(funct), .imm(Imm), .jump(JumpI))

module InstructionDecoder(
input [31:0]inst,
output [5:0] opcode,
output [4:0] rs,
output [4:0] rt,
output [4:0] rd,
output [4:0] shamt,
output [5:0] funct,
output [15:0] imm,
output [25:0] jump
    );
    
    assign opcode = inst[31:26];
    assign rs = inst[25:21];
    assign rt = inst[20:16];
    assign rd = inst[15:11];
    assign shamt = inst[10:6];
    assign funct = inst[5:0];
    assign imm = inst[15:0];
    assign jump = inst[25:0];
    
endmodule