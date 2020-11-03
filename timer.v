`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/10 16:08:35
// Design Name: 
// Module Name: LogicSignalOut
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


module LogicSignalOut1(
    input clk,
    input resetn,
    output reg [7:0] signalout,bit,
    output reg [3:0] digit

    );
 
integer counter, num , n ,s01 , s10 ,m01, m10,z; 
reg [1:0] state, nextstate;

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;
parameter s3 = 2'b11;

parameter delay = 1;

always@(posedge clk , negedge resetn) begin // 0~9 LED
   if(!resetn) begin
      state <= s0;
      num <= 0; 
      counter <= 0; 
      signalout <= 8'b00000000;
      s01 <= 0;
      s10 <= 0;
      m01 <= 0;
      m10 <= 0;
      
   end       
         
   if(counter < 500000000) begin           
         counter <= counter + 1; //counter++       
   end       
   else begin       
      counter <= 0; // 카운터 초기화    
      if(s01 < 10) begin
      
        s01 <= s01 +1; // 분 1의 자리 ++
      end
      else begin
        s01 <= 0;
        s10 <= s10 +1;
      end    
       
       if(s01 < 9 )begin
            s01 <= 0;
            s10 <= s10 + 1;
       end    
       else if(s10 < 6) begin
            s10 <= 0;
            s01 <= 0;
            m01 <= m01 + 1;
       end
       else if(m01 < 9) begin
            s10 <= 0;
            m01 <= 0;
            m10 <= m10 + 1;
       end     
       else if(m10 < 6)
            m10 <= 0;         
            m01 <= 0;
  end                  
         
end 
 
always @(*) begin // state -> nextstate 반복
case(state)
s0 : nextstate <= s1;
s1 : nextstate <= s2;
s2 : nextstate <= s3;
s3 : nextstate <= s0;

default : nextstate <= s0;

endcase
end

always@(posedge clk ) begin // 0~9 LEd     
         
   if(counter < 123456) begin //적당히 잔상 줄수있는 만큼          
         counter <= counter + 1; //counter++       
   end       
   else begin       
      counter <= 0; // 카운터 초기화
      nextstate <= z; // 이부분은 알아서
end
end
always @(*) begin // digit 
   state <= nextstate;
end
 
always @(posedge clk, negedge resetn) begin //출력
   /*
   case(state)
      s0 : digit<= 4'b0000; num <= sec or min //state 에 따라 digit 및 num 값 설정
   */
if(!resetn)begin  
   signalout <= 8'b11111100;
   digit <= 4'b1110;
  end
else begin

    case(state)
        s0 : begin
        digit <= 4'b1110;
        num <= s01;
        end
        s1 : begin 
        digit <= 4'b1101;    
        num <= s10;
        end
        s2 : begin
        digit <= 4'b1011;
        num <= m01;
        end
        s3 : begin
        digit <= 4'b0111;
        num <= m10;
        end
    endcase
end                       
    case(num)
      1 : signalout <= 8'b0000001; // LED 0        
      2 : signalout <= 8'b1001111; // LED 1      
      3 : signalout <= 8'b0010010;        
      4 : signalout <= 8'b0000110;        
      5 : signalout <= 8'b1001100; 
      6 : signalout <= 8'b0100100;        
      7 : signalout <= 8'b0100000;        
      8 : signalout <= 8'b0001111;        
      9 : signalout <= 8'b0000000;        
      10 : signalout <= 8'b0000100; // LED 9     
      default : signalout <= 8'b1111111; // 초기값   
   endcase      
end
endmodule
