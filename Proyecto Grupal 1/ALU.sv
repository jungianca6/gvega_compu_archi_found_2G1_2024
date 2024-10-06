module ALU # (parameter n = 4)(
	input logic [n-1:0] a, b,   	// entradas u operandos
	input logic [3:0] Operator, 	// codigo para la operacion
	output logic [n-1:0] Result,// resultado de la operacion
	output logic [n-1:0] binaryResult,
	output logic [6:0] display1,
	output logic [6:0] display2,
	
	output logic N, Z, C, V		 	// banderas de estado:
											// Negativo(N), Cero(Z), Acarreo(C), Desbordamiento (V) 
);

	//logic [n-1:0] extended_result; // resultado extendido para operaciones como MUL y DIV

	// definición de códigos de operación
	localparam [3:0] ADD = 4'b0000,
						  SUB = 4'b0001,
						  MUL = 4'b0010,
						  DIV = 4'b0011,
						  MOD = 4'b0100,
						  AND = 4'b0101,
						  OR  = 4'b0110,
						  XOR = 4'b0111,
						  SHL = 4'b1000,
						  SHR = 4'b1001; 

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

	// Instancia del multiplier
	wire [n-1:0] multiplier_result;
	wire [n-1:0] multiplier_Overf;
	multiplier_nb #(n) multiplier_inst (
		 .a(a),
		 .b(b),
		 .Overf(multiplier_Overf),
		 .Result(multiplier_result)
	);
	
	// Instancia del decoder
	Decoder decoder_inst (
		 .bin1(Result[3:0]),
		 .bin2(Operator),
		 .hex_result1(display1),
		 .hex_result2(display2)
	);
						  
	always_comb begin
		{N, Z, C, V} = 4'b0; // inicializacion de las banderas en "0000"
		//extended_result = {2*n{1'b0}}; // inicializacion del resultado extendido en "n...0"
		
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
			
			MUL: begin
				  Result = {multiplier_Overf, multiplier_result}; // multiplicacion
				  C = |multiplier_Overf;
			end
			
			DIV: begin
				  Result = a / b; // División
			end
			MOD: begin
				  Result = a % b; // Módulo
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
			SHL: begin
				  Result = a << b; // Shift left
			end
			SHR: begin
				  Result = a >> b; // Shift right
			end
			
			default: Result = {n{1'b0}}; // En caso de operación desconocida
		
		endcase
		
		N = Result[n-1];
		Z = (Result == {n{1'b0}});
		
		binaryResult = Result;
		
	end
	
endmodule
