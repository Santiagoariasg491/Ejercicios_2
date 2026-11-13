Algoritmo AnioBisiesto
	Definir anio, diasFebrero Como Entero;
	Escribir "==================================================";
	Escribir "  VERIFICAR SI UN ANIO ES BISIESTO";
	Escribir "==================================================";
	Escribir "";
	Escribir Sin Saltar "Escriba el anio que quiere verificar: ";
	Leer anio;
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Anio ingresado: ", anio;
	Si (anio % 4 = 0 Y anio % 100 <> 0) O (anio % 400 = 0) Entonces
		Escribir "El anio ", anio, " SI es bisiesto";
		diasFebrero <- 29;
	SiNo
		Escribir "El anio ", anio, " NO es bisiesto";
		diasFebrero <- 28;
	FinSi
	Escribir "Febrero tiene: ", diasFebrero, " dias";
FinAlgoritmo
