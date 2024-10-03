module bin_to_7seg (
	 input  logic yb1,yb0,
    input  logic [1:0] display,   
    output logic [6:0] seg     
);
    always_comb begin
        case (display)
            2'b00: seg = 7'b1000000;  // 0
            2'b01: seg = 7'b1111001;  // 1
            2'b10: seg = 7'b0100100;  // 2
            2'b11: seg = 7'b0110000;  // 3
            default: seg = 7'b1111111;  // Apagado
        endcase
    end

endmodule
