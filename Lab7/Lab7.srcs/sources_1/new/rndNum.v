`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2018 10:58:23 AM
// Design Name: 
// Module Name: rndNum
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


module rndNum(
    input clk,
    input reset,
    output [6:0]rnd
    );
    //wire [7:0]Q;
    
    wire in = rnd[0]^rnd[5]^rnd[6]^rnd[7];
    wire enable = 1'b1;
    FDRE #(.INIT(1'b1) ) t0(.C(clk), .R(reset), .CE(enable), .D(in), .Q(rnd[0]));
    FDRE #(.INIT(1'b0) ) t1(.C(clk), .R(reset), .CE(enable), .D(rnd[0]), .Q(rnd[1]));
    FDRE #(.INIT(1'b0) ) t2(.C(clk), .R(reset), .CE(enable), .D(rnd[1]), .Q(rnd[2]));
    FDRE #(.INIT(1'b0) ) t3(.C(clk), .R(reset), .CE(enable), .D(rnd[2]), .Q(rnd[3]));
    FDRE #(.INIT(1'b0) ) t4(.C(clk), .R(reset), .CE(enable), .D(rnd[3]), .Q(rnd[4]));
    FDRE #(.INIT(1'b0) ) t5(.C(clk), .R(reset), .CE(enable), .D(rnd[4]), .Q(rnd[5]));
    FDRE #(.INIT(1'b0) ) t6(.C(clk), .R(reset), .CE(enable), .D(rnd[5]), .Q(rnd[6]));
    FDRE #(.INIT(1'b0) ) t7(.C(clk), .R(reset), .CE(enable), .D(rnd[6]), .Q(rnd[7]));
   // FDRE #(.INIT(1'b0) ) t8(.C(clk), .R(reset), .CE(enable), .D(rnd[0]), .Q(rnd[8]));
    
endmodule
