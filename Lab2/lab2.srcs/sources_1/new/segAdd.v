`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2018 11:20:39 AM
// Design Name: 
// Module Name: segAdd
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


module segAdd(
    input n0,
    input n1,
    input n2,
    input n3,
    output A,
    output B,
    output C,
    output D,
    output E,
    output F,
    output G
    );
    assign A = ((~n3&~n2&~n1&n0)|(~n3&n2&~n1&~n0)|(n3&~n2&n1&n0)|(n3&n2&~n1&n0));
    assign B = ((~n3&n2&~n1&n0)|(~n3&n2&n1&~n0)|(n3&~n2&n1&n0)|(n3&n2&~n1&~n0)|(n3&n2&n1&~n0)|(n3&n2&n1&n0));
    assign C = ((~n3&~n2&n1&~n0)|(n3&n2&~n1&~n0)|(n3&n2&n1&~n0)|(n3&n2&n1&n0));
    assign D = ((~n3&~n2&~n1&n0)|(~n3&n2&~n1&~n0)|(~n3&n2&n1&n0)|(n3&~n2&~n1&n0)|(n3&~n2&n1&~n0)|(n3&n2&n1&n0));
    assign E = ((~n3&~n2&~n1&n0)|(~n3&~n2&n1&n0)|(~n3&n2&~n1&~n0)|(~n3&n2&~n1&n0)|(~n3&n2&n1&n0)|(n3&~n2&~n1&n0));
    assign F = ((~n3&~n2&~n1&n0)|(~n3&~n2&n1&~n0)|(~n3&~n2&n1&n0)|(~n3&n2&n1&n0)|(n3&n2&~n1&n0));
    assign G = ((~n3&~n2&~n1&~n0)|(~n3&~n2&~n1&n0)|(~n3&n2&n1&n0)|(n3&n2&~n1&~n0));
    
    wire t1, t2, t3, t4, t5;
    //ripAdd seven0(
    
endmodule
