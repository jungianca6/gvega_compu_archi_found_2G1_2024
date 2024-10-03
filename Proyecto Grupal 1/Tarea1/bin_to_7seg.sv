module bin_to_7seg (
	 input  logic yb1,yb0,  
    output logic [6:0] seg     
);
	logic [1:0] display;
		
  always_comb begin
		display[1] = yb1;
		display[0] = yb0;
  
  // Lógica para el decodificador a 7 segmentos
        case (display)
            2'b00: seg = 7'b1000000;  // 0
            2'b01: seg = 7'b1111001;  // 1
            2'b10: seg = 7'b0100100;  // 2
            2'b11: seg = 7'b0110000;  // 3
            default: seg = 7'b1111111;  // Apagado
        endcase
    end

endmodule
