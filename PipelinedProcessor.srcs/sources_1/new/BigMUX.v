`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 03:10:47 PM
// Design Name: 
// Module Name: BigMUX
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
//BigMUX #(.selectSize(2), .sizeVal(32)) BigMUXName (.select(selectSize - 1), .in0(sizeVal - 1), .in1(), .in2(), .muxOut(sizeVal - 1));

//BigMux #(.selectSize(2), .sizeVal (32)) RFRD1EtoALU (.select(ForwardAE), .in0(RFRD1E), .in1(ResultW), .in2(ALUOutM), .muxOut(ALUIn1E));
//BigMux #(.selectSize(2), .sizeVal (32)) RFRD2EtoALU (.select(ForwardBE), .in0(RFRD2E), .in1(ResultW), .in2(ALUOutM), .muxOut(bigMuxOut));


module BigMUX #(selectSize = 2, sizeVal = 32)(
input [selectSize - 1:0] select,
input [sizeVal - 1:0] in0, in1, in2,
output [sizeVal - 1:0] muxOut
);

    assign muxOut = select[1] ? in2 : (select[0] ? in1 : in0);
    
endmodule
