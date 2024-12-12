`timescale 1ns / 1ps

module ShiftRegister #(
    parameter WIDTH = 10
)(
    input logic clk,
    input logic reset_n,
    input logic load,
    input logic shift,
    input logic [WIDTH-1:0] data_in,
    output logic data_out
);
    logic [WIDTH-1:0] shift_reg;

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            shift_reg <= 0;
            data_out <= 1;
        end else if (load) begin
        shift_reg <= {data_in,1'b0};
        end else if (shift) begin
            data_out <= shift_reg[0];
            shift_reg <= shift_reg >> 1;
        end
        else 
        data_out <=1;
    end
endmodule