`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 12:57:40 PM
// Design Name: 
// Module Name: VGAcontr
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


module VGAcontr(
    output Hsync,
    output Vsync,
    output [3:0] vgaGreen,
    output [3:0] vgaRed,
    output [3:0] vgaBlue,
    output [15:0]led,
    input [15:0]sw,
    input btnC,
    input btnD,
    input btnU,
    input btnL,
    input btnR,
    input clk,
    output winflash,
    output RunTime, 
    output ShowTime,
    output ShowScore,
    output IncL,
    output IncW,
    output tsec,
    output hsec
    );
    wire [9:0]QH, QV, SHB, SVB, SHA, SVA, gaplength, start;
    wire resetV, resetH, t1,t2,t3,t4, active, activeRed, frame;
    wire vert1Col,vert2Col,vert3Col,vert4Col,vert5Col,vert6Col,vert7Col,hor1Col,hor2Col,hor3Col,hor4Col,hor5Col,hor6Col,hor7Col, move, hit, win;
    wire hitv1,hitv2,hitv3,hitv4,hitv5,hitv6,hitv7,hith1,hith2,hith3,hith4,hith5,hith6,hith7;
    wire fslug, fv1, fv2,fv3,fv4,fv5,fv6,fv7, fh1,fh2,fh3,fh4,fh5,fh6,fh7, winflash;
    wire[7:0] rnd;
    rndNum w(.clk(clk),.reset(sw[0]),.rnd(rnd));
    assign start = ({4'd0,rnd[5:0]} * 10'd5);
    assign gaplength = ({7'd0,sw[6:4]} * 10'd32)+ 10'd16;
    countUD10L H(.clk(clk), .Up(1'b1), .Dw(1'b0), .LD(resetH), .D(10'b0000000000), .Q(QH[9:0]), .UTC(t1) , .DTC(t2));
    assign resetH = QH[9]&QH[8]&~QH[7]&~QH[6]&~QH[5]&QH[4]&QH[3]&QH[2]&QH[1]&QH[0];
    
    countUD10L V(.clk(clk), .Up(resetH), .Dw(1'b0), .LD(resetV), .D(10'b0000000000), .Q(QV[9:0]), .UTC(t3) , .DTC(t4));
    assign resetV = QV[9]&~QV[8]&~QV[7]&~QV[6]&~QV[5]&~QV[4]&QV[3]&QV[2]&~QV[1]&~QV[0];
    
    //101 0001111 655 , 
    //101 1101110 750
    assign Hsync = ( (QH >= 10'd655) & (QH <= 10'd750)) ? 1'b0 : 1'b1;
    assign Vsync = ( (QV >= 10'd489) & (QV <= 10'd490)) ? 1'b0 : 1'b1;
    assign active = (QH>= 10'd0 & QH<= 10'd639) & (QV>=10'd0 & QV<= 10'd479);
    assign activeRed = (QH>= 10'd8 & QH<= 10'd630) & (QV>=10'd8 & QV<= 10'd470);
    
    // assign vgaBlue[3] = ((QH >= 10'd0 & QH<=10'd6) | (QH >= 10'd633 & QH <= 10'd639)) & ((QV >= 10'd0 & QV <= 10'd6) | (QV >= 10'd518 & QV <= 10'd524)); 
    //assign vgaBlue[3] = ((QH >= 10'd0 & QH<=10'd6) | (QH >= 10'd633 & QH <= 10'd639)) | ((QV >= 10'd0 & QV <= 10'd6) | (QV >= 10'd518 & QV <= 10'd524)); 
    wire border = (QH<=10'd7 & QV <= 10'd479)  | (QH >= 10'd631 & QH <= 10'd639 & QV <= 10'd479) 
                           | (QV <= 10'd7 & QH <= 10'd639 ) |  (QV >= 10'd471 & QV <= 10'd479 & QH <= 10'd639); 
     assign vgaBlue[3] = (border & hsec & winflash) | (border & ~winflash) ; //| ;
   //(QH<=10'd6)  | (QH >= 10'd633 & QH <= 10'd639) | 
    
    slug sl(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.Hout(SHA),.Vout(SVA),.led(led),.sw(sw),.hit(hit),.move(move),
    .win(win),.flash(fslug),.winflash(winflash),.RunTime(RunTime),.ShowTime(ShowTime),.ShowScore(ShowScore),.IncL(IncL),.IncW(IncW));
    
    edgeDect fa(.btnC(resetV),.clk(clk),.reset(1'b0),.out(frame));
     wire gborder = (QH >= SHA & QH <=  (SHA + 10'd16)) & (QV >= SVA & QV <=  (SVA + 10'd16));
    assign vgaGreen[3] = (gborder & hsec & fslug) | (gborder & ~fslug);
    
   // assign SHB = SHA;
   // assign SVB = SVA;
   // assign vgaRed = {4'b1101};
   // assign vgaGreen = {4'b0111};
   
    wire [9:0] vert1H, vert1V;
      assign vert1H = 10'd108;
   //assign vert1V = 10'd0;
         // assign start = ({4'd0,rnd[5:0]} * 10'd5); 
     // ({4'd0,rnd[7:2]} * 10'd5); 
      //({4'd0,rnd[6:1]} * 10'd5)
      //({4'd0,rnd[3:1],rnd[5:3]} * 10'd5)
      //({4'd0,rnd[7:4],rnd[1:0]} * 10'd5)
      
         //   ({4'd0,rnd[7:4],rnd[1:0]} * 10'd5)
         
             //  ({4'd0,rnd[7:6],rnd[7:4]} * 10'd5)
    vertBar v1(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hitv1),.QH(QH),.QV(QV),.SH(10'd158),
        .SV(vert1V),.colorOut(vert1Col),.gaplength(gaplength),.rnd(start),.dir(1'b0),.flash(fv1)); 
    vertBar v2(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hitv2),.QH(QH),.QV(QV),.SH(10'd208),
        .SV(vert1V),.colorOut(vert2Col),.gaplength(gaplength),.rnd(({4'd0,rnd[7:2]} * 10'd5)),.dir(1'b1),.flash(fv2)); 
    vertBar v3(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hitv3),.QH(QH),.QV(QV),.SH(10'd258),
        .SV(vert1V),.colorOut(vert3Col),.gaplength(gaplength),.rnd(({4'd0,rnd[6:1]} * 10'd5)),.dir(1'b0),.flash(fv3)); 
    vertBar v4(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hitv4),.QH(QH),.QV(QV),.SH(10'd308),
        .SV(vert1V),.colorOut(vert4Col),.gaplength(gaplength),.rnd(({4'd0,rnd[3:1],rnd[3:1]} * 10'd5)),.dir(1'b1),.flash(fv4)); 
    vertBar v5(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hitv5),.QH(QH),.QV(QV),.SH(10'd358),
        .SV(vert1V),.colorOut(vert5Col),.gaplength(gaplength),.rnd(({4'd0,rnd[7:4],rnd[1:0]} * 10'd5)),.dir(1'b0),.flash(fv5)); 
    vertBar v6(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hitv6),.QH(QH),.QV(QV),.SH(10'd408),
        .SV(vert1V),.colorOut(vert6Col),.gaplength(gaplength),.rnd(({4'd0,rnd[3:1],rnd[5:3]} * 10'd5)),.dir(1'b1),.flash(fv6)); 
    vertBar v7(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hitv7),.QH(QH),.QV(QV),.SH(10'd458),
        .SV(vert1V),.colorOut(vert7Col),.gaplength(gaplength),.rnd(({4'd0,rnd[7:6],rnd[7:4]} * 10'd5)),.dir(1'b0),.flash(fv7)); 
    
    
    horBar h1(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hith1),.QH(QH),.QV(QV),
        .SH(vert1V),.SV(10'd78),.colorOut(hor1Col),.gaplength(gaplength),.rnd(start),.led(led),.dir(1'b1),.flash(fh1)); 
    horBar h2(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hith2),.QH(QH),.QV(QV),
        .SH(vert1V),.SV(10'd128),.colorOut(hor2Col),.gaplength(gaplength),.rnd(({4'd0,rnd[7:2]} * 10'd5)),.dir(1'b0),.flash(fh2));
    horBar h3(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hith3),.QH(QH),.QV(QV),
        .SH(vert1V),.SV(10'd178),.colorOut(hor3Col),.gaplength(gaplength),.rnd(({4'd0,rnd[6:1]} * 10'd5)),.dir(1'b1),.flash(fh3));
    horBar h4(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hith4),.QH(QH),.QV(QV),
        .SH(vert1V),.SV(10'd228),.colorOut(hor4Col),.gaplength(gaplength),.rnd(({4'd0,rnd[3:1],rnd[3:1]} * 10'd5)),.dir(1'b0),.flash(fh4));
    horBar h5(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hith5),.QH(QH),.QV(QV),
        .SH(vert1V),.SV(10'd278),.colorOut(hor5Col),.gaplength(gaplength),.rnd(({4'd0,rnd[3:1],rnd[5:3]} * 10'd5)),.dir(1'b1),.flash(fh5));
    horBar h6(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hith6),.QH(QH),.QV(QV),
        .SH(vert1V),.SV(10'd328),.colorOut(hor6Col),.gaplength(gaplength),.rnd(({4'd0,rnd[7:4],rnd[1:0]} * 10'd5)),.dir(1'b0),.flash(fh6));
    horBar h7(.clk(clk),.btnU(btnU),.btnC(btnC),.btnD(btnD),.btnL(btnL),.btnR(btnR),.frame(frame),.move(move),.hit(hith7),.QH(QH),.QV(QV),
        .SH(vert1V),.SV(10'd378),.colorOut(hor7Col),.gaplength(gaplength),.rnd(({4'd0,rnd[7:6],rnd[7:4]} * 10'd5)),.dir(1'b1),.flash(fh7));
  
    assign vgaRed[2] = (vert1 |vert2 |vert3 |vert4 |vert5 |vert6 |vert7 |hor1|hor2|hor3|hor4|hor5|hor6|hor7) & activeRed;
    
    wire vert1 = ((vert1Col& hsec & fv1) | (vert1Col & ~fv1));
    wire vert2 = ((vert2Col& hsec & fv2) | (vert2Col & ~fv2));
    wire vert3 = ((vert3Col& hsec & fv3) | (vert3Col & ~fv3));
    wire vert4 = ((vert4Col& hsec & fv4) | (vert4Col & ~fv4));
    wire vert5 = ((vert5Col& hsec & fv5) | (vert5Col & ~fv5));
    wire vert6 = ((vert6Col& hsec & fv6) | (vert6Col & ~fv6));
    wire vert7 = ((vert7Col& hsec & fv7) | (vert7Col & ~fv7));
    
      wire hor1 = ((hor1Col& hsec & fh1) | (hor1Col & ~fh1));
      wire hor2 = ((hor2Col& hsec & fh2) | (hor2Col & ~fh2));
      wire hor3 = ((hor3Col& hsec & fh3) | (hor3Col & ~fh3));
      wire hor4 = ((hor4Col& hsec & fh4) | (hor4Col & ~fh4));
      wire hor5 = ((hor5Col& hsec & fh5) | (hor5Col & ~fh5));
      wire hor6 = ((hor6Col& hsec & fh6) | (hor6Col & ~fh6));
      wire hor7 = ((hor7Col& hsec & fh7) | (hor7Col & ~fh7));

    assign vgaRed[3] = (hor1Col |hor2Col |hor3Col |hor4Col |hor5Col |hor6Col |hor7Col)  & (vert1Col | vert2Col | vert3Col |vert4Col |vert5Col |vert6Col |vert7Col );
    //
    assign hitv1 = vgaGreen[3] & vert1Col;
    assign hitv2 = vgaGreen[3] & vert2Col;
    assign hitv3 = vgaGreen[3] & vert3Col;
    assign hitv4 = vgaGreen[3] & vert4Col;
    assign hitv5 = vgaGreen[3] & vert5Col;
    assign hitv6 = vgaGreen[3] & vert6Col;
    assign hitv7 = vgaGreen[3] & vert7Col;
    assign hith1 = vgaGreen[3] & hor1Col;
    assign hith2 = vgaGreen[3] & hor2Col;
    assign hith3 = vgaGreen[3] & hor3Col;
    assign hith4 = vgaGreen[3] & hor4Col;
    assign hith5 = vgaGreen[3] & hor5Col;
    assign hith6 = vgaGreen[3] & hor6Col;
    assign hith7 = vgaGreen[3] & hor7Col;
    
    assign hit = hitv1|hitv2|hitv3|hitv4|hitv5|hitv6|hitv7|hith1|hith2|hith3|hith4|hith5|hith6|hith7;
    
     wire [9:0] secArr;
     wire hsec;
     countUD10L tt(.clk(clk), .Up(frame), .Dw(1'b0), .LD(1'b0), .D(10'd0), .Q(secArr));
     assign sec = secArr[6];
     assign hsec = secArr[5];
    assign tsec = frame & ~secArr[5] & ~secArr[4] & ~secArr[3] & ~secArr[2] & ~secArr[1] & ~secArr[0]; 
     //assign tsec = frame  & ~secArr[2] & ~secArr[1] & ~secArr[0]; 
endmodule
