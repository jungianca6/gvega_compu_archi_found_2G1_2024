module ALU # (parameter n = 2)(
	input logic [n-1:0] a, b,   	// entradas u operandos
	input logic [1:0] Operator, 	// codigo para la operacion
	output logic [n-1:0] Result,// resultado de la operacion
	output logic [n-1:0] binaryResult,
	output logic [6:0] display1,
	output logic [6:0] display2,
	
	output logic N, Z, C, V		 	// banderas de estado:
											// Negativo(N), Cero(Z), Acarreo(C), Desbordamiento (V) 
);
						  
	wire [n-1:0] and_result, or_result;
	wire sum_overflow, sub_overflow;

	// Instancia del full_adder_nb
	wire [n-1:0] adder_result;
	wire adder_cout;
	full_adder_nb #(n) adder_inst (
		 .a(a),
		 .b(b),
		 .Cin(1'b0), // Asumiendo una suma sin acarreo de entrada
		 .Sum(adder_result),
		 .Cout(adder_cout)
	);

	// Instancia del full_subtract_nb
	wire [n-1:0] subtractor_result;
	wire subtractor_cout;
	full_subtractor_nb #(n) subtractor_inst (
		 .a(a),
		 .b(b),
		 .Cin(1'b0), // Asumiendo una resta sin acarreo de entrada
		 .Result(subtractor_result),
		 .Cout(subtractor_cout)
	);
	
	assign and_result = a & b;  //AND
	assign or_result = a | b;   //OR
	
	
	// Instancia del decoder
	Decoder result (
		 .bin(Result[n-1:0]),
		 .hex_result(display1)
	);
	
	Decoder operator (
		 .bin(Operator),
		 .hex_result(display2)
	);
	
	// Instancias de multiplexores para seleccionar la operación
    wire [n-1:0] selected_result;
    mux_4to1 #(n) result_mux (
        .d0(adder_result), 
        .d1(subtractor_result), 
        .d2(and_result), 
        .d3(or_result), 
        .sel(Operator[1:0]), // Se asume que solo se usan los primeros 2 bits de Operator
        .y(selected_result)
    );

    // Mux para el carry o borrow
    wire selected_cout;
    mux_2to1 #(1) cout_mux (
        .d0(adder_cout), 
        .d1(subtractor_cout), 
        .sel(Operator[1:0]), 
        .y(selected_cout)
    );
	 
	 assign sum_overflow = (a[n-1] == b[n-1]) && (Result[n-1] != a[n-1]);
    assign sub_overflow = (a[n-1] ^ subtractor_result[n-1]) & (a[n-1] ^ b[n-1]);
	 
	 wire selected_V;
    mux_2to1 #(1) overflow_mux (
        .d0(sum_overflow), 
        .d1(sub_overflow), 
        .sel(Operator[1:0]), 
        .y(selected_V)
    );
	 
	 // Asignación de resultados finales
    assign Result = selected_result;
	 assign binaryResult = Result;
	 
	 // Banderas de estado
    assign C = selected_cout;
    assign N = Result[n-1];
    assign Z = (Result == {n{1'b0}});
	 assign V = selected_V;
	 
	
endmodule
