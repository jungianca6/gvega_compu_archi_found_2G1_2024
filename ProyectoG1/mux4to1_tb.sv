module mux4to1_tb;
    logic [1:0] d0, d1, d2, d3;   // Entradas de datos de 2 bits
    logic [1:0] sel;              // Selector de 2 bits
    logic [1:0] y;                // Salida

    // Instanciamos el módulo mux_4to1
    mux_4to1 uut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .sel(sel),
        .y(y)
    );
    
    // Bloque inicial para las asignaciones de señales
    initial begin
        // Inicializamos los datos y selector
        d0 = 2'b00;
        d1 = 2'b00;
        d2 = 2'b00;
        d3 = 2'b00;
        sel = 2'b00;

        // Estimulamos las entradas
        #50
        d0 = 2'b00;
        d1 = 2'b01;
        d2 = 2'b10;
        d3 = 2'b11;
        sel = 2'b00;  // Se debería seleccionar d0

        #50
        sel = 2'b01;  // Se debería seleccionar d1

        #50
        sel = 2'b10;  // Se debería seleccionar d2

        #50
        sel = 2'b11;  // Se debería seleccionar d3

        #200;
        $finish;  // Finaliza la simulación
    end
   

endmodule
