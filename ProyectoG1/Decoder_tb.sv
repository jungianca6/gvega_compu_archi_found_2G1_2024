module Decoder_tb;

    // Definición de señales para las entradas y salidas del módulo Decoder
    logic [1:0] bin;        // Entrada binaria
    logic [6:0] hex_result;       // Salida del primer display

    // Instanciamos el módulo Decoder
    Decoder uut (
        .bin(bin),
        .hex_result(hex_result)
    );

    // Bloque inicial para los estímulos de prueba
    initial begin
        // Aplicamos todas las combinaciones posibles para bin
        // bin1 = 2'b00;
        bin = 2'b00;  #50;  // Espera 10 unidades de tiempo
        
        bin = 2'b01;  #50;

        bin = 2'b10;  #50;
 
        bin = 2'b11;  #50;

        // Finalizamos la simulación
        $finish;
    end

endmodule
