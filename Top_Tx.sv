`timescale 1ns / 1ps

module Transmitter(
    input logic clk,
    input logic reset_n,
    input logic startBTNC,startBTNU,
    input reg [8:0] TX_Data,  
    output logic TX_out
);

       logic CountSig,load;


       TX_DataPath #(
            .COUNTER_WIDTH(4),
            .COUNTER_MAX(10),
            .SHIFT_REG_WIDTH(9)
        ) TX_DataPath_inst (
            .clk(clk),
            .reset_n(reset_n),
            .load(load),
            .parity_enable(startBTNU),
            .TX_data(TX_Data),
            .TX_out(TX_out),
            .CountSig(CountSig)
        );


    Tx_Control Tx_Control_inst (
        .clk(clk),
        .reset_n(reset_n),
        .startBTNC(startBTNC),
        .COUNT(CountSig),
        .Parity(1),
        .TX_load(load)
    );

endmodule
