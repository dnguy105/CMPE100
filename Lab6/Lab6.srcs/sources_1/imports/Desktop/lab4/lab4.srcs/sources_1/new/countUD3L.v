`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2018 01:07:38 PM
// Design Name: 
// Module Name: countUD3L
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


module countUD3L(
    input clk,
    input Up,
    input Dw,
    input LD,
    input [2:0] D,
    output [2:0] Q,
    output UTC,
    output DTC,
    output four
    );
                                                                                                                                                       
    wire enable = LD | (Up ^ Dw);
    //assign LD = 1'b0;
    wire [2:0] Din, ffup,ffdw, outC;
    wire [3:0] tempC2,tempC1,tempC0;
    wire [1:0] selC = {Dw, Up};
    
    assign ffup[0] = ~(Q[0]);
    assign ffdw[0] = ~(Q[0]);
    assign tempC0 = {Q[0],ffdw[0], ffup[0], Q[0]};
    m4_1e b2(.in(tempC0),.sel(selC), .o(outC[0]));// mux for choose
    
    mux2_1 a2(.a(outC[0]), .b(D[0]), .sel(LD), .out(Din[0]));// mux for load
    FDRE #(.INIT(1'b0) ) d2(.C(clk), .R(reset), .CE(1'b1), .D(Din[0]), .Q(Q[0]));
    
    assign ffup[1] = (Q[1] ^ Q[0]);
    assign ffdw[1] = ~(Q[1] ^  Q[0]);
    assign tempC1 = {Q[1],ffdw[1], ffup[1], Q[1]};
    m4_1e b1(.in(tempC1),.sel(selC),  .o(outC[1]));// mux for choose
    
    mux2_1 a1(.a(outC[1]), .b(D[1]), .sel(LD), .out(Din[1]));// mux for load
    FDRE #(.INIT(1'b0) ) d1(.C(clk), .R(reset), .CE(1'b1), .D(Din[1]), .Q(Q[1]));
    
    assign ffup[2] = (Q[2] ^ (Q[0]&Q[1]));
    assign ffdw[2] = ~(Q[2] ^ (Q[0]|Q[1]));
    assign tempC2 = {Q[2],ffdw[2], ffup[2], Q[2]};
    m4_1e b0(.in(tempC2),.sel(selC), .o(outC[2]));// mux for choose
    mux2_1 a0(.a(outC[2]), .b(D[2]), .sel(LD), .out(Din[2]));// mux for load
    FDRE #(.INIT(1'b0) ) d0(.C(clk), .R(reset), .CE(1'b1), .D(Din[2]), .Q(Q[2]));
    
    //mux load
       
    //wire [2:0] temp2 = ~Q;
     assign four = Q[2]&~Q[1]&~Q[0];
     assign UTC = (Q[2] & Q[1] & Q[0]);
     assign DTC = (~Q[2] & ~Q[1] & ~Q[0]);
       
    //mux decrament
    /*
    mux2_1 g2(.a(temp3[2]), .b(D[2]), .sel(LD), .out(temp3[2]));
    mux2_1 g1(.a(temp3[2]), .b(D[2]), .sel(LD), .out(temp3[2]));
    mux2_1 g0(.a(temp3[2]), .b(D[2]), .sel(LD), .out(temp3[2]));  
   
    */
    
    
    
endmodule
