//`timescale 1ns / 1ps

//module UART(
//    input logic reset_n, clk,
//    input [7:0]transmitter_data,
//    input logic startBTNC,startBTNU,
//    output [7:0]Reciever_data
//    );
//    logic sbit,BR1,BR2;
    
//    Baudrate_top BR(.clk(clk),
//                    .reset_n(reset_n),
//                    .BR1(BR1),
//                    .BR2(BR2)   
//                );

     
//    Transmitter Transmitter(
//    .clk(BR1),
//    .reset_n(reset_n),
//    .startBTNC(startBTNC),
//    .startBTNU(startBTNU),
//    .TX_Data(transmitter_data),
//    .TX_out(sbit)   
//    );
    
    
//    RecieverTop Reciever(
//    .BR1(BR1),
//    .BR2(BR2),          
//    .reset_n(reset_n),      
//    .rx_out(Reciever_data),
//    .tx_out(sbit)
//    );
    
//endmodule






`timescale 1ns / 1ps

module UART(
//    input [7:0]transmitter_data,
//    input logic startBTNC,startBTNU,
    
    input wire CLK100MHZ,     // Clock signal
    input wire CPU_RESETN,    // Active-low reset
    input wire [15:0] SW,     // Switch inputs
    input wire BTNU,    
    input wire BTNC,    
    output wire CA, CB, CC, CD, CE, CF, CG, DP,  // 7-segment outputs for register 1
    input logic JA[2:1],
    output wire [7:0] AN      // Digit enable signals
    );
    logic [7:0]Reciever_data, transmitter_data;
    logic startBTNC,startBTNU;
    
    assign transmitter_data = SW[7:0];
    logic sbit,BR1,BR2;
    Baudrate_top BR(.clk(CLK100MHZ),
                    .reset_n(CPU_RESETN),
                    .BR1(BR1),
                    .BR2(BR2)   
                );

     
    Transmitter Transmitter(
    .clk(BR1),
    .reset_n(CPU_RESETN),
    .startBTNC(BTNC),
    .startBTNU(BTNU),
    .TX_Data(transmitter_data),
    .TX_out(JA[2])   
    );
    
    
    RecieverTop Reciever(
    .BR1(BR1),
    .BR2(BR2),          
    .reset_n(CPU_RESETN),      
    .rx_out(Reciever_data),
    .tx_out(JA[1])
    );
    
    

sev_seg_top display1 (
        .CLK100MHZ(CLK100MHZ),
        .CPU_RESETN(CPU_RESETN),
        .CA(CA), .CB(CB), .CC(CC), .CD(CD), .CE(CE), .CF(CF), .CG(CG), .DP(DP),
        .AN(AN),
        .T(Reciever_data)  // Use the output of register 1 for the display
    );
    
endmodule