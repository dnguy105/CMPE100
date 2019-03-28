`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2018 09:59:45 AM
// Design Name: 
// Module Name: m4_1e
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


module m4_1e(
    input [3:0] in,
    input [1:0] sel,
    input e,
    output o
    );
    assign o = e & ((in[0] & ~sel[1] & ~sel[0])|(in[1]&~sel[1]&sel[0])|(in[2]&sel[1]&~sel[0])|(in[3]&sel[1]&sel[0]));
    
endmodule
