module decoder_tb;
    logic a,b,c,d;
    logic y1,y0;

    decoderFingers uut (
        .a(a),
		  .b(b),
        .c(c),
        .d(d),
		  .y1(y1),
		  .y0(y0)
    );
	 
	 initial begin
        a = 1'b0;
        b = 1'b0;
        c = 1'b0;
        d = 1'b0;
    end

    initial begin
        #50
        a = 1'b0; 
        b = 1'b0; 
        c = 1'b0; 
        d = 1'b1;
		 	
        #50
        a = 1'b0; 
        b = 1'b0; 
        c = 1'b1; 
        d = 1'b1;
		  
		  #50
        a = 1'b0; 
        b = 1'b1; 
        c = 1'b1; 
        d = 1'b1;
		  
		  #50
        a = 1'b1; 
        b = 1'b1; 
        c = 1'b1; 
        d = 1'b1;
		  
		  #200;
        $finish;  // Finaliza la simulació     
    end
endmodule
	