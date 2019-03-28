`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2018 10:11:52 AM
// Design Name: 
// Module Name: topMod
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


module topMod(
    input a0,
    input b0,
    input a1,
    input b1,
    input a2,
    input b2,
    input cIn,
    output A,
    output B,
    output C,
    output D,
    output E,
    output F,
    output G,
    output AN0,
    output AN1,
    output AN2,
    output AN3,
    output DP
    );
    wire t0, t1,t2,t3,t4;
    ripAdd add1(.a0(a0), .b0(b0), .a1(a1), .b1(b1), .a2(a2), .b2(b2), .cIn(cIn),.s0(t0),.s1(t1),.s2(t2),.s3(t3));
    segAdd add2(.n0(t0), .n1(t1), .n2(t2), .n3(t3), .A(A),.B(B),.C(C),.D(D),.E(E),.F(F),.G(G));
    assign AN0 = 0;
    assign AN1 = 1;
    assign AN2 = 1;
    assign AN3 = 1;
    assign DP = 1;
endmodule
