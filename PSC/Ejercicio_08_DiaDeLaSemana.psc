Algoritmo DiaDeLaSemana
	Definir dia Como Entero;
	Definir nombreDia, tipoDia Como Caracter;
	Escribir "==================================================";
	Escribir "  DIA DE LA SEMANA";
	Escribir "==================================================";
	Escribir "";
	Escribir Sin Saltar "Escriba el numero del dia, de 1 a 7, donde 1 es lunes: ";
	Leer dia;
	Segun dia Hacer
		1:
			nombreDia <- "Lunes";
		2:
			nombreDia <- "Martes";
		3:
			nombreDia <- "Miercoles";
		4:
			nombreDia <- "Jueves";
		5:
			nombreDia <- "Viernes";
		6:
			nombreDia <- "Sabado";
		7:
			nombreDia <- "Domingo";
		De Otro Modo:
			nombreDia <- "NO VALIDO";
	FinSegun
	Segun dia Hacer
		1,2,3,4,5:
			tipoDia <- "Dia habil";
		6,7:
			tipoDia <- "Fin de semana";
		De Otro Modo:
			tipoDia <- "No aplica";
	FinSegun
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Numero recibido : ", dia;
	Escribir "Dia de la semana: ", nombreDia;
	Escribir "Tipo de dia     : ", tipoDia;
FinAlgoritmo
