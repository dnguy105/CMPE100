`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2018 02:58:45 PM
// Design Name: 
// Module Name: topSim
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


module simState(

    );
       reg clk;
       reg btnC;
       reg btnU;
       reg btnD;
       reg TimeUp;
       reg lastled;
        wire ShowTime;
        wire LoadTime;
        wire RunTime;
        wire IncU;
        wire IncD;
        wire ShowScore;
        wire FlashU;
        wire FlashD;
        wire shift;
        
       StateMachine test(.clk(clk),.btnC(btnC),.btnU(btnU),.btnD(btnD),.TimeUp(TimeUp),.lastled(lastled),.ShowTime(ShowTime),
        .LoadTime(LoadTime),.RunTime(RunTime),.IncU(IncU),.IncD(IncD),.ShowScore(ShowScore),.FlashU(FlashU),.FlashD(FlashD),.shift(shift));
      
      
         // wire t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12;
          
             parameter PERIOD = 10;
             parameter real DUTY_CYCLE = 0.5;
             parameter OFFSET = 2;
         
             initial    // Clock process for clkin
             begin
                 #OFFSET
                   clk = 1'b1;
                 forever
                 begin
                     #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = ~clk;
                 end
             end
            
            initial
            begin
            
            btnU = 1'b0;
            btnD = 1'b0;
            btnC = 1'b0;
             TimeUp = 1'b0;
             lastled = 1'b0;
            #100;
            btnC =1'b1;
            #100;
            btnC =1'b0;
             #100;
             TimeUp = 1'b0;
              lastled = 1'b1;
            #100;
            btnU = 1'b1;
            #100;
            btnU = 1'b0;
            #100;
            TimeUp = 1'b1;
            #100;
            TimeUp = 1'b0;
            btnC = 1'b1;
            #100;
            btnC =1'b0;
            #100;
            TimeUp = 1'b0;
            lastled = 1'b1;
            #100;
            btnD = 1'b1;
            #100;
            btnD = 1'b0;
           #100;
            TimeUp = 1'b1;
            #100;
            TimeUp = 1'b0;
            btnC = 1'b1;
            #100;
            btnC =1'b0;
            TimeUp = 1'b1;
            #100;
            TimeUp = 1'b0;
            btnC = 1'b1;
            #100;
            btnC =1'b0;
            btnD = 1'b1;
            btnU = 1'b1;
            #100;
            TimeUp = 1'b1;
            #100;
            btnC =1'b0;
            #100;
            btnC =1'b1;
            btnU = 1'b0;
            btnD = 1'b0;
            TimeUp = 1'b0;
            lastled = 1'b0;
            #100;
            btnC =1'b1;
            #100;
            btnC =1'b0;
            #100;
            TimeUp = 1'b0;
            lastled = 1'b1;
            #100;
            btnU = 1'b1;
            #100;
            btnU = 1'b0;
            #100;
            btnD = 1'b1;
            #100;
            btnD = 1'b0;
            #100;
            TimeUp = 1'b1;
            #100;
            TimeUp = 1'b0;
            
            
            #100;
            btnC =1'b0;
            #100;
            btnC =1'b1;
            btnU = 1'b0;
            TimeUp = 1'b0;
            lastled = 1'b0;
            #100;
            btnC =1'b1;
            #100;
            btnC =1'b0;
            #100;
            TimeUp = 1'b0;
            lastled = 1'b1;
            #100;
            btnD = 1'b1;
            #100;
            btnD = 1'b0;
            #100;
            btnU = 1'b1;
            #100;
            btnU = 1'b0;
            #100;
            TimeUp = 1'b1;
            #100;
            TimeUp = 1'b0;
            #100;
            btnC =1'b1;
            #100;
            btnC =1'b0;

            end
          
endmodule
