`timescale 1ns / 1ps

module tx_tb;

  
    logic clk;
    logic reset_n;
    logic load;
    logic BTNC;
    logic [8:0] TX;
    logic TX_out;
    logic CountSig;

    Top_Tx uut (
        .clk(clk),
        .reset_n(reset_n),
        .startBTNC(BTNC),
        .TX_load(load),
        .TX(TX),
        .TX_out(TX_out),
        .CountSig(CountSig)
    );

   
    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    initial begin
        reset_n = 0;
        load = 0;
        TX = 0;
        

        #50;
        reset_n = 1; 
        BTNC=1;
        #20;
        TX = 9'b101010101; 
        load = 1;         
        #11;
        load = 0;         

      
        #200;

        $stop;
    end

  
    initial begin
        $monitor("Time: %0t | Reset: %b | Load: %b | TX: %b | TX_out: %b",
                 $time, reset_n, load, TX, TX_out);
    end

endmodule