`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2018 10:40:44 AM
// Design Name: 
// Module Name: testFile
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


module testFile(
    
    );
    reg [15:0] sw;
    reg btnU;
    reg btnR;
    reg clkin;
    wire [6:0] seg;
    wire dp;
    wire [3:0] an;
    
    topMod test(.sw(sw),.btnU(btnU), .btnR(btnR),.clkin(clkin),.seg(seg),.dp(dp),.an(an));
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
        // add your stimuli here
        // to set signal foo to value 0 use
        // foo = 1'b0;
        // to set signal foo to value 1 use
        // foo = 1'b1;
        //always advance time my multiples of 100ns
        // to advance time by 100ns use the following line
        #100;
        sw = 16'b0000000000000000;
        #100;
        sw = 16'b0000000000000001;
        #100;
        sw = 16'b0000000000000010;    
        #100;
        sw = 16'b0000000000000011;    
        #100;  
        sw = 16'b0000000000000100;
        #100;
        sw = 16'b0000000000000101;    
        #100;    
        sw = 16'b0000000000000110;
        #100; 
        sw = 16'b0000000000000111;
        #100;    
        sw = 16'b0000000000001000;
        #100;    
        sw = 16'b0000000000001001;
        #100;  
        sw = 16'b0000000000001010;
        #100;    
        sw = 16'b0000000000001011;
        #100;   
        sw = 16'b0000000000001100;
        #100;    
        sw = 16'b0000000000001101;
        #100;
        sw = 16'b0000000000001101;
        #100;
        sw = 16'b0000000000001110;
        #100;
        sw = 16'b0000000000001111;
        #100;
        sw = 16'b0000000000000000;
        #100;
        sw = 16'b0000000000010000;
        #100;
        sw = 16'b0000000000100000;    
        #100;
        sw = 16'b0000000000110000;    
        #100;  
        sw = 16'b0000000001000000;
        #100;
        sw = 16'b0000000001010000;    
        #100;    
        sw = 16'b0000000001100000;
        #100; 
        sw = 16'b0000000001110000;
        #100;    
        sw = 16'b0000000010000000;
        #100;    
        sw = 16'b0000000010010000;
        #100;  
        sw = 16'b0000000010100000;
        #100;    
        sw = 16'b0000000010110000;
        #100;   
        sw = 16'b0000000011000000;
        #100;    
        sw = 16'b0000000011010000;
        #100;
        sw = 16'b0000000011010000;
        #100;
        sw = 16'b0000000011100000;
        #100;
        sw = 16'b0000000011110000;
        #100;
        btnU = 1'b0;
        sw = 16'b0000000100000001;
        #100;
        btnU = 1'b0;
        sw = 16'b0000001100000011;
        #100;
        btnU = 1'b0;
        sw = 16'b0000001100001001;

            
             
       
       end
    
endmodule
