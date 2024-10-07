module mux_2to1 #(
    parameter n = 4 // Ancho de las entradas y salida
)(
    input logic [n-1:0] d0, d1, // Entradas de datos
    input logic sel,             // Selector de 1 bit
    output logic [n-1:0] y       // Salida seleccionada
);

    always_comb begin
        if (sel) 
            y = d1;
        else 
            y = d0;
    end

endmodule
