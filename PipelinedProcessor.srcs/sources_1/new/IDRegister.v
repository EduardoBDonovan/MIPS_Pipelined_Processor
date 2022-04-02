`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:43:10 PM
// Design Name: 
// Module Name: IDRegister
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
//IDRegister #(.sizeVal(32), .sizeAd(5)) IDtoEXE (.clk(), .rst(Flush), .RFWED(RFWED), .MtoRFSelD(MtoRFSelD), .DMWED(DMWED), .ALUInSelD(ALUInSelD), .RFDSelD(RFDSelD), .BranchD(BranchD),
//.ALUSelD(ALUSelD), .RFRD1D(lilMuxOut1), .RFRD2D(lilMuxOut2), .RsD(RsD), .RtD(RtD), .RdD(RdD), .SImmD(SImmD), .RFWEE(RFWEE), .MtoRFSelE(MtoRFSelE), .DMWEE(DMWEE), .ALUInSelE(ALUInSelE), .RFDSelE(RFDSelE), .BranchE(BranchE),
// , .ALUSelE(ALUSelE), .RFRD1E(RFRD1E), .RFRD2E(RFRD2E), .RsE(RsE), .RtE(RtE), .RdE(RdE), .SImmE(SImmE));

module IDRegister #(parameter sizeVal = 32, sizeAd = 5)(
input clk, rst,
input RFWED, MtoRFSelD, DMWED, ALUInSelD, RFDSelD, //Enable and Sel inputs for reg
input [3:0] ALUSelD, //select input for reg
input [sizeVal - 1:0] RFRD1D, RFRD2D, //data input from Register File
input [sizeAd - 1:0] RsD, RtD, RdD, //register locations from Instruction decoder
input [sizeVal - 1:0] SImmD, //sign extended num
output reg RFWEE, MtoRFSelE, DMWEE, ALUInSelE, RFDSelE,
output reg [3:0] ALUSelE,
output reg [sizeVal - 1:0] RFRD1E, RFRD2E, //output going to mux then pot alu
output reg [sizeAd - 1:0] RsE, RtE, RdE, //goes to hazard detection and elsewhere
output reg [sizeVal - 1:0] SImmE //sign extended num out
    );
    
    always @(posedge clk)
    if(rst) begin
    RFWEE <= 0;
    MtoRFSelE <= 0;
    DMWEE <= 0;
    ALUInSelE <= 0;
    RFDSelE <= 0;
    ALUSelE <= 4'b0000;
    RFRD1E <= 0;
    RFRD2E <= 0;
    RsE <= 0;
    RtE <= 0;
    RdE <= 0;
    SImmE <= 0;
    end else begin
    RFWEE <= RFWED;
    MtoRFSelE <= MtoRFSelD;
    DMWEE <= DMWED;
    ALUInSelE <= ALUInSelD;
    RFDSelE <= RFDSelD;
    ALUSelE <= ALUSelD;
    RFRD1E <= RFRD1D;
    RFRD2E <= RFRD2D;
    RsE <= RsD;
    RtE <= RtD;
    RdE <= RdD;
    SImmE <= SImmD;
    end
    
endmodule