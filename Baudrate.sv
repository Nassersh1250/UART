`timescale 1ns / 1ps

module Baudrate#(parameter n, N)(
    
    input clk, R,
    
    output reg  Q,
    output reg [31:0]count2
    );
    reg [n-1:0] count=0;
    always_ff@(negedge clk, negedge R)
        begin  
            if (R == 0) begin 
                Q<=0;
                count2 = 0;
                end
            else if (count == N-1)begin 
                Q<=~Q;
                count = 0;
                if (Q==1) count2<=count2+1;
                end
            else count=count+1;
        end 
endmodule
