`timescale 1ns / 1ps

localparam N1 = 5209;
localparam N2 = 326;

localparam n1 = $clog2(N1);
localparam n2 = $clog2(N2);

module Baudrate_top(
    input logic clk,reset_n,
    output logic BR1,BR2
    
    );
    
    
    Baudrate #(.n(n1), .N(N1)) BR_x1 (
        .clk(clk),
        .R(reset_n),
        .Q(BR1)
    );
    
    Baudrate #(.n(n2), .N(N2)) BR_x16 (
        .clk(clk),
        .R(reset_n),
        .Q(BR2)
    );
endmodule
