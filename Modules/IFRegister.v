`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:43:10 PM
// Design Name: 
// Module Name: IFRegister
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
//IFRegister #(.sizeVal(32)) IFtoID (.clk(clk), .rst((lilMuxOut1 == lilMuxOut2) & BranchD), .en(~Stall), .RD(IMOut), .PCp1F(PCp1F), .InstrD(InstrD), .PCp1D(PCp1D));

module IFRegister #(parameter sizeVal = 32)(
input clk, rst, en,
input [sizeVal - 1:0] RD,
input [sizeVal - 1:0] PCp1F,
output reg [sizeVal - 1:0] InstrD,
output reg [sizeVal - 1:0] PCp1D
    );
    
    always @(posedge clk)
    if(rst) begin
    InstrD <= 0;
    PCp1D <= 0;
    end
    else if(en) begin
    InstrD <= RD;
    PCp1D <= PCp1F;
    end
    
endmodule