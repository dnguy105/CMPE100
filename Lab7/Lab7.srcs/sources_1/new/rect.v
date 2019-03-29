`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2018 10:48:39 AM
// Design Name: 
// Module Name: rect
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


module rect(
   input clk,
   input [9:0] QH,
   input [9:0] QV,
   input [9:0] SH,
   input [9:0] SV,
   input [9:0] length,
   input [9:0] width,
   output color
    );
    assign color = (QH >= SH & QH <=  (SH + width)) & (QV >= SV & QV <=  (SV + length));
endmodule
