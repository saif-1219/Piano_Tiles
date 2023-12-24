`timescale 1ns / 1ps


module top_rand_tst(
input clk,
input rst,
output [3:0] state
    );
wire [4:0] rand;
wire [2:0] num;
wire clk_d;
    clock c(clk,clk_d);
    random r1(clk_d,rst,rand);
    rand_div rd(rand,num);
    rand_to_state rts (clk_d,num,state);
//    rand_to_state rts(clk_d,rand,num);
endmodule
