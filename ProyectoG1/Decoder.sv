
module Decoder (
    input logic [1:0] bin1,     // Entrada binaria para el primer display
    input logic [1:0] bin2,     // Entrada binaria para el segundo display
    output logic [6:0] hex_result1, // Salida del primer display
    output logic [6:0] hex_result2  // Salida del segundo display
);

    // Conexiones de puertas lógicas para hex_result1
    wire n_bin1_0, n_bin1_1;  // inversores para bin1

    not (n_bin1_0, bin1[0]);
    not (n_bin1_1, bin1[1]);

    // hex_result1[0] controla el segmento 'a' del display
    // Este se activa con bin1 = 00 o bin1 = 10
    assign hex_result1[0] = (n_bin1_1 & n_bin1_0) | (bin1[1] & n_bin1_0);

    // hex_result1[1] controla el segmento 'b' del display
    // Este se activa con bin1 = 00 o bin1 = 01
    assign hex_result1[1] = (n_bin1_1 & n_bin1_0) | (n_bin1_1 & bin1[0]);

    // hex_result1[2] controla el segmento 'c' del display
    // Este se activa con bin1 = 00 o bin1 = 01
    assign hex_result1[2] = (n_bin1_1 & n_bin1_0) | (n_bin1_1 & bin1[0]);

    // hex_result1[3] controla el segmento 'd' del display
    // Este se activa con bin1 = 00 o bin1 = 10
    assign hex_result1[3] = (n_bin1_1 & n_bin1_0) | (bin1[1] & n_bin1_0);

    // hex_result1[4] controla el segmento 'e' del display
    // Este se activa con bin1 = 00 o bin1 = 10
    assign hex_result1[4] = (n_bin1_1 & n_bin1_0) | (bin1[1] & n_bin1_0);

    // hex_result1[5] controla el segmento 'f' del display
    // Este se activa con bin1 = 00 o bin1 = 01
    assign hex_result1[5] = (n_bin1_1 & n_bin1_0) | (n_bin1_1 & bin1[0]);

    // hex_result1[6] controla el segmento 'g' del display
    // Este se activa con bin1 = 10 o bin1 = 11
    assign hex_result1[6] = (bin1[1] & n_bin1_0) | (bin1[1] & bin1[0]);

    // Para hex_result2 sería lo mismo, pero utilizando bin2
    wire n_bin2_0, n_bin2_1;
    not (n_bin2_0, bin2[0]);
    not (n_bin2_1, bin2[1]);

    assign hex_result2[0] = (n_bin2_1 & n_bin2_0) | (bin2[1] & n_bin2_0);
    assign hex_result2[1] = (n_bin2_1 & n_bin2_0) | (n_bin2_1 & bin2[0]);
    assign hex_result2[2] = (n_bin2_1 & n_bin2_0) | (n_bin2_1 & bin2[0]);
    assign hex_result2[3] = (n_bin2_1 & n_bin2_0) | (bin2[1] & n_bin2_0);
    assign hex_result2[4] = (n_bin2_1 & n_bin2_0) | (bin2[1] & n_bin2_0);
    assign hex_result2[5] = (n_bin2_1 & n_bin2_0) | (n_bin2_1 & bin2[0]);
    assign hex_result2[6] = (bin2[1] & n_bin2_0) | (bin2[1] & bin2[0]);

endmodule

	