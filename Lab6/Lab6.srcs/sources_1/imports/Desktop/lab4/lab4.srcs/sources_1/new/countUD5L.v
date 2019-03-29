`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2018 12:43:05 PM
// Design Name: 
// Module Name: countUD5L
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


module countUD5L(
    input clk,
    input Up,
    input Dw,
    input LD,
    input [4:0] D,
    output [4:0] Q,
    output UTC,
    output DTC
    );
                                                                                                                                                       
    wire enable = LD | (Up ^ Dw);
    //assign LD = 1'b0;
    wire [4:0] Din, ffup,ffdw, outC;
    wire [3:0] tempC2,tempC1,tempC0,tempC3,tempC4;
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
    
    assign ffup[3] = (Q[3] ^ (Q[0]&Q[1]&Q[2]));
    assign ffdw[3] = ~(Q[3] ^ (Q[0]|Q[1]|Q[2]));
    assign tempC3 = {Q[3],ffdw[3], ffup[3], Q[3]};
    m4_1e b3(.in(tempC3),.sel(selC), .o(outC[3]));// mux for choose
    mux2_1 a3(.a(outC[3]), .b(D[3]), .sel(LD), .out(Din[3]));// mux for load
    FDRE #(.INIT(1'b0) ) d3(.C(clk), .R(reset), .CE(1'b1), .D(Din[3]), .Q(Q[3]));
    
    assign ffup[4] = (Q[4] ^ (Q[0]&Q[1]&Q[2]&Q[3]));
    assign ffdw[4] = ~(Q[4] ^ (Q[0]|Q[1]|Q[2]|Q[3]));
    assign tempC4 = {Q[4],ffdw[4], ffup[4], Q[4]};
    m4_1e b4(.in(tempC4),.sel(selC), .o(outC[4]));// mux for choose
    mux2_1 a4(.a(outC[4]), .b(D[4]), .sel(LD), .out(Din[4]));// mux for load
    FDRE #(.INIT(1'b0) ) d4(.C(clk), .R(reset), .CE(1'b1), .D(Din[4]), .Q(Q[4]));

   
   /*
    assign ffup[1] = (Q[1] ^ (Q[3]&Q[4]&Q[2]));
    assign ffdw[1] = ~(Q[1] ^ (Q[3]|Q[4]|Q[2]));
    assign tempC1 = {Q[1],ffdw[1], ffup[1], Q[1]};
    m4_1e b4(.in(tempC1),.sel(selC), .o(outC[1]));// mux for choose
    mux2_1 a4(.a(outC[1]), .b(D[1]), .sel(LD), .out(Din[1]));// mux for load
    FDRE #(.INIT(1'b0) ) d4(.C(clk), .R(reset), .CE(1'b1), .D(Din[1]), .Q(Q[1]));
    
    assign ffup[0] = (Q[0] ^ (Q[3]&Q[4]&Q[2]&Q[1]));
    assign ffdw[0] = ~(Q[0] ^ (Q[3]|Q[4]|Q[2]|Q[1]));
    assign tempC0 = {Q[0],ffdw[0], ffup[0], Q[0]};
    m4_1e b3(.in(tempC0),.sel(selC), .o(outC[0]));// mux for choose
    mux2_1 a3(.a(outC[0]), .b(D[0]), .sel(LD), .out(Din[0]));// mux for load
    FDRE #(.INIT(1'b0) ) d3(.C(clk), .R(reset), .CE(1'b1), .D(Din[0]), .Q(Q[0]));
    
    
    
    
    */
    
     assign UTC = (Q[4] & Q[3] & Q[2] & Q[1] & Q[0]);
     assign DTC = (~Q[4] & ~Q[3] &~Q[2] & ~Q[1] & ~Q[0]);
       
    //mux load
       
    //wire [2:0] temp2 = ~Q;
    
    //mux decrament
    /*
    mux2_1 g2(.a(temp3[2]), .b(D[2]), .sel(LD), .out(temp3[2]));
    mux2_1 g1(.a(temp3[2]), .b(D[2]), .sel(LD), .out(temp3[2]));
    mux2_1 g0(.a(temp3[2]), .b(D[2]), .sel(LD), .out(temp3[2]));  
   
    */
    
    
    
endmodule
