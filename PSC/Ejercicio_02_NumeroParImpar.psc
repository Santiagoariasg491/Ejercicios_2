Algoritmo NumeroParImpar
	Definir cantidad, residuo Como Entero;
	Escribir "==================================================";
	Escribir "  NUMERO PAR O IMPAR";
	Escribir "==================================================";
	Escribir "";
	Escribir Sin Saltar "Escriba cuantos estudiantes asistieron hoy: ";
	Leer cantidad;
	residuo <- cantidad % 2;
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Estudiantes que asistieron: ", cantidad;
	Escribir "Residuo de dividir entre 2: ", residuo;
	Si residuo = 0 Entonces
		Escribir "La cantidad es PAR";
		Escribir "Todos quedan emparejados, no sobra nadie";
	SiNo
		Escribir "La cantidad es IMPAR";
		Escribir "Queda un estudiante suelto y le toca con el profesor";
	FinSi
FinAlgoritmo
