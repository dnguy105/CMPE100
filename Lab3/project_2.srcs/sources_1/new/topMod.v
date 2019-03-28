`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2018 12:26:15 AM
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
    input [15:0] sw,
    input btnU,
    input btnR,
    input clkin,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    wire t0, dig_sel;
    wire [7:0] temp0, t1,t2;
    
    lab3_digsel test(.clkin(clkin) , .greset(btnR), .digsel(dig_sel));
    AddSub8 add( .A(sw[7:0]), .B(sw[15:8]), .sub(btnU), .S(temp0), .ovfl(dp));
    hex7seg dis0( .n(temp0[3:0]) , .e(1'b1), .seg(t1));
    hex7seg dis1( .n(temp0[7:4]) , .e(1'b1), .seg(t2));
    
    m2_1x8 choose( .in0(t1), .in1(t2), .sel(dig_sel), .o(seg));
    
    assign an[0] = ~dig_sel;
    assign an[1] = dig_sel;
    assign an[2] = 1;
    assign an[3] = 1;
    
    
    
    
    
    
endmodule
