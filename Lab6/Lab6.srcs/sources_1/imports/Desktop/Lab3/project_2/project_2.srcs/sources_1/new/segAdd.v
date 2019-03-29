`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 08:42:38 PM
// Design Name: 
// Module Name: segAdd
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


module segAdd(
    input [7:0] A,
    //[3:0] tempA, tempB,
   //[1:0] sel,
    input [7:0] B,
    input cIn,
    output [7:0] S,
    output cOut
    );
    
    wire t0,t1,t2,t3,t4,t5,t6;
    fullAdd add0( .a(A[0]), .b(B[0]), .cIn(cIn), .cOut(t0), .s(S[0]));
    fullAdd add1( .a(A[1]), .b(B[1]), .cIn(t0), .cOut(t1), .s(S[1]));
    fullAdd add2( .a(A[2]), .b(B[2]), .cIn(t1), .cOut(t2), .s(S[2]));
    fullAdd add3( .a(A[3]), .b(B[3]), .cIn(t2), .cOut(t3), .s(S[3]));
    fullAdd add4( .a(A[4]), .b(B[4]), .cIn(t3), .cOut(t4), .s(S[4]));
    fullAdd add5( .a(A[5]), .b(B[5]), .cIn(t4), .cOut(t5), .s(S[5]));
    fullAdd add6( .a(A[6]), .b(B[6]), .cIn(t5), .cOut(t6), .s(S[6]));
    fullAdd add7( .a(A[7]), .b(B[7]), .cIn(t6), .cOut(cOut), .s(S[7]));
        
    
   
endmodule
