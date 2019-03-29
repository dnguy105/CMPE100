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


module topMod6sim(

    );
        reg clkin;
        reg btnD;
        reg btnR;
        reg btnL;
        reg [15:0]sw;
        wire [6:0]seg;
        wire dp;
        wire [3:0]an;
        wire [15:0]led;
        
      topMod test(.clkin(clkin),.btnL(btnL),.btnR(btnR),.btnD(btnD),.sw(sw),.seg(seg),.dp(dp),.an(an),.led(led));
      
      
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
            btnD = 1'b0;
            btnR = 1'b0;
            btnL = 1'b0;
            #10000;
            #100
            btnR = 1'b1;
            #100;
            btnL = 1'b1;
            #100;
            btnR = 1'b0;
            #100;
            btnL = 1'b0;
            #400
            btnR = 1'b1;
            #100;
            btnL = 1'b1;
            #100;
            btnR = 1'b0;
            #100;
            btnL = 1'b0;
            #100
            btnR = 1'b1;
            #100;
            btnL = 1'b1;
            #100;
            btnR = 1'b0;
            #100;
            btnL = 1'b0;
            #100
            btnR = 1'b1;
            #100;
            btnL = 1'b1;
            #100;
            btnR = 1'b0;
            #100;
            btnL = 1'b0;
            #100
            btnR = 1'b1;
            #100;
            btnL = 1'b1;
            #100;
            btnR = 1'b0;
            #100;
            btnL = 1'b0; #100
            btnR = 1'b1;
            #100;
            btnL = 1'b1;
            #100;
            btnR = 1'b0;
            #100;
            btnL = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;  #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
            #100
            btnL = 1'b1;
            #100;
            btnR = 1'b1;
            #100;
            btnL = 1'b0;
            #100;
            btnR = 1'b0;
                                                                                                                                                                                                                                                                                                                                                                                                  
                                                                                             
                                    
            end
          
endmodule
