module mux2to1_tb;
    logic [1:0] d0, d1;  
    logic [1:0] sel;            
    logic [1:0] y;         

    // Instanciamos el módulo mux_4to1
    mux_2to1 uut (
        .d0(d0),
        .d1(d1),
        .sel(sel),
        .y(y)
    );
    
    // Bloque inicial para las asignaciones de señales
    initial begin
        // Inicializamos los datos y selector
        d0 = 2'b00;
        d1 = 2'b00;
        sel = 2'b00;

        // Estimulamos las entradas
        #50
        d0 = 2'b11;
        d1 = 2'b10;
		  
		  #50
        sel = 2'b00;  // Se debería seleccionar d0

        #50
        sel = 2'b01;  // Se debería seleccionar d1

        #200;
        $finish;  // Finaliza la simulación
    end

endmodule
