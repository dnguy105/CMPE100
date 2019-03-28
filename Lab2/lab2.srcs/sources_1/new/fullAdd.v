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
    assign s = cIn^(a^b);
    assign cOut = (a&b)|(cIn&(a^b));
endmodule
