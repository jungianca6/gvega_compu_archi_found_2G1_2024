module ALU # (parameter n = 2)(
	input logic [n-1:0] a, b,   	// entradas u operandos
	input logic [2:0] Operator, 	// codigo para la operacion
	output logic [n-1:0] Result,// resultado de la operacion
	output logic [n-1:0] binaryResult,
	output logic [6:0] display1,
	output logic [6:0] display2,
	
	output logic N, Z, C, V		 	// banderas de estado:
											// Negativo(N), Cero(Z), Acarreo(C), Desbordamiento (V) 
);

	// definición de códigos de operación
	localparam [2:0] ADD = 3'b000,
						  SUB = 3'b001,
						  AND = 3'b010,
						  OR  = 3'b011,
						  XOR = 3'b111;

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
	
	// Instancia del decoder
	Decoder decoder_inst (
		 .bin1(Result[n-1:0]),
		 .bin2(Operator),
		 .hex_result1(display1),
		 .hex_result2(display2)
	);
						  
	always_comb begin
		{N, Z, C, V} = 4'b0; // inicializacion de las banderas en "0000"
		
		case(Operator)
			ADD: begin
				  Result = adder_result; // suma
				  C = adder_cout;
				  V = (a[n-1] == b[n-1]) && (adder_result[n-1] != a[n-1]);
			end
			
			SUB: begin
				  Result = subtractor_result; // Resta
				  C = subtractor_cout;
				  V = (a[n-1] ^ subtractor_result[n-1]) & (a[n-1] ^ b[n-1]);
			end
			
			AND: begin
				  Result = a & b; // AND
			end
			OR: begin
				  Result = a | b; // OR
			end
			XOR: begin
				  Result = a ^ b; // XOR
			end		
			default: Result = {n{1'b0}}; // En caso de operación desconocida
		
		endcase
		
		N = Result[n-1];
		Z = (Result == {n{1'b0}});
		
		binaryResult = Result;
		
	end
	
endmodule
