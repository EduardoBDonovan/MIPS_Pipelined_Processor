`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:43:10 PM
// Design Name: 
// Module Name: EXERegister
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
//EXERegister #(.sizeVal(32), .sizeAd(5)) EXEtoMem (.clk(clk), .rst(rst), .RFWEE(RFWEE), .MtoRFSelE(MtoRFSelE), .DMWEE(DMWEE), .RFAE(RFAE),
// .ALUOutE(ALUOutE), .DMdinE(bigMuxOut), .RFWEM(RFWEM), .MtoRFSelM(MtoRFSelM), .DMWEM(DMWEM), .RFAM(RFAM), .ALUOutM(ALUOutM), .DMdinM(DMdinM));

module EXERegister #(parameter sizeVal = 32, sizeAd = 5)(
input clk, rst,
input RFWEE, MtoRFSelE, DMWEE, 
input [sizeAd - 1:0] RFAE,
input [sizeVal - 1:0] ALUOutE, DMdinE,
output reg RFWEM, MtoRFSelM, DMWEM,
output reg [sizeAd - 1:0] RFAM,
output reg [sizeVal - 1:0] ALUOutM, DMdinM
);

    always @(posedge clk)
    if(rst)begin
    RFWEM <= 0;
    MtoRFSelM <= 0;
    DMWEM <= 0;
    RFAM <= 0;
    ALUOutM <= 0;
    DMdinM <= 0;
    end else begin
    RFWEM <= RFWEE;
    MtoRFSelM <= MtoRFSelE;
    DMWEM <= DMWEE;
    RFAM <= RFAE;
    ALUOutM <= ALUOutE;
    DMdinM <= DMdinE;
    end
    
endmodule