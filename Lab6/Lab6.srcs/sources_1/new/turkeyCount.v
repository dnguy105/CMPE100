`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2018 11:00:09 AM
// Design Name: 
// Module Name: turkeyCount
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


module turkeyCount(
    input Up,
    input Dw,
    input clk,
    input LD,
    input [7:0] Din,
    output [7:0] Q,
    output UTC,
    output DTC,
    output TimeUp
    );
    
        wire [1:0] tempUTC, tempDTC;
        wire t0,t1,t2,t3;
        countUD3L a(.clk(clk), .Up(Up), .Dw(Dw), .LD(1'b0), .D(3'b000), .Q(Q[2:0]), .UTC(tempUTC[0]) , .DTC(tempDTC[0]));
        assign t2 = Up & tempUTC[0];
        assign t3 = Dw & tempDTC[0];
        countUD5L c(.clk(clk), .Up(t2), .Dw(t3), .LD(LD), .D(Din[7:3]), .Q(Q[7:3]), .UTC(tempUTC[1]) , .DTC(tempDTC[1]));
        assign UTC = tempUTC[1] &tempUTC[0];
        assign DTC = tempDTC[1] &tempDTC[0];
        
        assign TimeUp = DTC;
    
    
endmodule
