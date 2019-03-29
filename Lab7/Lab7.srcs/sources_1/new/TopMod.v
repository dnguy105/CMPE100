`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 01:58:26 PM
// Design Name: 
// Module Name: TopMod
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


module TopMod(
    input clkin,
    input btnD,
    input btnC,
    input btnR,
    input btnU,
    input btnL,
    input [15:0]sw,
    output [3:0] vgaBlue,
    output [3:0] vgaGreen,
    output [3:0] vgaRed,
    output Vsync,
    output Hsync,
    output [6:0] seg,
    output dp,
    output [3:0]an,
    output [15:0]led
    );
    //Flipflops through button inputs and H and V sync output
    wire [15:0] pick, pickTime,finalPick;
    
    wire btnLsyn,btnDsyn,btnRsyn, btnCsyn, btnUsyn, Hsyncsync, Vsyncsync;
    FDRE #(.INIT(1'b0)) syc0 (.C(clk), .CE(1'b1), .D(btnL), .Q(btnLsyn));
    FDRE #(.INIT(1'b0)) syc1 (.C(clk), .CE(1'b1), .D(btnD), .Q(btnDsyn));
    FDRE #(.INIT(1'b0)) syc2 (.C(clk), .CE(1'b1), .D(btnR), .Q(btnRsyn));
    FDRE #(.INIT(1'b0)) syc3 (.C(clk), .CE(1'b1), .D(btnC), .Q(btnCsyn));
    FDRE #(.INIT(1'b0)) syc4 (.C(clk), .CE(1'b1), .D(btnU), .Q(btnUsyn));
    FDRE #(.INIT(1'b0)) syc5 (.C(clk), .CE(1'b1), .D(Hsyncsync), .Q( Hsync));
    FDRE #(.INIT(1'b0)) syc6 (.C(clk), .CE(1'b1), .D(Vsyncsync), .Q( Vsync));
    
     wire winflash,RunTime,ShowTime,ShowScore,IncL,IncW, tsec,sec;
    lab7_clks not_so_slow (.clkin(clkin), .greset(sw[0]), .clk(clk), .digsel(digsel));
    VGAcontr a(.clk(clk),.btnU(btnUsyn),.btnC(btnCsyn),.btnD(btnDsyn),.btnL(btnLsyn),.btnR(btnRsyn),.Hsync(Hsyncsync),.Vsync(Vsyncsync)
        ,.vgaGreen(vgaGreen),.vgaRed(vgaRed),.vgaBlue(vgaBlue),.led(led),.sw(sw),.winflash(winflash),.RunTime(RunTime),.ShowTime(ShowTime)
        ,.ShowScore(ShowScore),.IncL(IncL),.IncW(IncW),.tsec(tsec),.hsec(sec));
    wire [4:0] wins, losses;
    countUD5L wi(.clk(clk), .Up(IncW), .Dw(1'b0), .LD(1'b0), .D(4'd0), .Q(wins), .UTC() , .DTC());
    countUD5L ls(.clk(clk), .Up(IncL), .Dw(1'b0), .LD(1'b0), .D(4'd0), .Q(losses), .UTC() , .DTC());
    
    wire [3:0] select, dam;
    assign pick [15:12] = wins[3:0];
    assign pick [ 11:4] = 8'd0;
    assign pick [3:0] = losses[3:0];
    
    RingCNT sn(.clk(clk),.Advance(digsel),.reset(sw[0]),.t(select));
 
    Selector sel(.sel(select),.N(finalPick),.H(dam));
    hex7seg hex(.n(dam),.e(1'b1),.seg(seg));
    assign an[0] = ~ ((select[0]&sec&winflash)|(select[0]&~winflash)) ;
    assign an[1] = ~ ((select[1]&sec&winflash&~ShowScore)|(select[1]&~winflash&~ShowScore))  ;
    assign an[2] = ~ ((select[2]&sec&winflash&~ShowScore)|(select[2]&~winflash&~ShowScore))  ; 
    assign an[3] = ~ ((select[3]&sec&winflash)|(select[3]&~winflash))  ;
    wire [3:0] tempUTC;
    
   countUD4ut10 a11( .Up(RunTime&tsec),.Dw(1'b0),.clk(clk),.LD(tempUTC[0] | btnC),.D(4'd0),.Q(pickTime[3:0]),.UTC(tempUTC[0]),.DTC());
   countUD4ut6 b( .Up(tempUTC[0]),.Dw(1'b0),.clk(clk),.LD(tempUTC[1]&tempUTC[0]| btnC),.D(4'd0),.Q(pickTime[7:4]),.UTC(tempUTC[1]),.DTC());
   countUD4ut10 c11( .Up(tempUTC[0]&tempUTC[1]),.Dw(1'b0),.clk(clk),.LD(tempUTC[2]&tempUTC[1]&tempUTC[0]| btnC),.D(4'd0),.Q(pickTime[11:8]),.UTC(tempUTC[2]),.DTC());
   countUD4ut6 b1( .Up(tempUTC[0]&tempUTC[1]&tempUTC[2]),.Dw(1'b0),.clk(clk),
        .LD(tempUTC[3]&tempUTC[2]&tempUTC[1]&tempUTC[0]| btnC),.D(4'd0),.Q(pickTime[15:12]),.UTC(tempUTC[3]),.DTC());
    
       m2_1x16 df( .in0(pickTime),.in1(pick),.sel(ShowScore),.o(finalPick));
    
    
endmodule
