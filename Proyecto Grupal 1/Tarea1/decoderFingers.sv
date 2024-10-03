module decoderFingers (
    input logic a, b, c, d,
    output logic y1, y0
);

    wire NOTa, NOTc, NOTac, NOTab;

    // Descripción de las compuertas lógicas
    not (NOTa, a);            
    not (NOTc, c);            
	 
    and (NOTac, NOTa, c);         
    and (NOTab, NOTa, b);        
	 
    or  (y0, NOTc, NOTab);     
    assign y1 = NOTac;         

endmodule

