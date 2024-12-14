`timescale 1ns / 1ps

module recieve_TB;

    logic tx_out, BR1,BR2, count1,reset_n,store,sample,find,  stop,sampled;
    logic [8:0] rx_out;
    Baudrate_top baudrate(.*);
    Reciever rec(.*);
    
    reg clk;

      // Clock generation
    always #5 clk = ~clk;  // 10 ns clock period (100 MHz)
    always #100000 begin 
        store = ~store;
        sample = ~sample;
        count1 = ~count1;
        end
    // Testbench process
    initial begin
        // Initialize signals
        clk = 0;
        reset_n = 0;

        // Apply reset
        #20 reset_n = 1; tx_out = 1; count1 = 0; store = 0; sample = 0;  // Release reset after 20 ns

        // Run the simulation for enough time to observe behavior
        #2000000; 
        $stop;  // End simulation
    end

    // Monitor signals for debugging
    initial begin
        
    end
endmodule

