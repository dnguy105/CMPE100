`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 11:28:40 PM
// Design Name: 
// Module Name: hex7seg
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


module hex7seg(
    input [3:0] n,
    input e,
    output [6:0] seg
    );
    
    wire t0 = ~n[0];
    wire [6:0] te;
    /*
    //m8_1e A( .in({n[0],1'b0,t0,1'b0,1'b0,n[0],n[0],1'b0}), .sel(n[3:1]), .e(1'b1), .o(seg[0]));
    m8_1e B( .in({1'b0,1'b0,n[0],t0,1'b0,1'b0,1'b0,1'b1}), .sel(n[3:1]), .e(1'b1), .o(seg[1]));
        m8_1e C( .in({1'b0,t0,1'b0,1'b0,1'b0,1'b0,t0,1'b1}), .sel(n[3:1]), .e(1'b1), .o(seg[2]));
        m8_1e D( .in({n[0],1'b0,t0,n[0],n[0],t0,1'b0,n[0]}), .sel(n[3:1]), .e(1'b1), .o(seg[3]));
        m8_1e E( .in({n[0],n[0],1'b1,n[0],n[0],1'b0,1'b0,1'b0}), .sel(n[3:1]), .e(1'b1), .o(seg[4]));
        m8_1e F( .in({n[0],1'b1,1'b0,n[0],1'b0,1'b0,n[0],1'b0}), .sel(n[3:1]), .e(1'b1), .o(seg[5]));
        m8_1e G( .in({1'b1,1'b0,1'b0,n[0],1'b0,1'b0,t0,1'b0}), .sel(n[3:1]), .e(1'b1), .o(seg[6]));
        */
    m8_1e A( .in({1'b0,n[0],n[0],1'b0,1'b0,t0,1'b0,n[0]}), .sel(n[3:1]), .e(1'b1), .o(te[0]));
    m8_1e B( .in({1'b1,t0,n[0],1'b0,t0,n[0],1'b0,1'b0}), .sel(n[3:1]), .e(1'b1), .o(te[1]));
    m8_1e C( .in({1'b1,t0,1'b0,1'b0,1'b0,1'b0,t0,1'b0}), .sel(n[3:1]), .e(1'b1), .o(te[2]));
    m8_1e D( .in({n[0],1'b0,t0,n[0],n[0],t0,1'b0,n[0]}), .sel(n[3:1]), .e(1'b1), .o(te[3]));
    m8_1e E( .in({1'b0,1'b0,1'b0,n[0],n[0],1'b1,n[0],n[0]}), .sel(n[3:1]), .e(1'b1), .o(te[4]));
    m8_1e F( .in({1'b0,n[0],1'b0,1'b0,n[0],1'b0,1'b1,n[0]}), .sel(n[3:1]), .e(1'b1), .o(te[5]));
    m8_1e G( .in({1'b0,t0,1'b0,1'b0,n[0],1'b0,1'b0,1'b1}), .sel(n[3:1]), .e(1'b1), .o(te[6]));
    //assign seg = ~seg;
   // assign seg = ~te;
endmodule
