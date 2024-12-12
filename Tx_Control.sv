`timescale 1ns / 1ps

module Tx_Control(
    input logic clk,
    input logic reset_n,
    input logic startBTNC,
    input logic COUNT,Parity,
    output logic TX_load
    );
    
    
typedef enum logic [1:0] {
        IDLE,
        Transmit,
       ParityStop
    } state_t;
    
        state_t current_state, next_state;
        
        
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
    
  
    
    always_comb begin
        case (current_state)
        
        IDLE: begin if(startBTNC ==1) 
                    next_state = Transmit;    
                    else 
                    next_state = IDLE;
                end
        Transmit: begin  if(COUNT && !Parity ) //10
                    next_state = IDLE;
                   else if(COUNT && Parity )   //11
                      next_state = ParityStop; 
                      else                    
                      next_state = Transmit; 
                 end 
        ParityStop: begin 
                    next_state = IDLE;

                 end
                 
            default: next_state = IDLE;
        endcase
    end
    
    
         always_comb begin
                case (current_state)
                    IDLE: begin
                        TX_load =1;
                    end
                    
                    Transmit: begin
                        TX_load=0;
                    end
                     ParityStop: begin
                        TX_load =0;
                        
                    end
                    
                    default:  TX_load = 0;
                endcase
            end
            
            
endmodule
    
        
