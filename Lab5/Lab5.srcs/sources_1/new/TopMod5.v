`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2018 04:44:49 PM
// Design Name: 
// Module Name: TopMod5
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


module TopMod5(
    input clkin,
    input btnR,
    input btnU,
    input btnC,
    input btnL,
    input btnD,
    input sw,
    output [15:0] led,
    output [6:0]seg,
    output [3:0]an,
    output dp
    );
   wire clk, digsel, qsec;
   wire TimeUp, lastled, ShowTime, LoadTime, RunTime, IncU, IncD, ShowScore, FlashU, FlashD, shift;
   wire [7:0] timerIn, timerOut;
   wire [3:0] ScoreU, ScoreD, select,dam;
   wire [15:0] pick, tempLed;
   lab5_clks slowit (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel), .qsec(qsec));
   
   
    wire btnCsyn,btnDsyn,btnUsyn;
     
      
      FDRE #(.INIT(1'b0)) syc0 (.C(clk), .CE(1'b1), .D(btnC), .Q(btnCsyn));
      FDRE #(.INIT(1'b0)) syc1 (.C(clk), .CE(1'b1), .D(btnD), .Q(btnDsyn));
      FDRE #(.INIT(1'b0)) syc2 (.C(clk), .CE(1'b1), .D(btnU), .Q(btnUsyn));
   
   
   LED_Shifter sh(.reset(lastled & ~ShowTime),.CE(qsec & ShowTime),.clk(clk),.led(led));
  // assign led = tempLed & {16{shift}};
   assign lastled = led[15] ;
   
   rndNum gen(.clk(clk),.reset(btnR),.rnd(timerIn));
   wire [7:0]tempIn  = timerIn;
   assign tempIn[8] = 1'b0; 
   
   Time_Counter temp0(.Dw(qsec&RunTime),.Up(1'b0),.LD(LoadTime),.Din(tempIn),.clk(clk),.TimeUp(TimeUp),.Q(timerOut));
   
   wire teme0, teme1, teme2, teme3;
   
   counter4L U(.Up(IncU),.Dw(1'b0),.clk(clk),.LD(1'b0),.D({1'b0,1'b0,1'b0,1'b0}),.Q(ScoreU),.UTC(teme0),.DTC(teme1));
   counter4L D(.Up(IncD),.Dw(1'b0),.clk(clk),.LD(1'b0),.D({1'b0,1'b0,1'b0,1'b0}),.Q(ScoreD),.UTC(teme2),.DTC(teme3));
   
  
   StateMachine stat(.clk(clk),.btnC(btnCsyn),.btnU(btnUsyn),.btnD(btnDsyn),.TimeUp(TimeUp),.LoadTime(LoadTime),.RunTime(RunTime),
        .lastled(lastled),.ShowTime(ShowTime),.IncU(IncU),.IncD(IncD),.ShowScore(ShowScore),
        .FlashU(FlashU),.FlashD(FlashD),.shift(shift));
        
  RingCNT sn(.clk(clk),.Advance(digsel),.reset(btnR),.t(select));
  
  assign pick[3:0] = ScoreD;
  assign pick[11:4] = timerOut;
  assign pick[15:12] = ScoreU;
  
  Selector sel(.sel(select),.N(pick),.H(dam));
  
  hex7seg hex(.n(dam),.e(1'b1),.seg(seg));
  
    wire[2:0] temp3;  
    countUD3L Dte(.Up(qsec),.Dw(1'b0),.clk(clk),.LD(1'b0),.D({1'b0,1'b0,1'b0}),.Q(temp3),.UTC(teme2),.DTC(teme3));
    wire q12 = temp3[0] & temp3[1];    
    assign an[0] = ~((select[0]&ShowScore)&~FlashD  |   (select[0]&ShowScore)&FlashD&q12) ;
    
    assign an[1] = ~((select[1]&(ShowTime | sw)));
    assign an[2] = ~((select[2]&(ShowTime | sw))); 
    
    assign an[3] =  ~((select[3]&ShowScore)&~FlashU | (select[3]&ShowScore)&FlashU&q12) ;
  
   assign dp = 1'b1;
   
endmodule
