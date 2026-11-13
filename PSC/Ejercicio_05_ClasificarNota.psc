Algoritmo ClasificarNota
	Definir nota Como Real;
	Definir desempeno Como Caracter;
	Escribir "==================================================";
	Escribir "  CLASIFICAR EL DESEMPENO DE UNA NOTA";
	Escribir "==================================================";
	Escribir "";
	Escribir Sin Saltar "Escriba la nota definitiva del periodo (0.0 a 5.0): ";
	Leer nota;
	Si nota < 3 Entonces
		desempeno <- "BAJO";
	SiNo
		Si nota < 4 Entonces
			desempeno <- "BASICO";
		SiNo
			Si nota <= 4.5 Entonces
				desempeno <- "ALTO";
			SiNo
				desempeno <- "SUPERIOR";
			FinSi
		FinSi
	FinSi
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Nota definitiva    : ", nota, " puntos";
	Escribir "Nivel de desempeno : ", desempeno;
FinAlgoritmo
