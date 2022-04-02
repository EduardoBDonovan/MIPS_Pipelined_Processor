`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:43:10 PM
// Design Name: 
// Module Name: MEMRegister
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
//MEMRegister #(.sizeVal(32)) MEMtoWB (.clk(clk), .rst(rst), .RFWEM(RFWEM), .MtoRFSelM(MtoRFSelM), .ALUOutM(ALUOutM), .DMOutM(DMOutM), .RFAM(RFAM), .RFWEW(RFWEW),
// .MtoRFSelW(MtoRFSelW), .ALUOutW(ALUOutW), .DMOutW(DMOutW), .RFAW(RFAW));

module MEMRegister #(parameter sizeVal = 32, sizeAd = 5)(
input clk, rst,
input RFWEM, MtoRFSelM,
input [sizeVal - 1:0] ALUOutM, 
input [sizeVal - 1:0] DMOutM,
input [sizeAd - 1:0] RFAM,
output reg RFWEW, MtoRFSelW,
output reg [sizeVal - 1:0] ALUOutW, //don't know this size either
output reg [sizeVal - 1:0] DMOutW,
output reg [sizeAd - 1:0] RFAW
    );
    
    always @(posedge clk)
    if(rst)begin
    RFWEW <= 0;
    MtoRFSelW <= 0;
    ALUOutW <= 0;
    DMOutW <= 0;
    RFAW <= 0;
    end else begin
    RFWEW <= RFWEM;
    MtoRFSelW <= MtoRFSelM;
    ALUOutW <= ALUOutM;
    DMOutW <= DMOutM;
    RFAW <= RFAM;
    end
    
endmodule
