`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2022 07:27:31 PM
// Design Name: 
// Module Name: Pipelined_tb
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


module Pipelined_tb;
    
    reg clk, rst;
    
    TopModule PipelinedPro (.clk(clk), .rst(rst));
    
    always #5 clk = ~clk;
    
    initial begin
    clk = 1; rst = 1;
    #1 rst = 0;
    
    #700;
    #10 $finish;
    end
    
endmodule
