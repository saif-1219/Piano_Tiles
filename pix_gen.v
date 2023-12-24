`timescale 1ns / 1ps

    module pix_gen(
    input clk_d,
    input [9:0] pixel_x,
    input [9:0] pixel_y,
    input [3:0] state,
    input active,
    input BeeSpriteOn,
    input [7:0] dout,
    input GSpriteOn,
    input [7:0] gout,
    
    input  S10SpriteOn,
    input  S11SpriteOn,
    input  S12SpriteOn,
    input  S13SpriteOn,
    input  S14SpriteOn,
    input  S15SpriteOn,
    input  S16SpriteOn,
    input  S17SpriteOn,
    input  S18SpriteOn,
    input  S19SpriteOn,
    
    input [7:0] S10dataout,
    input [7:0] S11dataout,
    input [7:0] S12dataout,
    input [7:0] S13dataout,
    input [7:0] S14dataout,
    input [7:0] S15dataout,
    input [7:0] S16dataout,
    input [7:0] S17dataout,
    input [7:0] S18dataout,
    input [7:0] S19dataout,
    
    
    input button_1,
    input button_2,
    input button_3,
    input button_4,
    input start_button,
    input st_chng,
    
    output reg [3:0] red = 0,
    output reg [3:0] green = 0,
    output reg [3:0] blue = 0,
    output reg [9:0] score = 0,
    output reg [1:0] game_state = 0
                    );

reg [9:0]BAYMin1 = 0;
reg [9:0]BAYMax1 = 100;
reg [9:0]BAYMin2 = 0;
reg [9:0]BAYMax2 = 100;
reg [9:0]BAYMin3 = 0;
reg [9:0]BAYMax3 = 100;
reg [9:0]BAYMin4 = 0;
reg [9:0]BAYMax4 = 100;
reg [3:0] scr = 0;
reg [30:0] test_counter = 0;
reg [12:0]counter1 = 2500;
reg [12:0]counter2 = 2500;
reg [12:0]counter3 = 2500;
reg [12:0]counter4 = 2500;
reg bool = 0;
reg [3:0] stat;

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
        if (game_state == 0) begin
            if (start_button) begin
                score = 0;
                game_state = 1;
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
    else if (game_state == 1) begin
        stat = state;
        if (BAYMax1 > 600)
            begin
            //reset the values so it starts from top
            BAYMin1 = 0;
            BAYMax1 = 100;
            counter1 = 0;
            
            end
        if (BAYMax2 > 600)
            begin
            //reset the values so it starts from top
            BAYMin2 = 0;
            BAYMax2 = 100;
            counter2 = 0;
            end
        if (BAYMax3 > 600)
            begin
            //reset the values so it starts from top
            BAYMin3 = 0;
            BAYMax3 = 100;
            counter3 = 0;
            end
        if (BAYMax4 > 600)
            begin
            //reset the values so it starts from top
            BAYMin4 = 0;
            BAYMax4 = 100;
            counter4 = 0;
            end
    
        if (st_chng) begin
            bool = 0;
            BAYMin1 = 0;
            BAYMax1 = 100;
            BAYMin2 = 0;
            BAYMax2 = 100;
            BAYMin3 = 0;
            BAYMax3 = 100;
            BAYMin4 = 0;
            BAYMax4 = 100;
            end
            
        if ((pixel_x > 0) && (pixel_x < 157) && (pixel_y > BAYMin1) && (pixel_y < BAYMax1) && (stat[0]==1))
            begin
            //1st tile
            if (bool == 0) begin
                red <= 4'hA;
                blue <= 4'h0;
                green <= 4'h0;
            end
            else begin
                red <= 4'h0;
                blue <= 4'h0;
                green <= 4'h0;
                end
            
            if (counter1 == 2500)
                begin
                BAYMin1 <= BAYMin1 + 1;
                BAYMax1 <= BAYMax1 + 1;
                counter1 = 0;
                end
                
            if ((button_1) && (bool==0))
                begin
                score = score + 1;
                bool = 1;
                end
            if (((button_2) || (button_3) || (button_4))&&(bool == 0)) 
                begin
                game_state = 2;
                end
            counter1=counter1+1;
            end
            
        else if ((pixel_x > 161) && (pixel_x < 318) && (pixel_y > BAYMin2) && (pixel_y < BAYMax2) && (stat[1]==1))
            begin
            //second tile
            if (bool==0) begin
                red <= 4'hF;
                blue <= 4'h0;
                green <= 4'hF;
                end
            else begin
                red <= 4'h0;
                blue <= 4'h0;
                green <= 4'h0;
                end
            
            if (counter2 == 2500)
                begin
                BAYMin2 <= BAYMin2 + 1;
                BAYMax2 <= BAYMax2 + 1;
                counter2 = 0;
                end
            if (button_2 && (bool==0))
                begin
                score = score + 1;
                bool = 1;
                end
            if (((button_1) || (button_3) || (button_4))&&(bool==0)) 
                begin
                game_state = 2;
                end
                
            counter2=counter2+1;
            end
        
        else if ((pixel_x > 322) && (pixel_x < 479) && (pixel_y > BAYMin3) && (pixel_y < BAYMax3) && (stat[2]==1))
            begin
            //3rd tile
            if (bool==0) begin
                red <= 4'h0;
                blue <= 4'hA;
                green <= 4'h0;
                end
            else begin
                red <= 4'h0;
                blue <= 4'h0;
                green <= 4'h0;
                end
            if (counter3 == 2500)
                begin
                BAYMin3 <= BAYMin3 + 1;
                BAYMax3 <= BAYMax3 + 1;
                counter3 = 0;
                end
            if ((button_3) && (bool==0))
                begin
                score = score + 1;
                bool = 1;
                
                end
            if (((button_2) || (button_1) || (button_4)) && (bool==0)) 
                begin
                game_state = 2;
                end
                
            counter3=counter3+1;
            end
        
        else if (pixel_x > 483 && pixel_x < 640 && pixel_y > BAYMin4 && pixel_y < BAYMax4 && stat[3]==1)
            begin
            ///4th tile
            if (bool==0) begin
                red <= 4'h0;
                blue <= 4'h0;
                green <= 4'hF;
                end
            else begin
                red <= 4'h0;
                blue <= 4'h0;
                green <= 4'h0;
                end
            if (counter4 == 2500)
                begin
                BAYMin4 <= BAYMin4 + 1;
                BAYMax4 <= BAYMax4 + 1;
                counter4 = 0;
                end
            if ((button_4) && (bool == 0))
                begin
                score = score + 1;
                bool = 1;
                end
            if (((button_2) || (button_3) || (button_1)) && (bool==0)) 
                begin
                game_state = 2;
                end
            
            counter4=counter4+1;
            end
        else if ((pixel_x > 157 && pixel_x < 161)||(pixel_x > 318 && pixel_x < 322)||(pixel_x > 479 && pixel_x < 483))
            begin
            red <= 4'h7;
            blue <= 4'h7;
            green <= 4'h7;
            end    
        else
            begin
            red <= 4'h0;
            blue <= 4'h0;
            green <= 4'h0;
            end
    end
     else if (game_state == 2) begin
            if ((button_1)&&(button_2)) begin
                game_state = 0;
                end
//            if (active)
//                begin
//                if (GSpriteOn==1)
//                    begin
//                    red <= (gpalette[(gout*3)])>>4; // RED bits(7:4) from colour palette
//                    green <= (gpalette[(gout*3)+1])>>4; // GREEN bits(7:4) from colour palette
//                    blue <= (gpalette[(gout*3)+2])>>4; // BLUE bits(7:4) from colour palette
//                    end
//                else
//                    begin
//                    red <= (gpalette[(COL*3)])>>4; // RED bits(7:4) from colour palette
//                    green <=(gpalette[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
//                    blue <= (gpalette[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
//                    end
//                end
//            else
//                    begin
//                    red <= 0; // set RED, GREEN & BLUE
//                    green <= 0; // to "0" when x,y outside of
//                    blue <= 0; // the active display area

//Pixel screen lost
if (active)
                begin
        if ((score%10)<100)
            begin
            
                if (S10SpriteOn==1)
                    begin
                    red <= (palette0[(S10dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette0[(S10dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette0[(S10dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette0[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette0[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette0[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
            
        else if ((score%10)==1)
            begin
            
                if (S11SpriteOn==1)
                    begin
                    red <= (palette1[(S11dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette1[(S11dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette1[(S11dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette1[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette1[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette1[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
            
            
        else if ((score%10)==2)
            
                begin
                if (S12SpriteOn==1)
                    begin
                    red <= (palette2[(S12dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette2[(S12dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette2[(S12dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette2[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette2[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette2[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
            
     

        else if ((score%10)==3)
            begin
            
                if (S13SpriteOn==1)
                    begin
                    red <= (palette3[(S13dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette3[(S13dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette3[(S13dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette3[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette3[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette3[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
           

        else if ((score%10)==4)
            begin
            
                if (S14SpriteOn==1)
                    begin
                    red <= (palette4[(S14dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette4[(S14dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette4[(S14dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette4[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette4[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette4[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
                end
     

        else if ((((score%1000)%100)%10)==5)
            begin
            if (active)
                begin
                if (S15SpriteOn==1)
                    begin
                    red <= (palette5[(S15dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette5[(S15dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette5[(S15dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette5[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette5[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette5[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
            else
                begin
                red <= 0; // set RED, GREEN & BLUE
                green <= 0; // to "0" when x,y outside of
                blue <= 0; // the active display area
                end
            end
            
        else if ((((score%1000)%100)%10)==6)
            begin
            if (active)
                begin
                if (S16SpriteOn==1)
                    begin
                    red <= (palette6[(S16dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette6[(S16dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette6[(S16dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette6[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette6[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette6[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
            else
                begin
                red <= 0; // set RED, GREEN & BLUE
                green <= 0; // to "0" when x,y outside of
                blue <= 0; // the active display area
                end
            end

        else if ((((score%1000)%100)%10)==7)
            begin
            if (active)
                begin
                if (S17SpriteOn==1)
                    begin
                    red <= (palette7[(S17dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette7[(S17dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette7[(S17dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette7[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette7[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette7[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
            else
                begin
                red <= 0; // set RED, GREEN & BLUE
                green <= 0; // to "0" when x,y outside of
                blue <= 0; // the active display area
                end
            end

        else if ((((score%1000)%100)%10)==8)
            begin
            if (active)
                begin
                if (S18SpriteOn==1)
                    begin
                    red <= (palette8[(S18dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette8[(S18dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette8[(S18dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette8[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette8[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette8[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
            else
                begin
                red <= 0; // set RED, GREEN & BLUE
                green <= 0; // to "0" when x,y outside of
                blue <= 0; // the active display area
                end
            end

        else if ((((score%1000)%100)%10)==9)
            begin
            if (active)
                begin
                if (S19SpriteOn==1)
                    begin
                    red <= (palette9[(S19dataout*3)])>>4; // RED bits(7:4) from colour palette
                    green <= (palette9[(S19dataout*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette9[(S19dataout*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                else
                    begin
                    red <= (palette9[(COL*3)])>>4; // RED bits(7:4) from colour palette
                    green <=(palette9[(COL*3)+1])>>4; // GREEN bits(7:4) from colour palette
                    blue <= (palette9[(COL*3)+2])>>4; // BLUE bits(7:4) from colour palette
                    end
                end
            else
                begin
                red <= 4'hF; // set RED, GREEN & BLUE
                green <= 0; // to "0" when x,y outside of
                blue <= 0; // the active display area
                end
            end

//      if ((pixel_x > 600)|| (pixel_x < 40) || (pixel_y > 440) || (pixel_y <40))
//                begin
//                red <= 4'h0;    
//                green <= 4'h1;    
//                blue <= 4'h0;    
//                end
    
//       else if (
         
//           ( pixel_x>=119 && pixel_x<=210 && pixel_y>=130 && pixel_y<=150 ) ||
//            ( pixel_x>=119 && pixel_x<=139 && pixel_y>=130 && pixel_y<=230 )||
//           ( pixel_x>=119 && pixel_x<=210 && pixel_y>=210 && pixel_y<=230 )||
//           ( pixel_x>=190 && pixel_x<=210 && pixel_y>=160 && pixel_y<=230 )||
//            ( pixel_x>=169 && pixel_x<=210 && pixel_y>=160 && pixel_y<=180 )|| 
            
//                   ( pixel_x>=219 && pixel_x<=310 && pixel_y>=130 && pixel_y<=150 )||
//            ( pixel_x>=219 && pixel_x<=239 && pixel_y>=130 && pixel_y<=230 )||
//            ( pixel_x>=290 && pixel_x<=310 && pixel_y>=130 && pixel_y<=230 )||
//           ( pixel_x>=219 && pixel_x<=310 && pixel_y>=170 && pixel_y<=190 )||
           
//                   ( pixel_x>=319 && pixel_x<=410 && pixel_y>=130 && pixel_y<=150 )||
//            ( pixel_x>=319 && pixel_x<=339 && pixel_y>=130 && pixel_y<=230 )||
//           ( pixel_x>=354 && pixel_x<=374 && pixel_y>=130 && pixel_y<=180 )||
//           ( pixel_x>=390 && pixel_x<=410 && pixel_y>=130 && pixel_y<=230 )||
           
//                  ( pixel_x>=419 && pixel_x<=510 && pixel_y>=130 && pixel_y<=150 )||
//           ( pixel_x>=419 && pixel_x<=439 && pixel_y>=130 && pixel_y<=230 )||
//           ( pixel_x>=419 && pixel_x<=469 && pixel_y>=170 && pixel_y<=190 )||
//           (pixel_x>=419 && pixel_x<=510 && pixel_y>=210 && pixel_y<=230 )||
           
//                  ( pixel_x>=119 && pixel_x<=210 && pixel_y>=250 && pixel_y<=270 )||
//           ( pixel_x>=119 && pixel_x<=139 && pixel_y>=250 && pixel_y<=350 )||
//            (pixel_x>=119 && pixel_x<=169 && pixel_y>=290 && pixel_y<=310 )||
//           ( pixel_x>=119 && pixel_x<=210 && pixel_y>=330 && pixel_y<=350 )||
           
//                  ( pixel_x>=219 && pixel_x<=310 && pixel_y>=250 && pixel_y<=270 ) ||
//           ( pixel_x>=219 && pixel_x<=239 && pixel_y>=250 && pixel_y<=350 ) ||
//           ( pixel_x>=290 && pixel_x<=310 && pixel_y>=250 && pixel_y<=350 )||
           
//                   ( pixel_x>=319 && pixel_x<=410 && pixel_y>=250 && pixel_y<=270 ) ||
//           ( pixel_x>=319 && pixel_x<=339 && pixel_y>=250 && pixel_y<=350 ) ||
//           ( pixel_x>=319 && pixel_x<=410 && pixel_y>=320 && pixel_y<=350 )||
//            ( pixel_x>=390 && pixel_x<=410 && pixel_y>=250 && pixel_y<=350 )          
            
//       )
//       begin 
//        red <= 4'hF;    
//        green <= 4'h0;    
//        blue <= 4'h3; 
//       end
       
//       else
//        begin
//            red <= 4'hF; 
//            blue <= 4'hF; 
//            green <= 4'hF; 
//        end
//end
   
//   else
//   begin 
//            red <= 4'h0;   
//            blue <= 4'h0;  
//            green <= 4'h0;
//   end
end
           
            end
    
endmodule