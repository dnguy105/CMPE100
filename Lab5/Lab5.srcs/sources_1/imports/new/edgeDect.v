`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2018 04:56:35 PM
// Design Name: 
// Module Name: edgeDect
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


module edgeDect(
    input btnC,
    input clk,
    input reset,
    output out
    );
    wire t0,t1;
    FDRE #(.INIT(1'b0) ) d0(.C(clk), .R(reset), .CE(1'b1), .D(btnC), .Q(t0));
    FDRE #(.INIT(1'b0) ) d1(.C(clk), .R(reset), .CE(1'b1), .D(t0), .Q(t1));
    assign out = t0 & ~t1;
       
       
       
       
    //FDRE #(.INIT(1'b0) ) d0(.C(clk), .R(reset), .CE(1'b1), .D(btnC), .Q(t[0]));
    //FDRE #(.INIT(1'b0) ) d1(.C(clk), .R(reset), .CE(t[0]), .D(t[0]), .Q(t[1]));
   // assign out = t[0]&~t[1];
   
endmodule
