`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:37:30 PM
// Design Name: 
// Module Name: SExt
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
//SignExtend #(.inw(16), .outw(32)) SExt (.Imm(Imm), .SImm(SImm));

module SignExtend#(parameter inw = 16, outw = 32)(
input signed [inw - 1:0] Imm,
output signed [outw - 1:0] SImm
    );
    assign SImm = {{(outw-inw){Imm[inw - 1]}}, Imm[inw - 1:0]};
endmodule