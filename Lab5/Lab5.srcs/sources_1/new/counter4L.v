`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2018 11:09:46 AM
// Design Name: 
// Module Name: counter4L
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


module counter4L(
    input Up,
    input Dw,
    input clk,
    input LD,
    input [3:0] D,
    output [3:0] Q,
    output UTC,
    output DTC
    );
    countUD4L a(.Up(Up),.Dw(Dw),.clk(clk),.LD(LD),.D(D),.Q(Q),.UTC(UTC),.DTC(DTC));
      
      
      
       
endmodule
