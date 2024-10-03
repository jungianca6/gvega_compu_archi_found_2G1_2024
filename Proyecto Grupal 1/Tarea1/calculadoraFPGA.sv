module calculadoraFPGA (
		input logic a,b,c,d,
		input clk,
		input reset,
		output logic [6:0] seg,
		output logic y1,y0,yb1,yb0
);

	decoderFingers decoder1 (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y1(y1),
        .y0(y0)
    );
	 
	 decoderAcumulator acumulator (
        .clk(clk),
        .reset(reset),
        .y1(y1),
        .y0(y0),
        .y3(y3),
        .y2(y2),
		  .yb1(yb1),
		  .yb0(yb0)
    );
	 
	 bin_to_7seg decoder(
		 .yb1(yb1),
		 .yb0(yb0), 
		 .seg(seg)
	);
	 
endmodule