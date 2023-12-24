`timescale 1ns / 1ps


module gameoverSprite(
input wire i_clk,
input wire i_rst,
input wire [9:0] xx,
input wire [9:0] yy,
input wire aactive,
output reg GSpriteOn, // 1=on, 0=off

output wire [7:0] dataout
    );
reg [17:0] address; // (17:0) or 2^18 or , need 480 x 360 = 172800
gameoverRom BeeVRom (.i_addr(address),.i_clk2(i_clk),.o_data(dataout));
// setup character positions and sizes
reg [17:0] BeeX = 80; // Bee X start position
reg [17:0] BeeY = 60; // Bee Y start position
localparam BeeWidth = 480; // Bee width in pixels
localparam BeeHeight = 360; // Bee height in pixels
always @ (posedge i_clk)
begin
if (aactive)
    begin
    if (xx==BeeX-1 && yy==BeeY)
        begin
        address <= 0;
        GSpriteOn <=1;
        end
    if ((xx>BeeX-1) && (xx<BeeX+BeeWidth) && (yy>BeeY-1) && (yy<BeeY+BeeHeight))
        begin
        address <= (xx-BeeX) + ((yy-BeeY)*BeeWidth);
        GSpriteOn <=1;
        end
    else GSpriteOn <=0;
    end
end

endmodule
