`timescale 1ns / 1ps

module Counter #(
    parameter WIDTH = 4,
    parameter MAX_COUNT = 10
)(
    input logic clk,
    input logic reset_n,
    input logic enable,
    output logic [WIDTH-1:0] count,
    output logic done
);
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            count <= 0;
            done <= 0;
        end else if (enable) begin
            if (count == MAX_COUNT) begin
                count <= 0;
                done <= 1;
            end else begin
                count <= count + 1;
                done <= 0;
            end
        end
    end
endmodule