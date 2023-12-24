`timescale 1ns / 1ps

module top_mod(
    input clk,
    input rst,
    input button_1,
    input button_2,
    input button_3,
    input button_4,
    input start_button,
    output h_sync,
    output v_sync,
    output reg[3:0] red,
    output reg[3:0] green,
    output reg [3:0] blue,
    output [0:6] seg,
    output [3:0] an  
     
    );
    wire clk_d;
    wire [4:0] rand;
    wire [2:0] num;
    wire [3:0] state;
    wire [9:0] h_count;
    wire trig_v;
    wire [9:0] v_count; 
    wire video_on;
    wire [9:0] x_loc;
    wire [9:0] y_loc;
    wire state_change;
    wire active;
    wire BeeSpriteOn;
    wire [7:0] dout;
    wire GSpriteOn;
    wire [7:0] gout;

    
    wire S10SpriteOn;
    wire S11SpriteOn;
    wire S12SpriteOn;
    wire S13SpriteOn;
    wire S14SpriteOn;
    wire S15SpriteOn;
    wire S16SpriteOn;
    wire S17SpriteOn;
    wire S18SpriteOn;
    wire S19SpriteOn;
    
    wire [7:0] S10dataout;
    wire [7:0] S11dataout;
    wire [7:0] S12dataout;
    wire [7:0] S13dataout;
    wire [7:0] S14dataout;
    wire [7:0] S15dataout;
    wire [7:0] S16dataout;
    wire [7:0] S17dataout;
    wire [7:0] S18dataout;
    wire [7:0] S19dataout;
    
    wire [1:0] game_state;
    
    wire [9:0] score;
    wire [3:0] one;
    wire [3:0] ten;
    wire [3:0] hun;
    wire [3:0] thou;
    
    reg [3:0] scr;
    
    clock c(clk,clk_d);
    h_counter h1 (clk_d, h_count,trig_v); //horizontal timing generator
    count_v v1 (clk_d, trig_v, v_count); // vertical timing geenrator
    vga_sync s1 (h_count, v_count, h_sync, v_sync, active, x_loc, y_loc); // displaying the screen and refreshing h_count and v_count to sync the display
    random r1(clk_d,rst,rand);
    rand_div rd(rand,num);
    rand_to_state rts (clk_d,num,state,state_change);
    //    gameoverSprite GDisplay (.i_clk(clk_d),.i_rst(rst),.xx(x_loc),.yy(y_loc),.aactive(active),.GSpriteOn(GSpriteOn),.dataout(gout));
    pix_gen p1(clk_d, x_loc, y_loc,state,active,BeeSpriteOn,dout,GspriteOn,gout,S10SpriteOn,S11SpriteOn,S12SpriteOn,S13SpriteOn,S14SpriteOn,S15SpriteOn,S16SpriteOn,S17SpriteOn,S18SpriteOn,S19SpriteOn,S10dataout,S11dataout,S12dataout,S13dataout,S14dataout,S15dataout,S16dataout,S17dataout,S18dataout,S19dataout,button_1,button_2,button_3,button_4,start_button,state_change, red, green, blue,score);
    ScreenSprite BeeDisplay (clk_d,rst,x_loc,y_loc,active,BeeSpriteOn,GSpriteOn,dout,gout,S10SpriteOn,S11SpriteOn,S12SpriteOn,S13SpriteOn,S14SpriteOn,S15SpriteOn,S16SpriteOn,S17SpriteOn,S18SpriteOn,S19SpriteOn,S10dataout,S11dataout,S12dataout,S13dataout,S14dataout,S15dataout,S16dataout,S17dataout,S18dataout,S19dataout); 
    digits dig(score,one,ten,hun,thou);
    seg7_control seg7(clk_d,rst,one,ten,hun,thou,seg,an);
    
    
    reg [7:0] palette [0:191];
reg [7:0] gpalette [0:191];
reg [7:0] palette0 [0:191];
reg [7:0] palette1 [0:191];
reg [7:0] palette2 [0:191];
reg [7:0] palette3 [0:191];
reg [7:0] palette4 [0:191];
reg [7:0] palette5 [0:191];
reg [7:0] palette6 [0:191];
reg [7:0] palette7 [0:191];
reg [7:0] palette8 [0:191];
reg [7:0] palette9 [0:191];
reg [7:0] COL = 0;  

initial begin
$readmemh("screen24bit.mem", palette); // load 192 hex values into "palette"
$readmemh("finalgameover24bit.mem", gpalette); // load 192 hex values into "palette"
$readmemh("zero_pal.mem", palette0);
$readmemh("one_pal.mem", palette1);
$readmemh("two_pal.mem", palette2);
$readmemh("three_pal.mem", palette3);
$readmemh("four_pal.mem", palette4);
$readmemh("five_pal.mem", palette5);
$readmemh("six_pal.mem", palette6);
$readmemh("seven_pal.mem", palette7);
$readmemh("eight_pal.mem", palette8);
$readmemh("nine_pal.mem", palette9);
end

always @(posedge clk_d)
    begin
        assign scr = score;
        if (game_state == 0) begin
            if (start_button) begin
                scr = 0;
                assign game_state = 1;
                end
                
            
            if (active)
            begin
                
                
                if (S10SpriteOn==1)
                    begin
                    red <= (palette0[(S10dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette0[(S10dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette0[(S10dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
//                else
//                    begin
//                    red <= (palette0[(COL*3)])>>4; // RED bits(7:4) from colour palette
//                    green <=(palette0[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
//                    blue <= (palette0[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
//                    end
//                end
                end
            if (active)
                begin
                if (BeeSpriteOn==1)
                    begin
                    red <= (palette[(dout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette[(dout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette[(dout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
            else
                begin
                red <= 0; // set RED, GREEN & BLUE
                green <= 0; // to "0" when x,y outside of
                blue <= 0; // the active display area
                end
            end
            end
endmodule
