`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/04 15:39:38
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


module LogicSignalOut(
    output reg [7:0] signalout,
    output reg [3:0] digit,
    input clk, 
    input reset
    );
    reg [1:0] state, next_state;
    integer count,count2,num,s01,s10,m01,m10,h01,h10;

    
    reg switch;
    
    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;
    
    parameter period = 49999999;
  
    
    always@ (posedge clk, negedge reset)
    begin
        if(!reset)
            state <= s0;
        else
            state <= next_state;
    end
    always@ (posedge clk, negedge reset)begin
        if(!reset)begin
            switch <= 0;
            count2 <= 0;
        end
        
        else begin
            if(count2 < 4999)begin
                count2 <= count2 + 1;
                switch <= 0;
            end
            
            else begin
                count2 <= 0;
                switch <= 1;
            end
        end
    end
    
    always@ (posedge switch)
    begin
        case(state)
        s0:begin
            next_state <= s1;
        end
        s1:begin
            next_state <= s2;
        end
        s2:begin
            next_state <= s3;
        end
        s3:begin
            next_state <= s0;
        end
        default:begin
            next_state <= s0;
        end
        endcase
        end

always@ (posedge clk, negedge reset)begin
        if(!reset)begin
            count <= 0;
            s01<=0;
            s10<=0;
            m01<=0;
            m10<=0;
            h01<=0;
            h10<=0;
         end
         
        
        
        else begin
            if(count < period)
                count <= count + 1;
                else begin
                    count <= 0;
                    
                    if(s01 < 9)
                        s01 <= s01 + 1;
                    else begin
                        
                        s10 <= s10+1;
                        s01 <= 0;
                    end
        end
         
         if(s10 > 5)begin
           m01 <= m01 + 1;
           s10 <= 0;
         end
         
         if(m01 > 9)begin
            m01 <= 0;
            m10 <= m10 + 1;
         end
         
         if(m10 > 5)begin
            m10 <= 0;
         end
         if(h01 > 4)begin
            h01 <= 0;
            h10 <= h10 +1;
         end
         if(h10 > 2)begin
            h10 <= 0; 
         end
      end
 end
 
always@ (posedge clk, negedge reset)begin
    if(!reset)begin
        signalout <= 8'b11000000;
        digit <= 4'b0001;
    end
    else begin
        case(state)
        s0:begin
            digit <= 4'b0001;
            num <= m01;
        end
        s1:begin
            digit <= 4'b0010;
            num <= m10;
        end
        s2:begin
            digit <= 4'b0100;
            num <= h01;
        end
        s3:begin
            digit <= 4'b1000;
            num <= h10;
        end
        default : begin
            digit <= 4'b0001;
            num <= m01;
        end
        endcase
        
        case(num)
        0:begin 
            signalout[7:0] <= 8'b11000000;
          end
        1:begin 
            signalout[7:0] <= 8'b11111001;
          end
        2:begin 
            signalout[7:0] <= 8'b10100100;
          end
        3:begin 
            signalout[7:0] <= 8'b10110000;
          end
        4:begin
            signalout[7:0] <= 8'b10011001;
          end
        5:begin
            signalout[7:0] <= 8'b10010010;
          end
        6:begin
            signalout[7:0] <= 8'b10000010;
          end
        7:begin
            signalout[7:0] <= 8'b11111000;
          end
        8:begin
            signalout[7:0] <= 8'b10000000;
          end
        9:begin
            signalout[7:0] <= 8'b10010000;
          end
        default : signalout[7:0] <= 8'b11000000;
        endcase
    end
end
        
endmodule
