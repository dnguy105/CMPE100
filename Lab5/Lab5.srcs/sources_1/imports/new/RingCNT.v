`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2018 01:24:12 PM
// Design Name: 
// Module Name: RingCNT
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


module RingCNT(
    input clk,
    input Advance,
    input reset,
    output [3:0]t
    );
   
    
   FDRE #(.INIT(1'b1) ) d0(.C(clk), .R(reset), .CE(Advance), .D(t[0]), .Q(t[1]));
   FDRE #(.INIT(1'b0) ) d1(.C(clk), .R(reset), .CE(Advance), .D(t[1]), .Q(t[2]));
   FDRE #(.INIT(1'b0) ) d2(.C(clk), .R(reset), .CE(Advance), .D(t[2]), .Q(t[3]));
   FDRE #(.INIT(1'b0) ) d3(.C(clk), .R(reset), .CE(Advance), .D(t[3]), .Q(t[0]));
    
    
endmodule
