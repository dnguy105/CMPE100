`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2018 11:20:15 AM
// Design Name: 
// Module Name: conv2sc
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


module conv2sc(
    input [7:0] A,
    output [7:0] B
    );
    wire [7:0] TB;
    wire t5; 
    segAdd add1( .A({8'b00000001}), .B(~A), .cIn(1'b0), .S(B), .cOut(t5));
    
    // wire [7:0] C;
    //segAdd add1( .A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .B(TB), .cIn(1'b1), .S(B), .cOut(t5));
    //assign B = C;
    
endmodule
