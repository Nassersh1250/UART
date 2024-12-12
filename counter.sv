`timescale 1ns / 1ps


module counter(
    input logic clk,reset_n,en,
    input logic [3:0] comparitor,
    output logic [3:0] counter
    );
    
    always@(posedge clk or negedge reset_n) begin 
        if (reset_n == 0) begin
            counter <= 0;
            end
      else if (en) begin 
            if (counter < comparitor) begin 
                counter = counter +1;
                end
             else if (counter == comparitor) begin 
                counter <= 0;
                end
            
            end
          end
        
endmodule
