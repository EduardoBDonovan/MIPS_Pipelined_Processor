`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2022 10:23:59 AM
// Design Name: 
// Module Name: Adder
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
// Adder #(.inw1(32), .inw2(1)) PCadder (.in1(PCF), .in2(1), .dataOut(PCp1F));
// Adder #(.inw1(32), .inw2(32)) Branchadder (.in1(SImmD), .in2(PCp1D), .dataOut(PCBranchD));

module Adder #(parameter inw1 = 32, inw2 = 32, outw = (inw1 > inw2) ? inw1 + 1 : inw2 + 1)(
input signed [inw1 - 1:0] in1, 
input signed [inw2 - 1:0] in2,
output signed [outw - 1:0] dataOut
);

assign dataOut = in1 + in2; 

endmodule
