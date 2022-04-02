`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:41:01 PM
// Design Name: 
// Module Name: DataMemory
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
//DataMemory #(.sizeVal(32), .File("datamem.mem")) DM (.clk(clk), .DMWE(DMWEM), .DMA(ALUOutM), .DMWD(DMdinM), .DMOUT(DMOutM));

module DataMemory#(parameter sizeVal = 32, File = "datamem.mem")(
input clk, DMWE,
input [sizeVal - 1:0] DMA, 
input [sizeVal - 1:0] DMWD,
output [sizeVal - 1:0] DMOUT
    );
    
reg [sizeVal - 1:0] ROM [0:512];

initial $readmemb(File, ROM);

always@(posedge clk)begin
if(DMWE)begin
ROM[DMA] <= DMWD;
end
end

assign DMOUT = ROM[DMA];

endmodule
