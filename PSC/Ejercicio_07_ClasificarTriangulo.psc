Algoritmo ClasificarTriangulo
	Definir ladoA, ladoB, ladoC Como Real;
	Escribir "==================================================";
	Escribir "  CLASIFICAR UN TRIANGULO POR SUS LADOS";
	Escribir "==================================================";
	Escribir "";
	Escribir Sin Saltar "Escriba la medida del lado A en cm: ";
	Leer ladoA;
	Escribir Sin Saltar "Escriba la medida del lado B en cm: ";
	Leer ladoB;
	Escribir Sin Saltar "Escriba la medida del lado C en cm: ";
	Leer ladoC;
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Lado A: ", ladoA, " cm";
	Escribir "Lado B: ", ladoB, " cm";
	Escribir "Lado C: ", ladoC, " cm";
	Si (ladoA <= 0) O (ladoB <= 0) O (ladoC <= 0) Entonces
		Escribir "Medida no valida";
		Escribir "Los tres lados tienen que ser mayores que cero";
	SiNo
		Si (ladoA + ladoB > ladoC) Y (ladoA + ladoC > ladoB) Y (ladoB + ladoC > ladoA) Entonces
			Si (ladoA = ladoB) Y (ladoB = ladoC) Entonces
				Escribir "Tipo de triangulo: EQUILATERO";
				Escribir "Los tres lados miden lo mismo, se corta con plantilla";
			SiNo
				Si (ladoA = ladoB) O (ladoA = ladoC) O (ladoB = ladoC) Entonces
					Escribir "Tipo de triangulo: ISOSCELES";
					Escribir "Dos lados miden lo mismo, se traza uno por uno";
				SiNo
					Escribir "Tipo de triangulo: ESCALENO";
					Escribir "Los tres lados son distintos, se traza uno por uno";
				FinSi
			FinSi
		SiNo
			Escribir "Con estas medidas no se puede armar un triangulo";
			Escribir "La suma de dos lados siempre tiene que superar al tercero";
		FinSi
	FinSi
FinAlgoritmo
