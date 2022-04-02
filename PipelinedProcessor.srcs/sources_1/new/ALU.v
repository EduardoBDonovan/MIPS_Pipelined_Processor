`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:40:18 PM
// Design Name: 
// Module Name: ALU
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
//ALU #(.sizeVal(32)) Alu (.ALUIn1(ALUIn1E), .ALUIn2(ALUIn2E), .ALUsel(ALUSelE), .shamt(shamt), .outreg(ALUOutE));

module ALU #(parameter sizeVal = 32)(
input signed [sizeVal - 1:0] ALUIn1, ALUIn2,
input [3:0] ALUsel,
input [4:0] shamt,
output reg signed [sizeVal - 1:0] outreg
//output reg zeroflag
);

always @(*) begin
//zeroflag = (outreg == 0);
case(ALUsel)
4'b0000: //addition
outreg = ALUIn1 + ALUIn2;
4'b0001: //subtraction
outreg = ALUIn1 - ALUIn2;
4'b0010: //AND
outreg = ALUIn1 & ALUIn2;
4'b0011: //OR
outreg = ALUIn1 | ALUIn2;
4'b0100: //XOR
outreg = ALUIn1 ^ ALUIn2;
4'b0101: //XNor
outreg = ALUIn1 ~^ ALUIn2;
4'b0110: //logical left shift
outreg = ALUIn2<<shamt;
4'b0111: //logical right shift
outreg = ALUIn2>>shamt;
4'b1000: //variable left shift
outreg = ALUIn2<<ALUIn1[4:0];
4'b1001: //variable right shift
outreg = ALUIn2>>ALUIn1[4:0];
4'b1010: //arithmetic variable shift right
outreg = ALUIn2>>>ALUIn1[4:0];
endcase 
end
endmodule
