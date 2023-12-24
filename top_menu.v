`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 02:02:36 PM
// Design Name: 
// Module Name: top_menu
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


module pix_gen_menu(
input wire CLK, // Onboard clock 100MHz : INPUT Pin W5
input x,
input y,
input start_button,
input video_on,
output reg [3:0] RED, // 4-bit VGA Red : OUTPUT Pin G19, Pin H19, Pin J19, Pin N19
output reg [3:0] GREEN, // 4-bit VGA Green : OUTPUT Pin J17, Pin H17, Pin G17, Pin D17
output reg [3:0] BLUE // 4-bit VGA Blue : OUTPUT Pin N18, Pin L18, Pin K18, Pin J18/ 4-bit VGA Blue : OUTPUT Pin N18, Pin L18, Pin K18, Pin J18


    );

wire [1:0] BeeSpriteOn; // 1=on, 0=off
wire [7:0] dout; // pixel value from Bee.mem
ScreenSprite ScreenDisplay (.i_clk(clk_d),.xx(x),.yy(y),.aactive(video_on),
.BSpriteOn(BeeSpriteOn),.dataout(dout));
// load colour palette
reg [7:0] palette [0:191]; // 8 bit values from the 192 hex entries in the colour palette
reg [7:0] COL = 0; // background colour palette value
initial begin
$readmemh("screen24bit.mem", palette); // load 192 hex values into "palette"
end
// draw on the active area of the screen
always @ (posedge clk_d)
begin
if (video_on)
begin
if (BeeSpriteOn==1)
begin
RED <= (palette[(dout*3)])>>4; // RED bits(7:4) from colour palette
GREEN <= (palette[(dout*3)+1])>>4; // GREEN bits(7:4) from colour palette
BLUE <= (palette[(dout*3)+2])>>4; // BLUE bits(7:4) from colour palette
end
else
begin
RED <= (palette[(COL*3)])>>4; // RED bits(7:4) from colour palette
GREEN <=(palette[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
BLUE <= (palette[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
end
end
else
begin
RED <= 0; // set RED, GREEN & BLUE
GREEN <= 0; // to "0" when x,y outside of
BLUE <= 0; // the active display area
end
end

endmodule
