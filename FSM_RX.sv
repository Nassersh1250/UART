`timescale 1ns / 1ps

module FSM_RX(
input logic clk,
input logic reset_n,
input logic find,sample1,sample2,pc,
output logic store,count1,stop,Parity_sig
);

typedef enum logic [3:0]{
IDEL,
sample_counter8,
sample_counter16,
store_sample,
parity,
stop_data,
Error
}state_t;

state_t p_state,n_state;

   always_ff@(posedge clk, negedge reset_n)
   begin
   
         if (~reset_n)
             p_state<=IDEL;
         else 
            p_state<=n_state;    
          
   end
   
     always@(*)
     begin 

         case(p_state)
         
         
         IDEL:
         
            if(find)
                n_state=sample_counter8;
            else 
                n_state=IDEL;
         
         sample_counter8:
         
            if(sample1==1)
                n_state=sample_counter16;
            else 
                n_state=sample_counter8;
         
         sample_counter16:
         
         if(sample2)
                n_state=store_sample;  
         else
                n_state=sample_counter16;
                
         store_sample:
         
         if(stop)
                n_state=parity;
         else
                         
                n_state=sample_counter16;
                
         parity: 
         
         if(pc)
                n_state=Error;
         else
                n_state=IDEL;
                
        Error:
        
        n_state=IDEL;
                
                
    endcase                         
         
  end
  
    always_comb begin  
    
    case(p_state)
    
    IDEL:    
    begin
    store=0;
    count1=0;
    stop=0;
    Parity_sig=0;
   end
    sample_counter8:
    begin
    store=0;
    count1=0;
    stop=0;
    Parity_sig=0;
   end
   
    sample_counter16:
   begin
    store=0;
    count1=1;
    stop=0;
    Parity_sig=0;
   end
   
    store_sample:
   begin
    store=1;
    count1=1;
    stop=0;
    Parity_sig=0;
   end
   
    parity:
   begin
    store=0;
    count1=0;
    stop=1;
    Parity_sig=0;
   end
   
    stop_data:
   begin
    store=0;
    count1=0;
    stop=0;
    Parity_sig=0;
   end
   
    Error:
    begin
    store=0;
    count1=0;
    stop=0;
    Parity_sig=0;
   end
   
   endcase
   
   end
   
   
    
       
endmodule