`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2018 09:38:07 PM
// Design Name: 
// Module Name: mux16_1
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


module mux16_1(
    input [3:0]t0,
    input [3:0]t1,
    input [3:0]t2,
    input [3:0]t3,
    input [3:0]sel,
    output [3:0]out
    );
    wire a,b;
    assign a = (~sel[3]&~sel[2]&sel[1]&~sel[0])|(~sel[3]&~sel[2]&~sel[1]&sel[0]);
    assign b = (~sel[3]&sel[2]&~sel[1]&~sel[0])|(~sel[3]&~sel[2]&~sel[1]&sel[0]);
    assign out = (t0 & ~a & ~b)| (t1 & ~a &b) | (t2 & a & ~b) | (t3 & a & b);
    
    //assign out = (t8&sel[3]&~sel[2]&~sel[1]&~sel[0])|(t4&~sel[3]&sel[2]&~sel[1]&~sel[0])|(t2&~sel[3]&~sel[2]&sel[1]&~sel[0])|(t1&sel[3]&~sel[2]&~sel[1]&sel[0]);
endmodule
