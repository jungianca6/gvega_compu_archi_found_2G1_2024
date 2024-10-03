module calculadoraFPGA (
		input logic a,b,c,d,
		output logic [2:0] resultado,
		output logic [3:0] display,
		output logic y1,
      output  logic y0
);

	decoderFingers decoder1 (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y1(y1),
        .y0(y0)
    );


	
endmodule