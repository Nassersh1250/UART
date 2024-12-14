`timescale 1ns / 1ps

module UART_TB;

logic [7:0] tx_data;
logic [7:0] rx_data;
logic reset_n, clk;
logic startBTNC,startBTNU;

always #5 clk = ~clk;


UART UART_TOP(.reset_n(reset_n),
              .clk(clk),
              .transmitter_data(tx_data),
              .startBTNC(startBTNC),
              .startBTNU(startBTNU),
              .Reciever_data(rx_data)
              );
initial begin
        clk = 0;
        reset_n = 0;
        tx_data = 8'b11111111;startBTNC = 0;startBTNU = 0;
        
        #5; reset_n = 1; tx_data = 8'b10110101;startBTNC = 1;startBTNU = 0;
        #20;

        
        $stop;  // End simulation
        
        
    end


endmodule

