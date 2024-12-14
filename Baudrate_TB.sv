`timescale 1ns / 1ps

module Baudrate_TB;

    // Parameters
    

    // Testbench signals
    reg clk;
    reg reset_n;  // Reset
    wire BR1,BR2;  // Output clock
    

    // Instantiate the DUT (Device Under Test)
    Baudrate_top  BRTOP (
        .clk(clk),
        .reset_n(reset_n),
        .BR1(BR1),
        .BR2(BR2)
    );
    
  

    // Clock generation
    always #5 clk = ~clk;  // 10 ns clock period (100 MHz)

    // Testbench process
    initial begin
        // Initialize signals
        clk = 0;
        reset_n = 0;

        // Apply reset
        #20 reset_n = 1;  // Release reset after 20 ns

        // Run the simulation for enough time to observe behavior
        #2000000;  // Simulate for 2 ms

        $stop;  // End simulation
    end

    // Monitor signals for debugging
    initial begin
        
    end
endmodule