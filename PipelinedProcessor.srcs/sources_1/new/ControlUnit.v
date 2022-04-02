`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:38:44 PM
// Design Name: 
// Module Name: ControlUnit
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
//ControlUnit CU (.opcode(opcode), .funct(funct), .MtoRFSel(MtoRFSelD), .DMWE(RFWED), .Branch(BranchD), .ALUinSel(ALUInSelD), .RFDSel(RFDSelD), .RFWE(RFWED), 
// .JumpSel(JumpSel), .ALUSel(ALUSelD));

module ControlUnit(
input [5:0] opcode,
input [5:0] funct,
output reg MtoRFSel, DMWE, Branch, ALUinSel, RFDSel, RFWE, JumpSel,
output reg [3:0] ALUSel
    );
    
    reg [1:0] ALUOp;
    
    always @(*)begin
    case(opcode)
    6'b000000: begin //add /
     RFWE = 1'b1; RFDSel = 1'b1; ALUinSel = 1'b0; Branch = 1'b0; DMWE = 1'b0; MtoRFSel = 1'b0; ALUOp = 2'b10; JumpSel = 1'b0;
    end
    6'b100011: begin //lw /
    RFWE = 1'b1; RFDSel = 1'b0; ALUinSel = 1'b1; Branch = 1'b0; DMWE = 1'b0; MtoRFSel = 1'b1; ALUOp = 2'b00; JumpSel = 1'b0;
    end
    6'b101011: begin //sw
    RFWE = 1'b0; ALUinSel = 1'b1; Branch = 1'b0; DMWE = 1'b1; ALUOp = 2'b00; JumpSel = 1'b0;
    end
    6'b000100: begin //beq
    RFWE = 1'b0; ALUinSel = 1'b0; Branch = 1'b1; DMWE = 1'b0; ALUOp = 2'b01; JumpSel = 1'b0;
    end
    6'b000010: begin //jump
    RFWE = 1'b0; DMWE = 1'b0; JumpSel = 1'b1;
    end
    6'b001000: begin //addi /
    RFWE = 1'b1; RFDSel = 1'b0; ALUinSel = 1'b1; Branch = 1'b0; DMWE = 1'b0; MtoRFSel = 1'b0; ALUOp = 2'b00;  JumpSel = 1'b0;
    end
    /*default: begin
    RFWE = 1'b0; RFDSel = 1'b1; ALUinSel = 1'b0; Branch = 1'b0; DMWE = 1'b0; MtoRFSel = 1'b0; ALUOp = 2'b10;
    end
    */
    endcase
    end
    
    always@(ALUOp) begin
    case(ALUOp)
    2'b00: ALUSel = 4'b0000;
    2'b01: ALUSel = 4'b0001;
    2'b10: case(funct)
        6'b100000: ALUSel = 4'b0000; //add 
        6'b100010: ALUSel = 4'b0001; //sub 
        6'b100100: ALUSel = 4'b0010; //and
        6'b100101: ALUSel = 4'b0011; //or
        6'b101010: ALUSel = 4'b0110; //sll
        6'b000100: ALUSel = 4'b1000; //sllv
        6'b000111: ALUSel = 4'b1010; //srav
        endcase
    endcase
    end
endmodule
