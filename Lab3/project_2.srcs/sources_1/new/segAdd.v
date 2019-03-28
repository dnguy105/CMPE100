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
        
    
       /*
        assign tempA[0] = A[0];
        assign tempA[2] = A[0];
        assign tempA[3] = A[0];
        assign tempB[0] = B[0];
        assign tempB[1] = B[0];
        assign tempB[2] = B[0];
        assign tempB[3] = B[0];
        assign sel[0] = B[0];
        assign sel[1] = 0;
        
        fullAdd add0( .a(tempA), .sel(sel), .b(B[0]), .cIn(0), .cOut(t0), .s(S[0]));
        
        assign tempA[0] = A[1];
        assign tempA[2] = A[1];
        assign tempA[3] = A[1];
        assign tempB[0] = B[1];
        assign tempB[1] = B[1];
        assign tempB[2] = B[1];
        assign tempB[3] = B[1];
        assign sel[0] = B[1];
        assign sel[1] = t0;
        
        fullAdd add1( .a(tempA), .sel(sel), .b(B[1]), .cIn(t0), .cOut(t1), .s(S[1]));
        
        assign tempA[0] = A[2];
        assign tempA[2] = A[2];
        assign tempA[3] = A[2];
        assign tempB[0] = B[2];
        assign tempB[1] = B[2];
        assign tempB[2] = B[2];
        assign tempB[3] = B[2];
        assign sel[0] = B[2];
        assign sel[1] = t1;
        
        fullAdd add2( .a(tempA), .sel(sel), .b(B[2]), .cIn(t1), .cOut(t2), .s(S[2]));
        
        assign tempA[0] = A[3];
        assign tempA[2] = A[3];
        assign tempA[3] = A[3];
        assign tempB[0] = B[3];
        assign tempB[1] = B[3];
        assign tempB[2] = B[3];
        assign tempB[3] = B[3];
        assign sel[0] = B[3];
        assign sel[1] = t2;
        
        fullAdd add3( .a(tempA), .sel(sel), .b(B[3]), .cIn(t2), .cOut(t3), .s(S[3]));
        
        assign tempA[0] = A[4];
        assign tempA[2] = A[4];
        assign tempA[3] = A[4];
        assign tempB[0] = B[4];
        assign tempB[1] = B[4];
        assign tempB[2] = B[4];
        assign tempB[3] = B[4];
        assign sel[0] = B[4];
        assign sel[1] = t3;
        
        fullAdd add4( .a(tempA), .sel(sel), .b(B[4]), .cIn(t3), .cOut(t4), .s(S[4]));
        
        assign tempA[0] = A[5];
        assign tempA[2] = A[5];
        assign tempA[3] = A[5];
        assign tempB[0] = B[5];
        assign tempB[1] = B[5];
        assign tempB[2] = B[5];
        assign tempB[3] = B[5];
        assign sel[0] = B[5];
        assign sel[1] = t4;
        
        fullAdd add5( .a(tempA), .sel(sel), .b(B[5]), .cIn(t4), .cOut(t5), .s(S[5]));
        
        assign tempA[0] = A[6];
        assign tempA[2] = A[6];
        assign tempA[3] = A[6];
        assign tempB[0] = B[6];
        assign tempB[1] = B[6];
        assign tempB[2] = B[6];
        assign tempB[3] = B[6];
        assign sel[0] = B[6];
        assign sel[1] = t5;
        
        fullAdd add6( .a(tempA), .sel(sel), .b(B[6]), .cIn(t5), .cOut(t6), .s(S[6]));
        
        assign tempA[0] = A[7];
        assign tempA[2] = A[7];
        assign tempA[3] = A[7];
        assign tempB[0] = B[7];
        assign tempB[1] = B[7];
        assign tempB[2] = B[7];
        assign tempB[3] = B[7];
        assign sel[0] = B[7];
        assign sel[1] = t6;
        
        fullAdd add7( .a(tempA), .sel(sel), .b(B[7]), .cIn(t6), .cOut(t7), .s(S[7]));
   */
    
endmodule
