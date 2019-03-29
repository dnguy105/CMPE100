`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2018 10:57:12 AM
// Design Name: 
// Module Name: vertBar
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


module horBar(
    input clk,
    input frame,
    input move,
    input hit,
    input [9:0] gaplength,
    input [9:0] QH,
    input [9:0] QV,
    input [9:0] SH,
    input [9:0] SV,
    input btnC,
    input btnD,
    input btnU,
    input btnL,
    input btnR,
    input dir,
    input [9:0] rnd,
    output flash,
    output colorOut,
    output [15:0]led
    );
    wire [3:0] sta ,D;
    wire enable = 1'b1;
    wire colorbar, colorgap;
    wire [9:0] vert1H, vert1V, start, gaplengthF;
    // countUD10L V(.clk(clk), .Up(frame & sta[2]), .Dw(frame & sta[1]), .LD(1'b0), .D(10'b0000000000), .Q(SV[9:0]));
     //countUD10L V(.clk(clk), .Up(frame), .Dw(frame), .LD(1'b0), .D(10'b0000000000), .Q(SV[9:0]));
     //wire [9:0] length = 10'd524 - gap;
   // rect b1(.clk(clk) ,. QH(QH) ,. QV(QV),.SH(SH),.SV(SV),.length(length),.width(10'd8),.color(colorOut));
      assign vert1V = 10'd108;
      //assign vert1V = 10'd0;
      countUD10L tt(.clk(clk), .Up(frame&sta[1]), .Dw(frame&sta[2]), .LD(sta[0]), .D(rnd), .Q(vert1H));
      
      
      rect vert1(.clk(clk),.QH(QH),.QV(QV),.SH(10'd9),.SV(SV),.length(10'd8),.width(10'd639),.color(colorbar));
      rect vertGap(.clk(clk),.QH(QH),.QV(QV),.SH(vert1H),.SV(SV),.length(10'd8),.width(gaplength),.color(colorgap));
      
       mux2_1 a2(.a(colorbar & ~colorgap), .b(colorbar), .sel(sta[0]), .out(colorOut));
      
      
      assign led [5]= move;
     //start
       assign led[0] = sta[0];
       assign D[0] = (sta[0]&(~btnR&~btnL&~btnU&~btnD) | btnC);
       FDRE #(.INIT(1'b1)) t0 (.C(clk), .CE(enable), .D(D[0]), .Q(sta[0]));
       
      //moveRi
       assign led[1] = sta[1];
       assign D[1] = ((sta[0] & dir & (btnR|btnL|btnU|btnD)) | (sta[1] & ~(vert1H >= (10'd630 - gaplength))) | (sta[2] & (vert1H <= 10'd8) ))  & ~sta[3] & ~btnC;          
       FDRE #(.INIT(1'b0)) t1 (.C(clk), .CE(enable), .D(D[1]), .Q(sta[1]));
       
       //moveLf
       assign led[2] = sta[2];
       assign D[2] = ((sta[0] & ~dir & (btnR|btnL|btnU|btnD)) | (sta[2] & ~(vert1H <= (10'd8))) | (sta[1] & vert1H >= (10'd630 - gaplength))) & ~sta[3] & ~btnC;          
       FDRE #(.INIT(1'b0)) t2 (.C(clk), .CE(enable), .D(D[2]), .Q(sta[2]));
       
       //flash
       assign led[3] = sta[3];
       assign flash = sta[3];
       assign D[3] =(sta[2] & hit) | (sta[1] & hit) | (sta[3]&~btnC);
       FDRE #(.INIT(1'b0)) t3 (.C(clk), .CE(enable), .D(D[3]), .Q(sta[3]));
//     countUD10L H(.clk(clk), .Up(frame), .Dw(frame ), .LD(1'b0), .D(10'b0000000000), .Q(Hout[9:0]));
//          countUD10L V(.clk(clk), .Up(frame ), .Dw(frame), .LD(1'b0), .D(10'b0000000000), .Q(Vout[9:0]));
//    rect b2(.clk(clk) ,. QH(QH) ,. QV(QV),.SH(SH),.SV(SV),.length(10'd479),.width(10'd8),.color(colorOut));
endmodule
