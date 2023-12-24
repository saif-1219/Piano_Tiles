`timescale 1ns / 1ps

module ScreenSprite(
input wire i_clk,
input wire i_rst,
input wire [9:0] xx,
input wire [9:0] yy,
input wire aactive,


output reg BSpriteOn,
output reg GSpriteOn,


output wire [7:0] dout,
output wire [7:0] gout,


output reg S10SpriteOn,
 output reg S11SpriteOn,
 output reg S12SpriteOn,
 output reg S13SpriteOn,
 output reg S14SpriteOn,
 output reg S15SpriteOn,
 output reg S16SpriteOn,
 output reg S17SpriteOn,
 output reg S18SpriteOn,
 output reg S19SpriteOn,

output wire [7:0] S10dataout,
 output wire [7:0] S11dataout,
 output wire [7:0] S12dataout,
 output wire [7:0] S13dataout,
 output wire [7:0] S14dataout,
 output wire [7:0] S15dataout,
 output wire [7:0] S16dataout,
 output wire [7:0] S17dataout,
 output wire [7:0] S18dataout,
 output wire [7:0] S19dataout
    );
    
reg [16:0] baddress; // (16:0) or 2^17 or 131072, need 471 x 250 = 117750
reg [17:0] gaddress;
reg [8:0] s10address;
reg [8:0] s11address;
reg [8:0] s12address;
reg [8:0] s13address;
 reg [8:0] s14address;
 reg [8:0] s15address;
 reg [8:0] s16address;
 reg [8:0] s17address;
 reg [8:0] s18address;
 reg [8:0] s19address;



 ScreenRom BeeVRom (.i_addr(baddress),.i_clk2(i_clk),.o_data(dout));
 gameoverRom grom (gaddress,i_clk,gout);
 ZeroRom ZeroS1Rom (.i_numberaddr(s10address),.i_clk2(Pclk),.o_numberdata(S10dataout));
 OneRom OneS1Rom (.i_numberaddr(s11address),.i_clk2(Pclk),.o_numberdata(S11dataout));
 TwoRom TwoS1Rom (.i_numberaddr(s12address),.i_clk2(Pclk),.o_numberdata(S12dataout));
 ThreeRom ThreeS1Rom (.i_numberaddr(s13address),.i_clk2(Pclk),.o_numberdata(S13dataout));
 FourRom FourS1Rom (.i_numberaddr(s14address),.i_clk2(Pclk),.o_numberdata(S14dataout));
 FiveRom FiveS1Rom (.i_numberaddr(s15address),.i_clk2(Pclk),.o_numberdata(S15dataout));
 SixRom SixS1Rom (.i_numberaddr(s16address),.i_clk2(Pclk),.o_numberdata(S16dataout));
 SevenRom SevenS1Rom (.i_numberaddr(s17address),.i_clk2(Pclk),.o_numberdata(S17dataout));
 EightRom EightS1Rom (.i_numberaddr(s18address),.i_clk2(Pclk),.o_numberdata(S18dataout));
 NineRom NineS1Rom (.i_numberaddr(s19address),.i_clk2(Pclk),.o_numberdata(S19dataout));
// setup character positons and sizes



reg [16:0] BeeX = 80; // Bee X start position
reg [16:0] BeeY = 112; // Bee Y start position
reg [16:0] GX = 80; // Bee X start position
reg [16:0] GY = 60;

 reg [9:0] S1X = 5; // Rocket X start position
 reg [8:0] S1Y = 10; // Rocket Y start position
 reg [9:0] S2X = 30; // Rocket X start position
 reg [8:0] S2Y = 10;
 
 
localparam BeeWidth = 471; // Bee width in pixels
localparam BeeHeight = 250;
localparam GWidth = 480; // Bee width in pixels
localparam GHeight = 360; // Bee height in pixels
localparam ScoreWidth = 20; // Rocket width in pixels
 localparam ScoreHeight = 20;
// check if xx,yy are within the confines of the Bee character
always @ (posedge i_clk)
    begin
    if (aactive)
        begin
        if (xx==BeeX-1 && yy==BeeY)
            begin
            baddress <= 0;
            BSpriteOn <=1;
            end
        if ((xx>BeeX-1) && (xx<BeeX+BeeWidth) && (yy>BeeY-1) && (yy<BeeY+BeeHeight))
            begin
            baddress <= (xx-BeeX) + ((yy-BeeY)*BeeWidth);
            BSpriteOn <=1;
            end
        else BSpriteOn <=0;
        
        
        if (xx==GX-1 && yy==GY)
            begin
            gaddress <= 0;
            GSpriteOn <=1;
            end
        if ((xx>GX-1) && (xx<GX+GWidth) && (yy>GY-1) && (yy<GY+GHeight))
            begin
            gaddress <= (xx-GX) + ((yy-GY)*GWidth);
            GSpriteOn <=1;
            end
        else begin
            GSpriteOn <=0;
            end
        
        if (xx==S1X-1 && yy==S1Y)
            begin
            s10address <= 0;
            S10SpriteOn <=1;
            end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight))
            begin
            s10address <= s10address + 1;
            S10SpriteOn <=1;
            end
         else begin
            S10SpriteOn <=0;
         end
     
        if (xx==S1X-1 && yy==S1Y)
            begin
            s11address <= 0;
            S11SpriteOn <=1;
            end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight))
            begin
            s11address <= s10address + 1;
            S11SpriteOn <=1;
            end
        else 
            begin
            S11SpriteOn <=0;
            end
     
     
        if (xx==S1X-1 && yy==S1Y)
            begin
            s12address <= 0;
            S12SpriteOn <=1;
            end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight))
            begin
            s12address <= s10address + 1;
            S12SpriteOn <=1;
            end
        else S13SpriteOn <=0;
        
      if (xx==S1X-1 && yy==S1Y)
        begin
        s13address <= 0;
        S13SpriteOn <=1;
        end
     if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight))
        begin
        s13address <= s10address + 1;
        S13SpriteOn <=1;
        end
        
     else S13SpriteOn <=0;
        
     if (xx==S1X-1 && yy==S1Y)
        begin
        s14address <= 0;
        S14SpriteOn <=1;
        end
     if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight))
        begin
        s14address <= s10address + 1;
        S14SpriteOn <=1;
        end
     else S14SpriteOn <=0;
        
     if (xx==S1X-1 && yy==S1Y)
        begin
        s15address <= 0;
        S15SpriteOn <=1;
        end
     if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight))
        begin
        s15address <= s10address + 1;
        S15SpriteOn <=1;
        end
     
     else S15SpriteOn <=0;
     
     if (xx==S1X-1 && yy==S1Y)
        begin
        s16address <= 0;
        S16SpriteOn <=1;
        end
        
     if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight))
        begin
        s16address <= s10address + 1;
        S16SpriteOn <=1;
        end
        
     else S16SpriteOn <=0;
        
        
    if (xx==S1X-1 && yy==S1Y)
        begin
        s17address <= 0;
        S17SpriteOn <=1;
        end
        
     if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight))
        begin
        s17address <= s10address + 1;
        S17SpriteOn <=1;
        end
        
     else S17SpriteOn <=0;
        
        
    if (xx==S1X-1 && yy==S1Y)
        begin
        s18address <= 0;
        S18SpriteOn <=1;
        end
     if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight))
        begin
        s18address <= s10address + 1;
        S18SpriteOn <=1;
        end
     else S18SpriteOn <=0;
        
        
    if (xx==S1X-1 && yy==S1Y)
        begin
        s19address <= 0;
        S19SpriteOn <=1;
        end
     if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight))
        begin
        s19address <= s10address + 1;
        S19SpriteOn <=1;
        end
     else S19SpriteOn <=0;
     
        
    end
end
endmodule
