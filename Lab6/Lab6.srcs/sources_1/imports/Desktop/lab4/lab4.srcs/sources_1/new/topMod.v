`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 10:53:47 AM
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
    input clkin,
    input btnD,
    input btnR,
    input btnL,
    input [15:0]sw,
    output [6:0] seg,
    output dp,
    output [3:0]an,
    output [15:0]led
    );
    wire clk, digsel, qsec;
    wire ShowTime, IncU, IncD, Flash, cntRes, UTC, DTC, four;
    wire [7:0] turCountOut, invTCount, finalTcount;
     wire [15:0] pick;
     wire [3:0] turkCrossT,turkSec, select,dam;
     
    lab6_clks slowit (.clkin(clkin), .greset(btnD), .clk(clk), .digsel(digsel), .qsec(qsec));
    
    wire btnLsyn,btnDsyn,btnRsyn;
    FDRE #(.INIT(1'b0)) syc0 (.C(clk), .CE(1'b1), .D(~btnL), .Q(btnLsyn));
    FDRE #(.INIT(1'b0)) syc1 (.C(clk), .CE(1'b1), .D(btnD), .Q(btnDsyn));
    FDRE #(.INIT(1'b0)) syc2 (.C(clk), .CE(1'b1), .D(~btnR), .Q(btnRsyn));
    
    assign led[15] = btnLsyn;
    assign led[8] = btnRsyn;
    
    StateMachine a0(.clk(clk),.left(btnLsyn),.right(btnRsyn),.ShowTime(ShowTime),.countReset(cntRes),.IncU(IncU),.IncD(IncD));
    turkeyCount a1(.Up(IncU),.Dw(IncD),.clk(clk),.LD(1'b0),.Din(8'b00000000),.Q(turCountOut));

    //counvert to 2sc
    conv2sc a2(.A(turCountOut),.B(invTCount));
    //choose between 2sc or turcount based on most significant bit,
    m2_1x8 a5(.in0(turCountOut),.in1(invTCount),.sel(turCountOut[7]),.o(finalTcount));
    
    //counter out will be 1 sec
    countUD4L a3(.Up(qsec),.Dw(1'b0),.clk(clk),.LD(1'b0),.D(4'b0000),.Q(turkSec));
    wire sec = turkSec[1] & turkSec[0] & qsec;
    //cross count
    countUD4L a4(.Up(sec & ShowTime & ~four ),.Dw(1'b0),.clk(clk),.LD(cntRes),.D(4'b0000),.Q(turkCrossT),.four(four));
    
    
    
    
    
    //display for negative number, use mux, 
    wire [6:0] neg = {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0};
    wire [6:0] pos = {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
    wire [7:0] sign;
    // choose seg
  
    
    
    RingCNT sn(.clk(clk),.Advance(digsel),.t(select));
    assign pick[7:0] = finalTcount;
    assign pick[11:8] = {4'b0000};//timerOut;
   assign pick[15:12] = turkCrossT;
    
    Selector sel(.sel(select),.N(pick),.H(dam));
    wire [6:0]intempSeg;
    wire [7:0] outtempSeg;
     
    hex7seg hex(.n(dam),.e(1'b1),.seg(intempSeg));
    
    
    assign seg = outtempSeg[6:0];
    m2_1x8 a11(.in0({1'b0,intempSeg}),.in1(8'b00111111),.sel(turCountOut[7]& select[2]),.o(outtempSeg));
    //2bit counter for flash
    wire[2:0] temp3;  
    
    countUD3L Dte(.Up(qsec),.Dw(1'b0),.clk(clk),.LD(1'b0),.D({1'b0,1'b0,1'b0}),.Q(temp3),.UTC(teme2),.DTC(teme3));
    wire q12 = temp3[1];
       
    
    assign an[0] = ~select[0]; //~((select[0]&ShowScore)&~FlashD  |   (select[0]&ShowScore)&FlashD&q12) ;
    assign an[1] = ~select[1]; //~((select[1]&(ShowTime | sw)));
    assign an[2] = ~((select[2]&(turCountOut[7]))); 
    assign an[3] =  ~((select[3]& ShowTime & ~four) | (select[3]&ShowTime & four & turkSec[1])) ;
          
          
    

endmodule
