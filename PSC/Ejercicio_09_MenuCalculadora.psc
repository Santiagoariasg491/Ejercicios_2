Algoritmo MenuCalculadora
	Definir opcion Como Entero;
	Definir num1, num2, resultado Como Real;
	Definir operacionValida Como Logico;
	Definir nombreOperacion Como Caracter;
	operacionValida <- Verdadero;
	Escribir "==================================================";
	Escribir "  CALCULADORA CON MENU DE OPCIONES";
	Escribir "==================================================";
	Escribir "";
	Escribir "  1. Sumar";
	Escribir "  2. Restar";
	Escribir "  3. Multiplicar";
	Escribir "  4. Dividir";
	Escribir "";
	Escribir Sin Saltar "Escriba el numero de la operacion (1 a 4): ";
	Leer opcion;
	Escribir Sin Saltar "Escriba el primer numero: ";
	Leer num1;
	Escribir Sin Saltar "Escriba el segundo numero: ";
	Leer num2;
	Segun opcion Hacer
		1:
			nombreOperacion <- "Suma";
			resultado <- num1 + num2;
		2:
			nombreOperacion <- "Resta";
			resultado <- num1 - num2;
		3:
			nombreOperacion <- "Multiplicacion";
			resultado <- num1 * num2;
		4:
			nombreOperacion <- "Division";
			Si num2 = 0 Entonces
				operacionValida <- Falso;
				Escribir "";
				Escribir "AVISO: no se puede dividir entre cero.";
				Escribir "       La division entre cero no esta definida en matematicas.";
			SiNo
				resultado <- num1 / num2;
			FinSi
		De Otro Modo:
			nombreOperacion <- "NINGUNA";
			operacionValida <- Falso;
			Escribir "";
			Escribir "AVISO: la opcion ", opcion, " no esta en el menu.";
			Escribir "       Las opciones validas son 1, 2, 3 y 4.";
	FinSegun
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Operacion elegida: ", nombreOperacion;
	Escribir "Primer numero    : ", num1;
	Escribir "Segundo numero   : ", num2;
	Si operacionValida Entonces
		Escribir "Resultado        : ", resultado;
	FinSi
FinAlgoritmo
