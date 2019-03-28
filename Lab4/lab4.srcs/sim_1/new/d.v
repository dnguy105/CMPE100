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
    reg clk;
    reg Up;
    reg Dw;
    reg LD;
    reg [2:0] D;
    wire [2:0] Q;
    wire UTC;
    wire DTC;
    
    countUD3L test(.clk(clk),.Up(Up),.Dw(Dw),.LD(LD),.D(D),.Q(Q),.UTC(UTC),.DTC(DTC));
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
        // add your stimuli here
        // to set signal foo to value 0 use
        // foo = 1'b0;
        // to set signal foo to value 1 use
        // foo = 1'b1;
        //always advance time my multiples of 100ns
        // to advance time by 100ns use the following line
        D = {1'b1,1'b0,1'b1};
        LD = 1'b0;
        Up =  1'b0;
        Dw= 1'b0;
        #100;
        Up =  1'b0;
        #100;
        Up =  1'b1;
        Dw= 1'b0;
        #100;
        Up =  1'b0;
        #100;
        Up =  1'b1;
        Dw= 1'b0;
        #100;
        Up =  1'b0;
        #100;
        Up =  1'b1;
        #100;
        Up =  1'b0;
        #100;
        Up =  1'b1;
        #100;
        Up =  1'b0;
        Dw= 1'b0;
        
        LD = 1'b1;
        #100;
         LD = 1'b0;
        #100;
        Up =  1'b0;
        Dw= 1'b1;
        #100;
        Up =  1'b0;
        Dw= 1'b0;
        #100;
        Up =  1'b0;
        Dw= 1'b1;
        #100;
        Up =  1'b0;
        Dw= 1'b0;
        //do nothing
        #100;
        Up =  1'b0;
        Dw= 1'b0;
        #100;
        Up =  1'b1;
        Dw= 1'b1;
        #100;
        Up =  1'b0;
        Dw= 1'b0;
        end
    
endmodule
