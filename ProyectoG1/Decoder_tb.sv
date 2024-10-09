module Decoder_tb;

    // Definición de señales para las entradas y salidas del módulo Decoder
    logic [1:0] bin1, bin2;        // Entradas binarias
    logic [6:0] hex_result1;       // Salida del primer display
    logic [6:0] hex_result2;       // Salida del segundo display

    // Instanciamos el módulo Decoder
    Decoder uut (
        .bin1(bin1),
        .bin2(bin2),
        .hex_result1(hex_result1),
        .hex_result2(hex_result2)
    );

    // Bloque inicial para los estímulos de prueba
    initial begin
        // Mostramos el encabezado de la simulación
        $display("Time\t bin1\t bin2\t hex_result1\t hex_result2");
        $monitor("%0t\t %b\t %b\t %b\t %b", $time, bin1, bin2, hex_result1, hex_result2);

        // Aplicamos todas las combinaciones posibles para bin1 y bin2
        // bin1 = 2'b00; bin2 = 2'b00;
        bin1 = 2'b00; bin2 = 2'b00; #10;  // Espera 10 unidades de tiempo
        bin1 = 2'b00; bin2 = 2'b01; #10;
        bin1 = 2'b00; bin2 = 2'b10; #10;
        bin1 = 2'b00; bin2 = 2'b11; #10;
        
        bin1 = 2'b01; bin2 = 2'b00; #10;
        bin1 = 2'b01; bin2 = 2'b01; #10;
        bin1 = 2'b01; bin2 = 2'b10; #10;
        bin1 = 2'b01; bin2 = 2'b11; #10;

        bin1 = 2'b10; bin2 = 2'b00; #10;
        bin1 = 2'b10; bin2 = 2'b01; #10;
        bin1 = 2'b10; bin2 = 2'b10; #10;
        bin1 = 2'b10; bin2 = 2'b11; #10;

        bin1 = 2'b11; bin2 = 2'b00; #10;
        bin1 = 2'b11; bin2 = 2'b01; #10;
        bin1 = 2'b11; bin2 = 2'b10; #10;
        bin1 = 2'b11; bin2 = 2'b11; #10;

        // Finalizamos la simulación
        $finish;
    end

endmodule
