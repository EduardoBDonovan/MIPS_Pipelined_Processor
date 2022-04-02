`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:35:04 PM
// Design Name: 
// Module Name: MUX
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
//MUX #(.sizeVal(32)) MuxName (.select(), .in0(), .in1(), .muxOut());

//MUX #(.sizeVal(32)) PCMux (.select((lilMuxOut1 == lilMuxOut2) & BranchD), .in0(PCp1F), .in1(PCBranchD), .muxOut(PC));
//MUX #(.sizeVal(32)) RFRD1Mux (.select(ForwardAD), .in0(RFOut1), .in1(ALUOutM), .muxOut(lilMuxOut1));
//MUX #(.sizeVal(32)) RFRD2Mux (.select(ForwardBD), .in0(RFOut2), .in1(ALUOutM), .muxOut(lilMuxOut2));
//MUX #(.sizeVal(5)) RFDSelEMux (.select(RFDSelE), .in0(RtE), .in1(RdE), .muxOut(RFAE));
//MUX #(.sizeVal(32)) ALUInSelEMux (.select(ALUInSelE), .in0(bigMuxOut), .in1(SImmE), .muxOut(ALUIn2E));
//MUX #(.sizeVal(32)) JumpMux (.select(JumpSel), .in0(PC), .in1(JAddr = {PCp1F[31:26], JumpI}), .muxOut(PCR));
//MUX #(.sizeVal(32)) MtoRFSelMux (.select(MtoRFSelW), .in0(ALUOutW), .in1(DMOutW), .muxOut(ResultW));

module MUX #(parameter sizeVal = 32)(
input select,
input [sizeVal - 1:0] in0, in1,
output [sizeVal - 1:0] muxOut
    );
    
    assign muxOut = select ? in1 : in0;
    
endmodule
