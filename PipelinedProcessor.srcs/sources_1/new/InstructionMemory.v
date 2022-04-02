`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 01:36:05 PM
// Design Name: 
// Module Name: InstructionMemory
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
//InstructionMemory #(.sizeVal(32), .File("MIPSCode.mem")) IM (.IMA(PCF), .IMRD(IMOut));

module InstructionMemory #(parameter sizeVal = 32, File = "MIPSCode.mem")(
input [sizeVal - 1:0] IMA, 
output reg [sizeVal - 1:0] IMRD
    );
    
//creates rom register
reg [sizeVal - 1:0] ROM [0:2**5-1];

//reads contents from memory file to rom register
initial $readmemb(File, ROM);

//outputs the info at specific rom address
always@(*)begin
IMRD = ROM[IMA];
end
    
endmodule
