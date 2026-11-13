Algoritmo LiquidacionFacturaEnergia
	Definir estrato, diasMora Como Entero;
	Definir consumo, tarifa, valorConsumo, porcentajeAjuste Como Real;
	Definir ajuste, interes, reconexion, alumbrado, total Como Real;
	Definir tipoAjuste Como Caracter;
	Escribir "==================================================";
	Escribir "  LIQUIDACION DE LA FACTURA DE ENERGIA";
	Escribir "==================================================";
	Escribir "";
	Escribir Sin Saltar "Escriba el estrato de la vivienda (1 a 6): ";
	Leer estrato;
	Escribir Sin Saltar "Escriba el consumo del mes en kWh: ";
	Leer consumo;
	Escribir Sin Saltar "Escriba los dias de mora de la factura anterior: ";
	Leer diasMora;
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Estrato            : ", estrato;
	Escribir "Consumo del mes    : ", consumo, " kWh";
	Escribir "Dias de mora       : ", diasMora, " dias";
	Escribir "";
	Si estrato < 1 O estrato > 6 O consumo < 0 O diasMora < 0 Entonces
		Escribir "DATOS INVALIDOS: la factura no se puede liquidar.";
		Escribir "El estrato debe estar entre 1 y 6.";
		Escribir "El consumo y los dias de mora no pueden ser negativos.";
	SiNo
		Si consumo <= 150 Entonces
			tarifa <- 520;
		SiNo
			Si consumo <= 350 Entonces
				tarifa <- 640;
			SiNo
				tarifa <- 780;
			FinSi
		FinSi
		valorConsumo <- consumo * tarifa;
		Segun estrato Hacer
			1:
				porcentajeAjuste <- -60;
			2:
				porcentajeAjuste <- -50;
			3:
				porcentajeAjuste <- -15;
			4:
				porcentajeAjuste <- 0;
			5,6:
				porcentajeAjuste <- 20;
			De Otro Modo:
				porcentajeAjuste <- 0;
		FinSegun
		ajuste <- valorConsumo * porcentajeAjuste / 100;
		Si porcentajeAjuste < 0 Entonces
			tipoAjuste <- "SUBSIDIO";
		SiNo
			Si porcentajeAjuste > 0 Entonces
				tipoAjuste <- "CONTRIBUCION";
			SiNo
				tipoAjuste <- "NINGUNO";
			FinSi
		FinSi
		Si diasMora = 0 Entonces
			interes <- 0;
		SiNo
			Si diasMora <= 30 Entonces
				interes <- valorConsumo * 3 / 100;
			SiNo
				interes <- valorConsumo * 6 / 100;
			FinSi
		FinSi
		Si diasMora > 60 Entonces
			reconexion <- 28000;
		SiNo
			reconexion <- 0;
		FinSi
		Si estrato = 5 O estrato = 6 Entonces
			alumbrado <- 12000;
		SiNo
			alumbrado <- 6000;
		FinSi
		total <- valorConsumo + ajuste + interes + reconexion + alumbrado;
		Escribir "Tarifa aplicada    : ", tarifa, " pesos por kWh";
		Escribir "Valor del consumo  : ", valorConsumo, " pesos";
		Escribir "Tipo de ajuste     : ", tipoAjuste;
		Escribir "Valor del ajuste   : ", ajuste, " pesos";
		Escribir "Interes por mora   : ", interes, " pesos";
		Escribir "Reconexion         : ", reconexion, " pesos";
		Escribir "Alumbrado publico  : ", alumbrado, " pesos";
		Escribir "TOTAL A PAGAR      : ", total, " pesos";
	FinSi
FinAlgoritmo
