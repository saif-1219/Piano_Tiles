
`timescale 1ns / 1ps
// Setup AlienSprites Module
 module AlienSprites_2(
 input wire [9:0] xx, // current x position
 input wire [9:0] yy, // current y position
 input wire aactive, // high during active pixel drawing
 input wire BulletSpriteOn,
 input wire BulletSpriteOn2,
 output reg A1SpriteOn,          // 1=on, 0=off
 output reg A2SpriteOn,          // 1=on, 0=off
 output reg A3SpriteOn,          // 1=on, 0=off
 output reg A4SpriteOn,
// output reg A5SpriteOn,
// output reg A6SpriteOn,
// output reg A7SpriteOn,
// output reg A8SpriteOn,
 output wire [7:0] A1dataout,    // 8 bit pixel value from Alien1.mem
 output wire [7:0] A2dataout,    // 8 bit pixel value from Alien2.mem
 output wire [7:0] A3dataout,    // 8 bit pixel value from Alien3.mem
 output wire [7:0] A4dataout,/**/
// output wire [7:0] A5dataout,
// output wire [7:0] A6dataout,
// output wire [7:0] A7dataout,
// output wire [7:0] A8dataout,
 output reg L1SpriteOn, // 1=on, 0=off (Rocket)
 output reg L2SpriteOn, // 1=on, 0=off (Rocket)
 output reg L3SpriteOn, // 1=on, 0=off (Rocket)
 output wire [7:0] L1dataout, // 8 bit pixel value from Rocket.mem
 output wire [7:0] L2dataout,
 output wire [7:0] L3dataout,
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
 
 output reg S20SpriteOn,
 output reg S21SpriteOn,
 output reg S22SpriteOn,
 output reg S23SpriteOn,
 output reg S24SpriteOn,
 output reg S25SpriteOn,
 output reg S26SpriteOn,
 output reg S27SpriteOn,
 output reg S28SpriteOn,
 output reg S29SpriteOn,
 
 output reg HS10SpriteOn,
 output reg HS11SpriteOn,
 output reg HS12SpriteOn,
 output reg HS13SpriteOn,
 output reg HS14SpriteOn,
 output reg HS15SpriteOn,
 output reg HS16SpriteOn,
 output reg HS17SpriteOn,
 output reg HS18SpriteOn,
 output reg HS19SpriteOn,
 
 output reg HS20SpriteOn,
 output reg HS21SpriteOn,
 output reg HS22SpriteOn,
 output reg HS23SpriteOn,
 output reg HS24SpriteOn,
 output reg HS25SpriteOn,
 output reg HS26SpriteOn,
 output reg HS27SpriteOn,
 output reg HS28SpriteOn,
// output reg HS29SpriteOn,
 
 output wire [7:0] S10dataout,
 output wire [7:0] S11dataout,
 output wire [7:0] S12dataout,
 output wire [7:0] S13dataout,
 output wire [7:0] S14dataout,
 output wire [7:0] S15dataout,
 output wire [7:0] S16dataout,
 output wire [7:0] S17dataout,
 output wire [7:0] S18dataout,
 output wire [7:0] S19dataout,
 
 output wire [7:0] S20dataout,
 output wire [7:0] S21dataout,
 output wire [7:0] S22dataout,
 output wire [7:0] S23dataout,
 output wire [7:0] S24dataout,
 output wire [7:0] S25dataout,
 output wire [7:0] S26dataout,
 output wire [7:0] S27dataout,
 output wire [7:0] S28dataout,
 output wire [7:0] S29dataout,
 
 output wire [7:0] HS10dataout,
 output wire [7:0] HS11dataout,
 output wire [7:0] HS12dataout,
 output wire [7:0] HS13dataout,
 output wire [7:0] HS14dataout,
 output wire [7:0] HS15dataout,
 output wire [7:0] HS16dataout,
 output wire [7:0] HS17dataout,
 output wire [7:0] HS18dataout,
 output wire [7:0] HS19dataout,
 
 output wire [7:0] HS20dataout,
 output wire [7:0] HS21dataout,
 output wire [7:0] HS22dataout,
 output wire [7:0] HS23dataout,
 output wire [7:0] HS24dataout,
 output wire [7:0] HS25dataout,
 output wire [7:0] HS26dataout,
 output wire [7:0] HS27dataout,
 output wire [7:0] HS28dataout,
// output wire [7:0] HS29dataout,
 input wire Pclk, // 25MHz pixel clock
 input wire start,
 input wire reset,
 output reg gameend
 );
// instantiate Alien1Rom code
reg [9:0] A1address;            // 2^10 or 1024, need 31 x 26 = 806
Alien1Rom Alien1VRom (.i_A1addr(A1address),.i_clk2(Pclk),.o_A1data(A1dataout));

// instantiate Alien2Rom code
reg [9:0] A2address;            // 2^10 or 1024, need 31 x 21 = 651
Alien2Rom Alien2VRom (.i_A2addr(A2address),.i_clk2(Pclk),.o_A2data(A2dataout));

// instantiate Alien3Rom code
reg [9:0] A3address;            // 2^10 or 1024, need 31 x 27 = 837
Alien3Rom Alien3VRom (.i_A3addr(A3address),.i_clk2(Pclk),.o_A3data(A3dataout));
 
 reg [9:0] A4address; // 2^10 or 1024, need 31 x 26 = 806
 Alien1Rom Alien4VRom (.i_A1addr(A4address),.i_clk2(Pclk),.o_A1data(A4dataout));
 
// reg [9:0] A5address; // 2^10 or 1024, need 31 x 26 = 806
// Alien2Rom Alien5VRom (.i_A2addr(A5address),.i_clk2(Pclk),.o_A2data(A5dataout));
 
// reg [9:0] A6address; // 2^10 or 1024, need 31 x 26 = 806
// Alien3Rom Alien6VRom (.i_A3addr(A6address),.i_clk2(Pclk),.o_A3data(A6dataout));
 
// reg [9:0] A7address; // 2^10 or 1024, need 31 x 26 = 806
// Alien1Rom Alien7VRom (.i_A1addr(A7address),.i_clk2(Pclk),.o_A1data(A7dataout));
 
// reg [9:0] A8address; // 2^10 or 1024, need 31 x 26 = 806
// Alien2Rom Alien8VRom (.i_A2addr(A8address),.i_clk2(Pclk),.o_A2data(A8dataout));


//For Alien 1
 reg [9:0] A1X = 200; // Alien1 X start position
 reg [9:0] A1Y = 2; // Alien1 Y start position
 localparam A1Width = 31; // Alien1 width in pixels
 localparam A1Height = 26; // Alien1 height in pixels
 
 //For Alien 2
 reg [9:0] A2X = 400; // Alien2 X start position
 reg [9:0] A2Y = 2; // Alien2 Y start position
 localparam A2Width = 31; // Alien2 width in pixels
 localparam A2Height = 21; // Alien2 height in pixels
 
 //For Alien 3
 reg [9:0] A3X = 600; // Alien3 X start position
 reg [9:0] A3Y = 479; // Alien3 Y start position
 localparam A3Width = 31; // Alien3 width in pixels
 localparam A3Height = 27; // Alien3 height in pixels
 
 reg [9:0] A4X = 110; // Alien4 X start position
 reg [9:0] A4Y = 479; // Alien4 Y start position
 
// reg [9:0] A5X = 220; // Alien4 X start position
// reg [9:0] A5Y = 479; // Alien4 Y start position
 
// reg [9:0] A6X = 330; // Alien4 X start position
// reg [9:0] A6Y = 479; // Alien4 Y start position
 
// reg [9:0] A7X = 440; // Alien4 X start position
// reg [9:0] A7Y = 479; // Alien4 Y start position
 
// reg [9:0] A8X = 550; // Alien4 X start position
// reg [9:0] A8Y = 479; // Alien4 Y start position
 
 reg [1:0] Adir1 = 1; // direction of alien1: 0=right, 1=left
 reg [1:0] Adir2 = 0; // direction of alien2
 reg [1:0] Adir3 = 1; // direction of alien3
 reg [1:0] Adir4 = 1;// direction of alien4
// reg [1:0] Adir5 = 0;// direction of alien4
// reg [1:0] Adir6 = 1;// direction of alien4
// reg [1:0] Adir7 = 0;// direction of alien4
// reg [1:0] Adir8 = 1;// direction of alien4
 reg [9:0] delaliens1=0; // counter to slow alien1 movement
 reg [9:0] delaliens2=0; 
 reg [9:0] delaliens3=0;
 reg [9:0] delaliens4=0;
// reg [9:0] delaliens5=0;
// reg [9:0] delaliens6=0;
// reg [9:0] delaliens7=0;
// reg [9:0] delaliens8=0;
 
 reg [2:0] lives=4;
 
 reg [8:0] L1address; // 2^10 or 1024, need 34 x 27 = 918
 reg [8:0] L2address; // 2^10 or 1024, need 34 x 27 = 918
 reg [8:0] L3address; // 2^10 or 1024, need 34 x 27 = 918
 LiveRom Live1VRom (.i_liveaddr(L1address),.i_clk2(Pclk),.o_livedata(L1dataout));
 LiveRom Live2VRom (.i_liveaddr(L2address),.i_clk2(Pclk),.o_livedata(L2dataout));
 LiveRom Live3VRom (.i_liveaddr(L3address),.i_clk2(Pclk),.o_livedata(L3dataout));
 
 // setup character positions and sizes
 reg [9:0] L1X = 549; // Rocket X start position
 reg [8:0] L1Y = 10; // Rocket Y start position
 reg [9:0] L2X = 579; // Rocket X start position
 reg [8:0] L2Y = 10; // Rocket Y start position
 reg [9:0] L3X = 609; // Rocket X start position
 reg [8:0] L3Y = 10; // Rocket Y start position
 localparam LiveWidth = 20; // Rocket width in pixels
 localparam LiveHeight = 20; // Rocket height in pixels
 
 reg [7:0] score=0;
 reg [7:0] highscore=0;
 
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
 
 reg [8:0] s20address;
 reg [8:0] s21address;
 reg [8:0] s22address;
 reg [8:0] s23address;
 reg [8:0] s24address;
 reg [8:0] s25address;
 reg [8:0] s26address;
 reg [8:0] s27address;
 reg [8:0] s28address;
 reg [8:0] s29address;
 
 reg [8:0] hs10address;
 reg [8:0] hs11address;
 reg [8:0] hs12address;
 reg [8:0] hs13address;
 reg [8:0] hs14address;
 reg [8:0] hs15address;
 reg [8:0] hs16address;
 reg [8:0] hs17address;
 reg [8:0] hs18address;
 reg [8:0] hs19address;
 
 reg [8:0] hs20address;
 reg [8:0] hs21address;
 reg [8:0] hs22address;
 reg [8:0] hs23address;
 reg [8:0] hs24address;
 reg [8:0] hs25address;
 reg [8:0] hs26address;
 reg [8:0] hs27address;
 reg [8:0] hs28address;
// reg [8:0] hs29address;
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
 
 ZeroRom ZeroS2Rom (.i_numberaddr(s20address),.i_clk2(Pclk),.o_numberdata(S20dataout));
 OneRom OneS2Rom (.i_numberaddr(s21address),.i_clk2(Pclk),.o_numberdata(S21dataout));
 TwoRom TwoS2Rom (.i_numberaddr(s22address),.i_clk2(Pclk),.o_numberdata(S22dataout));
 ThreeRom ThreeS2Rom (.i_numberaddr(s23address),.i_clk2(Pclk),.o_numberdata(S23dataout));
 FourRom FourS2Rom (.i_numberaddr(s24address),.i_clk2(Pclk),.o_numberdata(S24dataout));
 FiveRom FiveS2Rom (.i_numberaddr(s25address),.i_clk2(Pclk),.o_numberdata(S25dataout));
 SixRom SixS2Rom (.i_numberaddr(s26address),.i_clk2(Pclk),.o_numberdata(S26dataout));
 SevenRom SevenS2Rom (.i_numberaddr(s27address),.i_clk2(Pclk),.o_numberdata(S27dataout));
 EightRom EightS2Rom (.i_numberaddr(s28address),.i_clk2(Pclk),.o_numberdata(S28dataout));
 NineRom NineS2Rom (.i_numberaddr(s29address),.i_clk2(Pclk),.o_numberdata(S29dataout));
 
 ZeroRom ZeroHS1Rom (.i_numberaddr(hs10address),.i_clk2(Pclk),.o_numberdata(HS10dataout));
 OneRom OneHS1Rom (.i_numberaddr(hs11address),.i_clk2(Pclk),.o_numberdata(HS11dataout));
 TwoRom TwoHS1Rom (.i_numberaddr(hs12address),.i_clk2(Pclk),.o_numberdata(HS12dataout));
 ThreeRom ThreeHS1Rom (.i_numberaddr(hs13address),.i_clk2(Pclk),.o_numberdata(HS13dataout));
 FourRom FourHS1Rom (.i_numberaddr(hs14address),.i_clk2(Pclk),.o_numberdata(HS14dataout));
 FiveRom FiveHS1Rom (.i_numberaddr(hs15address),.i_clk2(Pclk),.o_numberdata(HS15dataout));
 SixRom SixHS1Rom (.i_numberaddr(hs16address),.i_clk2(Pclk),.o_numberdata(HS16dataout));
 SevenRom SevenHS1Rom (.i_numberaddr(hs17address),.i_clk2(Pclk),.o_numberdata(HS17dataout));
 EightRom EightHS1Rom (.i_numberaddr(hs18address),.i_clk2(Pclk),.o_numberdata(HS18dataout));
 NineRom NineHS1Rom (.i_numberaddr(hs19address),.i_clk2(Pclk),.o_numberdata(HS19dataout));
 
 ZeroRom ZeroHS2Rom (.i_numberaddr(hs20address),.i_clk2(Pclk),.o_numberdata(HS20dataout));
 OneRom OneHS2Rom (.i_numberaddr(hs21address),.i_clk2(Pclk),.o_numberdata(HS21dataout));
 TwoRom TwoHS2Rom (.i_numberaddr(hs22address),.i_clk2(Pclk),.o_numberdata(HS22dataout));
 ThreeRom ThreeHS2Rom (.i_numberaddr(hs23address),.i_clk2(Pclk),.o_numberdata(HS23dataout));
 FourRom FourHS2Rom (.i_numberaddr(hs24address),.i_clk2(Pclk),.o_numberdata(HS24dataout));
 FiveRom FiveHS2Rom (.i_numberaddr(hs25address),.i_clk2(Pclk),.o_numberdata(HS25dataout));
 SixRom SixHS2Rom (.i_numberaddr(hs26address),.i_clk2(Pclk),.o_numberdata(HS26dataout));
 SevenRom SevenHS2Rom (.i_numberaddr(hs27address),.i_clk2(Pclk),.o_numberdata(HS27dataout));
 EightRom EightHS2Rom (.i_numberaddr(hs28address),.i_clk2(Pclk),.o_numberdata(HS28dataout));
// NineRom NineHS2Rom (.i_numberaddr(hs29address),.i_clk2(Pclk),.o_numberdata(HS29dataout));
 
 reg [9:0] S1X = 5; // Rocket X start position
 reg [8:0] S1Y = 10; // Rocket Y start position
 reg [9:0] S2X = 30; // Rocket X start position
 reg [8:0] S2Y = 10; // Rocket Y start position
 reg [9:0] HS1X = 55; // Rocket X start position
 reg [8:0] HS1Y = 10; // Rocket Y start position
 reg [9:0] HS2X = 80; // Rocket X start position
 reg [8:0] HS2Y = 10; // Rocket Y start position
 localparam ScoreWidth = 20; // Rocket width in pixels
 localparam ScoreHeight = 20; // Rocket height in pixels

 
always @ (posedge Pclk)
     begin
    if (reset)
    begin
    A1X <= 297;
    A1Y <= 10;
    A2X <= 135;
    A2Y <= 20;
    A3X <= 135;
    A3Y <= 479;
    A4X <= 297;
    A4Y <= 479;
    lives <= 4;
    score<=0;
    gameend<=0;
    end
    
    if (start==0 && score>highscore)
    begin
    highscore<=score;
    end
    
    if (lives==0)
    begin
    gameend<=1;
    end
     
         if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S1X-1 && yy==S1Y && score>=0 && score <10)
            begin
            s10address <= 0;
            S10SpriteOn <=1;
         end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight) && (score>=0 && score <10))
            begin
            s10address <= s10address + 1;
            S10SpriteOn <=1;
     end
     else
        S10SpriteOn <=0;
     end

 end

     if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S1X-1 && yy==S1Y && score>=10 && score <20)
            begin
            s11address <= 0;
            S11SpriteOn <=1;
         end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight) && (score>=10 && score <20))
            begin
            s11address <= s11address + 1;
            S11SpriteOn <=1;
     end
     else
        S11SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S1X-1 && yy==S1Y && score>=20 && score <30)
            begin
            s12address <= 0;
            S12SpriteOn <=1;
         end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight) && (score>=20 && score <30))
            begin
            s12address <= s12address + 1;
            S12SpriteOn <=1;
     end
     else
        S12SpriteOn <=0;
     end

 end
    
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S1X-1 && yy==S1Y && score>=30 && score <40)
            begin
            s13address <= 0;
            S13SpriteOn <=1;
         end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight) && (score>=30 && score <40))
            begin
            s13address <= s13address + 1;
            S13SpriteOn <=1;
     end
     else
        S13SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S1X-1 && yy==S1Y && score>=40 && score <50)
            begin
            s14address <= 0;
            S14SpriteOn <=1;
         end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight) && (score>=40 && score <50))
            begin
            s14address <= s14address + 1;
            S14SpriteOn <=1;
     end
     else
        S14SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S1X-1 && yy==S1Y && score>=50 && score <60)
            begin
            s15address <= 0;
            S15SpriteOn <=1;
         end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight) && (score>=50 && score <60))
            begin
            s15address <= s15address + 1;
            S15SpriteOn <=1;
     end
     else
        S15SpriteOn <=0;
     end

 end
 
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S1X-1 && yy==S1Y && score>=60 && score <70)
            begin
            s16address <= 0;
            S16SpriteOn <=1;
         end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight) && (score>=60 && score <70))
            begin
            s16address <= s16address + 1;
            S16SpriteOn <=1;
     end
     else
        S16SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S1X-1 && yy==S1Y && score>=70 && score <80)
            begin
            s17address <= 0;
            S17SpriteOn <=1;
         end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight) && (score>=70 && score <80))
            begin
            s17address <= s17address + 1;
            S17SpriteOn <=1;
     end
     else
        S17SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S1X-1 && yy==S1Y && score>=80 && score <90)
            begin
            s18address <= 0;
            S18SpriteOn <=1;
         end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight) && (score>=80 && score <90))
            begin
            s18address <= s18address + 1;
            S18SpriteOn <=1;
     end
     else
        S18SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S1X-1 && yy==S1Y && score>=90 && score <100)
            begin
            s19address <= 0;
            S19SpriteOn <=1;
         end
         if ((xx>S1X-1) && (xx<S1X+ScoreWidth) && (yy>S1Y-1) && (yy<S1Y+ScoreHeight) && (score>=90 && score <100))
            begin
            s19address <= s19address + 1;
            S19SpriteOn <=1;
     end
     else
        S19SpriteOn <=0;
     end

 end
 
         if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S2X-1 && yy==S2Y && score%10==0)
            begin
            s20address <= 0;
            S20SpriteOn <=1;
         end
         if ((xx>S2X-1) && (xx<S2X+ScoreWidth) && (yy>S2Y-1) && (yy<S2Y+ScoreHeight) && (score%10==0))
            begin
            s20address <= s20address + 1;
            S20SpriteOn <=1;
     end
     else
        S20SpriteOn <=0;
     end

 end

     if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S2X-1 && yy==S2Y && score%10==1)
            begin
            s21address <= 0;
            S21SpriteOn <=1;
         end
         if ((xx>S2X-1) && (xx<S2X+ScoreWidth) && (yy>S2Y-1) && (yy<S2Y+ScoreHeight) && (score%10==1))
            begin
            s21address <= s21address + 1;
            S21SpriteOn <=1;
     end
     else
        S21SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S2X-1 && yy==S2Y && score%10==2)
            begin
            s22address <= 0;
            S22SpriteOn <=1;
         end
         if ((xx>S2X-1) && (xx<S2X+ScoreWidth) && (yy>S2Y-1) && (yy<S2Y+ScoreHeight) && (score%10==2))
            begin
            s22address <= s22address + 1;
            S22SpriteOn <=1;
     end
     else
        S22SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S2X-1 && yy==S2Y && score%10==3)
            begin
            s23address <= 0;
            S23SpriteOn <=1;
         end
         if ((xx>S2X-1) && (xx<S2X+ScoreWidth) && (yy>S2Y-1) && (yy<S2Y+ScoreHeight) && (score%10==3))
            begin
            s23address <= s23address + 1;
            S23SpriteOn <=1;
     end
     else
        S23SpriteOn <=0;
     end

 end

if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S2X-1 && yy==S2Y && score%10==4)
            begin
            s24address <= 0;
            S24SpriteOn <=1;
         end
         if ((xx>S2X-1) && (xx<S2X+ScoreWidth) && (yy>S2Y-1) && (yy<S2Y+ScoreHeight) && (score%10==4))
            begin
            s24address <= s24address + 1;
            S24SpriteOn <=1;
     end
     else
        S24SpriteOn <=0;
     end

 end
    
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S2X-1 && yy==S2Y && score%10==5)
            begin
            s25address <= 0;
            S25SpriteOn <=1;
         end
         if ((xx>S2X-1) && (xx<S2X+ScoreWidth) && (yy>S2Y-1) && (yy<S2Y+ScoreHeight) && (score%10==5))
            begin
            s25address <= s25address + 1;
            S25SpriteOn <=1;
     end
     else
        S25SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S2X-1 && yy==S2Y && score%10==6)
            begin
            s26address <= 0;
            S26SpriteOn <=1;
         end
         if ((xx>S2X-1) && (xx<S2X+ScoreWidth) && (yy>S2Y-1) && (yy<S2Y+ScoreHeight) && (score%10==6))
            begin
            s26address <= s26address + 1;
            S26SpriteOn <=1;
     end
     else
        S26SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S2X-1 && yy==S2Y && score%10==7)
            begin
            s27address <= 0;
            S27SpriteOn <=1;
         end
         if ((xx>S2X-1) && (xx<S2X+ScoreWidth) && (yy>S2Y-1) && (yy<S2Y+ScoreHeight) && (score%10==7))
            begin
            s27address <= s27address + 1;
            S27SpriteOn <=1;
     end
     else
        S27SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S2X-1 && yy==S2Y && score%10==8)
            begin
            s28address <= 0;
            S28SpriteOn <=1;
         end
         if ((xx>S2X-1) && (xx<S2X+ScoreWidth) && (yy>S2Y-1) && (yy<S2Y+ScoreHeight) && (score%10==8))
            begin
            s28address <= s28address + 1;
            S28SpriteOn <=1;
     end
     else
        S28SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==S2X-1 && yy==S2Y && score%10==9)
            begin
            s29address <= 0;
            S29SpriteOn <=1;
         end
         if ((xx>S2X-1) && (xx<S2X+ScoreWidth) && (yy>S2Y-1) && (yy<S2Y+ScoreHeight) && (score%10==9))
            begin
            s29address <= s29address + 1;
            S29SpriteOn <=1;
     end
     else
        S29SpriteOn <=0;
     end

 end
 
     if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS1X-1 && yy==HS1Y && highscore>=0 && highscore <10)
            begin
            hs10address <= 0;
            HS10SpriteOn <=1;
         end
         if ((xx>HS1X-1) && (xx<HS1X+ScoreWidth) && (yy>HS1Y-1) && (yy<HS1Y+ScoreHeight) && (highscore>=0 && highscore <10))
            begin
            hs10address <= hs10address + 1;
            HS10SpriteOn <=1;
     end
     else
        HS10SpriteOn <=0;
     end

 end

     if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS1X-1 && yy==HS1Y && highscore>=10 && highscore <20)
            begin
            hs11address <= 0;
            HS11SpriteOn <=1;
         end
         if ((xx>HS1X-1) && (xx<HS1X+ScoreWidth) && (yy>HS1Y-1) && (yy<HS1Y+ScoreHeight) && (highscore>=10 && highscore <20))
            begin
            hs11address <= hs11address + 1;
            HS11SpriteOn <=1;
     end
     else
        HS11SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS1X-1 && yy==HS1Y && highscore>=20 && highscore <30)
            begin
            hs12address <= 0;
            HS12SpriteOn <=1;
         end
         if ((xx>HS1X-1) && (xx<HS1X+ScoreWidth) && (yy>HS1Y-1) && (yy<HS1Y+ScoreHeight) && (highscore>=20 && highscore <30))
            begin
            hs12address <= hs12address + 1;
            HS12SpriteOn <=1;
     end
     else
        HS12SpriteOn <=0;
     end

 end
    
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS1X-1 && yy==HS1Y && highscore>=30 && highscore <40)
            begin
            hs13address <= 0;
            HS13SpriteOn <=1;
         end
         if ((xx>HS1X-1) && (xx<HS1X+ScoreWidth) && (yy>HS1Y-1) && (yy<HS1Y+ScoreHeight) && (highscore>=30 && highscore <40))
            begin
            hs13address <= hs13address + 1;
            HS13SpriteOn <=1;
     end
     else
        HS13SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS1X-1 && yy==HS1Y && highscore>=40 && highscore <50)
            begin
            hs14address <= 0;
            HS14SpriteOn <=1;
         end
         if ((xx>HS1X-1) && (xx<HS1X+ScoreWidth) && (yy>HS1Y-1) && (yy<HS1Y+ScoreHeight) && (highscore>=40 && highscore <50))
            begin
            hs14address <= hs14address + 1;
            HS14SpriteOn <=1;
     end
     else
        HS14SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS1X-1 && yy==HS1Y && highscore>=50 && highscore <60)
            begin
            hs15address <= 0;
            HS15SpriteOn <=1;
         end
         if ((xx>HS1X-1) && (xx<HS1X+ScoreWidth) && (yy>HS1Y-1) && (yy<HS1Y+ScoreHeight) && (highscore>=50 && highscore <60))
            begin
            hs15address <= hs15address + 1;
            HS15SpriteOn <=1;
     end
     else
        HS15SpriteOn <=0;
     end

 end
 
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS1X-1 && yy==HS1Y && highscore>=60 && highscore <70)
            begin
            hs16address <= 0;
            HS16SpriteOn <=1;
         end
         if ((xx>HS1X-1) && (xx<HS1X+ScoreWidth) && (yy>HS1Y-1) && (yy<HS1Y+ScoreHeight) && (highscore>=60 && highscore <70))
            begin
            hs16address <= hs16address + 1;
            HS16SpriteOn <=1;
     end
     else
        HS16SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS1X-1 && yy==HS1Y && highscore>=70 && highscore <80)
            begin
            hs17address <= 0;
            HS17SpriteOn <=1;
         end
         if ((xx>HS1X-1) && (xx<HS1X+ScoreWidth) && (yy>HS1Y-1) && (yy<HS1Y+ScoreHeight) && (highscore>=70 && highscore <80))
            begin
            hs17address <= hs17address + 1;
            HS17SpriteOn <=1;
     end
     else
        HS17SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS1X-1 && yy==HS1Y && highscore>=80 && highscore <90)
            begin
            hs18address <= 0;
            HS18SpriteOn <=1;
         end
         if ((xx>HS1X-1) && (xx<HS1X+ScoreWidth) && (yy>HS1Y-1) && (yy<HS1Y+ScoreHeight) && (highscore>=80 && highscore <90))
            begin
            hs18address <= hs18address + 1;
            HS18SpriteOn <=1;
     end
     else
        HS18SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS1X-1 && yy==HS1Y && highscore>=90 && highscore <100)
            begin
            hs19address <= 0;
            HS19SpriteOn <=1;
         end
         if ((xx>HS1X-1) && (xx<HS1X+ScoreWidth) && (yy>HS1Y-1) && (yy<HS1Y+ScoreHeight) && (highscore>=90 && highscore <100))
            begin
            hs19address <= hs19address + 1;
            HS19SpriteOn <=1;
     end
     else
        HS19SpriteOn <=0;
     end

 end
 
         if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS2X-1 && yy==HS2Y && highscore%10==0)
            begin
            hs20address <= 0;
            HS20SpriteOn <=1;
         end
         if ((xx>HS2X-1) && (xx<HS2X+ScoreWidth) && (yy>HS2Y-1) && (yy<HS2Y+ScoreHeight) && (highscore%10==0))
            begin
            hs20address <= hs20address + 1;
            HS20SpriteOn <=1;
     end
     else
        HS20SpriteOn <=0;
     end

 end

     if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS2X-1 && yy==HS2Y && highscore%10==1)
            begin
            hs21address <= 0;
            HS21SpriteOn <=1;
         end
         if ((xx>HS2X-1) && (xx<HS2X+ScoreWidth) && (yy>HS2Y-1) && (yy<HS2Y+ScoreHeight) && (highscore%10==1))
            begin
            hs21address <= hs21address + 1;
            HS21SpriteOn <=1;
     end
     else
        HS21SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS2X-1 && yy==HS2Y && highscore%10==2)
            begin
            hs22address <= 0;
            HS22SpriteOn <=1;
         end
         if ((xx>HS2X-1) && (xx<HS2X+ScoreWidth) && (yy>HS2Y-1) && (yy<HS2Y+ScoreHeight) && (highscore%10==2))
            begin
            hs22address <= hs22address + 1;
            HS22SpriteOn <=1;
     end
     else
        HS22SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS2X-1 && yy==HS2Y && highscore%10==3)
            begin
            hs23address <= 0;
            HS23SpriteOn <=1;
         end
         if ((xx>HS2X-1) && (xx<HS2X+ScoreWidth) && (yy>HS2Y-1) && (yy<HS2Y+ScoreHeight) && (highscore%10==3))
            begin
            hs23address <= hs23address + 1;
            HS23SpriteOn <=1;
     end
     else
        HS23SpriteOn <=0;
     end

 end

if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS2X-1 && yy==HS2Y && highscore%10==4)
            begin
            hs24address <= 0;
            HS24SpriteOn <=1;
         end
         if ((xx>HS2X-1) && (xx<HS2X+ScoreWidth) && (yy>HS2Y-1) && (yy<HS2Y+ScoreHeight) && (highscore%10==4))
            begin
            hs24address <= hs24address + 1;
            HS24SpriteOn <=1;
     end
     else
        HS24SpriteOn <=0;
     end

 end
    
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS2X-1 && yy==HS2Y && highscore%10==5)
            begin
            hs25address <= 0;
            HS25SpriteOn <=1;
         end
         if ((xx>HS2X-1) && (xx<HS2X+ScoreWidth) && (yy>HS2Y-1) && (yy<HS2Y+ScoreHeight) && (highscore%10==5))
            begin
            hs25address <= hs25address + 1;
            HS25SpriteOn <=1;
     end
     else
        HS25SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS2X-1 && yy==HS2Y && highscore%10==6)
            begin
            hs26address <= 0;
            HS26SpriteOn <=1;
         end
         if ((xx>HS2X-1) && (xx<HS2X+ScoreWidth) && (yy>HS2Y-1) && (yy<HS2Y+ScoreHeight) && (highscore%10==6))
            begin
            hs26address <= hs26address + 1;
            HS26SpriteOn <=1;
     end
     else
        HS26SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS2X-1 && yy==HS2Y && highscore%10==7)
            begin
            hs27address <= 0;
            HS27SpriteOn <=1;
         end
         if ((xx>HS2X-1) && (xx<HS2X+ScoreWidth) && (yy>HS2Y-1) && (yy<HS2Y+ScoreHeight) && (highscore%10==7))
            begin
            hs27address <= hs27address + 1;
            HS27SpriteOn <=1;
     end
     else
        HS27SpriteOn <=0;
     end

 end
 
    if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==HS2X-1 && yy==HS2Y && highscore%10==8)
            begin
            hs28address <= 0;
            HS28SpriteOn <=1;
         end
         if ((xx>HS2X-1) && (xx<HS2X+ScoreWidth) && (yy>HS2Y-1) && (yy<HS2Y+ScoreHeight) && (highscore%10==8))
            begin
            hs28address <= hs28address + 1;
            HS28SpriteOn <=1;
     end
     else
        HS28SpriteOn <=0;
     end

 end
 
//    if (start==0)
//     begin
    
//        // check if rocket is being drawn
//         if (aactive)
//            begin // check if xx,yy are within the confines of the Rocket
//         if (xx==HS2X-1 && yy==HS2Y && highscore%10==9)
//            begin
//            hs29address <= 0;
//            HS29SpriteOn <=1;
//         end
//         if ((xx>HS2X-1) && (xx<HS2X+ScoreWidth) && (yy>HS2Y-1) && (yy<HS2Y+ScoreHeight) && (highscore%10==9))
//            begin
//            hs29address <= hs29address + 1;
//            HS29SpriteOn <=1;
//     end
//     else
//        HS29SpriteOn <=0;
//     end

// end
         
     if (start==0)
     begin
    
        // check if rocket is being drawn
         if (aactive)
            begin // check if xx,yy are within the confines of the Rocket
         if (xx==L1X-1 && yy==L1Y && lives>=4)
            begin
            L1address <= 0;
            L1SpriteOn <=1;
         end
         if ((xx>L1X-1) && (xx<L1X+LiveWidth) && (yy>L1Y-1) && (yy<L1Y+LiveHeight) && (lives>=4))
            begin
            L1address <= L1address + 1;
            L1SpriteOn <=1;
     end
     else
        L1SpriteOn <=0;
     end

 end

 if (start==0)
 begin

    // check if rocket is being drawn
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==L2X-1 && yy==L2Y && lives>=3)
        begin
        L2address <= 0;
        L2SpriteOn <=1;
     end
     if ((xx>L2X-1) && (xx<L2X+LiveWidth) && (yy>L2Y-1) && (yy<L2Y+LiveHeight) && (lives>=3))
        begin
        L2address <= L2address + 1;
        L2SpriteOn <=1;
     end
     else
        L2SpriteOn <=0;
     end

 end
 
 if (start==0)
 begin

    // check if rocket is being drawn
     if (aactive)
        begin // check if xx,yy are within the confines of the Rocket
     if (xx==L3X-1 && yy==L3Y && lives>=2)
        begin
        L3address <= 0;
        L3SpriteOn <=1;
     end
     if ((xx>L3X-1) && (xx<L3X+LiveWidth) && (yy>L3Y-1) && (yy<L3Y+LiveHeight) && (lives>=2))
        begin
        L3address <= L3address + 1;
        L3SpriteOn <=1;
     end
     else
        L3SpriteOn <=0;
     end

 end
     
     if (start==0)
     begin
        if (xx==639 && yy==479)
         begin
            delaliens1<=delaliens1+1;
            if (delaliens1>1)
                begin
                    delaliens1<=0;
                    if (A1X<=5)
                        Adir1<=1;
                    else if (A1X>=634-31)
                        Adir1<=0;
                    if (Adir1 == 1 && A1X<640-A1Width)
                        begin
                            A1X<=A1X+4;
                            A1Y<=A1Y+1;
                        end
                    if (Adir1 == 0 && A1X>4)
                         begin
                             A1X<=A1X-4;
                             A1Y<=A1Y+1;
                         end
                if (A1Y>=460 && A1Y<478)
                    begin
                    A1Y<=0;
                    if (lives>0)
                        begin
                        lives<=lives-1;
                        end
                    if (Adir1==0)
                        Adir1<=1;
                    else
                        Adir1<=0;
                    end
                end
            end
             if (aactive)
                begin // check if xx,yy are within the confines of the Rocket
             if (xx==A1X-1 && yy==A1Y)
                begin
                A1address <= 0;
                A1SpriteOn <=1;
             end
             if ((xx>A1X-1) && (xx<A1X+A1Width) && (yy>A1Y-1) && (yy<A1Y+A1Height))
                begin
                A1address <= A1address + 1;
                A1SpriteOn <=1;
             end
             else
                A1SpriteOn <=0;
             if (BulletSpriteOn==1 && A1SpriteOn==1 && lives>0)
                begin
                A1Y<=479;
                score<=score+1;
                end
             else
             if (BulletSpriteOn2==1 && A1SpriteOn==1 && lives>0)
                begin
                A1Y<=479;
                score<=score+1;
                end
             end
     end
  
     if (start==0)
     begin
        if (xx==639 && yy==479)
         begin
            delaliens2<=delaliens2+1;
            if (delaliens2>1)
                begin
                    delaliens2<=0;
                    if (A2X<=5)
                        Adir2<=1;
                    else if (A2X>=634-26)
                        Adir2<=0;
                    if (Adir2 == 1 && A2X<640-A1Width)
                        begin
                            A2X<=A2X+1;
                            A2Y<=A2Y+4;
                        end
                    if (Adir2 == 0 && A2X>1)
                         begin
                             A2X<=A2X-1;
                             A2Y<=A2Y+4;
                         end
                if (A2Y>=460 && A2Y<478)
                    begin
                    A2Y<=0;
                    if (lives>0)
                        begin
                        lives<=lives-1;
                        end
                    if (Adir2==0)
                        Adir2<=1;
                    else
                        Adir2<=0;
                    end
                end
            end
             if (aactive)
                begin // check if xx,yy are within the confines of the Rocket
             if (xx==A2X-1 && yy==A2Y)
                begin
                A2address <= 0;
                A2SpriteOn <=1;
             end
             if ((xx>A2X-1) && (xx<A2X+A2Width) && (yy>A2Y-1) && (yy<A2Y+A2Height))
                begin
                A2address <= A2address + 1;
                A2SpriteOn <=1;
             end
             else
                A2SpriteOn <=0;
             if (BulletSpriteOn==1 && A2SpriteOn==1 && lives>0)
                begin
                A2Y<=479;
                score<=score+1;
                end
             else
             if (BulletSpriteOn2==1 && A2SpriteOn==1 && lives>0)
                begin
                A2Y<=479;
                score<=score+1;
                end
             end
     end
     
     if (start==0)
     begin
        if (xx==639 && yy==479)
         begin
            delaliens3<=delaliens3+1;
            if (delaliens3>1)
                begin
                    delaliens3<=0;
                    if (A3X<=5)
                        Adir3<=1;
                    else if (A3X>=634-32)
                        Adir3<=0;
                    if (Adir3 == 1 && A3X<640-A3Width)
                        begin
                            A3X<=A3X+1;
                            A3Y<=A3Y+2;
                        end
                    if (Adir3 == 0 && A3X>1)
                         begin
                             A3X<=A3X-1;
                             A3Y<=A3Y+2;
                         end
                if (A3Y>=460 && A3Y<478)
                    begin
                    A3Y<=0;
                    if (lives>0)
                        begin
                        lives<=lives-1;
                        end
                    if (Adir3==0)
                        Adir3<=1;
                    else
                        Adir3<=0;
                    end
                end
            end
             if (aactive)
                begin // check if xx,yy are within the confines of the Rocket
             if (xx==A3X-1 && yy==A3Y)
                begin
                A3address <= 0;
                A3SpriteOn <=1;
             end
             if ((xx>A3X-1) && (xx<A3X+A3Width) && (yy>A3Y-1) && (yy<A3Y+A3Height))
                begin
                A3address <= A3address + 1;
                A3SpriteOn <=1;
             end
             else
                A3SpriteOn <=0;
             if (BulletSpriteOn==1 && A3SpriteOn==1 && lives>0)
                begin
                A3Y<=479;
                score<=score+1;
                end
              else
              if (BulletSpriteOn2==1 && A3SpriteOn==1 && lives>0)
                begin
                A3Y<=479;
                score<=score+1;
                end
             end
       end      
     
     if (start==0)
     begin
        if (xx==639 && yy==479)
         begin
            delaliens4<=delaliens4+1;
            if (delaliens4>1)
                begin
                    delaliens4<=0;
                    if (A4X<=5)
                        Adir4<=1;
                    else if (A4X>=634-31)
                        Adir4<=0;
                    if (Adir4 == 1 && A4X<640-A1Width)
                        begin
                            A4X<=A4X+1;
                            A4Y<=A4Y+4;
                        end
                    if (Adir4 == 0 && A1X>1)
                         begin
                             A4X<=A4X-1;
                             A4Y<=A4Y+4;
                         end
                if (A4Y>=460 && A4Y<478)
                    begin
                    A4Y<=0;
                    if (lives>0)
                        begin
                        lives<=lives-1;
                        end
                    if (Adir4==0)
                        Adir4<=1;
                    else
                        Adir4<=0;
                    end
                end
            end
             if (aactive)
                begin // check if xx,yy are within the confines of the Rocket
             if (xx==A4X-1 && yy==A4Y)
                begin
                A4address <= 0;
                A4SpriteOn <=1;
             end
             if ((xx>A4X-1) && (xx<A4X+A1Width) && (yy>A4Y-1) && (yy<A4Y+A1Height))
                begin
                A4address <= A4address + 1;
                A4SpriteOn <=1;
             end
             else
                A4SpriteOn <=0;
             if (BulletSpriteOn==1 && A4SpriteOn==1 && lives>0)
                begin
                A4Y<=479;
                score<=score+1;
                end
             else
             if (BulletSpriteOn2==1 && A4SpriteOn==1 && lives>0)
                begin
                A4Y<=479;
                score<=score+1;
                end
             end
        end
        
//        if (start==0)
//     begin
//        if (xx==639 && yy==479)
//         begin
//            delaliens5<=delaliens5+1;
//            if (delaliens5>1)
//                begin
//                    delaliens5<=0;
//                    if (A5X<=5)
//                        Adir5<=1;
//                    else if (A5X>=634-37)
//                        Adir5<=0;
//                    if (Adir5 == 1 && A5X<640-A2Width)
//                        begin
//                            A5X<=A5X+7;
//                            A5Y<=A5Y+4;
//                        end
//                    if (Adir5 == 0 && A5X>7)
//                         begin
//                             A5X<=A5X-7;
//                             A5Y<=A5Y+4;
//                         end
//                if (A5Y>=460 && A5Y<478)
//                    begin
//                    A5Y<=0;
//                    if (lives>0)
//                        begin
//                        lives<=lives-1;
//                        end
//                    if (Adir5==0)
//                        Adir5<=1;
//                    else
//                        Adir5<=0;
//                    end
//                end
//            end
//             if (aactive)
//                begin // check if xx,yy are within the confines of the Rocket
//             if (xx==A5X-1 && yy==A5Y)
//                begin
//                A5address <= 0;
//                A5SpriteOn <=1;
//             end
//             if ((xx>A5X-1) && (xx<A5X+A2Width) && (yy>A5Y-1) && (yy<A5Y+A2Height))
//                begin
//                A5address <= A5address + 1;
//                A5SpriteOn <=1;
//             end
//             else
//                A5SpriteOn <=0;
//             if (BulletSpriteOn==1 && A5SpriteOn==1 && lives>0)
//                begin
//                A5Y<=479;
//                score<=score+1;
//                end
//             else
//             if (BulletSpriteOn2==1 && A5SpriteOn==1 && lives>0)
//                begin
//                A5Y<=479;
//                score<=score+1;
//                end
//             end
//     end
     
//     if (start==0)
//     begin
//        if (xx==639 && yy==479)
//         begin
//            delaliens6<=delaliens6+1;
//            if (delaliens6>1)
//                begin
//                    delaliens6<=0;
//                    if (A6X<=5)
//                        Adir6<=1;
//                    else if (A6X>=634-38)
//                        Adir6<=0;
//                    if (Adir6 == 1 && A6X<640-A3Width)
//                        begin
//                            A6X<=A6X+8;
//                            A6Y<=A6Y+2;
//                        end
//                    if (Adir6 == 0 && A6X>8)
//                         begin
//                             A6X<=A6X-8;
//                             A6Y<=A6Y+2;
//                         end
//                if (A6Y>=460 && A6Y<478)
//                    begin
//                    A6Y<=0;
//                    if (lives>0)
//                        begin
//                        lives<=lives-1;
//                        end
//                    if (Adir6==0)
//                        Adir6<=1;
//                    else
//                        Adir6<=0;
//                    end
//                end
//            end
//             if (aactive)
//                begin // check if xx,yy are within the confines of the Rocket
//             if (xx==A6X-1 && yy==A6Y)
//                begin
//                A6address <= 0;
//                A6SpriteOn <=1;
//             end
//             if ((xx>A6X-1) && (xx<A6X+A3Width) && (yy>A6Y-1) && (yy<A6Y+A3Height))
//                begin
//                A6address <= A6address + 1;
//                A6SpriteOn <=1;
//             end
//             else
//                A6SpriteOn <=0;
//             if (BulletSpriteOn==1 && A6SpriteOn==1 && lives>0)
//                begin
//                A6Y<=479;
//                score<=score+1;
//                end
//              else
//              if (BulletSpriteOn2==1 && A6SpriteOn==1 && lives>0)
//                begin
//                A6Y<=479;
//                score<=score+1;
//                end
//             end
//       end   
       
//       if (start==0)
//     begin
//        if (xx==639 && yy==479)
//         begin
//            delaliens7<=delaliens7+1;
//            if (delaliens7>1)
//                begin
//                    delaliens7<=0;
//                    if (A7X<=5)
//                        Adir7<=1;
//                    else if (A7X>=634-36)
//                        Adir7<=0;
//                    if (Adir7 == 1 && A7X<640-A1Width)
//                        begin
//                            A7X<=A7X+5;
//                            A7Y<=A7Y+10;
//                        end
//                    if (Adir7 == 0 && A7X>5)
//                         begin
//                             A7X<=A7X-5;
//                             A7Y<=A7Y+10;
//                         end
//                if (A7Y>=460 && A7Y<478)
//                    begin
//                    A7Y<=0;
//                    if (lives>0)
//                        begin
//                        lives<=lives-1;
//                        end
//                    if (Adir7==0)
//                        Adir7<=1;
//                    else
//                        Adir7<=0;
//                    end
//                end
//            end
//             if (aactive)
//                begin // check if xx,yy are within the confines of the Rocket
//             if (xx==A7X-1 && yy==A7Y)
//                begin
//                A7address <= 0;
//                A7SpriteOn <=1;
//             end
//             if ((xx>A7X-1) && (xx<A7X+A1Width) && (yy>A7Y-1) && (yy<A7Y+A1Height))
//                begin
//                A7address <= A7address + 1;
//                A7SpriteOn <=1;
//             end
//             else
//                A7SpriteOn <=0;
//             if (BulletSpriteOn==1 && A7SpriteOn==1 && lives>0)
//                begin
//                A7Y<=479;
//                score<=score+1;
//                end
//             else
//             if (BulletSpriteOn2==1 && A7SpriteOn==1 && lives>0)
//                begin
//                A7Y<=479;
//                score<=score+1;
//                end
//             end
//     end
       
//     if (start==0)
//     begin
//        if (xx==639 && yy==479)
//         begin
//            delaliens8<=delaliens8+1;
//            if (delaliens8>1)
//                begin
//                    delaliens8<=0;
//                    if (A8X<=5)
//                        Adir8<=1;
//                    else if (A8X>=634-40)
//                        Adir8<=0;
//                    if (Adir8 == 1 && A8X<640-A2Width)
//                        begin
//                            A8X<=A8X+10;
//                            A8Y<=A8Y+1;
//                        end
//                    if (Adir8 == 0 && A8X>10)
//                         begin
//                             A8X<=A8X-10;
//                             A8Y<=A8Y+1;
//                         end
//                if (A8Y>=460 && A8Y<478)
//                    begin
//                    A8Y<=0;
//                    if (lives>0)
//                        begin
//                        lives<=lives-1;
//                        end
//                    if (Adir8==0)
//                        Adir8<=1;
//                    else
//                        Adir8<=0;
//                    end
//                end
//            end
//             if (aactive)
//                begin // check if xx,yy are within the confines of the Rocket
//             if (xx==A8X-1 && yy==A8Y)
//                begin
//                A8address <= 0;
//                A8SpriteOn <=1;
//             end
//             if ((xx>A8X-1) && (xx<A8X+A2Width) && (yy>A8Y-1) && (yy<A8Y+A2Height))
//                begin
//                A8address <= A8address + 1;
//                A8SpriteOn <=1;
//             end
//             else
//                A8SpriteOn <=0;
//             if (BulletSpriteOn==1 && A8SpriteOn==1 && lives>0)
//                begin
//                A8Y<=479;
//                score<=score+1;
//                end
//             else
//             if (BulletSpriteOn2==1 && A8SpriteOn==1 && lives>0)
//                begin
//                A8Y<=479;
//                score<=score+1;
//                end
//             end
//     end
       
 end
endmodule
