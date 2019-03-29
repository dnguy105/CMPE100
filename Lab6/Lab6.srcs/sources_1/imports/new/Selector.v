`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2018 05:59:00 PM
// Design Name: 
// Module Name: Selector
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


module Selector(
    input [3:0] sel,
    input [15:0] N,
    output [3:0] H
    );
    /*
    wire [3:0] t1,t2,t4,t8;
    assign t1 = N[3:0];
    assign t2 = N[7:4];
    assign t4 = N[11:8];
    assign t8 = N[15:12];
    mux16_1 a(.t0(t1),.t1(t2),.t2(t4),.t3(t8),.sel(sel),.out(H));
    */
    assign H = ((N[15:12]&{4{sel[3]}})
                ^(N[11:8]&{4{sel[2]}})
                ^(N[7:4]&{4{sel[1]}})
                ^(N[3:0]&{4{sel[0]}}));


endmodule


 //  assign H = N[15:12] & sel[3]&~sel[3]&~sel[3]&~sel[3]
// ~sel[3]&sel[3]&~sel[3]&~sel[3]
// ~sel[3]&~sel[3]&sel[3]&~sel[3]
// ~sel[3]&~sel[3]&~sel[3]&sel[3]
   
   
            
    
    
    