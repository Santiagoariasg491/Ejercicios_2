Algoritmo MayorDeEdad
	Definir edad Como Entero;
	Escribir "==================================================";
	Escribir "  VERIFICAR SI ES MAYOR DE EDAD";
	Escribir "==================================================";
	Escribir "";
	Escribir Sin Saltar "Escriba la edad de la persona en anios cumplidos: ";
	Leer edad;
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Edad registrada: ", edad, " anios";
	Si edad >= 18 Entonces
		Escribir "Veredicto: ES MAYOR DE EDAD";
		Escribir "Carne: de adulto, lo tramita la persona sola";
	SiNo
		Escribir "Veredicto: ES MENOR DE EDAD";
		Escribir "Carne: juvenil, necesita la firma de un acudiente";
	FinSi
FinAlgoritmo
