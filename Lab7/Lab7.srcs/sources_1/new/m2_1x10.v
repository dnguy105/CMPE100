`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2018 06:12:56 PM
// Design Name: 
// Module Name: m2_1x10
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


module m2_1x10(
    input [9:0] in0,
    input [9:0] in1,
    input sel,
    output [9:0] o
    );
    assign o = (~sel & in0) ^ (sel & in1);
endmodule
