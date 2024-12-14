module seven_seg_decoder(
    input wire [3:0] digit,  // 4-bit input representing a single hexadecimal digit (0 to F)
    output reg [6:0] Seg     // Output to 7-segment display (CA to CG)
);

    always @(*) begin
        case (digit)
            4'h0: Seg = 7'b1000000; // Display 0
            4'h1: Seg = 7'b1111001; // Display 1
            4'h2: Seg = 7'b0100100; // Display 2
            4'h3: Seg = 7'b0110000; // Display 3
            4'h4: Seg = 7'b0011001; // Display 4
            4'h5: Seg = 7'b0010010; // Display 5
            4'h6: Seg = 7'b0000010; // Display 6
            4'h7: Seg = 7'b1111000; // Display 7
            4'h8: Seg = 7'b0000000; // Display 8
            4'h9: Seg = 7'b0010000; // Display 9
            4'hA: Seg = 7'b0001000; // Display A
            4'hB: Seg = 7'b0000011; // Display b
            4'hC: Seg = 7'b1000110; // Display C
            4'hD: Seg = 7'b0100001; // Display d
            4'hE: Seg = 7'b0000110; // Display E
            4'hF: Seg = 7'b0001110; // Display F
            default: Seg = 7'b1111111; // Blank display
        endcase
    end

endmodule
