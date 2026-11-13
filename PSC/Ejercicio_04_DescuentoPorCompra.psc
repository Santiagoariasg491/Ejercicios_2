Algoritmo DescuentoPorCompra
	Definir valorCompra, porcentaje, descuento, total Como Real;
	Escribir "==================================================";
	Escribir "  DESCUENTO POR MONTO DE COMPRA";
	Escribir "==================================================";
	Escribir "";
	Escribir Sin Saltar "Escriba el valor de la compra en pesos: ";
	Leer valorCompra;
	Si valorCompra > 100000 Entonces
		porcentaje <- 10;
	SiNo
		porcentaje <- 0;
	FinSi
	descuento <- valorCompra * porcentaje / 100;
	total <- valorCompra - descuento;
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Valor de la compra  : $ ", valorCompra;
	Escribir "Porcentaje aplicado : ", porcentaje, " por ciento";
	Escribir "Valor del descuento : $ ", descuento;
	Escribir "TOTAL A PAGAR       : $ ", total;
FinAlgoritmo
