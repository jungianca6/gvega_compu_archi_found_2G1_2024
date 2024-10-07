module Decoder (
	input logic [1:0] bin1,
	input logic [1:0] bin2,
	output logic [6:0] hex_result1,
	output logic [6:0] hex_result2	
);

	always @(bin1, bin2) begin
		case(bin1)
			2'b00: hex_result1 = 7'b1000000; // 0
			2'b01: hex_result1 = 7'b1111001; // 1
			2'b10: hex_result1 = 7'b0100100; // 2
			2'b11: hex_result1 = 7'b0110000; // 3
			default: hex_result1 = 7'b1000000;
		endcase
		
		case(bin2)
			2'b00: hex_result2 = 7'b1000000; // 0
			2'b01: hex_result2 = 7'b1111001; // 1
			2'b10: hex_result2 = 7'b0100100; // 2
			2'b11: hex_result2 = 7'b0110000; // 3
			default: hex_result2 = 7'b1000000;
		endcase	
	end

endmodule
	