`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2018 05:16:15 PM
// Design Name: 
// Module Name: slug
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


module slug(
    input clk,
    input btnC,
    input btnD,
    input btnU,
    input btnL,
    input btnR,
    input frame,
    input [15:0]sw,
    output move,
    input hit,
    output win,
    output flash,
    output winflash,
    output [9:0]Hout,
    output [9:0]Vout,
    output [15:0]led,
    output RunTime, 
    output ShowTime,
    output ShowScore,
    output IncL,
    output IncW
    );
    
    wire [9:0] tempH, tempV;
    //m2_1x10 R( .in0(Hin),.in1(Hin+10'b1),.sel(btnR),.o(tempH));
    //m2_1x10 L( .in0(TempH),.in1(TempH-10'b1),.sel(btnL),.o(Hout));
     //
     // m2_1x10 U( .in0(Vin),.in1(Vin+10'b1),.sel(btnU),.o(tempV));
      //m2_1x10 D( .in0(tempV),.in1(tempV-10'b1),.sel(btnD),.o(Vout));
   // wire [9:0] temp = 
    countUD10L H(.clk(clk), .Up(btnR & frame & (Hout <= 613) & ~sta[3] & ~sta[2]), .Dw(btnL & frame & (Hout >= 9)& ~sta[2] & ~sta[3]), .LD(btnC | (win & btnC) | sta[0]), .D(10'd10), .Q(Hout[9:0]));
    countUD10L V(.clk(clk), .Up(btnD & frame & (Vout <= 453)& ~sta[3] & ~sta[2]), .Dw(btnU & frame & (Vout >= 9)& ~sta[2] & ~sta[3]), .LD(btnC| (win & btnC)|sta[0]), .D(10'd10), .Q(Vout[9:0]));
    wire enable = 1'b1;
    wire [3:0]sta,D;
    //start
    assign led[12] = sta[0];
    assign D[0] = (sta[0]&(~btnR&~btnL&~btnU&~btnD) | btnC);
    FDRE #(.INIT(1'b1)) t0 (.C(clk), .CE(enable), .D(D[0]), .Q(sta[0]));
                                                                                                                                                                 
    //move
    assign move = sta[1];
    assign led[13] = sta[1];
    assign D[1] = (sta[0] & (btnR|btnL|btnU|btnD)) | (sta[1]&(~hit&~win&~btnC));
    FDRE #(.INIT(1'b0)) t1 (.C(clk), .CE(enable), .D(D[1]), .Q(sta[1]));
  
    //git/flash
    assign D[2] = (sta[1]& hit) | (sta[2] & ~btnC);
    assign flash = sta[2];
    assign led[14] = sta[2];
    FDRE #(.INIT(1'b0)) t2 (.C(clk), .CE(enable), .D(D[2]), .Q(sta[2]));
    
    //win
    assign win = (Hout >= 10'd614)& (Vout >= 10'd454);
    assign winflash = sta[3];
    assign led[15] = sta[3];
    assign D[3] =(sta[1] &  win) | (sta[3] & ~btnC);
    FDRE #(.INIT(1'b0)) t3 (.C(clk), .CE(enable), .D(D[3]), .Q(sta[3]));
    
    assign RunTime = sta[1];
    assign ShowTime = sta[1] | sta[2] | sta[3];
    assign ShowScore = sta[0];
    assign IncW = sta[1] & win;
    assign IncL = sta[1] & hit;
endmodule
