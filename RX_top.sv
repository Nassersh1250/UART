`timescale 1ns / 1ps

module RecieverTop(
    
    input logic reset_n,BR1,BR2,tx_out,
    output logic [8:0] rx_out
    );
    
     logic stop;
     logic sampled;
     logic find;
   
     logic count1;
     logic store;
     logic count1_out;
     logic Parity_sig;
     logic sample;
                
    Reciever receiver (
     .tx_out(tx_out),
     .BR1(BR1),
     .BR2(BR2),
     .find(find), 
     .stop(stop), 
     .rx_out(rx_out),
     .sampled(sampled),
     .count1(count1),
     .sample(sample),
     .Parity_sig(Parity_sig),
     .store(store),
     .reset_n(reset_n)
    );
  
    FSM_RX controller_rx(
    .clk(BR2),                               
    .reset_n(reset_n),
    .stop(stop),
    .sampled(sampled),
    .find(find),       
    .store(store),
    .count1(count1),
    .Parity_sig(Parity_sig),
    .sample(sample)    
    
    );
    
    
endmodule
