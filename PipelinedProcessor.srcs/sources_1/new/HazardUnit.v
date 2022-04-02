`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 03:04:24 PM
// Design Name: 
// Module Name: HazardUnit
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
//HarzardUnit #(.sizeAd(5)) HU (.BranchD(BranchD), .RsD(RsD), .RtD(RtD), .RsE(RsE), .RtE(RtE), .RFWEE(RFWEE), .MtoRFSelE(MtoRFSelE), .MtoRFSelM(MtoRFSelM), .RFWEM(RFWEM), 
// .RFWEW(RFWEW), .RFAE(RFAE), .RFAM(RFAM), .RFAW(RFAW), .Stall(Stall), .ForwardAD(ForwardAD), .ForwardBD(ForwardBD), .Flush(Flush), .ForwardAE(ForwardAE), .ForwardBE(ForwardBe));

module HazardUnit #(parameter sizeAd = 5)(
input BranchD, RFWEE, MtoRFSelE, MtoRFSelM, RFWEM, RFWEW,
input [sizeAd - 1:0] RsD, RtD, RsE, RtE,
input [sizeAd - 1:0] RFAE, RFAM, RFAW,
output wire Stall, Flush, ForwardAD, ForwardBD,
output wire [1:0] ForwardAE, ForwardBE
    );
    
    wire LWStall;
    
    wire BRStall;

    assign LWStall = MtoRFSelE & ((RtE == RsD) | (RtE == RtD));
    
    assign BRStall = ((RsD == RFAE) | (RtD == RFAE)) & BranchD & RFWEE | ((RsD == RFAM) | (RtD == RFAM)) & BranchD & MtoRFSelM;
     
    assign Stall = LWStall | BRStall;
    
    assign Flush = LWStall | BRStall;
    
    assign ForwardAD = (RsD != 0) & (RsD == RFAM) & RFWEM;
    
    assign ForwardBD = (RtD != 0) & (RtD == RFAM) & RFWEM;
    
    assign ForwardAE = ((RsE != 0) & RFWEM & (RsE == RFAM)) ? 2'b10 : (((RsE != 0) & RFWEW & (RsE == RFAW)) ? 2'b01 : 2'b00);
    
    assign ForwardBE = ((RtE != 0) & RFWEM & (RtE == RFAM)) ? 2'b10 : (((RtE != 0) & RFWEW & (RtE == RFAW)) ? 2'b01 : 2'b00);
    
endmodule
