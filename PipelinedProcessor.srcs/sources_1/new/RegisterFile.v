`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:39:28 PM
// Design Name: 
// Module Name: RegisterFile
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
//RegisterFile #(.sizeVal(32), .sizeAd(5)) RF (.RFWE(RFWEW), .clk(~clk), .RFWD(ResultW), .RFWA(RFAW), .RFRA1(RsD), .RFRA2(RtD),
// .RFRD1(RFOut1), .RFRD2(RFOut2));

module RegisterFile #(parameter sizeVal = 32, sizeAd = 5)(
input RFWE, //write enable
input clk, //clock
input [sizeVal - 1:0] RFWD, //input port w value
input [sizeAd - 1:0] RFWA, //address 
input [sizeAd - 1:0] RFRA1, RFRA2, //input ports w read value
output [sizeVal-1:0] RFRD1, RFRD2 //output ports
 );
 
 reg [sizeVal - 1:0] RAM [0:sizeVal - 1];
 
 //initial $readmemb("RF_Init.mem", RAM);

 initial RAM[0] = 0;

always@(posedge clk)begin
    if(RFWE) begin
    RAM[RFWA] <= RFWD;
    end
end
assign RFRD1 = RAM[RFRA1];
assign RFRD2 = RAM[RFRA2];
endmodule

