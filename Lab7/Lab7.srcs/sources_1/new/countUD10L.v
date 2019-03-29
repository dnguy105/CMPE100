`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 01:02:57 PM
// Design Name: 
// Module Name: countUD10L
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


module countUD10L(
    input clk,
    input Up,
    input Dw,
    input LD,
    input [9:0] D,
    output [9:0] Q,
    output UTC,
    output DTC
    );
    wire [1:0] tempUTC, tempDTC;
    wire t0,t1,t2,t3;
    countUD5L c(.clk(clk), .Up(Up), .Dw(Dw), .LD(LD), .D(D[4:0]), .Q(Q[4:0]), .UTC(tempUTC[0]) , .DTC(tempDTC[0]));
    assign t2 = Up & tempUTC[0];
    assign t3 = Dw & tempDTC[0];
    countUD5L b(.clk(clk), .Up(t2), .Dw(t3), .LD(LD), .D(D[9:5]), .Q(Q[9:5]), .UTC(tempUTC[1]) , .DTC(tempDTC[1]));
    assign UTC = tempUTC[1] &tempUTC[0];
    assign DTC = tempDTC[1] &tempDTC[0];
    
    
endmodule
