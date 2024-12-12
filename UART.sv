`timescale 1ns / 1ps

module UART(
    input logic reset_n, clk,
    input [7:0]transmitter_data,
    input logic startBTNC,startBTNU,
    output [7:0]Reciever_data
    );
    logic sbit,BR1,BR2;
    
    Baudrate_top BR(.clk(clk),
                    .reset_n(reset_n),
                    .BR1(BR1),
                    .BR2(BR2)   
                );

     
    Transmitter Transmitter(
    .clk(BR1),
    .reset_n(reset_n),
    .startBTNC(startBTNC),
    .startBTNU(startBTNU),
    .TX_Data(transmitter_data),
    .TX_out(sbit)   
    );
    
    
    RecieverTop Reciever(
    .BR1(BR1),
    .BR2(BR2),          
    .reset_n(reset_n),      
    .rx_out(Reciever_data),
    .tx_out(sbit)
    );
    
endmodule
