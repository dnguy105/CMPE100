`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2018 03:52:05 PM
// Design Name: 
// Module Name: StateMachine
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


module StateMachine(
    input clk,
    input left,
    input right,
    output ShowTime,
    output countReset,
    output IncU,
    output IncD
    );
    wire[8:0] D, Q;
    wire enable = 1'b1;
    
    

    //Idle 
    assign D[0] = (Q[0]|Q[1]|Q[5])&(left&right)  |  Q[4] | Q[8] | (Q[0]&(~left&~right));
    FDRE #(.INIT(1'b1)) t0 (.C(clk), .CE(enable), .D(D[0]), .Q(Q[0]));
    
    //Right First
    assign D[1] = (Q[0]| Q[1]| Q[5])&(left&~right);
    FDRE #(.INIT(1'b0)) t1 (.C(clk), .CE(enable), .D(D[1]), .Q(Q[1]));
    
    // right to left 
    assign D[2] = (Q[2]| Q[1]| Q[3])&(~left&~right);
    FDRE #(.INIT(1'b0)) t2 (.C(clk), .CE(enable), .D(D[2]), .Q(Q[2]));
    
    //left after right
    assign D[3] =(Q[2]| Q[3])&(~left&right);
    FDRE #(.INIT(1'b0)) t3 (.C(clk), .CE(enable), .D(D[3]), .Q(Q[3]));
    
    //Right to left done
    assign D[4] =  (Q[3])&(left&right);
    FDRE #(.INIT(1'b0)) t4 (.C(clk), .CE(enable), .D(D[4]), .Q(Q[4]));
    
    //left first
    assign D[5] =  (Q[0]| Q[6]| Q[5])&(~left&right);
    FDRE #(.INIT(1'b0)) t5 (.C(clk), .CE(enable), .D(D[5]), .Q(Q[5]));
    
    //left to right
    assign D[6] =  (Q[6]| Q[7]| Q[5])&(~left&~right);
    FDRE #(.INIT(1'b0)) t6 (.C(clk), .CE(enable), .D(D[6]), .Q(Q[6]));
    
    //right after left
    assign D[7] =  (Q[6]| Q[7])&(left&~right);
    FDRE #(.INIT(1'b0)) t7 (.C(clk), .CE(enable), .D(D[7]), .Q(Q[7]));
    
    //left to right done
    assign D[8] =  Q[7]&(left&right);
    FDRE #(.INIT(1'b0)) t8 (.C(clk), .CE(enable), .D(D[8]), .Q(Q[8]));
    
    assign ShowTime = Q[1]|Q[2]|Q[3]|Q[5]|Q[6]|Q[7];
    assign IncU = Q[4];
    assign IncD = Q[8];
    assign countReset = (Q[0]&((right&~left)|(~right&left)))|
    (Q[1]&((right&left)|(~right&~left)))|
    (Q[2]&((right&~left)|(~right&left)))|
    (Q[3]&((right&left)|(~right&~left)))|
    (Q[5]&((right&left)|(~right&left )))|
    (Q[6]&((right&~left)|(~right&left)))|
    (Q[7]&((~right&~left)|(right&left)));
  
    
endmodule
