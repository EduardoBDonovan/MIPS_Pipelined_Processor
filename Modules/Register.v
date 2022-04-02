`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2022 10:26:06 AM
// Design Name: 
// Module Name: Register
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
//Register #(.dataW(32)) PC (.clk(clk), .rst(rst), .en(~Stall), .dataIn(PCR), .dataOut(PCF));

module Register #(parameter dataW = 32)(
input clk, rst, en,
input [dataW - 1:0] dataIn,
output reg [dataW - 1:0] dataOut
    );
    
    always @(posedge clk)
    if(rst) dataOut <= 0;
    else if(en) dataOut <= dataIn;
    
endmodule
