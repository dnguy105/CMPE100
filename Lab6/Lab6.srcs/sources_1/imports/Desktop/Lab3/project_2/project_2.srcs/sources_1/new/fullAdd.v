`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2018 10:04:39 AM
// Design Name: 
// Module Name: fullAdd
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


module fullAdd(
    input a,
    input b,
    input cIn,
    output cOut,
    output s
    );    
        //[3:0]temp0, temp1,
    //[1:0] sel0, sel1
       wire t0 = ~cIn;
       m4_1e mux1(.in({cIn,t0,t0,cIn}), .sel({a,b}), .o(s));
       m4_1e mux0(.in({1'b1,cIn,cIn,1'b0}), .sel({a,b}), .o(cOut));
   /*
   
    assign temp0[0] = cIn; 
    assign temp0[1] = ~cIn; 
    assign temp0[2] = ~cIn;
    assign temp0[3] = cIn;  
    assign sel0[0] = b;
    assign sel0[1] = a;
    
    assign  temp1[0] = 0; 
    assign temp1[1] = cIn; 
    assign temp1[2] = cIn;
    assign  temp1[3] = 1;  
    assign  sel1[0] = b;
    assign sel1[1] = a;
    */
    
    
    
endmodule
