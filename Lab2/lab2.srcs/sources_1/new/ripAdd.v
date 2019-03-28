`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2018 10:21:34 AM
// Design Name: 
// Module Name: ripAdd
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


module ripAdd(
    input a0,
    input b0,
    input a1,
    input b1,
    input a2,
    input b2,
    input cIn,
    output s0,
    output s1,
    output s2,
    output s3
    );
    
    wire t1, t2;
    fullAdd add1(.a(a0), .b(b0), .cIn(cIn) , .cOut(t1), .s(s0));
    fullAdd add2(.a(a1), .b(b1), .cIn(t1) , .cOut(t2), .s(s1));
    fullAdd add3(.a(a2), .b(b2), .cIn(t2) , .cOut(s3), .s(s2));
endmodule


