`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2018 10:53:47 AM
// Design Name: 
// Module Name: AddSub8
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


module AddSub8(
    input [7:0] A,
    input [7:0] B,
    input sub,
    output [7:0] S,
    output ovfl
    );
    wire t2,t3;
    wire [7:0] TB, t0,t1;
    assign TB = ~B;
   
    //~b
    segAdd add1( .A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .B(TB), .cIn(1'b1), .S(t0), .cOut(t3));
    m2_1x8 choose( .in0(B), .in1(t0), .sel(sub), .o(t1));
    
    segAdd add( .A(A), .B(t1), .cIn(1'b0), .S(S), .cOut(t2));
        assign ovfl = ((A[7]&B[7]&~S[7])|(~A[7]&~B[7]&S[7]));
    
   /*
   always @( sub)begin
           if ( sub == 1)begin 
           
                  assign B[0] = ~B[0];
                  assign B[1] = ~B[]];
                  assign B[2] = ~B[2];
                  assign B[3] = ~B[3];
                  assign B[4] = ~B[4];
                  assign B[5] = ~B[5];
                  assign B[6] = ~B[6];
                  assign B[7] = ~B[7];
                  
                  assign B = ~B;
                  segAdd flip( .A({0,0,0,0,0,0,0,0}), .B(B), .cIn(1), .S(B), .cOut(ovfl));
           end
           
         end 
         */
   // if sub = 1 
    /*
    if sub = 0, run a and b through seg add,
    */
    /*
        assign B[0] = ~B{0};
           assign B[1] = ~B{1};
           assign B[2] = ~B{2};
           assign B[3] = ~B{3};
           assign B[4] = ~B{4};
           assign B[5] = ~B{5};
           assign B[6] = ~B{6};
           assign B[7] = ~B{7};
           segAdd flip( .A({0,0,0,0,0,0,0,0}), .B(B), .cIn(1), .S(B), .cOut(ovfl));
    */
   
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
