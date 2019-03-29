`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2018 07:27:31 PM
// Design Name: 
// Module Name: LED_Shifter
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


module LED_Shifter(
    input reset,
    input CE,
    input clk,
    output [15:0]led
    );
        wire enable = CE;
        FDRE #(.INIT(1'b0) ) t0(.C(clk), .R(reset), .CE(enable), .D(1'b1), .Q(led[0]));
        FDRE #(.INIT(1'b0) ) t1(.C(clk), .R(reset), .CE(enable), .D(led[0]), .Q(led[1]));
        FDRE #(.INIT(1'b0) ) t2(.C(clk), .R(reset), .CE(enable), .D(led[1]), .Q(led[2]));
        FDRE #(.INIT(1'b0) ) t3(.C(clk), .R(reset), .CE(enable), .D(led[2]), .Q(led[3]));
        FDRE #(.INIT(1'b0) ) t4(.C(clk), .R(reset), .CE(enable), .D(led[3]), .Q(led[4]));
        FDRE #(.INIT(1'b0) ) t5(.C(clk), .R(reset), .CE(enable), .D(led[4]), .Q(led[5]));
        FDRE #(.INIT(1'b0) ) t6(.C(clk), .R(reset), .CE(enable), .D(led[5]), .Q(led[6]));
        FDRE #(.INIT(1'b0) ) t7(.C(clk), .R(reset), .CE(enable), .D(led[6]), .Q(led[7]));
        FDRE #(.INIT(1'b0) ) t8(.C(clk), .R(reset), .CE(enable), .D(led[7]), .Q(led[8]));
        FDRE #(.INIT(1'b0) ) t9(.C(clk), .R(reset), .CE(enable), .D(led[8]), .Q(led[9]));
        FDRE #(.INIT(1'b0) ) t10(.C(clk), .R(reset), .CE(enable), .D(led[9]), .Q(led[10]));
        FDRE #(.INIT(1'b0) ) t11(.C(clk), .R(reset), .CE(enable), .D(led[10]), .Q(led[11]));
        FDRE #(.INIT(1'b0) ) t12(.C(clk), .R(reset), .CE(enable), .D(led[11]), .Q(led[12]));
        FDRE #(.INIT(1'b0) ) t13(.C(clk), .R(reset), .CE(enable), .D(led[12]), .Q(led[13]));
        FDRE #(.INIT(1'b0) ) t14(.C(clk), .R(reset), .CE(enable), .D(led[13]), .Q(led[14]));
        FDRE #(.INIT(1'b0) ) t15(.C(clk), .R(reset), .CE(enable), .D(led[14]), .Q(led[15]));
    
endmodule
