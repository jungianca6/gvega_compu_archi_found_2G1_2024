module mux_2to1 #(
    parameter n = 2 // Ancho de las entradas y salida
)(
    input logic [n-1:0] d0, d1,    // Entradas de datos
    input logic [1:0] sel,         // Selector de 2 bits
    output logic [n-1:0] y         // Salida seleccionada
);

    wire nSel0, nSel1;
    wire [n-1:0] and_d0, and_d1;
    
    // Generar los inversores para los selectores	 
	 not (nSel0, sel[0]);
	 not (nSel1, sel[1]);
    
    // AND lógico para seleccionar d0 cuando sel es 00
    assign and_d0 = {n{nSel1 & nSel0}} & d0;
    
    // AND lógico para seleccionar d1 cuando sel es 01
    assign and_d1 = {n{nSel1 & sel[0]}} & d1;
    
    // OR lógico para obtener la salida
    assign y = and_d0 | and_d1;

endmodule
