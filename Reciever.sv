`timescale 1ns / 1ps


module Reciever(
    input logic tx_out, BR1,BR2, count1,reset_n,store,sample,Parity_sig,
    output logic find, stop, sampled,
    output logic [8:0] rx_out
    );
    
    
    logic [3:0] sample_count;
    logic [3:0] data_count;
    logic [3:0] comparitor;
    logic sampled_data ;
    
    assign comparitor = count1?4'b1111:4'b0111;
    
    counter samplecount(.clk(BR2),
                        .reset_n(reset_n),
                        .en(sample),
                        .comparitor(comparitor),
                        .counter(sample_count));
                        
    counter datacount(.clk(BR2),
                      .reset_n(reset_n),
                      .en(store),
                      .comparitor(8),
                      .counter(data_count));
                      
                      
    assign stop = (data_count == 8);
    assign sampled = (sample_count == comparitor);
    always@(*) begin 
        if (tx_out == 0) 
            find = 1;
        else 
            find = 0;
        end 
    
    
    always@(posedge BR2 or negedge reset_n) begin 
        if (reset_n == 0) begin 
            sampled_data <= 0;
            end
        else if (sample == 1) begin 
             
                sampled_data <=tx_out;
                
            end    
    end 
    
    always@(posedge BR2 or negedge reset_n) begin
          if (reset_n == 0) begin 
            rx_out <=0;
            end  
          else if (store) begin 
            rx_out[0] <= sampled_data;
            rx_out[1] <= rx_out[0];
            rx_out[2] <= rx_out[1];
            rx_out[3] <= rx_out[2];
            rx_out[4] <= rx_out[3];
            rx_out[5] <= rx_out[4];
            rx_out[6] <= rx_out[5];
            rx_out[7] <= rx_out[6];
            rx_out[8] <= rx_out[7];
//            stop  = 1;
          end 
          end
endmodule
