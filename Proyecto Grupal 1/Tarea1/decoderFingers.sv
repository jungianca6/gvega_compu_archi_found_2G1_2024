module decoderFingers (
	input logic a,b,c,d,
	output logic y1, y0
);

	assign y1 = (~a & c);
	assign y0 = (~c | (~a & b));
	
endmodule

