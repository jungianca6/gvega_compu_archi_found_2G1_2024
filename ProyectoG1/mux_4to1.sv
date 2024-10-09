module mux_4to1 #(
    parameter n = 2 // Ancho de las entradas y salida
)(
    input logic [n-1:0] d0, d1, d2, d3, // Entradas de datos
    input logic [1:0] sel,              // Selector de 2 bits
    output logic [n-1:0] y              // Salida seleccionada
);
    
    wire [n-1:0] andOUT0, andOUT1, andOUT2, andOUT3;
    wire nSel0, nSel1;

    // Generar los inversores para los selectores	 
	 not (nSel0, sel[0]);
	 not (nSel1, sel[1]);
	 
	 
    // Generar las salidas de cada AND
    assign andOUT0 = d0 & {n{nSel1 & nSel0}}; // d0 seleccionada cuando sel = 00
    assign andOUT1 = d1 & {n{nSel1 & sel[0]}};   // d1 seleccionada cuando sel = 01
    assign andOUT2 = d2 & {n{sel[1] & nSel0}};   // d2 seleccionada cuando sel = 10
    assign andOUT3 = d3 & {n{sel[1] & sel[0]}};     // d3 seleccionada cuando sel = 11

    // OR final para seleccionar el resultado
    assign y = andOUT0 | andOUT1 | andOUT2 | andOUT3;

endmodule

