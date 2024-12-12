`timescale 1ns / 1ps


module TX_DataPath (
   input logic clk,
    input logic reset_n,
    input logic load,
    input logic [7:0] TX_data,
    input logic parity_enable,
    output logic TX_out,
    output logic CountSig
);
    parameter COUNTER_WIDTH = 4;
    parameter COUNTER_MAX = 9;
    parameter SHIFT_REG_WIDTH = 9;
    parameter PARITY_TYPE =0;
    
    logic [COUNTER_WIDTH-1:0] count;
    logic shift;
    logic [8:0] TX_Data_with_parity; 
   // logic CountSig;

    // Instantiate Parity Generator
    ParityGenerator #(
        .PARITY_TYPE(PARITY_TYPE),
        .PARITY_ON(1)
    ) ParityGen_inst (
        .data_in(TX_data),
        .enable(parity_enable),
        .data_out(TX_Data_with_parity)
    );
    Counter #(
        .WIDTH(COUNTER_WIDTH),
        .MAX_COUNT(COUNTER_MAX)
    ) counter_inst (
        .clk(clk),
        .reset_n(reset_n),
        .enable(load || shift),
        .count(count),
        .done(CountSig)
    );
    
    ShiftRegister #(
        .WIDTH(SHIFT_REG_WIDTH)
    ) shift_reg_inst (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .shift(shift),
        .data_in(TX_Data_with_parity),
        .data_out(TX_out)
    );
    
    assign shift = (count > 0 && count<= COUNTER_MAX);

endmodule