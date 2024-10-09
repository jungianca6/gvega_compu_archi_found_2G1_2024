module mux_4to1 #(
    parameter n = 2 // Ancho de las entradas y salida
)(
    input logic [n-1:0] d0, d1, d2, d3, // Entradas de datos
    input logic [1:0] sel,              // Selector de 2 bits
    output logic [n-1:0] y              // Salida seleccionada
);

    always_comb begin
        case (sel)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b10: y = d2;
            2'b11: y = d3;
            default: y = {n{1'b0}}; // Default a 0 si hay un error en el selector
        endcase
    end

endmodule
