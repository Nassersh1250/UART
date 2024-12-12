module ParityGenerator #(
    parameter PARITY_TYPE = 1,  
    parameter PARITY_ON = 0  
)(
    input  logic [7:0] data_in,  
    input  logic       enable,   
    output logic [8:0] data_out  
);

    logic parity_bit;

    
    always_comb begin
    
        if(PARITY_ON) begin
        parity_bit = ^data_in;
        if (PARITY_TYPE)      
         parity_bit = ~parity_bit;
               
        data_out={data_in, parity_bit} ;
        end
        else
        data_out={1'b0,data_in};
 
        
        
            end

   
//    assign data_out = enable ? {data_in, parity_bit} : {data_in, 1'b0};

endmodule


//module ParityGenerator #(
//    parameter PARITY_TYPE = 1,  
//    parameter PARITY_ON = 0  
//)(
//    input  logic [7:0] data_in,  
//    input  logic       enable,   
//    output logic [8:0] data_out  
//);

//    logic parity_bit;

    
//    always_comb begin
    
//        if(PARITY_TYPE) 
//        parity_bit = ^data_in;    
//         parity_bit = ~parity_bit;
        
//    end

   
//   assign data_out = enable ? {data_in, parity_bit} : {data_in, 1'b0};

//endmodule
