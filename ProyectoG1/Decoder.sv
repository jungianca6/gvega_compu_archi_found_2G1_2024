
module Decoder (
    input logic [1:0] bin,     // Entrada binaria para el display
    output logic [6:0] hex_result // Salida del primer display
);

    // Conexiones de puertas lógicas para hex_result1
    wire n_bin_0, n_bin_1;  // inversores para bin

    not (n_bin_0, bin[0]);  
    not (n_bin_1, bin[1]);

    // hex_result1[0] controla el segmento 'a' del display
    assign hex_result[0] = (n_bin_1 & bin[0]) ;

    // hex_result1[1] controla el segmento 'b' del display
    assign hex_result[1] = 1'b0;

    // hex_result1[2] controla el segmento 'c' del display
    assign hex_result[2] = (bin[1] & n_bin_0);

    // hex_result1[3] controla el segmento 'd' del display
    assign hex_result[3] = (n_bin_1 & bin[0]);

    // hex_result1[4] controla el segmento 'e' del display
    assign hex_result[4] = bin[0];

    // hex_result1[5] controla el segmento 'f' del display
    assign hex_result[5] = (bin[0])|(bin[1]);

    // hex_result1[6] controla el segmento 'g' del display1
    assign hex_result[6] = n_bin_1;

endmodule

	