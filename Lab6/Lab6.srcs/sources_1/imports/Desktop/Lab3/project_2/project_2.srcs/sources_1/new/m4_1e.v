
module m4_1e(
    input [3:0] in,
    input [1:0] sel,
    output o
    );
   //assign o = e & ((in[0] & ~sel[1] & ~sel[0])|(in[1]&~sel[1]&sel[0])|(in[2]&sel[1]&~sel[0])|(in[3]&sel[1]&sel[0]));
    assign o =  in[sel];
endmodule
