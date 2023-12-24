`timescale 1ns / 1ps

module ThreeRom(
    input wire [9:0] i_numberaddr, // (8:0) or 2^9 or 512, need 20 x 20 = 400
    input wire i_clk2,
    output reg [7:0] o_numberdata // (7:0) 8 bit pixel value from Alien1.mem
 );
 
 (*ROM_STYLE="block"*) reg [7:0] numbermemory_array [0:400]; 
 initial begin
 $readmemh("three.mem", numbermemory_array);
 end
 
 always @ (posedge i_clk2)
 o_numberdata <= numbermemory_array[i_numberaddr]; 

endmodule

