module decoderAcumulator (
   input clk,
	input reset,
	
	input logic  y1, y0,  // y1 = C, y0 = D
	output logic y3, y2,   // y3 = A, y2 = B
	output logic yb1, yb0
);

	wire NOTy3, NOTy2, NOTy1, NOTy0;
	wire NOTbORNOTd, aXORc, aXNORc, firstHalf, secondHalf, bd, yZero, yOne;
	
	not (NOTy3, y3);            
   not (NOTy2, y2); 
	not (NOTy1, y1);
	not (NOTy0, y0);

	or (NOTbORNOTd, NOTy2, NOTy0);  // B' OR D'
	xor (aXORc, y3, y1);            // A XOR C
	and (firstHalf, NOTbORNOTd, aXORc);  // (B' OR D') AND (A XOR C)
	
	and (bd, y2, y0);               // B AND D
	xnor (aXNORc, y3, y1);          // A XNOR C
	and (secondHalf, bd, aXNORc);   // (B AND D) AND (A XNOR C)
	
	or (yOne, firstHalf, secondHalf); 
	assign yb1 = yOne;              // ( (B' OR D') AND (A XOR C) ) OR ( (B AND D) AND (A XNOR C))
	
	xor (yZero, y2, y0);            // B XOR D
	assign yb0 = yZero;


	
	always_ff @(posedge clk or posedge reset) begin
        if (reset) begin      // Si reset está activo, Q1 y Q2 se ponen a 0
            y3 <= 1'b0;
            y2 <= 1'b0;
        end else begin        // Si no hay reset, Q1 captura D1 y Q2 captura D2
            y3 <= yb1;
            y2 <= yb0;
        end
    end

endmodule
