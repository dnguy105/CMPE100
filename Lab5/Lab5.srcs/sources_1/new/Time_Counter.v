`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2018 11:27:13 AM
// Design Name: 
// Module Name: Time_Counter
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


module Time_Counter(
    input Dw,
    input Up,
    input LD,
    input [7:0]Din,
    input clk,
    output TimeUp,
    output UTC,
    output DTC,
    output [7:0]Q
    );
    wire [1:0] tempUTC, tempDTC;
    wire t0,t1,t2,t3;
    countUD3L a(.clk(clk), .Up(Up), .Dw(Dw), .LD(LD), .D(Din[2:0]), .Q(Q[2:0]), .UTC(tempUTC[0]) , .DTC(tempDTC[0]));
    assign t2 = Up & tempUTC[0];
    assign t3 = Dw & tempDTC[0];
    countUD5L c(.clk(clk), .Up(t2), .Dw(t3), .LD(LD), .D(Din[7:3]), .Q(Q[7:3]), .UTC(tempUTC[1]) , .DTC(tempDTC[1]));
    
    assign UTC = tempUTC[1] &tempUTC[0];
    assign DTC = tempDTC[1] &tempDTC[0];
    
    assign TimeUp = DTC;

    
endmodule
