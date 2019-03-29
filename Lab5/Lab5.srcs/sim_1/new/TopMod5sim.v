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


module topMod5sim(

    );
        reg clkin;
        reg btnR;
        reg btnU;
        reg btnD;
        reg btnC;
        reg btnL;
        reg sw;
        wire [6:0] seg;
        wire dp;
        wire [3:0]an;
        wire [15:0]led;
        
      TopMod5 test(.clkin(clkin),.btnR(btnR),.btnU(btnU),.btnD(btnD),.btnC(btnC),.btnL(btnL),.sw(sw),.seg(seg),.dp(dp),.an(an),.led(led));
      
      
         // wire t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12;
          
             parameter PERIOD = 10;
             parameter real DUTY_CYCLE = 0.5;
             parameter OFFSET = 2;
         
             initial    // Clock process for clkin
             begin
                 #OFFSET
                   clkin = 1'b1;
                 forever
                 begin
                     #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
                 end
             end
            
            initial
            begin
            #1000;
        
            btnR = 1'b0;
            btnU = 1'b0;
            btnD = 1'b0;
            btnC = 1'b0;
            btnL = 1'b0;
            sw = 1'b1;
            #100;
            btnC =1'b1;
            #1000;
            btnC =1'b0;
            #12000;
            btnU = 1'b1;
            #10000;
            btnU = 1'b0;
            #12000;
            btnD = 1'b1;
            #10000;
            btnD = 1'b0;
             btnC = 1'b1;
            end
          
endmodule
