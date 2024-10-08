module mux_2to1 #(
    parameter n = 2 // Ancho de las entradas y salida
)(
    input logic [n-1:0] d0, d1, // Entradas de datos
    input logic [1:0] sel,             // Selector de 1 bit
    output logic [n-1:0] y       // Salida seleccionada
);

    always_comb begin
        case (sel)
            2'b00: y = d0;
            2'b01: y = d1;
            default: y = {n{1'b0}}; 
        endcase
    end

endmodule
