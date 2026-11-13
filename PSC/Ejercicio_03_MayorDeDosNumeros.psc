Algoritmo MayorDeDosNumeros
	Definir ventaAna, ventaCarlos, diferencia Como Real;
	Escribir "==================================================";
	Escribir "  QUIEN VENDIO MAS EN EL MES";
	Escribir "==================================================";
	Escribir "";
	Escribir Sin Saltar "Escriba el total vendido por Ana en el mes: ";
	Leer ventaAna;
	Escribir Sin Saltar "Escriba el total vendido por Carlos en el mes: ";
	Leer ventaCarlos;
	diferencia <- abs(ventaAna - ventaCarlos);
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Venta de Ana    : ", ventaAna, " pesos";
	Escribir "Venta de Carlos : ", ventaCarlos, " pesos";
	Escribir "Diferencia      : ", diferencia, " pesos";
	Escribir "";
	Si ventaAna > ventaCarlos Entonces
		Escribir "Gana el bono: ANA";
		Escribir "Ana vendio mas que Carlos este mes";
	SiNo
		Si ventaCarlos > ventaAna Entonces
			Escribir "Gana el bono: CARLOS";
			Escribir "Carlos vendio mas que Ana este mes";
		SiNo
			Escribir "Gana el bono: EMPATE";
			Escribir "Los dos vendieron lo mismo, el bono se reparte en partes iguales";
		FinSi
	FinSi
FinAlgoritmo
