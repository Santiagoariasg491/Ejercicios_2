# Soluciones explicadas

### Las 10 soluciones del cuadernillo de estructuras de decisión, paso a paso

> **Enunciados:** están en [Ejercicios.md](Ejercicios.md).
> **Código ejecutable:** cada solución tiene su archivo en la carpeta [PSC/](PSC/).
> **Todas las soluciones de este documento fueron ejecutadas realmente en PSeInt** con el perfil Estricto, y **cada camino de cada programa se ejecutó por separado**. Las salidas que aparecen en la sección 7 de cada solución son la salida literal del programa, no un ejemplo inventado.

---

## Cómo usar este documento

**No lo leas de corrido.** Se aprende a programar equivocándose, no leyendo soluciones. Úsalo así:

1. Intenta el ejercicio por tu cuenta hasta donde llegues.
2. Si te trabas, lee **solo** la sección **1. Análisis antes de programar** de la solución y vuelve a intentar.
3. Si sigue sin salir, lee la sección **3. La lógica explicada**. Ahí está de dónde sale la condición.
4. Solo al final mira el código.
5. Cuando ya te haya funcionado, lee la sección **8. Errores comunes**. Ahí casi siempre está el error que acabas de cometer, con nombre y apellido.

Tu solución no tiene que ser idéntica a esta. Si tus nombres de variables son distintos pero el programa toma el camino correcto en todos los casos de prueba, tu solución es válida. Lo que sí debe coincidir son **las respuestas de cada caso**.

---

## Aviso importante sobre los comentarios

En la sección **4. El código completo** de cada solución vas a ver el código **tal cual está en el archivo `.psc`**: sin un solo comentario.

En la sección **5. El código explicado bloque por bloque** vas a ver ese mismo código **con comentarios `//`** que explican cada línea.

**Esos comentarios existen únicamente en este documento. No los copies al archivo `.psc`.** PSeInt dibuja cada comentario como una caja adicional en el diagrama de flujo (`Ctrl + D`), lo ensucia y a veces hace que la generación del diagrama falle. En este cuadernillo eso pesa más que en el anterior: el diagrama de un programa con decisiones ya trae sus propios rombos y ramas, y llenarlo de cajas de texto lo vuelve imposible de leer.

| Dónde | Qué contiene |
|---|---|
| `PSC/Ejercicio_NN_*.psc` | **Solo código.** Limpio y ejecutable. |
| `Soluciones.md` (este archivo) | **Todas las explicaciones y comentarios.** |

---

## Estructura de cada solución

Las diez soluciones tienen exactamente las mismas ocho secciones:

| Sección | Qué encontrarás |
|---|---|
| 1. Análisis antes de programar | Entradas, proceso y salidas, identificados **antes** de escribir código |
| 2. Diccionario de datos | Cada variable, su tipo y por qué ese tipo |
| 3. La lógica explicada | De dónde sale la condición, por qué se escribe así y qué pasa si se escribe mal |
| 4. El código completo | Copia exacta del archivo `.psc` |
| 5. El código explicado bloque por bloque | El mismo código, ahora comentado línea por línea |
| 6. Prueba de escritorio | El valor de cada variable paso a paso, como si fueras el computador |
| 7. Ejecución real verificada | La salida literal que produjo PSeInt, un camino por corrida |
| 8. Errores comunes | Qué se escribe mal, qué pasa y cómo se arregla |

---

## Recordatorio de sintaxis

### Lo que ya sabías de Ejercicios_1

| Para... | Se escribe | Ejemplo |
|---|---|---|
| Declarar una variable | `Definir <nombre> Como <Tipo>;` | `Definir edad Como Entero;` |
| Pedir un dato al usuario | `Leer <variable>;` | `Leer edad;` |
| Guardar un resultado | `<variable> <- <expresión>;` | `total <- valor - descuento;` |
| Mostrar algo | `Escribir <cosa>, <cosa>;` | `Escribir "Edad: ", edad;` |
| Mostrar sin bajar de línea | `Escribir Sin Saltar <texto>;` | `Escribir Sin Saltar "Edad: ";` |

| Operador | Qué hace | Ejemplo | Resultado |
|---|---|---|---|
| `+` `-` `*` `/` | Suma, resta, multiplicación, división | `7 / 2` | `3.5` |
| `^` | Potencia | `3 ^ 2` | `9` |
| `%` | Residuo de la división | `7 % 2` | `1` |

### Lo nuevo de este cuadernillo

**Tipos de dato.** A los que ya conocías se suman dos:

| Tipo | Guarda | Ejemplo |
|---|---|---|
| `Entero` | Números sin decimales | `Definir edad Como Entero;` |
| `Real` | Números con decimales | `Definir nota Como Real;` |
| `Caracter` | Texto | `Definir nombreDia Como Caracter;` |
| `Logico` | Solo `Verdadero` o `Falso` | `Definir esValido Como Logico;` |

> **Ojo con `Caracter`:** a pesar del nombre, en PSeInt guarda un texto completo, no una sola letra. `nombreDia <- "Miercoles";` es correcto.

**Operadores relacionales.** Son los que convierten una comparación en una condición:

| Operador | Significa | Ejemplo | Resultado |
|---|---|---|---|
| `>` | mayor que | `5 > 3` | Verdadero |
| `<` | menor que | `5 < 3` | Falso |
| `>=` | mayor o igual que | `5 >= 5` | Verdadero |
| `<=` | menor o igual que | `4 <= 5` | Verdadero |
| `=` | igual a | `5 = 5` | Verdadero |
| `<>` | distinto de | `5 <> 3` | Verdadero |

> **El más traicionero es `=`.** Dentro de un `Si` **compara**; fuera de un `Si` no sirve para guardar nada, porque para eso está la flecha `<-`. Escribir `Si residuo <- 0 Entonces` es un error, y escribir `residuo = 0;` esperando guardar un valor, también.

**Operadores lógicos.** Juntan varias condiciones en una sola:

| Operador | Es verdadero cuando... | Ejemplo |
|---|---|---|
| `Y` | se cumplen **las dos** condiciones | `nota >= 3 Y nota < 4` |
| `O` | se cumple **al menos una** | `estrato = 5 O estrato = 6` |
| `NO` | la condición que sigue es falsa | `NO (edad >= 18)` |

**Estructuras de decisión.**

Decisión simple, un solo camino opcional:

```
Si <condición> Entonces
	<instrucciones>
FinSi
```

Decisión doble, dos caminos:

```
Si <condición> Entonces
	<instrucciones si se cumple>
SiNo
	<instrucciones si no se cumple>
FinSi
```

Decisión anidada, tres o más caminos. El segundo `Si` va **dentro** del `SiNo` del primero, y cada uno cierra con su propio `FinSi`:

```
Si <condición 1> Entonces
	<camino A>
SiNo
	Si <condición 2> Entonces
		<camino B>
	SiNo
		<camino C>
	FinSi
FinSi
```

Selección múltiple, para comparar una variable contra valores exactos:

```
Segun <variable> Hacer
	<valor1>:
		<instrucciones>
	<valor2>,<valor3>:
		<instrucciones para cualquiera de los dos>
	De Otro Modo:
		<instrucciones para todo lo demás>
FinSegun
```

**Orden en que se resuelve una condición** (de primero a último):

1. Lo que esté entre paréntesis `( )`
2. Las operaciones aritméticas: `^`, después `*` `/` `%`, después `+` `-`
3. Las comparaciones: `>` `<` `>=` `<=` `=` `<>`
4. `NO`
5. `Y`
6. `O`

Que `Y` se resuelva antes que `O` es la misma idea de que la multiplicación se resuelva antes que la suma. Aun así, en este cuadernillo los paréntesis se escriben siempre: una condición que se lee sola vale más que una que hay que descifrar.

---

## Solución del Ejercicio 1 — ¿Es mayor de edad?

### 1. Análisis antes de programar

En el cuadernillo anterior este paso consistía en separar qué entra, qué se calcula y qué sale. Aquí aparece algo nuevo: el proceso ya no es una cuenta, es **una pregunta**. El programa no tiene que calcular ningún número; tiene que mirar el dato que recibió, hacerse una pregunta sobre él y, según la respuesta, tomar uno de dos caminos.

| Entradas | Proceso | Salidas |
|---|---|---|
| `edad`: la edad de la persona en años cumplidos. La escribe el usuario por teclado. | Comparar la edad contra 18. Esa comparación no produce un número: produce **verdadero** o **falso**, y no hay una tercera posibilidad. | `edad`: la misma edad, repetida en pantalla para que la auxiliar confirme que no se equivocó al teclear. |
| (no hay más entradas) | Según esa respuesta, ejecutar uno de dos bloques de instrucciones. El otro bloque **no se ejecuta nunca** en esa corrida. | El veredicto: `ES MAYOR DE EDAD` o `ES MENOR DE EDAD`. Uno de los dos, jamás los dos. |
| | | El carné que le corresponde: el de adulto, o el juvenil con firma de acudiente. |

Fíjate en algo que va a valer para todos los ejercicios que siguen: la parte difícil de este programa no es escribirlo, son cinco líneas. La parte difícil es **decidir cuál es la pregunta exacta que hay que hacer**. Y esa decisión se toma en el cuaderno, no en el teclado. Si te sientas a escribir el `Si` esperando que la condición correcta se te ocurra mientras tecleas, vas a escribir la primera que suene bien en español, y en este ejercicio la que suena bien en español es precisamente la equivocada.

Escribe entonces, antes de tocar el computador, esta frase completa: "la persona recibe carné de adulto cuando su edad es de 18 años o más". Con esa frase escrita, traducirla a código es mecánico.

### 2. Diccionario de datos

| Variable | Tipo | Por qué ese tipo |
|---|---|---|
| `edad` | Entero | Los años cumplidos se cuentan de uno en uno y no se parten: nadie tiene 17.5 años cumplidos. Cuando cumples 17 tienes 17, y sigues teniendo 17 hasta el día en que cumples 18. Esa es exactamente la definición de un número entero. Si la declararas `Como Real`, PSeInt no marcaría ningún error, pero el programa aceptaría que alguien tecleara `17.5` y respondería con toda tranquilidad `ES MENOR DE EDAD`, dándole apariencia de dato válido a algo que en el mostrador de la biblioteca no significa nada. Declararla `Entero` hace que el propio programa rechace ese dato: al teclear `17.5` se detiene con `ERROR 313: No coinciden los tipos (EDAD), el valor ingresado debe ser un entero.` y no imprime ningún veredicto. Un programa que se niega a responder ante un dato absurdo es mejor que uno que responde cualquier cosa. |

**Este programa tiene una sola variable.** Puede parecer poco después de los cuatro y cinco datos del cuadernillo anterior, y por eso vale la pena decir en voz alta lo que no está en la tabla: el veredicto y el carné **no se guardan en ninguna variable**. Se escriben directo en pantalla dentro de la rama que corresponda. No hace falta guardarlos porque no se usan después para nada más: se imprimen y ahí se acaba el programa.

No siempre va a ser así. En el Ejercicio 5, el de las notas, el nivel de desempeño sí se guarda en una variable de tipo `Caracter`, porque allá la decisión y la impresión están separadas por varias líneas. La regla que sirve para los dos casos es esta: **una variable se crea cuando un valor tiene que sobrevivir a la línea donde nació.** Si el valor se usa y se olvida en el mismo renglón, no necesita variable.

### 3. La lógica explicada

**De dónde sale la condición.** El dato del problema es la ley: en Colombia se es mayor de edad **desde** el día en que se cumplen 18 años. La palabra que hay que leer con lupa es "desde". "Desde los 18" incluye a los 18. A quien cumplió 18 años hoy no le falta ni un día: ya es mayor de edad y ya puede tramitar el carné de adulto.

Ahora traduce eso a una frase que se pueda comparar. La persona recibe carné de adulto cuando su edad es **18 o más**. "18 o más" son dos posibilidades unidas: o la edad es mayor que 18, o la edad es igual a 18. Y hay un operador que pregunta exactamente eso de una sola vez:

```
Si edad >= 18 Entonces
```

El operador `>=` se lee "mayor o igual que". Da verdadero si se cumple **cualquiera** de las dos partes. No exige que se cumplan las dos, cosa que además sería imposible: un número no puede ser al mismo tiempo mayor que 18 e igual a 18.

**Cómo resuelve la máquina esa condición.** PSeInt no entiende la palabra `edad`. Lo primero que hace es reemplazarla por el valor que tiene guardado, y después evalúa la comparación que queda:

| Lo que escribes | Cómo lo resuelve la máquina | Resultado |
|---|---|---|
| `edad >= 18` con `edad` valiendo 20 | Reemplaza `edad` por 20 y queda `20 >= 18`. ¿20 es mayor que 18? Sí. Con eso ya basta, ni siquiera revisa la otra parte. | **Verdadero.** Se ejecuta la rama del `Entonces` y la del `SiNo` se salta completa. |
| `edad >= 18` con `edad` valiendo 15 | Queda `15 >= 18`. ¿15 es mayor que 18? No. ¿15 es igual a 18? Tampoco. Ninguna de las dos partes se cumple. | **Falso.** Se salta la rama del `Entonces` y se ejecuta la del `SiNo`. |
| `edad >= 18` con `edad` valiendo 18 | Queda `18 >= 18`. ¿18 es mayor que 18? No. ¿18 es igual a 18? Sí. Con que se cumpla una de las dos, la condición completa es verdadera. | **Verdadero.** Rama del `Entonces`: carné de adulto, que es lo que dice la ley. |

Esa tercera fila es todo el ejercicio. Guárdala.

**El error típico, demostrado con números.** La forma natural de decirlo en español es "si la edad es mayor de 18". Uno lo dice así en la conversación y nadie se confunde, porque el que escucha entiende la intención. El computador no entiende intenciones: hace literalmente lo que está escrito. Y `>` escrito solo, sin el `=`, significa *estrictamente* mayor, es decir "más grande, y no vale que sea igual".

Compara los dos operadores en todo el rango de edades que puede llegar al mostrador:

| `edad` | `edad > 18` | Camino que toma | `edad >= 18` | Camino que toma | ¿Coinciden? |
|---|---|---|---|---|---|
| 40 | Verdadero | mayor de edad | Verdadero | mayor de edad | Sí |
| 20 | Verdadero | mayor de edad | Verdadero | mayor de edad | Sí |
| 19 | Verdadero | mayor de edad | Verdadero | mayor de edad | Sí |
| **18** | **Falso** | **menor de edad** | **Verdadero** | **mayor de edad** | **No** |
| 17 | Falso | menor de edad | Falso | menor de edad | Sí |
| 15 | Falso | menor de edad | Falso | menor de edad | Sí |
| 9 | Falso | menor de edad | Falso | menor de edad | Sí |

Los dos operadores dan el mismo resultado en absolutamente todas las edades **menos en una**: el 18. Eso es lo que hace que este error sea tan difícil de cazar. Si pruebas tu programa con 20 y con 15, como haría cualquiera, las dos versiones responden igual de bien y te vas convencido de que quedó. El error se esconde en un solo valor de cien posibles.

Y el chiste amargo es que ese valor es justamente el que motivó el programa. La auxiliar no pidió ayuda con los señores de 40 ni con los niños de 9; con esos nunca se equivocó. Pidió ayuda con los de 18 recién cumplidos. Un programa que falla exactamente ahí no resuelve nada, y encima da la impresión de funcionar.

Así se ve la versión con `>` cuando se le teclea 18. Es una corrida real, no un ejemplo inventado:

```
------------------- RESULTADOS -------------------
Edad registrada: 18 anios
Veredicto: ES MENOR DE EDAD
Carne: juvenil, necesita la firma de un acudiente
```

Ni una advertencia, ni un mensaje de error, ni un color rojo. El programa terminó sin problemas y entregó una respuesta falsa. **A esto se le llama un error silencioso, y es el tipo de error que te va a acompañar todo el semestre.** No lo encuentra el computador: lo encuentras tú, probando el caso frontera.

**Qué es un caso frontera.** Es el valor exacto donde el programa cambia de camino. Aquí es el 18: en 17 responde una cosa y en 18 responde otra. Toda condición tiene su frontera, y la frontera es el único lugar donde `>` y `>=` se diferencian. De ahí sale la regla de prueba: **cuando tengas una condición con un número adentro, prueba ese número exacto.** No uno más ni uno menos: ese.

**Segundo error: escribir la condición al revés.** Otra forma de equivocarse es voltear los dos lados de la comparación y escribir `Si 18 >= edad`. Se ve parecido, pero pregunta lo contrario: "¿18 es mayor o igual que la edad?", o sea, "¿la persona tiene 18 años o menos?".

| `edad` | Lo que evalúa `18 >= edad` | Camino que toma el programa | Lo que debería responder |
|---|---|---|---|
| 20 | `18 >= 20` da Falso | menor de edad, carné juvenil | mayor de edad |
| 15 | `18 >= 15` da Verdadero | mayor de edad, carné de adulto | menor de edad |
| 18 | `18 >= 18` da Verdadero | mayor de edad, carné de adulto | mayor de edad |

Mira la última fila: con 18 acierta. Es una versión que se equivoca en casi todas las edades del mundo, pero pasa el caso frontera. Eso enseña la otra mitad de la lección: **un solo caso de prueba nunca alcanza, ni siquiera si es el más importante.** Hay que probar los tres: uno claramente de un lado, uno claramente del otro y el de la frontera. Los tres, siempre.

**Tercer error: `=>` en lugar de `>=`.** Los operadores de dos símbolos van pegados y en un orden fijo, y en PSeInt ese orden es primero el `>` y después el `=`. Si lo inviertes, este no es silencioso: el programa ni siquiera arranca.

```
Lin 12 (inst 1): ERROR 234: Falta operando (antes de >).
```

PSeInt leyó el `=` primero y se quedó esperando algo a la izquierda que no encontró. Aunque el mensaje suene enredado, agradécelo: te dice la línea exacta y se corrige en dos segundos. Los errores que el computador detecta son los baratos.

**Por qué solo se ejecuta una rama.** Esto es lo verdaderamente nuevo del ejercicio y conviene decirlo despacio. La estructura completa se lee así:

```
Si <condicion> Entonces
    bloque A
SiNo
    bloque B
FinSi
```

| Línea | Qué hace la máquina al llegar ahí |
|---|---|
| `Si <condicion> Entonces` | Evalúa la condición. El resultado es verdadero o falso, nunca otra cosa. |
| `bloque A` | Se ejecuta **solo** si la condición dio verdadero. Si dio falso, la máquina ni lo mira. |
| `SiNo` | No evalúa nada. Es la señal de "aquí empieza lo que se hace en todos los demás casos". |
| `bloque B` | Se ejecuta **solo** si la condición dio falso. |
| `FinSi` | Cierra la estructura. Aquí los dos caminos se vuelven a juntar y el programa sigue derecho. |

El programa deja de ser una línea recta: se abre en dos y se vuelve a cerrar. Las instrucciones que están antes del `Si` se ejecutan siempre; las que están después del `FinSi` también se ejecutan siempre, sin importar por dónde se haya pasado. Las de adentro, no: cada corrida recorre una sola de las dos ramas.

Por eso las dos líneas del carné van **dentro** de cada rama y no después del `FinSi`. Si sacas la línea `Escribir "Carne: de adulto...";` y la pones debajo del `FinSi`, se va a imprimir siempre, incluso cuando el veredicto diga que la persona es menor de edad. El resultado es este absurdo, que también es una corrida real, esta vez con edad 15:

```
Edad registrada: 15 anios
Veredicto: ES MENOR DE EDAD
Carne: de adulto, lo tramita la persona sola
```

En PSeInt lo que decide si una línea está adentro o afuera del `Si` no es la sangría, es su posición entre `Entonces`, `SiNo` y `FinSi`. La sangría con TAB es para que **tú** lo veas de un vistazo. Escríbela bien de todas formas: el día que tengas tres `Si` metidos uno dentro de otro, en el Ejercicio 7, va a ser lo único que te permita entender tu propio programa.

### 4. El código completo

Este es el archivo `PSC/Ejercicio_01_MayorDeEdad.psc` tal cual:

```
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
```

Son diecinueve líneas y ni un solo comentario. Cuéntalas por grupos: tres son la carcasa y la declaración (`Algoritmo`, `Definir` y `FinAlgoritmo`), seis se van en el banner y en pedir el dato, tres en mostrar la edad registrada con su separador, y las siete últimas, las del `Si`, son el ejercicio completo. Todo lo nuevo de este cuadernillo cabe en esas siete.

### 5. El código explicado bloque por bloque

**Advertencia importante: los comentarios que empiezan con `//` que vas a ver aquí abajo existen SOLO en esta explicación. NO los copies a tu archivo `.psc`.** PSeInt dibuja cada comentario como una caja extra dentro del diagrama de flujo (`Ctrl + D`), así que un programa comentado genera un diagrama lleno de cajas de texto que tapan la lógica. En este ejercicio eso se nota más que nunca, porque el diagrama del `Si` es un rombo del que salen dos flechas, y ese dibujo es justamente lo que vale la pena mirar. El archivo que entregas va limpio, sin un solo `//`.

**Bloque 1: la carcasa del programa.**

```
Algoritmo MayorDeEdad   // el nombre coincide con el del archivo, sin el prefijo Ejercicio_01_
	...                 // aqui adentro va todo el programa
FinAlgoritmo            // marca el final; sin esta linea PSeInt no ejecuta
```

Igual que en todos los programas del cuadernillo anterior. El nombre va pegado, sin espacios ni tildes, con mayúscula al comienzo de cada palabra. El archivo se llama `Ejercicio_01_MayorDeEdad.psc` y el algoritmo se llama `MayorDeEdad`: se le quita el prefijo `Ejercicio_01_` y la extensión, y lo que queda es el nombre.

**Bloque 2: la declaración.**

```
	Definir edad Como Entero;   // una sola cajita de memoria, para numeros sin decimales
```

Una sola variable, un solo `Definir`. En el perfil Estricto esto es obligatorio y va **antes** de usarla. Si borras esta línea, el programa alcanza a imprimir el banner y la pregunta, y se cae justo en el `Leer` con `ERROR 208: Variable no definida (EDAD).`

Fíjate en ese detalle, que vale para todo el semestre: alcanzó a mostrar cosas en pantalla antes de caerse. **Que un programa imprima algo no significa que esté bien.**

**Bloque 3: el banner.**

```
	Escribir "==================================================";   // 50 signos igual, exactos
	Escribir "  VERIFICAR SI ES MAYOR DE EDAD";                      // titulo, con 2 espacios de sangria
	Escribir "==================================================";   // la misma linea, se repite
	Escribir "";                                                     // linea en blanco: aire antes de preguntar
```

El banner es el mismo formato de todo el cuadernillo: dos líneas de exactamente 50 signos igual encerrando el título. Los dos espacios al comienzo del título no son un descuido, son la sangría que lo deja despegado del borde. `Escribir "";` imprime una línea vacía y sirve para que la pregunta no quede pegada al banner.

Nada de esto cambia el resultado del programa. Cambia si la persona que lo usa entiende qué le están pidiendo, que es la mitad del trabajo.

**Bloque 4: pedir el dato.**

```
	Escribir Sin Saltar "Escriba la edad de la persona en anios cumplidos: ";  // pregunta, sin bajar de linea
	Leer edad;                                                                 // detiene todo y guarda lo tecleado
```

`Escribir Sin Saltar` deja el cursor en la misma línea, así el número queda escrito al lado de la pregunta y no debajo. Por eso el texto termina en dos puntos y un espacio.

`Leer` es la única instrucción del programa que detiene la ejecución: se queda esperando a que alguien teclee algo y presione Enter, y guarda ese algo dentro de `edad`. Antes de esta línea la variable no tiene valor; después de esta línea ya se puede comparar. Fíjate en la palabra `anios` escrita así, sin la eñe, porque va dentro del `.psc`.

**Bloque 5: el separador y la edad registrada.**

```
	Escribir "";                                                    // linea en blanco
	Escribir "------------------- RESULTADOS -------------------";  // 19 guiones + RESULTADOS + 19 guiones
	Escribir "Edad registrada: ", edad, " anios";                   // etiqueta + valor + unidad
```

La línea de RESULTADOS también mide 50 caracteres, igual que la del banner, para que las dos queden alineadas en pantalla.

La tercera línea merece atención. Las comas van pegando pedazos en un solo renglón: primero el texto entre comillas, después el **valor** de la variable (el nombre va **sin** comillas; si escribieras `"edad"` entre comillas se imprimiría la palabra `edad` en lugar del número), y al final la unidad. Repetir en pantalla el dato que entró parece redundante, pero es lo que le permite a la auxiliar darse cuenta de que tecleó 81 cuando quería teclear 18.

Y hay una razón de fondo para que esta línea esté **antes** del `Si` y no dentro de las ramas: la edad registrada se muestra siempre, sin importar el camino. Todo lo que no depende de la decisión va afuera. Escribirla dos veces, una en cada rama, funcionaría, pero sería la misma línea repetida y el día que cambies el texto tendrías que acordarte de cambiarlo en dos sitios.

**Bloque 6: la decisión.**

```
	Si edad >= 18 Entonces                                           // la pregunta: verdadero o falso
		Escribir "Veredicto: ES MAYOR DE EDAD";                      // rama VERDADERA: solo si edad es 18 o mas
		Escribir "Carne: de adulto, lo tramita la persona sola";
	SiNo                                                             // "en todos los demas casos"
		Escribir "Veredicto: ES MENOR DE EDAD";                      // rama FALSA: solo si edad es 17 o menos
		Escribir "Carne: juvenil, necesita la firma de un acudiente";
	FinSi                                                            // cierra el bloque; aqui se juntan los caminos
```

Estas siete líneas son el ejercicio. Repasa la anatomía, porque se repite igual en los diez ejercicios de este cuadernillo:

- La línea del `Si` lleva la condición en el medio y la palabra `Entonces` al final, y **no termina en punto y coma**. Si se te olvida el `Entonces`, PSeInt responde `ERROR 32: Falta Entonces.` antes de ejecutar nada.
- `SiNo` va solo en su línea: sin condición, sin `Entonces` y sin punto y coma. Significa "en todos los demás casos", y por eso no necesita que le expliques cuáles son.
- `FinSi` cierra el bloque y tampoco lleva punto y coma. Si se te olvida, aparece `ERROR 117: Falta cerrar SI.`
- Las instrucciones de adentro sí llevan punto y coma, como cualquier instrucción normal, y van con un TAB más de sangría que la línea del `Si`.

Cada rama tiene dos `Escribir`: el veredicto y el carné. Podrías meter los dos textos en un solo `Escribir` separados por comas, pero saldrían en el mismo renglón y la salida se leería peor. Dos líneas, dos ideas.

Lo que nunca hay que perder de vista: **en una corrida cualquiera solo se ejecutan dos de estos cuatro `Escribir`.** Los otros dos están escritos en el archivo, existen, ocupan espacio, y esa vez no se ejecutan. Es la primera vez que te pasa eso en un programa.

### 6. Prueba de escritorio

Hacer la prueba de escritorio es ponerse en el lugar del computador con lápiz y papel: recorrer el programa línea por línea anotando qué vale cada variable y qué sale en pantalla. En este ejercicio sirve además para algo nuevo: **ver con los ojos cuáles líneas se saltan.**

Datos de prueba: **edad = 18**, el caso frontera. El signo `?` significa que la variable ya existe pero todavía no tiene valor.

| Paso | Instrucción | edad | Qué aparece en pantalla |
|---|---|---|---|
| 1 | `Definir edad Como Entero;` | ? | (nada, solo reserva la memoria) |
| 2 | `Escribir "=====...";` | ? | `==================================================` |
| 3 | `Escribir "  VERIFICAR SI ES MAYOR DE EDAD";` | ? | `  VERIFICAR SI ES MAYOR DE EDAD` |
| 4 | `Escribir "=====...";` | ? | `==================================================` |
| 5 | `Escribir "";` | ? | (una línea en blanco) |
| 6 | `Escribir Sin Saltar "Escriba la edad...";` | ? | `Escriba la edad de la persona en anios cumplidos: ` y el cursor se queda ahí mismo |
| 7 | `Leer edad;` (el usuario teclea 18) | **18** | (aparece el 18 que se tecleó) |
| 8 | `Escribir "";` | 18 | (una línea en blanco) |
| 9 | `Escribir "------ RESULTADOS ------";` | 18 | `------------------- RESULTADOS -------------------` |
| 10 | `Escribir "Edad registrada: ", edad, " anios";` | 18 | `Edad registrada: 18 anios` |
| 11 | `Si edad >= 18 Entonces` | 18 | (nada: evalúa `18 >= 18` y da **Verdadero**) |
| 12 | `Escribir "Veredicto: ES MAYOR DE EDAD";` | 18 | `Veredicto: ES MAYOR DE EDAD` |
| 13 | `Escribir "Carne: de adulto, lo tramita...";` | 18 | `Carne: de adulto, lo tramita la persona sola` |
| 14 | `SiNo` | 18 | (se salta: la condición ya fue verdadera) |
| 15 | `Escribir "Veredicto: ES MENOR DE EDAD";` | 18 | **(no se ejecuta)** |
| 16 | `Escribir "Carne: juvenil, necesita...";` | 18 | **(no se ejecuta)** |
| 17 | `FinSi` | 18 | (nada: aquí los dos caminos se vuelven a juntar) |
| 18 | `FinAlgoritmo` | 18 | (fin del programa) |

**Detalle del paso 11, hecho a mano tal como lo hace la máquina.** Lo escrito es `edad >= 18`. Primero la máquina reemplaza el nombre por el valor guardado y queda `18 >= 18`. Después evalúa las dos partes del operador por separado: "¿18 es mayor que 18?" da falso, porque un número no es mayor que sí mismo; "¿18 es igual a 18?" da verdadero. Como `>=` se conforma con que se cumpla **una** de las dos, el resultado de toda la condición es **Verdadero**. Con ese verdadero en la mano el programa entra por el `Entonces`, ejecuta los pasos 12 y 13, y salta hasta el `FinSi` sin ni siquiera leer los pasos 15 y 16.

Ese es el instante exacto en el que se decide todo. Si la condición estuviera escrita con `>`, la primera pregunta seguiría dando falso, la segunda ni se haría, el resultado sería **Falso**, y las líneas que se saltarían serían la 12 y la 13. El mismo dato, el mismo programa, un carácter de diferencia y el veredicto contrario.

**Qué habría pasado con otros datos.** El programa no cambia; lo único que cambia es por dónde pasa:

| Si el usuario teclea | `edad >= 18` se resuelve así | Camino que toma | Líneas que se ejecutan |
|---|---|---|---|
| 20 | `20 >= 18` da Verdadero | rama del `Entonces` | la 12 y la 13; se saltan la 15 y la 16 |
| 15 | `15 >= 18` da Falso | rama del `SiNo` | la 15 y la 16; se saltan la 12 y la 13 |
| 18 | `18 >= 18` da Verdadero | rama del `Entonces` | la 12 y la 13; se saltan la 15 y la 16 |
| 17 | `17 >= 18` da Falso | rama del `SiNo` | la 15 y la 16; se saltan la 12 y la 13 |

Los pasos del 1 al 11, y el 17, son idénticos en las cuatro corridas. Lo único que cambia es el interior del `Si`.

### 7. Ejecución real verificada

Estas son las salidas **reales y textuales** que produjo PSeInt al ejecutar el archivo bajo el perfil Estricto. El chequeo de sintaxis no reportó ni un error. Lo que aparece después del signo `>` es el dato que se tecleó.

**Corrida 1.** Datos escritos por teclado: `20`.

```
==================================================
  VERIFICAR SI ES MAYOR DE EDAD
==================================================

Escriba la edad de la persona en anios cumplidos: > 20

------------------- RESULTADOS -------------------
Edad registrada: 20 anios
Veredicto: ES MAYOR DE EDAD
Carne: de adulto, lo tramita la persona sola
```

Verificación a mano: la condición es `20 >= 18`. ¿20 es mayor que 18? Sí. Verdadero, entonces rama del `Entonces`: mayor de edad, carné de adulto. Correcto.

**Corrida 2.** Datos escritos por teclado: `15`.

```
==================================================
  VERIFICAR SI ES MAYOR DE EDAD
==================================================

Escriba la edad de la persona en anios cumplidos: > 15

------------------- RESULTADOS -------------------
Edad registrada: 15 anios
Veredicto: ES MENOR DE EDAD
Carne: juvenil, necesita la firma de un acudiente
```

Verificación a mano: la condición es `15 >= 18`. ¿15 es mayor que 18? No. ¿15 es igual a 18? Tampoco. Falso, entonces rama del `SiNo`: menor de edad, carné juvenil con acudiente. Correcto. Fíjate en que las dos líneas de la otra rama, las del carné de adulto, no aparecen por ninguna parte de la salida: estaban escritas en el archivo y no se ejecutaron.

**Corrida 3, el caso frontera.** Datos escritos por teclado: `18`. Esta es la corrida que decide si el ejercicio quedó bien o quedó mal.

```
==================================================
  VERIFICAR SI ES MAYOR DE EDAD
==================================================

Escriba la edad de la persona en anios cumplidos: > 18

------------------- RESULTADOS -------------------
Edad registrada: 18 anios
Veredicto: ES MAYOR DE EDAD
Carne: de adulto, lo tramita la persona sola
```

Verificación a mano: la condición es `18 >= 18`. ¿18 es mayor que 18? No. ¿18 es igual a 18? Sí. Con una de las dos basta, así que la condición es verdadera y la persona recibe carné de adulto. Es lo que dice la ley y es lo que la auxiliar necesitaba resolver.

Coincide exactamente con la prueba de escritorio de la sección 6, paso por paso. Y las tres corridas juntas cubren lo que hay que cubrir: una edad claramente por encima, una claramente por debajo y la de la frontera. **Si tu programa te da estas tres salidas, quedó bien. Si te da las dos primeras pero en la tercera dice `ES MENOR DE EDAD`, revisa el operador del `Si` antes de seguir al Ejercicio 2.**

### 8. Errores comunes en este ejercicio

| Lo que escribe el estudiante | Qué pasa | Cómo se arregla |
|---|---|---|
| `Si edad > 18 Entonces` | **Es el error de este ejercicio y no parece un error.** PSeInt no muestra ningún mensaje, `F9` no encuentra nada y el programa corre completo. Con 20 responde bien y con 15 también. Pero con 18 exactos imprime `Veredicto: ES MENOR DE EDAD` y le manda el carné juvenil a una persona que legalmente ya es adulta. Falla en un solo valor de todos los posibles, y ese valor es justamente el que motivó el programa. | Usar `>=`, que se lee "mayor o igual que": `Si edad >= 18 Entonces`. Y sobre todo, probar siempre con el número que aparece dentro de la condición. Si la condición dice 18, tu caso de prueba obligatorio es 18. |
| `Si 18 >= edad Entonces` | Otro error silencioso, y más traicionero todavía. La comparación quedó al revés: pregunta si 18 es mayor o igual que la edad, es decir si la persona tiene 18 años **o menos**. Con 20 responde `ES MENOR DE EDAD` y con 15 responde `ES MAYOR DE EDAD`, al contrario en las dos. Y con 18 acierta de casualidad, así que si solo probaras el caso frontera te lo tragarías entero. | Escribir siempre la variable a la izquierda y el valor de referencia a la derecha: `Si edad >= 18 Entonces`. Se lee de corrido, "si la edad es mayor o igual que 18", y así es mucho más difícil equivocarse. |
| Sacar el `Escribir` del carné y ponerlo debajo del `FinSi` | El programa corre sin quejarse, pero esa línea quedó fuera de las dos ramas y por lo tanto se ejecuta **siempre**. Con 15 imprime `Veredicto: ES MENOR DE EDAD` y enseguida `Carne: de adulto, lo tramita la persona sola`: dos líneas que se contradicen una a la otra. | Todo lo que dependa de la decisión va **entre** `Entonces` y `SiNo`, o **entre** `SiNo` y `FinSi`. Lo que va después del `FinSi` se ejecuta pase lo que pase. Revísalo mirando dónde están esas tres palabras clave, no mirando la sangría. |
| `Si edad => 18 Entonces` | El programa no arranca. PSeInt responde `ERROR 234: Falta operando (antes de >).` porque leyó el `=` primero y se quedó esperando algo a la izquierda que nunca llegó. | Los dos símbolos van pegados y en este orden: primero el mayor, después el igual, `>=`. Lo mismo aplica para `<=`. |
| Olvidar el `FinSi`, o poner el `SiNo` y no cerrar el bloque | El programa tampoco arranca: `ERROR 117: Falta cerrar SI.` Es un error de los buenos, de los que aparecen antes de ejecutar. | Cada `Si` se cierra con su propio `FinSi`. Acostúmbrate a escribir primero las tres líneas de la estructura vacía (`Si ... Entonces`, `SiNo`, `FinSi`) y a llenarlas después. En el Ejercicio 3, cuando haya dos `Si` anidados, esa costumbre te va a ahorrar media hora. |
| Escribir los textos con tildes o eñes, por ejemplo `"Carné: de adulto"` con tilde, o `"anios"` escrito con eñe | PSeInt no marca ningún error y la decisión funciona igual de bien, pero cómo se vean esas letras deja de depender de tu programa y pasa a depender de la consola donde se ejecute. En unas salen bien y en otras aparecen partidas o cambiadas por símbolos raros, y es el detalle que hace ver mal un trabajo entregado. | Dentro del `.psc` todo va sin tildes ni eñes: `Carne`, `anios`, `Veredicto`. Así se ve igual en cualquier computador. En los documentos `.md` sí se escriben con ortografía completa, porque esos se leen en el navegador y no en la consola. |
| Poner comentarios con `//` dentro del `.psc` para explicar el `Si` | El programa corre bien, pero al generar el diagrama de flujo con `Ctrl + D` PSeInt dibuja una caja extra por cada comentario. En este ejercicio el diagrama es un rombo con dos flechas saliendo, que es justo lo que vale la pena ver, y las cajas de texto lo tapan. | Dejar el `.psc` limpio, sin un solo `//`. La explicación va en este documento, no dentro del código. |

---

## Solución del Ejercicio 2 — ¿Par o impar?

### 1. Análisis antes de programar

Este cuadro se llena con lápiz y papel, antes de abrir PSeInt. Fíjate en que la columna del medio tiene dos partes bien separadas: primero se **calcula** un número y solo después se **decide** con él. Ese es todo el ejercicio.

| Entradas | Proceso | Salidas |
|---|---|---|
| `cantidad`: cuántos estudiantes asistieron hoy a la clase | 1. Repartir la cantidad en grupos de dos y quedarse con lo que sobra. Ese sobrante es el residuo.<br>2. Guardar ese residuo en su propia variable.<br>3. Preguntar si el residuo vale cero.<br>4. Si vale cero, la cantidad es par: todos quedan emparejados.<br>5. Si no vale cero, la cantidad es impar: sobra un estudiante y le toca con el profesor. | La cantidad registrada<br>El residuo de dividirla entre 2<br>El veredicto PAR o IMPAR con su consecuencia para la clase |

En el ejercicio anterior el proceso era casi nada: la edad llegaba del teclado y se comparaba de una vez contra 18. Aquí el dato que llega del teclado **no sirve para decidir tal como llega**. Nadie te va a escribir "soy par". Hay que fabricar el número que responde la pregunta y solo entonces preguntar. Por eso el paso 2 y el paso 3 son dos líneas distintas del programa y no una sola: **un `Si` no calcula, un `Si` pregunta**.

### 2. Diccionario de datos

| Variable | Tipo | Por qué ese tipo |
|---|---|---|
| `cantidad` | Entero | Los estudiantes se cuentan de uno en uno. No existe "asistieron ocho estudiantes y medio", así que un número entero representa el dato con exactitud y no hacen falta decimales. Declararla Entero además te protege de una entrada absurda: si alguien teclea `8.5`, PSeInt detiene el programa y muestra `ERROR 313: No coinciden los tipos (CANTIDAD), el valor ingresado debe ser un entero`. Si la declararas Real, el programa aceptaría `8.5` sin decir nada y a partir de ahí todo lo que siga es basura. |
| `residuo` | Entero | Es lo que sobra al repartir una cantidad entera en grupos de dos, y sobrar estudiantes es sobrar personas completas. En este programa solo puede valer 0 o 1, nunca otra cosa. El tipo Entero también trabaja de red de seguridad: si por equivocación escribes `residuo <- cantidad / 2;` (la división en lugar del residuo) y el profesor reporta 7 estudiantes, la división da 3.5, que no cabe en un Entero, y PSeInt frena el programa con `ERROR 314: No coinciden los tipos, el valor a asignar debe ser un entero`. Ojo con esto: esa red atrapa el error solo cuando la cantidad es impar. Con 8 estudiantes la división da 4, que sí es entero, el programa corre feliz y responde mal. Volvemos sobre esto en el punto 3. |

Las dos son Entero y comparten tipo, así que se declaran en una sola línea separadas por coma: `Definir cantidad, residuo Como Entero;`. Declarar cada variable en su propia línea también funciona; es cuestión de gusto, no de corrección.

### 3. La lógica explicada

**De dónde sale la condición**

La definición de número par que aprendiste en el colegio dice esto:

> Un número es par cuando se puede repartir en grupos de dos sin que sobre nada.

Léela otra vez y fíjate en dónde está la información: la definición **no habla del resultado de la división**, habla de lo que sobra. Si repartes 8 estudiantes en parejas te quedan 4 parejas y no sobra nadie; el 4 no aporta nada a la decisión, el que decide es el "no sobra nadie". Si repartes 7 te quedan 3 parejas y sobra 1; otra vez, el 3 no importa, importa el 1.

Ese sobrante tiene nombre en matemáticas, se llama **residuo**, y en PSeInt se saca con el operador `%`. Entonces la traducción de la definición al programa es directa:

- "lo que sobra al repartir la cantidad en grupos de dos" se escribe `cantidad % 2`
- "sin que sobre nada" se escribe `= 0`

Y de ahí salen las dos líneas del programa:

```
residuo <- cantidad % 2;
Si residuo = 0 Entonces
```

**El error clásico: `/` no es `%`**

Los dos símbolos hablan de la misma división, pero responden preguntas distintas. Esta tabla es la que hay que tener clara:

| Cantidad | `cantidad / 2` responde | `cantidad % 2` responde | ¿Cuál sirve para decidir si es par? |
|---|---|---|---|
| 8 | 4 — caben 4 parejas | 0 — no sobra nadie | El residuo. El 4 no dice nada sobre par o impar |
| 7 | 3.5 — media pareja no existe | 1 — sobra uno | El residuo |
| 12 | 6 | 0 | El residuo |
| 5 | 2.5 | 1 | El residuo |
| 25 | 12.5 | 1 | El residuo |
| 0 | 0 | 0 | El residuo, aunque aquí los dos coincidan |

Mira la columna del medio: los valores de `/` no se parecen entre sí (4, 3.5, 6, 2.5, 12.5, 0) y no hay forma de mirar uno solo y saber si el número era par. La columna de `%`, en cambio, solo produce dos valores en todo el universo de los números: 0 o 1. Por eso `%` sirve para decidir y `/` no.

**Qué pasa de verdad si escribes la condición con `/`**

Esto no es una advertencia teórica. Se escribió la versión equivocada, `Si cantidad / 2 = 0 Entonces`, se ejecutó en PSeInt y esto fue lo que respondió:

| Cantidad | Condición correcta `residuo = 0` | Condición equivocada `cantidad / 2 = 0` | Lo que imprimió el programa equivocado | ¿Acertó? |
|---|---|---|---|---|
| 8 | 0 = 0 es Verdadero, va a PAR | 4 = 0 es Falso, va a IMPAR | `La cantidad es IMPAR` | **No.** 8 es par |
| 7 | 1 = 0 es Falso, va a IMPAR | 3.5 = 0 es Falso, va a IMPAR | `La cantidad es IMPAR` | Sí, pero de pura casualidad |
| 0 | 0 = 0 es Verdadero, va a PAR | 0 = 0 es Verdadero, va a PAR | `La cantidad es PAR` | Sí, pero de pura casualidad |

Detente en esa tabla, porque enseña algo más grande que este ejercicio. El programa equivocado **acertó dos de los tres casos**. Si el estudiante lo prueba con 7 y con 0 y se queda tranquilo, entrega un programa roto convencido de que funciona. Y PSeInt no lo ayuda: las tres corridas terminaron sin un solo mensaje de error, porque para la máquina `4 = 0` es una comparación perfectamente válida entre dos números. La cuenta está bien hecha; la que está mal planteada es la pregunta. **Un programa que da la respuesta correcta no siempre está bien escrito; a veces solo tuvo suerte con los datos de prueba.**

De hecho, esa condición equivocada responde IMPAR para absolutamente todo, menos para el cero. La única cantidad del mundo que hace que `cantidad / 2` valga 0 es la cantidad 0.

**El otro error: la flecha metida dentro de la condición**

El segundo tropiezo típico es escribir `Si residuo <- 0 Entonces`. Suena razonable si uno piensa "quiero que residuo sea cero", pero eso no es lo que uno quiere: uno quiere **preguntar** si residuo ya es cero.

Lo grave es que PSeInt no lo rechaza. Se ejecutó y arrancó sin un solo error. La razón es que PSeInt no ve una flecha ahí adentro: ve el símbolo de "menor que" seguido de un signo menos, es decir, lee `residuo < -0`, que se pronuncia "¿residuo es menor que cero negativo?". Y un residuo nunca es negativo, así que la respuesta siempre es Falso y el programa siempre se va por el `SiNo`. Esto es lo que devolvió al ejecutarlo:

| Cantidad | `residuo` vale | Lo que PSeInt entiende: `residuo < -0` | Rama que toma | Lo que imprimió | ¿Acertó? |
|---|---|---|---|---|---|
| 8 | 0 | 0 < 0 es Falso | `SiNo` | `La cantidad es IMPAR` | **No** |
| 7 | 1 | 1 < 0 es Falso | `SiNo` | `La cantidad es IMPAR` | Sí, de casualidad |
| 0 | 0 | 0 < 0 es Falso | `SiNo` | `La cantidad es IMPAR` | **No** |

La rama del `Entonces` nunca se ejecuta. Es código muerto: está escrito, se ve bonito en la pantalla y no corre jamás.

**Los dos símbolos que se parecen: `<-` y `=`**

Esta es la confusión que este ejercicio viene a resolver de una vez por todas:

| Símbolo | Dónde se usa | Qué hace | Ejemplo de este programa |
|---|---|---|---|
| `<-` | En una línea propia, fuera de cualquier condición | **Guarda.** Toma el valor de la derecha y lo mete en la variable de la izquierda, borrando lo que hubiera antes | `residuo <- cantidad % 2;` |
| `=` | Dentro de la condición de un `Si` | **Pregunta.** Compara los dos lados y responde Verdadero o Falso. No guarda nada, no cambia nada | `Si residuo = 0 Entonces` |

Y funciona igual al revés: si sacas el `=` de la condición y lo usas para asignar, escribiendo `residuo = cantidad % 2;` como línea suelta, PSeInt sí lo detecta y muestra `ERROR 106: Instruccion no valida` en esa línea. Es decir, el error de usar `=` para guardar te lo avisan; el de usar `<-` para preguntar no. Por eso el segundo es más peligroso.

**El caso frontera: el cero es par**

Mucha gente cree que el cero no es ni par ni impar, o que hay que tratarlo aparte con un `Si` especial. Ninguna de las dos cosas. Aplica la definición sin adornos: ¿se pueden repartir 0 estudiantes en grupos de dos sin que sobre nadie? Sí, se forman cero parejas y no sobra nadie. Entonces el cero es par.

Y la cuenta lo confirma sola: `0 % 2` pregunta cuánto sobra después de sacar todas las parejas posibles de 0 estudiantes. No se saca ninguna pareja y no queda nadie por fuera, así que el residuo es 0. La condición `residuo = 0` da Verdadero y el programa responde PAR sin que tú hayas escrito una sola línea especial para ese caso. **Cuando una fórmula está bien planteada, los casos raros se resuelven solos.** Si te ves obligado a agregar un `Si` extra para el cero, es señal de que la fórmula principal está mal.

### 4. El código completo

Este es el archivo `PSC/Ejercicio_02_NumeroParImpar.psc` tal cual:

```
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
```

Son veintiún líneas y no hay ni un comentario. Así es como se entrega.

### 5. El código explicado bloque por bloque

**Advertencia importante: los comentarios que empiezan con `//` que vas a ver aquí abajo existen SOLO en esta explicación. NO los copies a tu archivo `.psc`.** PSeInt dibuja cada comentario como una caja extra dentro del diagrama de flujo (`Ctrl + D`), y el diagrama termina lleno de cajitas de texto que estorban para leerlo. El archivo que entregas va limpio. Fíjate también en que estos comentarios están escritos sin tildes, por la misma razón por la que el resto del código no las lleva.

**Bloque 1: el encabezado y la declaración**

```
Algoritmo NumeroParImpar
	Definir cantidad, residuo Como Entero;   // Dos variables, las dos Entero, declaradas en una sola linea
```

El nombre que va después de `Algoritmo` tiene que ser exactamente `NumeroParImpar`, igual que el nombre del archivo sin el `Ejercicio_02_` del principio ni el `.psc` del final. Toda variable se declara antes de usarse, y como las dos comparten tipo caben en una sola línea separadas por coma.

Fíjate en que `residuo` se declara aquí aunque su valor no llegue del teclado. Una variable no es solo un buzón para lo que escribe el usuario: también sirve para guardar resultados intermedios que tú fabricas. Este es el primer programa del cuadernillo donde eso pasa.

**Bloque 2: el banner que ve el usuario**

```
	Escribir "==================================================";   // Marco de arriba del titulo
	Escribir "  NUMERO PAR O IMPAR";                                  // El titulo, con dos espacios de sangria
	Escribir "==================================================";   // Marco de abajo
	Escribir "";                                                      // Linea en blanco, para que la pantalla respire
```

La línea de signos igual tiene exactamente 50 caracteres, igual que el separador de resultados que aparece más abajo. Que las dos midan lo mismo es lo que hace que la pantalla se vea alineada y no torcida. `Escribir ""` imprime una línea vacía; es puro orden visual, pero un programa que se lee bien vale más que uno que escupe texto apretujado.

**Bloque 3: pedir el dato**

```
	Escribir Sin Saltar "Escriba cuantos estudiantes asistieron hoy: ";   // Sin Saltar deja el cursor en la MISMA linea
	Leer cantidad;                                                        // Lo que teclee el profesor queda guardado en cantidad
```

`Escribir Sin Saltar` no baja el cursor al terminar, así que el profesor escribe el número justo al lado del mensaje y no una línea más abajo. Nunca pongas un `Leer` pelado: el usuario vería la pantalla en blanco sin saber qué se espera de él.

**Bloque 4: el cálculo que fabrica la condición**

```
	residuo <- cantidad % 2;   // Aqui SE CALCULA la respuesta. La flecha guarda el resultado en residuo
```

Esta es la línea nueva del ejercicio y merece que la mires sola. Ocurren tres cosas, en este orden: primero PSeInt calcula `cantidad % 2`, o sea cuánto sobra al repartir la cantidad en grupos de dos; después toma ese resultado; y por último la flecha lo guarda dentro de `residuo`, borrando lo que hubiera antes. La flecha siempre trabaja de derecha a izquierda.

Esta línea va **antes** del `Si` y a la fuerza. El `Si` no calcula nada, solo mira valores que ya existen. Si movieras esta línea después del `FinSi`, el `Si` preguntaría por una variable que todavía no tiene valor, y PSeInt no lo deja pasar: se detiene con `ERROR 215: Variable no inicializada (RESIDUO)`. Está comprobado, no es una suposición.

**Bloque 5: mostrar lo que se leyó y el número de la decisión**

```
	Escribir "";                                                     // Linea en blanco antes del separador
	Escribir "------------------- RESULTADOS -------------------";   // Separador de 50 caracteres, igual de largo que el banner
	Escribir "Estudiantes que asistieron: ", cantidad;               // Se repite el dato leido para dejar constancia
	Escribir "Residuo de dividir entre 2: ", residuo;                // Se muestra el numero del que depende TODA la decision
```

La coma dentro de `Escribir` pega texto y variables en una misma línea de salida. Ningún número sale solo: siempre lleva su etiqueta.

La cuarta línea es opcional para el profesor de educación física, que solo quiere saber si es par o impar, pero es obligatoria para ti mientras aprendes. Cuando una decisión depende de un número intermedio, imprimir ese número es la forma más rápida de entender por qué el programa respondió lo que respondió. Si algún día el veredicto te sale al revés, mira primero el residuo: si el residuo está bien y el veredicto está mal, el error está en la condición; si el residuo ya viene mal, el error está en el cálculo. Acabas de partir el problema en dos.

**Bloque 6: la decisión**

```
	Si residuo = 0 Entonces                                                  // Aqui el signo = PREGUNTA, no guarda nada
		Escribir "La cantidad es PAR";                                      // Esta rama corre solo si residuo vale 0
		Escribir "Todos quedan emparejados, no sobra nadie";
	SiNo                                                                     // Todo lo demas, o sea cuando residuo vale 1
		Escribir "La cantidad es IMPAR";
		Escribir "Queda un estudiante suelto y le toca con el profesor";
	FinSi                                                                    // Cierra el Si. Sin esta linea el programa no arranca
FinAlgoritmo
```

De las dos ramas se ejecuta **una sola**, siempre, sin excepción. Nunca las dos y nunca ninguna. Si el residuo vale 0 se imprimen las dos líneas de arriba y las dos de abajo ni se miran; si vale 1, al revés.

Cada rama tiene dos `Escribir`, y eso es a propósito: el primero da el veredicto técnico (PAR o IMPAR) y el segundo lo traduce a lo que el profesor necesita hacer con su clase. Un `Si` puede contener tantas instrucciones como quieras, no una sola.

El `FinSi` no es decoración. Es lo que le dice a PSeInt dónde termina la decisión y dónde vuelve el programa a ser una línea recta. Si lo borras, el chequeo de sintaxis se cae con `ERROR 117: Falta cerrar SI` y el programa ni siquiera arranca.

### 6. Prueba de escritorio

Ahora hacemos de computador. Seguimos el programa instrucción por instrucción con `cantidad = 7`, escogido a propósito porque es el caso que se va por el `SiNo`, que es la rama que más cuesta seguir. El signo `?` significa que esa variable está declarada pero todavía no tiene ningún valor guardado. La **negrita** marca el valor que acaba de cambiar en ese paso.

| Paso | Instrucción que se ejecuta | cantidad | residuo | Qué aparece en pantalla |
|---|---|---|---|---|
| 0 | `Definir cantidad, residuo Como Entero;` | ? | ? | (nada) |
| 1 | `Escribir "=====...=====";` | ? | ? | `==================================================` |
| 2 | `Escribir "  NUMERO PAR O IMPAR";` | ? | ? | `  NUMERO PAR O IMPAR` |
| 3 | `Escribir "=====...=====";` | ? | ? | `==================================================` |
| 4 | `Escribir "";` | ? | ? | (una línea en blanco) |
| 5 | `Escribir Sin Saltar "Escriba cuantos...: ";` | ? | ? | `Escriba cuantos estudiantes asistieron hoy: ` y el cursor se queda ahí mismo |
| 6 | `Leer cantidad;` el profesor teclea 7 | **7** | ? | el 7 que él escribió |
| 7 | `residuo <- cantidad % 2;` o sea `7 % 2` | 7 | **1** | (nada, este paso no imprime) |
| 8 | `Escribir "";` | 7 | 1 | (una línea en blanco) |
| 9 | `Escribir "-------- RESULTADOS --------";` | 7 | 1 | `------------------- RESULTADOS -------------------` |
| 10 | `Escribir "Estudiantes que asistieron: ", cantidad;` | 7 | 1 | `Estudiantes que asistieron: 7` |
| 11 | `Escribir "Residuo de dividir entre 2: ", residuo;` | 7 | 1 | `Residuo de dividir entre 2: 1` |
| 12 | `Si residuo = 0 Entonces` se evalúa `1 = 0` | 7 | 1 | (nada; la respuesta es Falso y salta al `SiNo`) |
| 13 | `Escribir "La cantidad es IMPAR";` | 7 | 1 | `La cantidad es IMPAR` |
| 14 | `Escribir "Queda un estudiante suelto...";` | 7 | 1 | `Queda un estudiante suelto y le toca con el profesor` |
| 15 | `FinSi` | 7 | 1 | (nada, la decisión terminó) |

**El paso crítico es el 12**, y lo vamos a hacer a mano, despacio. Al llegar ahí `residuo` ya vale 1, porque el paso 7 lo calculó y lo guardó. PSeInt no vuelve a calcular nada: agarra el 1 que está guardado, lo pone donde dice `residuo` y le queda la pregunta `1 = 0`. ¿Es el 1 igual al 0? No. La respuesta es **Falso**, y con un Falso el programa se salta completa la rama del `Entonces` y aterriza en el `SiNo`.

Presta atención a lo que **no** aparece en la tabla: las líneas `Escribir "La cantidad es PAR";` y `Escribir "Todos quedan emparejados, no sobra nadie";` no tienen fila. No es un olvido. Es que en esta corrida esas dos líneas **no se ejecutaron nunca**, aunque estén escritas en el archivo. Eso es lo que significa que un programa tome un camino: el otro camino se queda ahí, sin correr.

Y ahora, en corto, qué habría pasado con los otros datos. Esta tabla también está hecha a mano, con la misma cuenta del paso 7 y la misma pregunta del paso 12:

| cantidad | Paso 7: `cantidad % 2` da | Paso 12: `residuo = 0` responde | Camino que toma | Veredicto |
|---|---|---|---|---|
| 8 | 0 | Verdadero | rama del `Entonces` | PAR |
| 7 | 1 | Falso | rama del `SiNo` | IMPAR |
| 0 | 0 | Verdadero | rama del `Entonces` | PAR |
| 25 | 1 | Falso | rama del `SiNo` | IMPAR |

La columna del medio solo puede decir Verdadero o Falso, nunca una tercera cosa, y por eso los caminos son exactamente dos. Si algún día necesitas tres respuestas distintas, un `Si/SiNo` no te va a alcanzar. Eso es justo lo que viene en el Ejercicio 3.

### 7. Ejecución real verificada

Las tres corridas que siguen son la salida literal que produjo PSeInt al ejecutar el archivo `Ejercicio_02_NumeroParImpar.psc` bajo el perfil Estricto. El chequeo de sintaxis no reportó ni un error. El signo `>` no lo imprime tu programa: lo agrega la herramienta de consola con la que se capturó la salida, para señalar lo que se escribió por teclado. Si en tu pantalla no aparece, todo está bien.

**Corrida 1.** Datos escritos por teclado: `8`.

```
==================================================
  NUMERO PAR O IMPAR
==================================================

Escriba cuantos estudiantes asistieron hoy: > 8

------------------- RESULTADOS -------------------
Estudiantes que asistieron: 8
Residuo de dividir entre 2: 0
La cantidad es PAR
Todos quedan emparejados, no sobra nadie
```

Verificación a mano: 8 repartido en grupos de dos da 4 parejas exactas, y 4 por 2 son 8, así que no queda nadie por fuera. El residuo es 0. Como 0 es igual a 0, la condición es Verdadera y el programa se va por la rama del `Entonces`. La comprobación que siempre se cumple es esta: (parejas x 2) + residuo = cantidad original, o sea 4 x 2 + 0 = 8. Cuadra.

**Corrida 2.** Datos escritos por teclado: `7`.

```
==================================================
  NUMERO PAR O IMPAR
==================================================

Escriba cuantos estudiantes asistieron hoy: > 7

------------------- RESULTADOS -------------------
Estudiantes que asistieron: 7
Residuo de dividir entre 2: 1
La cantidad es IMPAR
Queda un estudiante suelto y le toca con el profesor
```

Verificación a mano: en 7 caben 3 parejas, que se llevan 6 estudiantes, y del 6 al 7 sobra 1. El residuo es 1. Como 1 no es igual a 0, la condición es Falsa y el programa se va por el `SiNo`. Comprobación: 3 x 2 + 1 = 7. Cuadra. Y esta corrida coincide exactamente, línea por línea, con la prueba de escritorio del punto 6, que es lo que confirma que el papel y la máquina están de acuerdo.

**Corrida 3, el caso frontera.** Datos escritos por teclado: `0`.

```
==================================================
  NUMERO PAR O IMPAR
==================================================

Escriba cuantos estudiantes asistieron hoy: > 0

------------------- RESULTADOS -------------------
Estudiantes que asistieron: 0
Residuo de dividir entre 2: 0
La cantidad es PAR
Todos quedan emparejados, no sobra nadie
```

Verificación a mano: en 0 caben 0 parejas, esas 0 parejas se llevan 0 estudiantes, y no queda nadie por fuera. El residuo es 0. Comprobación: 0 x 2 + 0 = 0. Cuadra. El programa responde PAR, que es la respuesta correcta, y lo hace **sin una sola línea escrita especialmente para el cero**. Esta corrida es la que hay que enseñar cuando alguien pregunte si el cero es par: sí lo es, y la fórmula lo sabía sola.

**¿Y si alguien escribe un número con decimales?** Se probó tecleando `8.5` y PSeInt no lo acepta: muestra `ERROR 313: No coinciden los tipos (CANTIDAD), el valor ingresado debe ser un entero` y ahí se detiene, sin llegar a calcular el residuo. No es una falla de tu programa, es la consecuencia de haber declarado `cantidad` como Entero, y para este problema está bien: a una clase de educación física no llega medio estudiante.

### 8. Errores comunes en este ejercicio

| Lo que escribe el estudiante | Qué pasa | Cómo se arregla |
|---|---|---|
| `Si cantidad / 2 = 0 Entonces` | **El error estrella de este ejercicio, y es silencioso.** PSeInt no dice absolutamente nada porque `4 = 0` es una comparación válida. Ejecutado de verdad: con 8 responde `La cantidad es IMPAR`, que es falso; con 7 responde IMPAR, que es correcto por casualidad; y con 0 responde PAR, también por casualidad. Acierta dos de tres casos, así que el estudiante lo prueba por encima y lo entrega roto. | Preguntar por lo que sobra, no por el resultado de la división. Calcula el residuo con `%` en su propia línea y compara ese residuo contra 0. |
| `residuo <- cantidad / 2;` y después `Si residuo = 0 Entonces` | El mismo error de fondo, pero con un comportamiento partido en dos que confunde muchísimo. Con 8 estudiantes la división da 4, cabe en un Entero, el programa corre completo, imprime `Residuo de dividir entre 2: 4` y responde IMPAR: mal, y en silencio. Con 7 la división da 3.5, que no cabe en un Entero, y ahí sí PSeInt frena con `ERROR 314: No coinciden los tipos, el valor a asignar debe ser un entero`. Un mismo programa que unas veces da error y otras no vuelve loco a cualquiera. | Cambiar `/` por `%`: `residuo <- cantidad % 2;`. Y de paso fíjate en la pista que te dio el programa: cuando imprimió 4 donde debía imprimir 0 o 1, ese número en pantalla estaba gritando que la línea del cálculo estaba mal. |
| `Si residuo <- 0 Entonces` | Silencioso y de los peores. PSeInt arranca sin protestar, porque no lee una flecha: lee el signo de "menor que" seguido de un menos, o sea `residuo < -0`. Un residuo nunca es negativo, así que la condición da Falso siempre. Ejecutado de verdad, responde `La cantidad es IMPAR` con 8, con 7 y con 0: la rama del `Entonces` no corre jamás. | Dentro de un `Si` se compara con `=`, no con `<-`. La flecha guarda y va afuera, en su propia línea; el igual pregunta y va adentro de la condición. |
| `residuo = cantidad % 2;` como línea suelta | El mismo enredo al revés: usar el igual para guardar. Este sí lo detecta PSeInt, que muestra `ERROR 106: Instruccion no valida` en esa línea y no ejecuta nada. Es el error más amable de los cuatro, porque te avisa de una. | Guardar siempre con la flecha: `residuo <- cantidad % 2;`. |
| Escribir `residuo <- cantidad % 2;` después del `FinSi`, o no escribirlo del todo | El `Si` termina preguntando por una variable que está declarada pero vacía. PSeInt se detiene con `ERROR 215: Variable no inicializada (RESIDUO)`, y lo hace a mitad de camino: alcanza a mostrar el banner y a leer el número, y se cae justo cuando va a imprimir el residuo. | Poner el cálculo antes del `Si`. El orden de arriba hacia abajo no es un detalle de estilo: el computador no puede usar un valor que todavía no ha calculado. |
| Escribir tildes o eñes en el `.psc`, por ejemplo `Definir residúo Como Entero;` o el texto `"no sobra ningún niño"` | En un nombre de variable revienta el chequeo de sintaxis y aparecen varios mensajes de golpe: `ERROR 68: Caracter no valido` seguido de `ERROR 48: Identificador no valido` y de errores de operando que no tienen nada que ver, porque una sola letra rara desordena toda la línea. Dentro de un texto entre comillas PSeInt no se queja, pero la consola de Windows muestra esos caracteres rotos y la salida queda ilegible. | El `.psc` va en español sin tildes ni eñes, ni siquiera dentro de las comillas: `residuo`, `ningun`, `nino`. Este documento `.md` sí lleva la ortografía completa; el código no. |
| Poner comentarios `//` dentro del `.psc` para explicar el residuo | El programa corre igual y no da ningún error, así que el estudiante no se entera de que hizo algo indebido. El problema aparece al abrir el diagrama de flujo con `Ctrl + D`: PSeInt dibuja una caja extra por cada comentario, y el diagrama, que debería mostrar de un vistazo la bifurcación del `Si`, queda enterrado en cajitas de texto que no aportan nada. | El archivo que se entrega va sin un solo `//`. Todas las explicaciones viven en este documento, que para eso está. |

---

## Solución del Ejercicio 3 — ¿Quién vendió más?

### 1. Análisis antes de programar

Antes de escribir una sola línea hay que tener claro qué te entregan, qué tienes que hacer con eso y qué vas a devolver. En este ejercicio hay algo más que anotar: **cuántos resultados distintos puede producir el programa**. Esa pregunta es la que decide la forma de la decisión, y es la que el dueño de la tienda nunca se hizo.

| Entradas | Proceso | Salidas |
|---|---|---|
| `ventaAna`: lo que vendió Ana durante el mes, en pesos | 1. Restar las dos ventas y quitarle el signo al resultado con `abs` para obtener `diferencia` | `ventaAna`: la venta de Ana, tal como se registró |
| `ventaCarlos`: lo que vendió Carlos durante el mes, en pesos | 2. Preguntar si `ventaAna` es mayor que `ventaCarlos`. Si sí, el bono es de Ana y el programa termina de decidir ahí | `ventaCarlos`: la venta de Carlos, tal como se registró |
| | 3. Si esa primera pregunta falló, preguntar **otra vez**: ¿es `ventaCarlos` mayor que `ventaAna`? Si sí, el bono es de Carlos | `diferencia`: por cuántos pesos le ganó uno al otro |
| | 4. Si las dos preguntas fallaron, no queda otra posibilidad: vendieron lo mismo y hay empate | El veredicto del bono: ANA, CARLOS o EMPATE, con una frase que lo explique |

Fíjate en los pasos 2, 3 y 4. Son **tres** resultados posibles, pero solo hacen falta **dos** preguntas. Eso no es un truco ni una casualidad: cada pregunta que haces parte el mundo en dos, así que con una pregunta separas dos casos, con dos preguntas separas tres, y así. El paso 4 no tiene pregunta porque a esa altura ya no hay nada que preguntar: las dos anteriores fallaron y la única situación que sobrevive es el empate.

Esa es la diferencia entre este ejercicio y los dos anteriores. Allá había dos caminos y un `Si-Entonces-SiNo` los cubría completos. Aquí hay tres, y para tres se necesita un `Si` metido adentro de otro.

### 2. Diccionario de datos

| Variable | Tipo | Por qué ese tipo |
|---|---|---|
| `ventaAna` | Real | Es dinero, y el dinero se parte. En los ejemplos las ventas son redondas ($1.500.000, $980.000) porque así se leen mejor, pero una venta real de un mes termina en $980.500 o en $1.437.250. Si la declaras Entero, el programa arranca bien, muestra el banner, alcanza a preguntar, y en el momento exacto en que el usuario teclea `980500.50` se detiene con `ERROR 313: No coinciden los tipos (VENTAANA), el valor ingresado debe ser un entero.` y no llega nunca a los resultados. El tipo se elige por lo que el dato **puede** llegar a ser, no por lo que fue en la primera prueba. |
| `ventaCarlos` | Real | Exactamente la misma razón. Y hay una razón adicional: las dos ventas se comparan entre sí, y comparar dos variables del mismo tipo es lo natural. Declarar una Real y la otra Entero no es un error de sintaxis, pero deja el programa cojo: acepta decimales de Ana y los rechaza de Carlos, sin ninguna justificación. |
| `diferencia` | Real | Sale de restar dos números Reales. La resta de dos reales es un real, así que el resultado tiene que caber en una variable Real. Si la declaras Entero y las ventas traen decimales, PSeInt corta la asignación con `ERROR 314: No coinciden los tipos, el valor a asignar debe ser un entero.` Este caso es más traicionero que el anterior porque el error no aparece cuando el usuario escribe, sino más adelante, en la línea del cálculo. |

Las tres se declaran en una sola línea, `Definir ventaAna, ventaCarlos, diferencia Como Real;`, porque son del mismo tipo. Eso es legal en PSeInt y se lee mejor que tres líneas separadas. Si tuvieras variables de tipos distintos necesitarías una línea `Definir` por cada tipo.

Un detalle que vale la pena señalar: `diferencia` no es un dato que entre por teclado ni un dato que decida algo. Es un dato que se calcula solo para mostrarlo. Existe porque el enunciado pide mostrar por cuántos pesos le ganó uno al otro. El programa tomaría exactamente la misma decisión sin ella.

### 3. La lógica explicada

Este es el punto del ejercicio, así que vamos despacio.

**De dónde sale la condición.**

La regla del dueño de la tienda, dicha en voz alta, es esta: *"el bono es para el que más vendió, y si vendieron lo mismo se reparte"*. Escrita así no se puede programar todavía, porque una condición de PSeInt no responde "quién" sino "sí o no". Hay que convertir la regla en una lista de preguntas de sí o no, en orden:

1. ¿Vendió Ana más que Carlos? Si la respuesta es sí, el bono es de Ana. Fin.
2. Si la respuesta fue no: ¿vendió Carlos más que Ana? Si la respuesta es sí, el bono es de Carlos. Fin.
3. Si las dos respuestas fueron no, hay empate.

"Vendió Ana más que Carlos" se escribe `ventaAna > ventaCarlos`. El símbolo `>` es el mismo de las matemáticas del colegio y se lee "mayor que". Ahí no hay nada nuevo. Lo nuevo es **dónde va la segunda pregunta**.

**Por qué la segunda pregunta va adentro del `SiNo`.**

Cuando el programa llega al `SiNo` de la primera pregunta, ya sabe una cosa: que `ventaAna > ventaCarlos` dio Falso. ¿Y eso qué significa? Mucha gente lee `SiNo` como "lo contrario", y de ahí concluye que si Ana no vendió más entonces Carlos vendió más. **Eso es falso.** `SiNo` no significa "lo contrario", significa "en todos los demás casos", y en "todos los demás casos" caben dos situaciones distintas:

- Que Carlos haya vendido más que Ana.
- Que hayan vendido exactamente lo mismo.

Las dos hacen que `ventaAna > ventaCarlos` sea Falso, y son cosas completamente distintas. Por eso adentro de ese `SiNo` hay que hacer una segunda pregunta que las separe. Y esa segunda pregunta es un `Si` completo, con su `Entonces`, su `SiNo` y su propio `FinSi`. Eso es lo que quiere decir "`Si` anidado": un `Si` que vive adentro de otro.

Esta es la tabla de lo que hace la máquina con los tres juegos de datos del enunciado. La columna "no se evalúa" no es adorno: cuando la primera condición da Verdadero, el programa entra por el `Entonces` y **nunca mira** lo que hay en el `SiNo`.

| Datos | `ventaAna > ventaCarlos` | `ventaCarlos > ventaAna` | Camino que toma | Veredicto |
|---|---|---|---|---|
| Ana 1500000, Carlos 980000 | `1500000 > 980000` es **Verdadero** | no se evalúa | Rama `Entonces` del `Si` de afuera | ANA |
| Ana 980000, Carlos 1500000 | `980000 > 1500000` es **Falso** | `1500000 > 980000` es **Verdadero** | `SiNo` de afuera, y de ahí al `Entonces` del `Si` de adentro | CARLOS |
| Ana 1200000, Carlos 1200000 | `1200000 > 1200000` es **Falso** | `1200000 > 1200000` es **Falso** | `SiNo` de afuera, y de ahí al `SiNo` del `Si` de adentro | EMPATE |

Mira la última fila con cuidado. `1200000 > 1200000` es Falso, y mucha gente duda de eso. `>` significa "estrictamente mayor", no "mayor o igual". Un número nunca es estrictamente mayor que sí mismo. Por eso las dos preguntas fallan cuando hay empate, y por eso el empate cae en el último `SiNo`, que es justo donde queríamos que cayera.

**El error clásico: resolverlo con un solo `Si/SiNo`.**

Casi todo el mundo escribe primero esta versión, que se lee muy razonable: si Ana vende más gana Ana, y si no, gana Carlos.

```
Si ventaAna > ventaCarlos Entonces
    ... gana Ana ...
SiNo
    ... gana Carlos ...
FinSi
```

Vamos a correrla mentalmente con los tres juegos de datos:

| Lo que escribes | Cómo lo resuelve la máquina | Resultado |
|---|---|---|
| Un solo `Si/SiNo`, con Ana 1500000 y Carlos 980000 | `1500000 > 980000` da Verdadero, entra por el `Entonces` | ANA. **Correcto** |
| El mismo programa, con Ana 980000 y Carlos 1500000 | `980000 > 1500000` da Falso, entra por el `SiNo` | CARLOS. **Correcto** |
| El mismo programa, con Ana 1200000 y Carlos 1200000 | `1200000 > 1200000` da Falso, entra por el `SiNo` sin más preguntas | CARLOS. **Falso: hubo empate** |

Acierta dos de tres. Ese es el problema: acierta lo suficiente como para que uno crea que quedó bien. Ese programa se ejecutó de verdad con las dos ventas iguales, y estas fueron las dos líneas que imprimió:

```
Diferencia      : 0 pesos
Gana el bono: CARLOS
```

Léelas juntas. El propio programa está diciendo que la diferencia entre las dos ventas es de cero pesos y, dos renglones abajo, que ganó Carlos. Se contradice a sí mismo en pantalla y no le importa. **PSeInt no reporta ni un solo error**, no se cae, no advierte nada: el programa hace exactamente lo que le escribiste. La máquina no sabe qué es un bono ni qué es justo; sabe seguir instrucciones. Si en tus instrucciones el empate no existe, en el programa el empate no existe.

Este es el tipo de error más caro que hay, y por eso el ejercicio existe. Un error de sintaxis te detiene y te obliga a arreglarlo. Un error de lógica te deja seguir, te entrega un resultado con toda tranquilidad y te lo entrega mal.

**El otro error silencioso: escribir `>=` en la primera pregunta.**

Alguien podría pensar que da lo mismo poner `>` o `>=`. No da lo mismo, y el único caso donde se nota es, otra vez, el empate:

| Primera condición | Ana 1500000, Carlos 980000 | Ana 980000, Carlos 1500000 | Ana 1200000, Carlos 1200000 |
|---|---|---|---|
| `ventaAna > ventaCarlos` | Verdadero, gana ANA | Falso, sigue preguntando | Falso, sigue preguntando y termina en EMPATE |
| `ventaAna >= ventaCarlos` | Verdadero, gana ANA | Falso, sigue preguntando | **Verdadero, gana ANA** |

Con `>=` el empate se lo lleva Ana, el `SiNo` del fondo se vuelve inalcanzable y la palabra EMPATE no aparece nunca en pantalla, aunque esté escrita en tu código. Un `Escribir` que nunca se ejecuta es peor que uno que falta, porque lo ves ahí en el archivo y crees que está haciendo algo.

Regla práctica que te va a servir de aquí en adelante: **cuando uses `>` o `<`, pregúntate siempre qué pasa cuando los dos valores son iguales.** Ese caso siempre existe y casi siempre es el que se olvida.

**Por qué la diferencia lleva `abs`.**

`abs` devuelve un número sin signo: el valor absoluto. Aquí hace falta porque lo que interesa es el tamaño de la ventaja, no quién la tiene. De quién es la ventaja ya lo dice el veredicto del bono; repetirlo en la diferencia con un signo menos no informa nada y sí se ve raro.

| Datos | `ventaAna - ventaCarlos` | `abs(ventaAna - ventaCarlos)` |
|---|---|---|
| Ana 1500000, Carlos 980000 | 520000 | 520000 |
| Ana 980000, Carlos 1500000 | −520000 | 520000 |
| Ana 1200000, Carlos 1200000 | 0 | 0 |

Sin `abs`, la segunda fila imprime `Diferencia      : -520000 pesos`. Eso se comprobó ejecutando la versión sin `abs` con esos mismos datos. No es un error que detenga el programa, pero una diferencia negativa entre dos ventas no significa nada para el dueño de la tienda: la distancia que hay de 980000 a 1500000 es la misma que hay de 1500000 a 980000, porque una distancia no tiene dirección. Eso es lo que `abs` deja arreglado en una sola línea.

**Los dos `FinSi`.**

Abriste dos `Si`, así que van dos `FinSi`, y se cierran de adentro hacia afuera, igual que los paréntesis en matemáticas. El `FinSi` del `Si` de adentro va primero, y el del `Si` de afuera va después. Si dejas uno solo, PSeInt sí te avisa cuando revisas la sintaxis: responde `ERROR 117: Falta cerrar SI.` y te señala la línea donde abriste el `Si` que quedó sin cerrar. Ese error es una molestia de dos minutos; el del empate te puede costar un bono mal entregado.

La sangría no cambia nada para la máquina, pero para ti lo cambia todo: el `Si` de adentro va un TAB más a la derecha que el de afuera, y así, mirando de reojo la columna donde empieza cada palabra, sabes de un vistazo cuál `FinSi` cierra cuál `Si`.

### 4. El código completo

Este es el archivo `PSC/Ejercicio_03_MayorDeDosNumeros.psc` tal cual:

```
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
```

Cuenta las palabras `Si` que abren bloque: hay dos, en las líneas del `Si ventaAna` y del `Si ventaCarlos`. Cuenta los `FinSi`: hay dos. Cuenta los `SiNo`: hay dos, uno por cada `Si`. Esa cuenta la puedes hacer siempre antes de ejecutar, y te ahorra la mitad de los errores de sintaxis de este ejercicio.

### 5. El código explicado bloque por bloque

**Advertencia importante: los comentarios que empiezan con `//` que vas a ver aquí abajo existen SOLO en esta explicación. NO los copies a tu archivo `.psc`.** La razón es práctica: PSeInt dibuja **una caja extra por cada comentario** dentro del diagrama de flujo que se genera con `Ctrl + D`. Un programa con doce comentarios produce un diagrama lleno de cajas que no son ni entrada, ni proceso, ni salida, y el diagrama deja de servir para lo que sirve, que es ver la forma del programa de un golpe de vista. En este ejercicio eso importa el doble, porque lo que uno quiere ver en el diagrama es justamente el rombo de la decisión y las tres puntas que salen de él. Los comentarios son para aprender aquí; el archivo que entregas va limpio.

**Bloque 1: el encabezado y la declaración de variables.**

```
Algoritmo MayorDeDosNumeros
	// El nombre del algoritmo es igual al del archivo, quitandole el
	// prefijo Ejercicio_03_ y la extension .psc.
	// Las tres variables son Real porque manejan dinero, y el dinero
	// se parte. Se declaran juntas porque son del mismo tipo.
	Definir ventaAna, ventaCarlos, diferencia Como Real;
```

Toda variable se declara antes de usarse. Si más adelante escribes `ventaAna` y nunca la declaraste, o la escribiste con otra ortografía, PSeInt corta con `ERROR 211: La variable (X) no esta definida.` Esa es una de las razones por las que conviene declarar todo junto y arriba: si las tres están en una sola línea a la vista, es difícil que se te olvide una.

**Bloque 2: el banner que ve el usuario.**

```
	// Tres lineas que forman el titulo del programa. La linea de signos
	// igual tiene exactamente 50 caracteres, la misma medida que el
	// separador de RESULTADOS de mas abajo, para que el bloque quede parejo.
	Escribir "==================================================";
	Escribir "  QUIEN VENDIO MAS EN EL MES";
	Escribir "==================================================";
	// Un Escribir con las comillas vacias imprime una linea en blanco.
	// Sirve para separar visualmente el titulo de las preguntas.
	Escribir "";
```

El texto del banner va sin tildes: se escribe `QUIEN VENDIO MAS`, no `QUIÉN VENDIÓ MÁS`. Es una regla del `.psc` completo, textos entre comillas incluidos, y en la sección 8 está explicado qué pasa cuando no se respeta.

**Bloque 3: la entrada de los dos datos.**

```
	// Escribir Sin Saltar deja el cursor en la MISMA linea, entonces el
	// usuario teclea su respuesta justo al lado de la pregunta. Con un
	// Escribir normal el numero quedaria en el renglon de abajo.
	Escribir Sin Saltar "Escriba el total vendido por Ana en el mes: ";
	// Leer detiene el programa, espera a que el usuario escriba algo y
	// guarda ese valor dentro de la variable que se nombra despues.
	Leer ventaAna;
	Escribir Sin Saltar "Escriba el total vendido por Carlos en el mes: ";
	// El orden de los Leer es el orden en que el programa va a preguntar.
	// Si los inviertes, la venta de Ana termina guardada en ventaCarlos
	// y el programa entrega el bono al reves sin dar ningun error.
	Leer ventaCarlos;
```

Ese último comentario describe otro error silencioso que vale la pena tener presente: la máquina no sabe que la primera respuesta era de Ana. Lo sabe porque tú lo escribiste en el mensaje **y** porque escribiste `Leer ventaAna` justo debajo. Si el mensaje y el `Leer` no concuerdan, el programa queda mintiendo con toda corrección de sintaxis.

**Bloque 4: el cálculo de la diferencia.**

```
	// abs es una funcion: recibe una expresion entre parentesis y devuelve
	// ese valor sin signo. Primero se resuelve la resta de adentro y
	// despues abs le quita el signo al resultado.
	// Con 980000 y 1500000 la resta da -520000 y abs devuelve 520000.
	diferencia <- abs(ventaAna - ventaCarlos);
```

La flecha `<-` no significa "igual": significa "guarde esto adentro de". Se resuelve todo lo que está a la derecha y ese resultado se mete en la caja de la izquierda. Es la misma flecha que vienes usando desde el cuadernillo anterior, y en la sección 8 vas a ver qué pasa si se te ocurre usarla dentro de un `Si`.

**Bloque 5: las tres líneas de resultados.**

```
	Escribir "";
	// El separador de RESULTADOS mide 50 caracteres, igual que el banner.
	Escribir "------------------- RESULTADOS -------------------";
	// Las comas pegan pedazos en una sola linea: el texto entre comillas,
	// luego el valor de la variable (sin comillas, porque queremos el
	// numero guardado y no la palabra), y luego la unidad.
	// Los espacios antes de los dos puntos alinean los tres valores en
	// la misma columna. No es adorno: una tabla desalineada se lee mal.
	Escribir "Venta de Ana    : ", ventaAna, " pesos";
	Escribir "Venta de Carlos : ", ventaCarlos, " pesos";
	Escribir "Diferencia      : ", diferencia, " pesos";
	Escribir "";
```

Estas tres líneas se ejecutan **siempre**, sin importar quién gane, porque están afuera del `Si`. Ese es el orden que conviene: primero se muestra lo que es cierto pase lo que pase, y después se decide. Si metieras estas líneas adentro de las ramas, tendrías que repetirlas tres veces y el día que cambies una etiqueta te tocaría acordarte de cambiarla en tres sitios.

**Bloque 6: el `Si` anidado. Este es el bloque del ejercicio.**

```
	// Primera pregunta. Si es Verdadera, se ejecutan las dos lineas de
	// adentro y el programa salta hasta el FinSi de afuera: todo lo que
	// hay en el SiNo no se mira siquiera.
	Si ventaAna > ventaCarlos Entonces
		Escribir "Gana el bono: ANA";
		Escribir "Ana vendio mas que Carlos este mes";
	SiNo
		// Aqui llegamos cuando ventaAna > ventaCarlos dio Falso.
		// Eso NO quiere decir que gano Carlos: quiere decir que Ana no
		// gano. Faltan por separar dos casos, y por eso va otra pregunta.
		Si ventaCarlos > ventaAna Entonces
			Escribir "Gana el bono: CARLOS";
			Escribir "Carlos vendio mas que Ana este mes";
		SiNo
			// Este SiNo no lleva pregunta y no la necesita: si las dos
			// condiciones anteriores fallaron, la unica posibilidad que
			// queda es que las dos ventas sean iguales.
			Escribir "Gana el bono: EMPATE";
			Escribir "Los dos vendieron lo mismo, el bono se reparte en partes iguales";
		FinSi
	FinSi
FinAlgoritmo
```

Mira las sangrías. El `Si` de afuera arranca con un TAB, sus `Escribir` con dos. El `Si` de adentro arranca con dos TAB, sus `Escribir` con tres. Y los `FinSi` se cierran de adentro hacia afuera: el que está más a la derecha cierra el `Si` de adentro, el que está más a la izquierda cierra el de afuera. Puedes comprobarlo con el dedo: pon el dedo en un `FinSi` y súbelo derecho por la pantalla hasta encontrar un `Si` en esa misma columna. Ese es el que cierra.

De las seis líneas `Escribir` que hay dentro de esta estructura, en cada ejecución se ejecutan **exactamente dos**. Las otras cuatro están ahí, escritas, y la máquina pasa de largo por encima de ellas. Eso es lo que hace nuevo a este cuadernillo frente al anterior: hasta el Ejercicio 10 de Ejercicios_1, todas las líneas de todos los programas se ejecutaban siempre.

### 6. Prueba de escritorio

La prueba de escritorio es ponerse uno en el lugar del computador y recorrer el programa instrucción por instrucción, anotando en papel qué tiene cada variable en cada momento. Se hace **antes de ejecutar**, para saber qué resultado deberías obtener. Si la máquina te da otra cosa, el programa tiene un error.

Vamos a recorrer el caso 3, el del empate, que es el que decide si el programa está bien: `ventaAna = 1200000` y `ventaCarlos = 1200000`.

El signo `?` significa que la variable ya está declarada pero todavía no tiene ningún valor guardado. En **negrita** va el valor que acaba de cambiar en ese paso.

| Paso | Instrucción | ventaAna | ventaCarlos | diferencia | Qué aparece en pantalla |
|---|---|---|---|---|---|
| 1 | `Definir ventaAna, ventaCarlos, diferencia Como Real;` | ? | ? | ? | nada |
| 2 | `Escribir "===...===";` | ? | ? | ? | la línea de 50 signos igual |
| 3 | `Escribir "  QUIEN VENDIO MAS EN EL MES";` | ? | ? | ? | `  QUIEN VENDIO MAS EN EL MES` |
| 4 | `Escribir "===...===";` | ? | ? | ? | la línea de 50 signos igual |
| 5 | `Escribir "";` | ? | ? | ? | una línea en blanco |
| 6 | `Escribir Sin Saltar "Escriba el total vendido por Ana en el mes: ";` | ? | ? | ? | la pregunta, sin saltar de renglón |
| 7 | `Leer ventaAna;` (se teclea 1200000) | **1200000** | ? | ? | el `1200000` que teclea el usuario |
| 8 | `Escribir Sin Saltar "Escriba el total vendido por Carlos en el mes: ";` | 1200000 | ? | ? | la segunda pregunta |
| 9 | `Leer ventaCarlos;` (se teclea 1200000) | 1200000 | **1200000** | ? | el `1200000` que teclea el usuario |
| 10 | `diferencia <- abs(1200000 - 1200000);` | 1200000 | 1200000 | **0** | nada |
| 11 | `Escribir "";` | 1200000 | 1200000 | 0 | una línea en blanco |
| 12 | `Escribir "------------------- RESULTADOS -------------------";` | 1200000 | 1200000 | 0 | el separador de resultados |
| 13 | `Escribir "Venta de Ana    : ", ventaAna, " pesos";` | 1200000 | 1200000 | 0 | `Venta de Ana    : 1200000 pesos` |
| 14 | `Escribir "Venta de Carlos : ", ventaCarlos, " pesos";` | 1200000 | 1200000 | 0 | `Venta de Carlos : 1200000 pesos` |
| 15 | `Escribir "Diferencia      : ", diferencia, " pesos";` | 1200000 | 1200000 | 0 | `Diferencia      : 0 pesos` |
| 16 | `Escribir "";` | 1200000 | 1200000 | 0 | una línea en blanco |
| 17 | `Si 1200000 > 1200000 Entonces` → **Falso**, salta al `SiNo` | 1200000 | 1200000 | 0 | nada |
| 18 | `Si 1200000 > 1200000 Entonces` (el de adentro) → **Falso**, salta a su `SiNo` | 1200000 | 1200000 | 0 | nada |
| 19 | `Escribir "Gana el bono: EMPATE";` | 1200000 | 1200000 | 0 | `Gana el bono: EMPATE` |
| 20 | `Escribir "Los dos vendieron lo mismo, ...";` | 1200000 | 1200000 | 0 | la frase completa del empate |
| 21 | `FinSi`, `FinSi`, `FinAlgoritmo` | 1200000 | 1200000 | 0 | el programa termina |

**El paso crítico son el 17 y el 18, y conviene hacerlos a mano.** En el paso 17 la máquina reemplaza cada nombre por su valor y evalúa `1200000 > 1200000`. La pregunta es si el número de la izquierda es *estrictamente* mayor que el de la derecha, y no lo es: es igual. Resultado, Falso. Entonces la máquina se salta las dos líneas del `Entonces` sin ejecutarlas y aterriza en el `SiNo`.

En el paso 18 encuentra la segunda pregunta y hace lo mismo: `1200000 > 1200000`, Falso otra vez. Se salta las dos líneas del `Entonces` de adentro y cae en el `SiNo` de adentro, que no tiene ninguna condición que revisar. Ahí se ejecutan las dos líneas del empate y se acabó.

Fíjate en algo que se ve muy bien en esta tabla: entre el paso 17 y el 18, ninguna variable cambió. Un `Si` **no modifica** el valor de nada, solo decide por dónde sigue el programa. Las columnas de las variables se quedan quietas y lo único que se mueve es el punto por donde va la ejecución.

Resultado esperado según el papel: `Diferencia      : 0 pesos` y `Gana el bono: EMPATE`.

**Qué habría pasado con los otros datos.** Los dos primeros casos de prueba recorren la misma estructura, pero se salen por otra puerta:

| Datos | Paso 17: `ventaAna > ventaCarlos` | Paso 18: `ventaCarlos > ventaAna` | Puerta por la que sale | Qué imprime |
|---|---|---|---|---|
| Ana 1500000, Carlos 980000 | Verdadero | no se ejecuta nunca | `Entonces` del `Si` de afuera | `Gana el bono: ANA` |
| Ana 980000, Carlos 1500000 | Falso | Verdadero | `Entonces` del `Si` de adentro | `Gana el bono: CARLOS` |
| Ana 1200000, Carlos 1200000 | Falso | Falso | `SiNo` del `Si` de adentro | `Gana el bono: EMPATE` |

Tres juegos de datos, tres puertas distintas, un solo programa. Cuando pruebes el tuyo, pruébalo con los tres: un programa con tres caminos no está probado hasta que hayas pasado por los tres.

### 7. Ejecución real verificada

El archivo se ejecutó con el intérprete de PSeInt bajo el perfil Estricto, con los tres juegos de datos de la prueba de escritorio. El chequeo de sintaxis **no reportó ningún error**. Lo que sigue es la salida literal del programa; el signo `>` al lado de cada pregunta lo pone PSeInt para indicar que está esperando que el usuario escriba algo, y no está en tu código.

**Corrida 1.** Datos escritos por teclado: `1500000` y `980000`.

```
==================================================
  QUIEN VENDIO MAS EN EL MES
==================================================

Escriba el total vendido por Ana en el mes: > 1500000
Escriba el total vendido por Carlos en el mes: > 980000

------------------- RESULTADOS -------------------
Venta de Ana    : 1500000 pesos
Venta de Carlos : 980000 pesos
Diferencia      : 520000 pesos

Gana el bono: ANA
Ana vendio mas que Carlos este mes
```

Verificación a mano: la resta es `1500000 - 980000 = 520000`, y como ya es positiva, `abs` la deja igual en `520000`, que es lo que imprimió. La primera condición fue `1500000 > 980000`, que es Verdadera, así que el programa entró por el `Entonces` de afuera y el `Si` de adentro no se evaluó ni una vez. Coincide con la primera fila de la tabla de caminos.

**Corrida 2.** Datos escritos por teclado: `980000` y `1500000`. Son los mismos dos números de la corrida anterior, invertidos.

```
==================================================
  QUIEN VENDIO MAS EN EL MES
==================================================

Escriba el total vendido por Ana en el mes: > 980000
Escriba el total vendido por Carlos en el mes: > 1500000

------------------- RESULTADOS -------------------
Venta de Ana    : 980000 pesos
Venta de Carlos : 1500000 pesos
Diferencia      : 520000 pesos

Gana el bono: CARLOS
Carlos vendio mas que Ana este mes
```

Verificación a mano: la resta ahora es `980000 - 1500000 = -520000`, un número negativo, y `abs` le quita el signo y devuelve `520000`. Compara esta línea de diferencia con la de la corrida 1: **son idénticas**, y eso es exactamente lo que se quería. La ventaja de uno sobre el otro mide lo mismo se mire desde donde se mire. Sin `abs`, aquí habría salido `-520000`. En cuanto a la decisión: `980000 > 1500000` es Falso, el programa bajó al `SiNo`, evaluó `1500000 > 980000`, que es Verdadero, y salió por el `Entonces` de adentro.

**Corrida 3, el caso del empate. Esta es la que importa.** Datos escritos por teclado: `1200000` y `1200000`.

```
==================================================
  QUIEN VENDIO MAS EN EL MES
==================================================

Escriba el total vendido por Ana en el mes: > 1200000
Escriba el total vendido por Carlos en el mes: > 1200000

------------------- RESULTADOS -------------------
Venta de Ana    : 1200000 pesos
Venta de Carlos : 1200000 pesos
Diferencia      : 0 pesos

Gana el bono: EMPATE
Los dos vendieron lo mismo, el bono se reparte en partes iguales
```

Verificación a mano: `1200000 - 1200000 = 0`, y `abs(0)` es `0`. La diferencia impresa es `0`, que es la señal de que las dos ventas son iguales. Las dos condiciones dieron Falso, tal como se calculó en los pasos 17 y 18 de la prueba de escritorio, y el programa salió por el `SiNo` del `Si` de adentro. Los tres números y las dos líneas del veredicto coinciden con lo que decía el papel.

Compara esta corrida con lo que imprimió la versión de un solo `Si/SiNo` que se mostró en la sección 3, con estos mismos datos: `Diferencia      : 0 pesos` seguido de `Gana el bono: CARLOS`. El mismo dato de entrada, el mismo cero en la diferencia, dos veredictos distintos y ni un mensaje de error en ninguna de las dos ejecuciones. La única forma de saber cuál de las dos versiones es la correcta es probar el caso del empate y leer la respuesta.

### 8. Errores comunes en este ejercicio

| Lo que escribe el estudiante | Qué pasa | Cómo se arregla |
|---|---|---|
| Un solo `Si/SiNo`: si Ana vende más gana Ana, `SiNo` gana Carlos | El programa corre perfecto y **no muestra ningún error**. Acierta con 1500000 contra 980000 y acierta al revés, pero con dos ventas iguales de 1200000 imprime `Gana el bono: CARLOS` justo debajo de `Diferencia      : 0 pesos`. Se contradice en pantalla y nadie se entera. Es el error del ejercicio. | Meter una segunda pregunta, `Si ventaCarlos > ventaAna Entonces`, adentro del `SiNo` del primero, con su propio `SiNo` y su propio `FinSi`. `SiNo` significa "en todos los demás casos", y ahí caben dos situaciones que hay que separar. |
| `Si ventaAna >= ventaCarlos Entonces` en la primera pregunta | Silencioso también. Con `>=` el empate cumple la primera condición y el bono se lo lleva Ana. Con 1200000 y 1200000 imprime `Gana el bono: ANA`. La rama del EMPATE queda escrita en el archivo pero es inalcanzable: nunca se ejecuta, pase lo que pase. | La primera condición va con `>`, sin el igual. El caso "son iguales" tiene que llegar vivo hasta el último `SiNo`, que es el único que lo trata bien. Cada vez que escribas `>` o `<`, pregúntate qué pasa si los dos valores son iguales. |
| Dejar un solo `FinSi` habiendo abierto dos `Si` | Este sí lo detecta PSeInt al revisar la sintaxis con `F9`. Responde `ERROR 117: Falta cerrar SI.` y señala la línea donde empieza el `Si` que quedó sin cerrar. El programa no se ejecuta. | Contar: tantos `FinSi` como `Si` abriste, cerrados de adentro hacia afuera. Si la sangría está bien puesta, cada `FinSi` queda en la misma columna que el `Si` que cierra, y el error se ve a simple vista. |
| `diferencia <- ventaAna - ventaCarlos;` sin `abs` | No hay error ni advertencia. Cuando Ana vende menos, la diferencia sale con signo menos: con 980000 y 1500000 imprime `Diferencia      : -520000 pesos`. Una ventaja negativa no significa nada para quien lee el informe. | Envolver la resta en `abs(...)`: `diferencia <- abs(ventaAna - ventaCarlos);`. La distancia entre dos números no tiene dirección. |
| `Definir ventaAna, ventaCarlos, diferencia Como Entero;` | Mientras las ventas sean redondas parece funcionar. Apenas alguien teclea una venta real como `980500.50`, el programa se detiene ahí mismo con `ERROR 313: No coinciden los tipos (VENTAANA), el valor ingresado debe ser un entero.` y no llega a los resultados. | Declararlas `Como Real`. El dinero se parte, y una venta del mes de una tienda casi nunca termina en cero cerrado. |
| Escribir tildes o eñes dentro del `.psc`, por ejemplo `Escribir "Ana vendió más";` o llamar `dueño` a una variable | Depende de dónde estén. Dentro de un nombre de variable, PSeInt no compila: responde `ERROR 68: Caracter no valido` y detrás `ERROR 48: Identificador no valido`. Dentro de un texto entre comillas no da error de sintaxis, pero la consola de Windows no dibuja bien esos caracteres y el mensaje le llega roto al usuario. | Escribir todo el `.psc` sin tildes ni eñes, textos entre comillas incluidos: `vendio`, `mas`, `duenio`, `numero`. Este documento `.md` sí va con ortografía completa; el archivo que se ejecuta, no. |
| Dejar comentarios `//` dentro del archivo `.psc` | El programa sigue corriendo igual, pero el diagrama de flujo de `Ctrl + D` se llena de cajas de comentario y se vuelve ilegible. Justo en este ejercicio es donde más duele, porque lo que uno quiere ver en el diagrama es el rombo de la decisión con sus tres salidas. | Borrar todos los `//` del `.psc`. Las explicaciones viven en este documento, no en el archivo que se ejecuta. |

---

## Solución del Ejercicio 4 — Descuento por monto de compra

### 1. Análisis antes de programar

Este cuadro se llena **con lápiz y papel, antes de abrir PSeInt**. En este ejercicio el análisis importa todavía más que en los tres anteriores, porque aquí el proceso tiene un paso que no imprime nada: lo único que hace es dejar un número listo para las cuentas que vienen después. Si no separas ese paso en el papel, terminas escribiendo la fórmula del descuento dos veces sin necesidad.

| Entradas | Proceso | Salidas |
|---|---|---|
| `valorCompra`: cuánto sumó la compra en pesos, antes de cualquier rebaja. Es el único dato que digita la cajera | 1. Decidir qué porcentaje le corresponde a esa compra: 10 si pasa de los $100.000, 0 si no los pasa | `porcentaje`: el porcentaje que le tocó a esta compra en particular, 10 o 0 |
| El 10 % de la promoción **no es una entrada**: lo fijó la dueña de la papelería y es igual para todos los clientes, así que va escrito dentro del programa | 2. Calcular cuántos pesos son ese porcentaje del valor de la compra | `descuento`: los pesos que se le rebajan al cliente |
| Los $100.000 del tope tampoco son una entrada: son la regla de la promoción, no un dato que alguien teclee | 3. Restarle ese descuento al valor de la compra | `total`: lo que el cliente termina pagando en la caja |

Mira bien el paso 1. No dice "mostrar el descuento" ni "avisar que hay promoción": dice **decidir un número**. Ese número queda guardado, y los pasos 2 y 3 lo usan sin preguntar de dónde salió. Por eso los pasos 2 y 3 son idénticos para el cliente que compró $150.000 y para el que compró $80.000: se escriben una sola vez y sirven para los dos.

### 2. Diccionario de datos

| Variable | Tipo | Por qué ese tipo |
|---|---|---|
| `valorCompra` | Real | Es plata, y la plata en una papelería no siempre da redonda: tres cuadernos, un lapicero y media resma pueden sumar 99500.50. Si la declaras `Entero`, ese dato ni siquiera alcanza a entrar: PSeInt corta la ejecución con el `ERROR 313: No coinciden los tipos (VALORCOMPRA), el valor ingresado debe ser un entero.` justo en el `Leer`, y el programa muere antes de decidir nada. Con `Real` entran tanto 150000 como 99500.50, así que cubre los dos casos. |
| `porcentaje` | Real | Hoy esta variable solo guarda 10 o 0, que son dos números enteros, así que declararla `Entero` funcionaría **hoy**. Se declara `Real` por dos razones. La primera es que ese valor entra en una división entre 100, y todo lo que participa en una división es candidato a tener decimales. La segunda es la que de verdad pesa: el día que la papelería anuncie un 12.5 % de descuento, con `Real` solo cambias el número, y con `Entero` el programa se detiene con el `ERROR 314: No coinciden los tipos, el valor a asignar debe ser un entero.` |
| `descuento` | Real | Es el resultado de una división entre 100, y dividir produce decimales con muchísima facilidad. Sin ir más lejos, una compra de $100.001 deja un descuento de 10000.1. Si esta variable fuera `Entero`, PSeInt no redondearía ni recortaría por su cuenta para seguir adelante: detendría la ejecución con el error 314 en esa misma línea. |
| `total` | Real | Es una resta entre dos valores reales, así que el resultado tiene que poder ser real también. Si `descuento` trae decimales, `total` los va a traer. |

Las cuatro se declaran en una sola línea porque comparten el tipo. La regla práctica es la misma del cuadernillo anterior: **si una variable participa en una división o guarda plata, es `Real`**. Los `Entero` se reservan para lo que se cuenta de a uno y nunca se parte, como los años cumplidos del Ejercicio 1 o la cantidad de estudiantes del Ejercicio 2.

### 3. La lógica explicada

**De dónde sale la condición.** No sale de tu cabeza: sale del aviso que la dueña pegó en la vitrina. El aviso dice "a quien compre **más de** $100.000 le hacemos el 10 % de descuento". Esas tres palabras, "más de", son la condición. Traducirlas es todo el trabajo:

| Lo que dice el aviso | Lo que significa | Cómo se escribe en PSeInt |
|---|---|---|
| "más de $100.000" | Estrictamente mayor. El $100.000 exacto **no** entra | `valorCompra > 100000` |
| "desde $100.000" o "de $100.000 en adelante" | Mayor o igual. El $100.000 exacto **sí** entra | `valorCompra >= 100000` |
| "menos de $100.000" | Estrictamente menor. El $100.000 exacto no entra | `valorCompra < 100000` |

El aviso dice "más de", así que la línea es `Si valorCompra > 100000 Entonces`. Aquí no hay nada que interpretar ni que suponer: se lee el enunciado y se copia la palabra.

**Cómo resuelve la máquina esa condición.** Cuando el programa llega al `Si`, reemplaza el nombre de la variable por el valor que tiene guardado y evalúa la comparación. El resultado de esa comparación no es un número: es Verdadero o Falso, y eso es lo único que decide cuál de las dos ramas se ejecuta.

| Lo que escribes | Cómo lo resuelve la máquina | Resultado |
|---|---|---|
| `Si valorCompra > 100000 Entonces` con `valorCompra` en 150000 | ¿150000 es mayor que 100000? Sí | **Verdadero** → entra a la rama `Entonces` → `porcentaje` queda en 10 |
| `Si valorCompra > 100000 Entonces` con `valorCompra` en 80000 | ¿80000 es mayor que 100000? No | **Falso** → entra a la rama `SiNo` → `porcentaje` queda en 0 |
| `Si valorCompra > 100000 Entonces` con `valorCompra` en 100000 | ¿100000 es mayor que 100000? No: es exactamente igual, y "mayor" no incluye "igual" | **Falso** → entra a la rama `SiNo` → `porcentaje` queda en 0 |

La tercera fila es el ejercicio completo. El operador `>` significa "estrictamente mayor", y un número nunca es mayor que sí mismo. Por eso la compra de exactamente $100.000 se va por el `SiNo` y se queda sin descuento, que es justo lo que prometió el aviso.

**El error clásico de este ejercicio, demostrado con números.** Cambia ese `>` por `>=` y mira lo que pasa con las tres compras de prueba:

| Compra | Con `>` (lo que dice el aviso) | Con `>=` (lo que se teclea sin pensar) | ¿Se nota la diferencia? |
|---|---|---|---|
| $150.000 | 10 %, descuento $15.000, total $135.000 | 10 %, descuento $15.000, total $135.000 | No, dan exactamente lo mismo |
| $80.000 | 0 %, descuento $0, total $80.000 | 0 %, descuento $0, total $80.000 | No, dan exactamente lo mismo |
| $100.000 | 0 %, descuento $0, total **$100.000** | 10 %, descuento $10.000, total **$90.000** | Sí: **$10.000 de diferencia** |

Dos de cada tres pruebas pasan. Si te sientas a probar con $150.000 y con $80.000, cierras el archivo convencido de que quedó bien, y PSeInt jamás te va a decir lo contrario: la versión con `>=` no tiene un solo error de sintaxis, corre completa y saca cuentas coherentes. El detalle es que las saca sobre una promoción distinta a la del aviso. Y todos los días, en una papelería de barrio, alguien compra exactamente los útiles que suman la cifra del tope; a ese cliente la caja le regala $10.000 que nadie le prometió.

De ahí sale una costumbre que te va a servir para todo el curso: **el caso que hay que probar siempre es el del número que aparece escrito en la condición**. No los que están claramente a un lado o al otro, sino el de la frontera exacta.

**Por qué las dos fórmulas van después del `FinSi` y no adentro.** Esta es la idea nueva del ejercicio. El `Si` deja guardado un número en `porcentaje` y ahí termina su trabajo. Después, ya fuera de las ramas, las dos fórmulas se ejecutan siempre, con el valor que haya quedado:

| Camino que tomó el programa | `porcentaje` al salir del `FinSi` | `descuento <- valorCompra * porcentaje / 100` | `total <- valorCompra - descuento` |
|---|---|---|---|
| Compra de $150.000, rama `Entonces` | 10 | 150000 × 10 ÷ 100 = **15000** | 150000 − 15000 = **135000** |
| Compra de $80.000, rama `SiNo` | 0 | 80000 × 0 ÷ 100 = **0** | 80000 − 0 = **80000** |

Fíjate en la segunda fila: no hubo que escribir ningún caso especial para "el cliente sin descuento". La multiplicación por cero da cero sola, y restarle cero a un número lo deja intacto. La aritmética resolvió el segundo camino sin que tú hicieras nada.

**La versión larga, la que casi todo el mundo escribe primero.** Es esta:

```
Si valorCompra > 100000 Entonces
	descuento <- valorCompra * 10 / 100;
	total <- valorCompra - descuento;
SiNo
	descuento <- 0;
	total <- valorCompra;
FinSi
```

Funciona. Da los mismos resultados y PSeInt no protesta. El problema no es que esté mal hoy: es lo que pasa mañana. El día que la dueña anuncie 15 % en vez de 10 %, tienes que acordarte de que la fórmula está escrita en dos sitios. Si cambias uno y olvidas el otro, el programa queda liquidando con dos promociones distintas según el camino que tome cada cliente, y ese es el tipo de error que puede vivir meses en un programa sin que nadie lo note. En la versión buena hay **un solo** número 10 en todo el archivo, y cambiar la promoción es cambiar dos caracteres.

Hay una variante todavía peor de la versión larga: escribir `total <- valorCompra * 0.9;` en la rama del descuento. Ahí el 10 % ya ni siquiera aparece escrito, queda disfrazado dentro de un 0.9 que el próximo lector tiene que descifrar, y además el programa no puede imprimir cuánto fue el descuento en pesos, porque ese valor nunca llegó a existir. El enunciado pedía mostrarlo.

### 4. El código completo

Este es el archivo `PSC/Ejercicio_04_DescuentoPorCompra.psc` tal cual:

```
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
```

### 5. El código explicado bloque por bloque

**Advertencia importante: los comentarios que empiezan con `//` que vas a ver aquí abajo existen SOLO en esta explicación. NO los copies a tu archivo `.psc`.** La razón es práctica: PSeInt dibuja cada comentario como una caja extra dentro del diagrama de flujo (`Ctrl + D`), así que un programa tan corto como este sale convertido en un diagrama larguísimo e ilegible. El archivo que entregas va limpio, y todas las explicaciones viven en este documento. Fíjate además en que esos comentarios están escritos sin tildes: dentro de un `.psc` no van tildes ni eñes en ninguna parte, tampoco en un comentario.

**Bloque 1: el nombre del algoritmo y la declaración de variables**

```
Algoritmo DescuentoPorCompra
	Definir valorCompra, porcentaje, descuento, total Como Real;   // 1 dato de entrada y 3 valores que calcula el programa
```

Las cuatro variables se declaran de una sola vez porque las cuatro son `Real`. El orden en que están escritas no es casual: primero `valorCompra`, que es lo que entra, y después `porcentaje`, `descuento` y `total`, que son exactamente los tres resultados en el orden en que el programa los va produciendo. Un `Definir` bien ordenado le cuenta al lector de qué se trata el programa antes de que lea una sola cuenta.

**Bloque 2: el encabezado en pantalla**

```
	Escribir "==================================================";   // marco superior
	Escribir "  DESCUENTO POR MONTO DE COMPRA";                       // titulo del programa
	Escribir "==================================================";   // cierra el marco
	Escribir "";                                                      // linea en blanco
```

Este bloque no calcula nada: solo informa. La cajera tiene que saber qué programa abrió antes de que le pregunten un número. Los signos `=` van dentro de comillas, así que para PSeInt son puro texto sin ningún significado especial; son exactamente 50, la misma medida que usa la línea de RESULTADOS del final, y por eso los dos marcos quedan alineados en pantalla.

**Bloque 3: la entrada del dato**

```
	Escribir Sin Saltar "Escriba el valor de la compra en pesos: ";   // pregunta y deja el cursor al lado
	Leer valorCompra;                                                 // guarda lo digitado en valorCompra
```

`Escribir Sin Saltar` imprime el texto pero no baja de línea, así que el usuario escribe justo después de los dos puntos y la pantalla se lee como una conversación. El `Leer` toma lo que la persona digitó y lo guarda en `valorCompra`. Fíjate en que el mensaje dice "en pesos": si no lo aclaras, alguien puede digitar 150 pensando en miles y el programa liquidaría una compra de ciento cincuenta pesos.

**Bloque 4: la decisión, que aquí solo fija un número**

```
	Si valorCompra > 100000 Entonces   // la promocion dice "mas de", por eso es > y no >=
		porcentaje <- 10;               // esta compra si entra en la promocion
	SiNo
		porcentaje <- 0;                // esta compra paga precio completo
	FinSi
```

Este es el bloque nuevo del ejercicio, y lo llamativo es lo que **no** tiene: no hay un solo `Escribir` adentro. Las dos ramas hacen lo mismo, guardar un número en `porcentaje`, y se diferencian únicamente en cuál número guardan. De las dos líneas de asignación se ejecuta siempre exactamente una: nunca las dos, nunca ninguna. Cuando el programa llega al `FinSi`, `porcentaje` tiene un valor seguro, venga del camino que venga, y esa es la garantía que necesitan los cálculos del bloque siguiente.

La sangría con TAB también dice algo. `porcentaje <- 10;` está un nivel más adentro que el `Si` porque le pertenece; `FinSi` vuelve al nivel del `Si` porque lo cierra. PSeInt entiende el programa igual sin sangría, pero tú no.

**Bloque 5: los dos cálculos, que van fuera del `Si`**

```
	descuento <- valorCompra * porcentaje / 100;   // el porcentaje que quedo guardado, convertido a pesos
	total <- valorCompra - descuento;              // lo que el cliente paga en la caja
```

Estas dos líneas están pegadas al margen del `Si`, no adentro de él, y ese detalle de sangría es la diferencia entre un programa que funciona y uno que se cae. Se ejecutan siempre, con el `porcentaje` que haya dejado el bloque anterior. Si quedó 10, el descuento sale positivo; si quedó 0, la multiplicación por cero deja el descuento en cero y la resta devuelve el valor original intacto.

Sacar un porcentaje es siempre la misma cuenta: multiplicar por el número del porcentaje y dividir entre 100. La multiplicación y la división tienen la misma prioridad y se resuelven de izquierda a derecha, así que para una compra de $150.000 la máquina hace primero `150000 * 10 = 1500000` y después `1500000 / 100 = 15000`. Ese `/ 100` no es opcional: es lo que traduce el número 10 a "10 de cada 100".

**Bloque 6: la salida de resultados**

```
	Escribir "";                                                      // separa las cuentas de los resultados
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Valor de la compra  : $ ", valorCompra;                 // texto y valor en la misma linea
	Escribir "Porcentaje aplicado : ", porcentaje, " por ciento";     // se puede pegar texto a los dos lados
	Escribir "Valor del descuento : $ ", descuento;
	Escribir "TOTAL A PAGAR       : $ ", total;
FinAlgoritmo
```

La coma dentro del `Escribir` pega texto y valores en una sola línea, y se pueden encadenar tantos pedazos como haga falta: en la línea del porcentaje hay texto, después el valor y después más texto. Los espacios extra antes de los dos puntos están puestos a propósito para que las cuatro cifras queden en columna y la salida se lea como un recibo de verdad.

Fíjate en que las cuatro salidas se imprimen fuera del `Si`, igual que los cálculos. La dueña quería ver los tres números para poder explicarle al cliente de dónde salió cada peso, y ahí están los tres, tomen el camino que tomen. `FinAlgoritmo` cierra el programa y no lleva punto y coma.

### 6. Prueba de escritorio

Hacer una prueba de escritorio es fingir que tú eres el computador: recorres el programa línea por línea, con lápiz, anotando qué valor tiene cada variable en cada momento. Es la única forma de encontrar un error de lógica sin ejecutar nada. Aquí seguimos el camino de una compra de **$150.000**, la que sí entra en la promoción. El símbolo `?` significa que la variable ya existe pero todavía no tiene ningún valor guardado, y la **negrita** marca el valor que acaba de cambiar en ese paso.

| Paso | Lo que ejecuta el computador | valorCompra | porcentaje | descuento | total | Qué aparece en pantalla |
|---|---|---|---|---|---|---|
| 1 | `Definir valorCompra, porcentaje, descuento, total Como Real;` | ? | ? | ? | ? | nada, solo se crean las cuatro cajas vacías |
| 2 | `Escribir "==================================================";` | ? | ? | ? | ? | la línea de signos `=` |
| 3 | `Escribir "  DESCUENTO POR MONTO DE COMPRA";` | ? | ? | ? | ? | `  DESCUENTO POR MONTO DE COMPRA` |
| 4 | `Escribir "==================================================";` | ? | ? | ? | ? | la línea de signos `=` |
| 5 | `Escribir "";` | ? | ? | ? | ? | una línea en blanco |
| 6 | `Escribir Sin Saltar "Escriba el valor de la compra en pesos: ";` | ? | ? | ? | ? | la pregunta, con el cursor esperando al lado |
| 7 | `Leer valorCompra;` — la cajera digita **150000** | **150000** | ? | ? | ? | el número que ella escribió |
| 8 | `Si valorCompra > 100000 Entonces` → 150000 > 100000 es Verdadero | 150000 | ? | ? | ? | nada, una comparación no imprime |
| 9 | `porcentaje <- 10;` | 150000 | **10** | ? | ? | nada, una asignación no imprime |
| 10 | `SiNo` con `porcentaje <- 0;` — **esta rama no se ejecuta** | 150000 | 10 | ? | ? | nada |
| 11 | `FinSi` | 150000 | 10 | ? | ? | nada, solo cierra la decisión |
| 12 | `descuento <- 150000 * 10 / 100;` → 1500000 / 100 | 150000 | 10 | **15000** | ? | nada |
| 13 | `total <- 150000 - 15000;` | 150000 | 10 | 15000 | **135000** | nada |
| 14 | `Escribir "";` | 150000 | 10 | 15000 | 135000 | una línea en blanco |
| 15 | `Escribir "------------------- RESULTADOS -------------------";` | 150000 | 10 | 15000 | 135000 | la línea de RESULTADOS |
| 16 | `Escribir "Valor de la compra  : $ ", valorCompra;` | 150000 | 10 | 15000 | 135000 | `Valor de la compra  : $ 150000` |
| 17 | `Escribir "Porcentaje aplicado : ", porcentaje, " por ciento";` | 150000 | 10 | 15000 | 135000 | `Porcentaje aplicado : 10 por ciento` |
| 18 | `Escribir "Valor del descuento : $ ", descuento;` | 150000 | 10 | 15000 | 135000 | `Valor del descuento : $ 15000` |
| 19 | `Escribir "TOTAL A PAGAR       : $ ", total;` | 150000 | 10 | 15000 | 135000 | `TOTAL A PAGAR       : $ 135000` |

**El paso crítico es el 8**, y vale la pena hacerlo a mano. El computador toma el valor guardado en `valorCompra`, que es 150000, lo pone en el lugar del nombre y le queda la pregunta `150000 > 100000`. La responde con Verdadero, y con eso decide que ejecuta el paso 9 y se salta el paso 10. Nunca ejecuta las dos ramas: elige una. Por eso en el paso 10 la fila aparece sin ningún cambio de valor, aunque la línea `porcentaje <- 0;` esté escrita en el archivo.

El otro paso que hay que mirar despacio es el 12, porque es donde se ve la idea del ejercicio. La fórmula dice `porcentaje`, no `10`. El programa fue a buscar qué había guardado en esa caja, encontró el 10 que dejó el paso 9 y calculó con él. Si el paso 8 hubiera dado Falso, esa misma línea, sin cambiar ni un carácter, habría calculado con un 0.

Y esto es lo que habría pasado con otros datos, siguiendo el mismo recorrido:

| Valor que digita la cajera | `valorCompra > 100000` | Camino que toma | porcentaje | descuento | total |
|---|---|---|---|---|---|
| 150000 | Verdadero | rama `Entonces` | 10 | 15000 | 135000 |
| 80000 | Falso | rama `SiNo` | 0 | 0 | 80000 |
| 100000 | Falso | rama `SiNo` | 0 | 0 | 100000 |
| 100001 | Verdadero | rama `Entonces` | 10 | 10000.1 | 90000.9 |

Compara las dos últimas filas: un solo peso de diferencia en la compra cambia el camino completo. Así de exacta es la frontera que escribiste en la condición.

### 7. Ejecución real verificada

Las tres corridas que siguen son la salida **literal** que produjo PSeInt al ejecutar el archivo bajo el perfil Estricto. El chequeo de sintaxis (`F9`) no reportó ningún error, y ninguna de las tres ejecuciones mostró un solo mensaje de `ERROR`. El símbolo `>` es la marca que PSeInt pone en el punto donde el usuario digita el dato.

**Corrida 1.** Datos escritos por teclado: `150000`, una compra que sí entra en la promoción.

```
==================================================
  DESCUENTO POR MONTO DE COMPRA
==================================================

Escriba el valor de la compra en pesos: > 150000

------------------- RESULTADOS -------------------
Valor de la compra  : $ 150000
Porcentaje aplicado : 10 por ciento
Valor del descuento : $ 15000
TOTAL A PAGAR       : $ 135000
```

Verificación a mano: 150000 es mayor que 100000, así que la condición dio Verdadero y `porcentaje` quedó en 10. El descuento es 150000 × 10 ÷ 100 = 1500000 ÷ 100 = **15000**. El total es 150000 − 15000 = **135000**. Los cuatro valores coinciden con la prueba de escritorio del punto anterior, que era la idea: si el papel y la máquina dan lo mismo, entendiste el algoritmo.

**Corrida 2.** Datos escritos por teclado: `80000`, una compra que no alcanza el tope.

```
==================================================
  DESCUENTO POR MONTO DE COMPRA
==================================================

Escriba el valor de la compra en pesos: > 80000

------------------- RESULTADOS -------------------
Valor de la compra  : $ 80000
Porcentaje aplicado : 0 por ciento
Valor del descuento : $ 0
TOTAL A PAGAR       : $ 80000
```

Verificación a mano: 80000 no es mayor que 100000, la condición dio Falso y `porcentaje` quedó en 0. El descuento es 80000 × 0 ÷ 100 = **0**, y el total es 80000 − 0 = **80000**, el mismo valor que entró. Fíjate en que las dos fórmulas se ejecutaron igual que en la corrida 1, con las mismas letras escritas en el archivo; lo único distinto fue el número que traían adentro. No hizo falta ningún camino especial para el cliente sin promoción.

**Corrida 3.** Datos escritos por teclado: `100000`. Este es el **caso frontera** y es el que decide si el programa está bien o está mal, porque el aviso dice "más de $100.000".

```
==================================================
  DESCUENTO POR MONTO DE COMPRA
==================================================

Escriba el valor de la compra en pesos: > 100000

------------------- RESULTADOS -------------------
Valor de la compra  : $ 100000
Porcentaje aplicado : 0 por ciento
Valor del descuento : $ 0
TOTAL A PAGAR       : $ 100000
```

Verificación a mano: la pregunta fue `100000 > 100000`, y un número no es mayor que sí mismo, así que la respuesta es Falso y el programa se fue por el `SiNo`. `porcentaje` quedó en 0, el descuento en 0 y el total en los 100000 que entraron. Esta corrida es la prueba de que el programa respeta el "más de" del aviso. Si al ejecutar la tuya con este mismo dato te aparece `Porcentaje aplicado : 10 por ciento` y un total de 90000, tu condición está escrita con `>=` y ya sabes exactamente qué carácter sobra.

### 8. Errores comunes en este ejercicio

| Lo que escribe el estudiante | Qué pasa | Cómo se arregla |
|---|---|---|
| `Si valorCompra >= 100000 Entonces` | Es **el error estrella de este ejercicio** y no produce ninguna queja de PSeInt. Con $150.000 y con $80.000 imprime exactamente lo mismo que el programa correcto, así que las dos primeras pruebas pasan y uno cierra el archivo tranquilo. Con una compra de exactamente $100.000 imprime `Porcentaje aplicado : 10 por ciento`, un descuento de $10.000 y un `TOTAL A PAGAR       : $ 90000`. La papelería regala $10.000 cada vez que alguien compra justo la cifra del tope. | El aviso dice "más de", no "desde": `Si valorCompra > 100000 Entonces`. Antes de teclear un `>` o un `>=`, pregúntate una sola cosa: el número del tope, ¿entra o no entra? |
| `Si valorCompra > 100.000 Entonces`, con el punto de los miles | PSeInt no lee `100.000` como cien mil: el punto es el separador **decimal**, así que para el programa ese número vale 100. Una compra de $80.000 pasa la condición sin problema y sale con `Porcentaje aplicado : 10 por ciento` y `TOTAL A PAGAR       : $ 72000`. No aparece ningún error: simplemente todo el mundo tiene descuento. | Dentro del código los números se escriben sin separador de miles: `100000`. El punto de los miles es para el aviso de la vitrina y para este documento, nunca para el `.psc`. |
| `porcentaje <- 0.10;` | Está mezclando las dos formas de escribir un porcentaje. La fórmula del bloque 5 ya divide entre 100, así que ese 0.10 se divide una segunda vez: para una compra de $150.000 el programa imprime `Porcentaje aplicado : 0.1 por ciento`, un descuento de $150 y un `TOTAL A PAGAR       : $ 149850`. Corre perfecto y le rebaja al cliente cien veces menos de lo prometido. | O guardas `10` y divides entre 100 en la fórmula, o guardas `0.10` y no divides. Las dos cosas juntas, no. Aquí se guarda `10`, que además es como está escrito el aviso. |
| Meter `descuento` y `total` dentro de la rama `Entonces` | El camino de la compra grande funciona y por eso el error pasa la primera prueba. Pero el camino de la compra pequeña deja esas dos variables sin ningún valor guardado, y al llegar al `Escribir` la ejecución se corta con `ERROR 215: Variable no inicializada (DESCUENTO).` El cliente de $80.000 nunca ve su total. | Sacar las dos fórmulas del `Si` y ponerlas debajo del `FinSi`, pegadas al margen. Ahí se ejecutan siempre, tome el programa el camino que tome. |
| Olvidar el `FinSi` | El programa ni siquiera arranca: PSeInt muestra `ERROR 117: Falta cerrar SI.` y señala la línea donde empieza el `Si`. Este es de los errores buenos, porque avisa antes de que alguien se lleve un total equivocado. | Todo `Si` se cierra con su `FinSi`, que no lleva punto y coma. Truco de oficio: escribe el `Si` y el `FinSi` de una vez, y solo después llenas el centro. |
| `Definir valorCompra, descuénto Como Real;` o `Escribir "Descuento aplicado según la promoción";` | Si la tilde cae dentro del nombre de una variable, PSeInt corta la ejecución con `ERROR 68: Caracter no valido` y lo repite por cada carácter raro que encuentre. Si cae dentro de un texto entre comillas no hay error, pero la consola de Windows imprime esas letras rotas y la salida queda con símbolos extraños en la mitad de las palabras. | En el `.psc` no van tildes ni eñes en ninguna parte, tampoco dentro de las comillas: `descuento`, `segun`, `promocion`, `anio`. Este documento `.md` sí lleva la ortografía completa; el código no. |
| Comentar el `.psc` con `//` para acordarse de qué hace cada línea | El programa corre igual y PSeInt no se queja, así que parece inofensivo. El problema aparece al abrir el diagrama de flujo con `Ctrl + D`: cada comentario se dibuja como una caja más, y este programa de veintidós líneas comentado sale convertido en un diagrama larguísimo donde ya no se distingue la decisión. Además el archivo se entrega limpio. | El `.psc` va sin un solo `//`. Las explicaciones viven en un documento aparte, que es exactamente lo que estás leyendo en la sección 5. |

---

## Solución del Ejercicio 5 — Clasificar el desempeño de una nota

### 1. Análisis antes de programar

Papel y lápiz antes que teclado. En este ejercicio la tentación es fuerte: uno cree que ya entendió la tabla de desempeños y se pone a escribir `Si` uno detrás de otro hasta que la cosa suene bien. Así es como salen los programas que corren sin un solo error y contestan mal. Antes de escribir la primera línea, deja por escrito qué entra, qué se decide y qué sale.

| Entradas | Proceso | Salidas |
|---|---|---|
| nota (Real): la nota definitiva del periodo, entre 0.0 y 5.0 | 1. Mostrar el banner del programa | La nota que quedó registrada, para que el profesor confirme que la escribió bien |
| | 2. Pedir la nota y leerla | El nivel de desempeño que le corresponde: BAJO, BASICO, ALTO o SUPERIOR |
| | 3. Si la nota es menor que 3, el nivel es BAJO | |
| | 4. Si no, y además es menor que 4, el nivel es BASICO | |
| | 5. Si no, y además es menor o igual a 4.5, el nivel es ALTO | |
| | 6. Si no, el nivel es SUPERIOR | |
| | 7. Mostrar la nota y el nivel | |

Tres cosas de este análisis merecen que te detengas.

**`desempeno` no está en la columna de entradas.** El profesor nunca la escribe por teclado. Es una variable de trabajo que nace de la necesidad del proceso, igual que la variable `auxiliar` del Ejercicio 5 del cuadernillo anterior. Distinguir cuáles variables vienen del usuario y cuáles nacen del proceso es parte de aprender a analizar.

**Los pasos 3, 4, 5 y 6 no son cuatro pasos seguidos.** Son cuatro caminos, y el programa recorre exactamente uno. Si la nota es 2.4, el paso 3 se cumple y los pasos 4, 5 y 6 no se ejecutan nunca: ni siquiera se miran. Esa es la diferencia entre una lista de instrucciones y una decisión.

**El paso 7 está afuera de la decisión.** Se ejecuta siempre, venga la nota que venga. Por eso el nivel se guarda en una variable en lugar de imprimirse dentro de cada camino: la escalera decide, y una sola línea al final muestra lo que decidió.

### 2. Diccionario de datos

| Variable | Tipo | Por qué ese tipo |
|---|---|---|
| nota | Real | Las notas del colegio llevan decimales: 3.5, 4.2, 4.55. `Real` es el único tipo que las admite. Si la declaras `Entero`, el programa arranca bien, dibuja el banner, pide la nota y se detiene en seco apenas alguien escriba un decimal, con el mensaje `ERROR 313: No coinciden los tipos (NOTA), el valor ingresado debe ser un entero`. Ojo con la trampa: si tú lo pruebas con 4 y con 2, una `nota` declarada `Entero` funciona perfecto y el archivo parece correcto. El error aparece el día que llegue la primera nota con decimales, que en una planilla de colegio son casi todas. Acuérdate también de que el separador decimal es el punto: se escribe `4.55`. |
| desempeno | Caracter | Guarda una palabra, no un número: BAJO, BASICO, ALTO o SUPERIOR. En PSeInt el tipo `Caracter` no guarda una sola letra, a pesar de como suena el nombre; guarda todo el texto que le metas, una palabra o una frase entera. Si la declaras `Real`, PSeInt ni siquiera arranca el programa: marca las cuatro asignaciones de la escalera, una por una, con `ERROR 125: No coinciden los tipos`. Y hay un detalle más que cuesta caro: el texto va **entre comillas**. `desempeno <- "BAJO";` guarda la palabra BAJO. `desempeno <- BAJO;` sin comillas hace que PSeInt busque una variable llamada BAJO, no la encuentre y detenga el programa con `ERROR 210: Variable no definida (BAJO)`. |

Ninguna de las dos es `Entero` ni `Logico`: no estamos contando cosas indivisibles y no estamos respondiendo verdadero o falso, sino repartiendo un número en cuatro cajones y guardando el nombre del cajón que le tocó.

### 3. La lógica explicada

Esta parte hay que leerla despacio. El código de este ejercicio son trece líneas de decisión; entender por qué esas trece y no otras es lo que te va a servir en el resto del curso.

**De dónde salen las condiciones.** La tabla oficial está escrita en castellano y el programa necesita comparaciones. Traducir renglón por renglón se ve así:

| Nivel | Como lo dice la tabla oficial | Como se dice en comparaciones |
|---|---|---|
| Bajo | menor que 3.0 | `nota < 3` |
| Básico | de 3.0 a 3.9 | `nota >= 3 Y nota < 4` |
| Alto | de 4.0 a 4.5 | `nota >= 4 Y nota <= 4.5` |
| Superior | de 4.6 a 5.0 | `nota > 4.5` |

Una aclaración sobre el renglón de Básico. Dice "de 3.0 a 3.9", pero la traducción no es `nota <= 3.9`, sino `nota < 4`. La razón es que entre 3.9 y 4.0 todavía caben notas: 3.95, 3.99. Cuando una tabla escribe el final de un rango con un decimal, casi siempre quiere decir "hasta justo antes del siguiente". Si tradujeras al pie de la letra `nota <= 3.9`, una nota de 3.95 se te escaparía del renglón de Básico y terminaría donde no debe.

**La escalera arrastra información, y por eso las condiciones quedan cortas.** Mira la columna derecha de esa tabla: dos de los cuatro renglones necesitan dos comparaciones unidas con `Y`. Y sin embargo, en el código de la solución no hay ni un solo `Y`. Eso no es un descuido: es el punto entero del ejercicio.

Cuando anidas cada `Si` dentro del `SiNo` del anterior, una condición solo se evalúa si **todas las anteriores fallaron**. Y que una condición falle es información. Si el programa llegó a la segunda pregunta, es porque `nota < 3` dio Falso, y eso quiere decir que la nota es 3.0 o más. Ese dato ya lo tienes gratis, sin preguntar.

| Escalón | Para llegar aquí tuvo que fallar | Lo que la máquina ya sabe de la nota | Condición que falta escribir |
|---|---|---|---|
| 1 | nada, es el primero | nada | `nota < 3` |
| 2 | `nota < 3` | que es 3.0 o más | `nota < 4` |
| 3 | `nota < 3` y `nota < 4` | que es 4.0 o más | `nota <= 4.5` |
| 4 | las tres anteriores | que pasa de 4.5 | ninguna, es el `SiNo` final |

Compara las dos formas de escribir el segundo escalón, con una nota de 3.5:

| Lo que escribes | Cómo lo resuelve la máquina con nota = 3.5 | Resultado |
|---|---|---|
| `Si nota >= 3 Y nota < 4 Entonces` | Resuelve `3.5 >= 3` y da Verdadero. Resuelve `3.5 < 4` y da Verdadero. Combina `Verdadero Y Verdadero` y da Verdadero | BASICO |
| `Si nota < 4 Entonces` | Resuelve `3.5 < 4` y da Verdadero | BASICO |

Las dos dan lo mismo, y van a dar lo mismo con cualquier nota. La primera mitad de la condición larga, `nota >= 3`, **no puede ser falsa nunca en esa línea**: si fuera falsa, el programa habría entrado al primer escalón y jamás habría llegado hasta ahí. Una condición que siempre es verdadera no decide nada; lo único que hace es darle trabajo extra a quien lee el programa. Escribirla no está mal, pero sobra, y en un programa largo esas sobras son las que terminan confundiendo.

**Las fronteras: 3.0 y 4.5.** Los valores que deciden si tu escalera quedó bien no son 2.4 ni 4.8. Son los que caen justo en el borde. Empecemos por el 3.0, que según la tabla es Básico:

| Lo que escribes en el primer escalón | Cómo lo resuelve la máquina con nota = 3.0 | Nivel que sale | ¿Coincide con la tabla oficial? |
|---|---|---|---|
| `Si nota < 3 Entonces` | `3 < 3` es Falso, así que baja al `SiNo`. Allí `3 < 4` es Verdadero | BASICO | Sí |
| `Si nota <= 3 Entonces` | `3 <= 3` es Verdadero, entra al primer escalón | BAJO | No |

Esa segunda versión se ejecutó de verdad y con una nota de 3.0 contestó BAJO, sin dar ningún error, sin ninguna advertencia. Un carácter de diferencia y un estudiante mal clasificado.

Ahora la otra frontera, el 4.5, que según la tabla es Alto:

| Lo que escribes en el tercer escalón | Cómo lo resuelve la máquina con nota = 4.5 | Nivel que sale | ¿Coincide con la tabla oficial? |
|---|---|---|---|
| `Si nota <= 4.5 Entonces` | `4.5 <= 4.5` es Verdadero, entra al tercer escalón | ALTO | Sí |
| `Si nota < 4.5 Entonces` | `4.5 < 4.5` es Falso, así que cae al `SiNo` final | SUPERIOR | No |

La regla es corta y te va a servir todo el curso: **`<` deja la frontera afuera y `<=` la deja adentro**. Cuando leas un rango en un enunciado, lo primero que tienes que preguntarte es si el número del borde pertenece al rango o no, porque de esa respuesta depende cuál de los dos signos va.

**El error clásico de este ejercicio: la escalera al revés.** Este hay que verlo con números, porque leyéndolo no asusta. Alguien escribe la escalera empezando por arriba, así:

```
	Si nota <= 5 Entonces
		desempeno <- "SUPERIOR";
	SiNo
		Si nota <= 4.5 Entonces
			desempeno <- "ALTO";
		SiNo
			Si nota < 4 Entonces
				desempeno <- "BASICO";
			SiNo
				desempeno <- "BAJO";
			FinSi
		FinSi
	FinSi
```

Cada línea, leída sola, es cierta: una nota menor o igual a 5 existe, una menor o igual a 4.5 existe. La sangría está perfecta, los tres `FinSi` están todos, `F9` pasa limpio y el programa corre. Y contesta esto:

| nota | Primera pregunta: `nota <= 5` | Qué pasa | Nivel que sale | Nivel correcto |
|---|---|---|---|---|
| 2.4 | `2.4 <= 5` es Verdadero | Entra al primer escalón y las otras tres preguntas no se evalúan nunca | SUPERIOR | BAJO |
| 3.5 | `3.5 <= 5` es Verdadero | Lo mismo | SUPERIOR | BASICO |
| 4.2 | `4.2 <= 5` es Verdadero | Lo mismo | SUPERIOR | ALTO |
| 4.8 | `4.8 <= 5` es Verdadero | Lo mismo | SUPERIOR | SUPERIOR, acierta por casualidad |

Esas cuatro respuestas salieron de ejecutar el programa equivocado de verdad. Todas las notas del colegio caen en el primer escalón, porque todas son menores o iguales a 5: el programa quedó convertido en una máquina de decir SUPERIOR. Y el único caso en el que acierta es justamente el que un estudiante de afán escoge para probar.

¿Por qué pasa? Porque en una escalera **la primera pregunta tiene que ser la más estrecha**, la que solo puede responder que sí para un grupo pequeño de valores. `nota <= 5` es verdadera para cualquier nota del colegio, así que se traga todo lo que le llega. `nota < 3`, en cambio, solo es verdadera para las notas bajas, y deja pasar el resto hacia los escalones de abajo.

Si prefieres pensar de mayor a menor, se puede, pero entonces las condiciones cambian todas: la primera sería `nota > 4.5` para SUPERIOR, la segunda `nota >= 4` para ALTO y la tercera `nota >= 3` para BASICO, y el `SiNo` final se queda con BAJO. Esa escalera funciona igual de bien. Lo que no funciona es mezclar las dos: escribir las condiciones de una y ponerlas en el orden de la otra.

**El otro error: cuatro `Si` sueltos en vez de una escalera.** El segundo intento típico es este, y hasta se ve más ordenado:

```
	Si nota < 3 Entonces
		desempeno <- "BAJO";
	FinSi
	Si nota < 4 Entonces
		desempeno <- "BASICO";
	FinSi
	Si nota <= 4.5 Entonces
		desempeno <- "ALTO";
	FinSi
	Si nota > 4.5 Entonces
		desempeno <- "SUPERIOR";
	FinSi
```

Son las mismas condiciones, en el mismo orden, sin un solo `SiNo`. Pero aquí no hay una decisión con cuatro salidas: hay cuatro decisiones independientes, y **las cuatro se evalúan**. Seguimos una nota de 2.4 línea por línea:

| Línea que se ejecuta | Con nota = 2.4 | Qué queda guardado en desempeno |
|---|---|---|
| `Si nota < 3` | `2.4 < 3` es Verdadero | BAJO |
| `Si nota < 4` | `2.4 < 4` es Verdadero | BASICO, que acaba de pisar a BAJO |
| `Si nota <= 4.5` | `2.4 <= 4.5` es Verdadero | ALTO, que acaba de pisar a BASICO |
| `Si nota > 4.5` | `2.4 > 4.5` es Falso | ALTO, que es lo último que quedó |

Este programa también se ejecutó de verdad, y con 2.4, con 3.5 y con 4.2 contestó ALTO las tres veces. La asignación destruye el valor anterior sin preguntarle a nadie, que es exactamente la lección del Ejercicio 5 del cuadernillo anterior, el de intercambiar dos variables.

La diferencia de fondo entre los dos códigos es esta: en la escalera, apenas una condición acierta, las demás **ni se miran**, porque están todas metidas dentro del `SiNo` de la anterior. En los cuatro `Si` sueltos no hay nada que corte el paso, así que el programa recorre las cuatro preguntas y gana la última que resulte verdadera.

**El hueco de la tabla oficial.** Vuelve a mirar la tabla del enunciado: Alto va "de 4.0 a 4.5" y Superior "de 4.6 a 5.0". ¿Dónde queda una nota de 4.55? En ningún renglón. La tabla tiene un hueco y no lo dice.

Esto no es un invento de este ejercicio: pasa todo el tiempo con tarifas, escalas salariales y reglamentos del mundo real, escritos pensando en valores de un solo decimal y sin acordarse de lo que hay en medio. Cuando pasa, el que decide es el programador, porque el computador va a contestar algo de todas maneras. Aquí la decisión ya está tomada y vive en la condición del tercer escalón:

| nota | ¿Aparece en la tabla oficial? | Qué contesta el programa | Por qué |
|---|---|---|---|
| 4.5 | Sí, en el renglón de Alto | ALTO | `4.5 <= 4.5` es Verdadero |
| 4.55 | No aparece en ningún renglón | SUPERIOR | `4.55 <= 4.5` es Falso, así que cae al `SiNo` final |
| 4.6 | Sí, en el renglón de Superior | SUPERIOR | `4.6 <= 4.5` es Falso, cae en el mismo sitio |

Si el colegio prefiriera que 4.55 quedara en Alto, la condición del tercer escalón sería `nota < 4.6` y asunto arreglado. Ninguna de las dos versiones es más correcta que la otra: la correcta es la que el colegio acuerde. Lo que no se puede hacer es dejar el hueco sin tapar y confiar en que nunca va a llegar un 4.55, porque el día que llegue el programa va a contestar sin avisar que estaba pisando terreno indefinido.

### 4. El código completo

Este es el archivo `PSC/Ejercicio_05_ClasificarNota.psc` tal cual:

```
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
```

Cuenta las líneas de la decisión: tres `Si`, tres `SiNo`, cuatro asignaciones y tres `FinSi`. Ni un `Y`, ni un `O`, ni un solo comentario.

### 5. El código explicado bloque por bloque

**Advertencia importante: los comentarios que empiezan con `//` que vas a ver aquí abajo existen SOLO en esta explicación. NO los copies a tu archivo `.psc`.** La razón es práctica: PSeInt dibuja cada comentario como una caja extra dentro del diagrama de flujo (`Ctrl + D`), y en un programa con escalera, donde el diagrama ya tiene tres rombos de decisión, esas cajas de más lo vuelven ilegible. Tu archivo va limpio; las explicaciones viven aquí.

**Bloque 1: el encabezado y las declaraciones**

```
Algoritmo ClasificarNota
	Definir nota Como Real;            // la nota que escribe el profesor, con decimales
	Definir desempeno Como Caracter;   // aqui va a quedar la palabra del nivel
```

El nombre del algoritmo tiene que coincidir con el nombre del archivo sin el `Ejercicio_05_` ni la extensión. Las dos variables se declaran en líneas separadas porque son de tipos distintos: en un mismo `Definir` solo caben variables del mismo tipo.

Fíjate en que `desempeno` se declara aquí, al principio, aunque su valor no se decide sino mucho más abajo. Declarar es reservar la caja; llenarla es otra cosa y viene después.

**Bloque 2: el banner que ve el usuario**

```
	Escribir "==================================================";   // 50 signos igual
	Escribir "  CLASIFICAR EL DESEMPENO DE UNA NOTA";                // dos espacios de sangria
	Escribir "==================================================";
	Escribir "";                                                     // linea en blanco
```

Esto no cambia ni un cálculo, pero un programa que no dice qué hace está incompleto. Observa que el título dice `DESEMPENO` y no `DESEMPEÑO`: dentro del `.psc` no van eñes ni tildes, ni siquiera dentro de las comillas, porque la consola de Windows las muestra rotas.

**Bloque 3: la pregunta y la lectura**

```
	Escribir Sin Saltar "Escriba la nota definitiva del periodo (0.0 a 5.0): ";   // Sin Saltar deja el cursor al lado
	Leer nota;                                                                    // lo que se teclee entra en nota
```

`Escribir Sin Saltar` no baja de línea, así que el profesor escribe justo al lado del mensaje. El mensaje incluye el rango `(0.0 a 5.0)` a propósito: quien usa el programa no tiene por qué adivinar en qué escala se le está pidiendo la nota. `Leer` detiene el programa hasta que la persona teclee algo y oprima Enter.

**Bloque 4: el primer escalón de la escalera**

```
	Si nota < 3 Entonces       // la pregunta mas estrecha va de primera
		desempeno <- "BAJO";   // solo entran aqui las notas menores que 3
	SiNo                       // a partir de esta linea ya se sabe que la nota es 3.0 o mas
```

Esta es la pregunta que reparte todo. Si da Verdadero, se guarda BAJO y el programa salta directo hasta el último `FinSi`: todo lo que hay entre el `SiNo` y ese `FinSi` se ignora por completo.

Si da Falso, entra al `SiNo`, y esa entrada trae información. Nadie la escribe en ninguna parte, pero cualquiera que lea el programa sabe que a partir de ahí la nota es 3.0 o más, porque si fuera menor no estaría ahí. Eso es lo que permite que las siguientes preguntas sean de una sola comparación.

**Bloque 5: los otros dos escalones y los tres `FinSi`**

```
		Si nota < 4 Entonces               // segundo escalon: aqui la nota ya es 3.0 o mas
			desempeno <- "BASICO";         // entonces esto cubre el rango 3.0 a 3.99
		SiNo                               // aqui abajo la nota ya es 4.0 o mas
			Si nota <= 4.5 Entonces        // tercer escalon: el <= mete al 4.5 en ALTO
				desempeno <- "ALTO";
			SiNo                           // este SiNo es el ultimo: no pregunta nada
				desempeno <- "SUPERIOR";   // todo lo que pase de 4.5 cae aqui
			FinSi                          // cierra el Si de nota <= 4.5
		FinSi                              // cierra el Si de nota < 4
	FinSi                                  // cierra el Si de nota < 3
```

Aquí está el ejercicio completo. Cada `Si` nuevo vive dentro del `SiNo` del anterior, y por eso la sangría crece un TAB en cada escalón. La sangría no cambia lo que hace el programa, pero es lo único que te deja ver de un vistazo cuál `SiNo` pertenece a cuál `Si`.

El último `SiNo` es distinto de los otros dos: no abre ningún `Si` adentro. Ahí no hace falta preguntar nada porque ya no queda nada que preguntar. Si la nota no es menor que 3, ni menor que 4, ni menor o igual a 4.5, entonces pasa de 4.5 y punto. Cuatro caminos con tres preguntas.

Los tres `FinSi` se cierran en el orden inverso al que se abrieron, igual que los paréntesis en matemáticas: el que se abrió de último se cierra de primero. Si te falta uno, PSeInt te lo dice con `ERROR 117: Falta cerrar SI` antes de ejecutar. Si te sobra, también se queja. Estos son los errores fáciles: los peligrosos son los otros, los que no dan ningún mensaje.

**Bloque 6: los resultados**

```
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Nota definitiva    : ", nota, " puntos";   // la coma pega la etiqueta con el valor
	Escribir "Nivel de desempeno : ", desempeno;         // una sola linea para los cuatro caminos
FinAlgoritmo
```

Estas dos líneas de salida están **afuera** de toda la escalera, así que se ejecutan siempre, sin importar por dónde haya pasado el programa. Esa es la ventaja de guardar el nivel en una variable en lugar de escribirlo dentro de cada rama: el mensaje se escribe una sola vez, y el día que el colegio cambie "BASICO" por otra palabra hay un solo sitio que tocar.

Los espacios antes de los dos puntos no son adorno: alinean las dos etiquetas para que los valores queden uno debajo del otro. `FinAlgoritmo` cierra el programa y va sin punto y coma.

### 6. Prueba de escritorio

Hacer una prueba de escritorio es hacer de computador con lápiz y papel: recorrer el programa línea por línea anotando qué valor tiene cada variable. Vamos a seguir la nota **4.2**, que es el caso que atraviesa las tres preguntas. El símbolo `?` significa que la variable ya existe pero todavía no tiene ningún valor útil.

| Paso | Línea que se ejecuta | nota | desempeno | Qué aparece en pantalla |
|---|---|---|---|---|
| 1 | `Definir nota Como Real;` y `Definir desempeno Como Caracter;` | ? | ? | (nada) |
| 2 | Los tres `Escribir` del banner y el `Escribir ""` | ? | ? | La línea de signos igual, el título y otra línea de signos igual |
| 3 | `Escribir Sin Saltar "Escriba la nota..."` | ? | ? | Escriba la nota definitiva del periodo (0.0 a 5.0): |
| 4 | `Leer nota;` | **4.2** | ? | > 4.2 |
| 5 | `Si nota < 3 Entonces` evalúa `4.2 < 3` y da Falso | 4.2 | ? | (nada) |
| 6 | Salta al `SiNo` y evalúa `Si nota < 4`, o sea `4.2 < 4`, y da Falso | 4.2 | ? | (nada) |
| 7 | Salta al segundo `SiNo` y evalúa `Si nota <= 4.5`, o sea `4.2 <= 4.5`, y da Verdadero | 4.2 | ? | (nada) |
| 8 | `desempeno <- "ALTO";` | 4.2 | **ALTO** | (nada) |
| 9 | Salta hasta después de los tres `FinSi` | 4.2 | ALTO | (nada) |
| 10 | `Escribir "";` y la línea de RESULTADOS | 4.2 | ALTO | Una línea en blanco y `------------------- RESULTADOS -------------------` |
| 11 | `Escribir "Nota definitiva    : ", nota, " puntos";` | 4.2 | ALTO | Nota definitiva    : 4.2 puntos |
| 12 | `Escribir "Nivel de desempeno : ", desempeno;` | 4.2 | ALTO | Nivel de desempeno : ALTO |
| 13 | `FinAlgoritmo` | 4.2 | ALTO | (el programa termina) |

El paso crítico son los pasos 5, 6, 7 y 8, y conviene hacerlos a mano. La máquina no adivina: reemplaza `nota` por el número que tiene guardado y resuelve la comparación. Primero `4.2 < 3`, que es Falso, así que la asignación de BAJO se salta entera. Después `4.2 < 4`, que también es Falso, así que la de BASICO también se salta. Y por último `4.2 <= 4.5`, que sí es Verdadero, y ahí se ejecuta la única asignación de todo el programa.

Fíjate en la columna de `desempeno`: se mantiene en `?` desde el paso 1 hasta el paso 8. En todo el programa se ejecuta **una sola** asignación, nunca dos, nunca cero. Ese es el sello de que la escalera está bien armada, y es justo lo que se rompe en la versión de los cuatro `Si` sueltos, donde con una nota de 2.4 se ejecutan tres.

Y esto es lo que habría pasado con los otros datos de prueba. "No se evalúa" quiere decir que el programa ni siquiera llega a esa línea:

| nota | `nota < 3` | `nota < 4` | `nota <= 4.5` | Dónde cae | desempeno |
|---|---|---|---|---|---|
| 2.4 | Verdadero | no se evalúa | no se evalúa | primer escalón | BAJO |
| 3.0 | Falso | Verdadero | no se evalúa | segundo escalón | BASICO |
| 3.5 | Falso | Verdadero | no se evalúa | segundo escalón | BASICO |
| 4.2 | Falso | Falso | Verdadero | tercer escalón | ALTO |
| 4.5 | Falso | Falso | Verdadero | tercer escalón | ALTO |
| 4.55 | Falso | Falso | Falso | el `SiNo` final | SUPERIOR |
| 4.8 | Falso | Falso | Falso | el `SiNo` final | SUPERIOR |

Mira la primera fila: con una nota de 2.4 el programa hace **una sola** comparación en todo su recorrido. Una escalera bien ordenada no solo acierta, además trabaja menos.

### 7. Ejecución real verificada

El archivo se ejecutó con el intérprete de PSeInt bajo el perfil Estricto, con los siete juegos de datos de la tabla de prueba del enunciado. El chequeo de sintaxis no reportó ni un error, y estas son las salidas literales.

**Corrida 1.** Datos escritos por teclado: nota = 2.4.

```
==================================================
  CLASIFICAR EL DESEMPENO DE UNA NOTA
==================================================

Escriba la nota definitiva del periodo (0.0 a 5.0): > 2.4

------------------- RESULTADOS -------------------
Nota definitiva    : 2.4 puntos
Nivel de desempeno : BAJO
```

`2.4 < 3` es Verdadero, así que entra al primer escalón y guarda BAJO. Las otras dos preguntas no se evalúan. Coincide con la tabla oficial, donde Bajo es todo lo que esté por debajo de 3.0.

**Corrida 2.** Datos escritos por teclado: nota = 3.5.

```
==================================================
  CLASIFICAR EL DESEMPENO DE UNA NOTA
==================================================

Escriba la nota definitiva del periodo (0.0 a 5.0): > 3.5

------------------- RESULTADOS -------------------
Nota definitiva    : 3.5 puntos
Nivel de desempeno : BASICO
```

`3.5 < 3` es Falso y `3.5 < 4` es Verdadero, así que cae en el segundo escalón: BASICO. Y aquí se ve lo que se explicó arriba: alcanzó con `nota < 4` porque el primer escalón ya había descartado todo lo menor que 3.

**Corrida 3.** Datos escritos por teclado: nota = 4.2.

```
==================================================
  CLASIFICAR EL DESEMPENO DE UNA NOTA
==================================================

Escriba la nota definitiva del periodo (0.0 a 5.0): > 4.2

------------------- RESULTADOS -------------------
Nota definitiva    : 4.2 puntos
Nivel de desempeno : ALTO
```

`4.2 < 3` es Falso, `4.2 < 4` es Falso y `4.2 <= 4.5` es Verdadero: tercer escalón, ALTO. Es el mismo recorrido que se siguió a mano en la prueba de escritorio, paso por paso, y da lo mismo.

**Corrida 4.** Datos escritos por teclado: nota = 4.8.

```
==================================================
  CLASIFICAR EL DESEMPENO DE UNA NOTA
==================================================

Escriba la nota definitiva del periodo (0.0 a 5.0): > 4.8

------------------- RESULTADOS -------------------
Nota definitiva    : 4.8 puntos
Nivel de desempeno : SUPERIOR
```

Las tres preguntas dan Falso: `4.8 < 3` no, `4.8 < 4` no, `4.8 <= 4.5` tampoco. Cae en el `SiNo` final, el que no pregunta nada, y guarda SUPERIOR.

**Corrida 5. Caso frontera.** Datos escritos por teclado: nota = 3.0, el valor exacto que separa Bajo de Básico.

```
==================================================
  CLASIFICAR EL DESEMPENO DE UNA NOTA
==================================================

Escriba la nota definitiva del periodo (0.0 a 5.0): > 3.0

------------------- RESULTADOS -------------------
Nota definitiva    : 3 puntos
Nivel de desempeno : BASICO
```

Esta es la corrida que verifica el signo del primer escalón. `3 < 3` es Falso, así que 3.0 **no** es Bajo, y baja al segundo escalón, donde `3 < 4` es Verdadero: BASICO, que es lo que dice la tabla oficial. Si la condición estuviera escrita `nota <= 3`, esta misma corrida habría contestado BAJO.

Fíjate también en la línea de la nota: se escribió `3.0` y aparece `3`. PSeInt no imprime los decimales que valen cero. No es un error: para la máquina `3` y `3.0` son el mismo número, y la comparación se hizo con el valor, no con lo que se ve.

**Corrida 6. La otra frontera.** Datos escritos por teclado: nota = 4.5, el valor exacto que separa Alto de Superior.

```
==================================================
  CLASIFICAR EL DESEMPENO DE UNA NOTA
==================================================

Escriba la nota definitiva del periodo (0.0 a 5.0): > 4.5

------------------- RESULTADOS -------------------
Nota definitiva    : 4.5 puntos
Nivel de desempeno : ALTO
```

`4.5 <= 4.5` es Verdadero, así que 4.5 queda adentro del nivel Alto, que es lo que pide la tabla. Esta es la corrida que verifica el `<=` del tercer escalón: con `<` habría contestado SUPERIOR.

**Corrida 7. El hueco de la tabla.** Datos escritos por teclado: nota = 4.55, una nota que no aparece en ningún renglón de la tabla oficial.

```
==================================================
  CLASIFICAR EL DESEMPENO DE UNA NOTA
==================================================

Escriba la nota definitiva del periodo (0.0 a 5.0): > 4.55

------------------- RESULTADOS -------------------
Nota definitiva    : 4.55 puntos
Nivel de desempeno : SUPERIOR
```

`4.55 <= 4.5` es Falso, así que cae en el `SiNo` final: SUPERIOR. Ninguna nota se queda sin nivel, que era la condición que se puso al tapar el hueco. Las siete corridas coinciden con lo que se calculó a mano en la sección 6.

### 8. Errores comunes en este ejercicio

| Lo que escribe el estudiante | Qué pasa | Cómo se arregla |
|---|---|---|
| Escribe la escalera al revés, empezando por `Si nota <= 5 Entonces` | Todas las notas del colegio son menores o iguales a 5, así que todas entran al primer escalón y las otras preguntas no se evalúan nunca. El programa contesta SUPERIOR con 2.4, con 3.5 y con 4.2. PSeInt no da ni un error ni una advertencia: `F9` pasa limpio y el programa corre feliz contestando mal | La primera pregunta de la escalera tiene que ser la más estrecha, la que solo dice que sí para un grupo pequeño de notas. De menor a mayor: primero `nota < 3`, después `nota < 4`, después `nota <= 4.5` |
| Escribe cuatro `Si` sueltos, cada uno con su `FinSi`, sin ningún `SiNo` | No es una decisión con cuatro salidas sino cuatro decisiones sueltas, y las cuatro se evalúan. Con una nota de 2.4 se ejecutan tres asignaciones seguidas y cada una pisa a la anterior: queda ALTO. Con 3.5 y con 4.2 también queda ALTO. Otra vez, ni un mensaje de error | Anidar: cada `Si` nuevo va dentro del `SiNo` del anterior. Así, apenas una condición acierta, el resto ni se mira |
| Cambia `<` por `<=` en alguna frontera, o al contrario | Es el error de un solo carácter y es invisible en las pruebas normales. Con `Si nota <= 3` en el primer escalón, una nota de 3.0 sale BAJO en vez de BASICO. Con `Si nota < 4.5` en el tercero, una nota de 4.5 sale SUPERIOR en vez de ALTO. Con 2.4 y con 4.8 los dos programas aciertan, así que el error solo se descubre si pruebas los bordes | Antes de escribir la condición, pregúntate si el número del borde pertenece o no al rango. `<` lo deja afuera, `<=` lo deja adentro. Y prueba siempre con el valor exacto de la frontera, no solo con valores cómodos |
| Le falta un `FinSi`, o cierra los tres en el orden equivocado | Este sí lo detecta PSeInt antes de ejecutar: `ERROR 117: Falta cerrar SI`, con el número de la línea donde empezó el `Si` que quedó abierto | Tres `Si` piden tres `FinSi`, y se cierran en orden inverso al que se abrieron. Usa el TAB en cada escalón: si la sangría está bien puesta, los `FinSi` que faltan saltan a la vista |
| Escribe `desempeno <- BAJO;` sin las comillas | PSeInt cree que BAJO es el nombre de otra variable, la busca, no la encuentra y detiene el programa con `ERROR 210: Variable no definida (BAJO)`. Y hay algo peor: el error solo aparece si el programa **pasa** por esa línea. Con una nota de 3.5 el programa corrió completo y contestó BASICO sin quejarse, porque nunca entró al primer escalón; con 2.4 se cayó. Un mismo archivo que unas veces funciona y otras no | Todo texto va entre comillas dobles: `desempeno <- "BAJO";`. Y cuando pruebes, pasa por los cuatro caminos, no solo por uno: un camino que nunca se ejecuta es un camino que nunca se revisa |
| Escribe `desempeño` con eñe, o pone tildes dentro de los textos entre comillas | Si la eñe está en el nombre de la variable, PSeInt no arranca: marca `ERROR 48: Identificador no valido` en el `Definir` y `ERROR 86: Identificador no valido` en cada línea que la use. Si la tilde está adentro de un texto entre comillas no da error, pero la consola imprime un carácter roto donde iba la letra, y el profesor recibe una planilla con basura | En el `.psc` no van tildes ni eñes, ni siquiera dentro de las comillas: `desempeno`, `DESEMPENO`, `periodo`. Este documento `.md` sí va con ortografía completa; el archivo de código no |
| Le pone comentarios `//` al `.psc` para explicar cada escalón | El programa corre igual, no hay error. El problema aparece con `Ctrl + D`: PSeInt dibuja cada comentario como una caja extra en el diagrama de flujo, y en un programa con tres rombos de decisión anidados esas cajas dejan el diagrama ilegible | El `.psc` va limpio. Si necesitas explicarte la escalera a ti mismo, hazlo en papel o en un `.md` aparte, como este. Los comentarios de la sección 5 existen solo aquí |

---

## Solución del Ejercicio 6 — ¿El año es bisiesto?

### 1. Análisis antes de programar

Este cuadro se llena con lápiz y papel antes de tocar el teclado. Fíjate en la columna del medio: es la primera vez en el cuadernillo que el proceso no es una sola pregunta, sino tres preguntas que después hay que combinar. Si te sientas a escribir código sin tener claras esas tres preguntas por separado, vas a terminar armando la condición a punta de ensayo y error, y así no se aprende nada.

| Entradas | Proceso | Salidas |
|---|---|---|
| `anio`: el año que la secretaria quiere verificar | 1. Averiguar si el año es divisible entre 4.<br>2. Averiguar si es divisible entre 100.<br>3. Averiguar si es divisible entre 400.<br>4. Combinar esas tres respuestas en **una sola** condición que diga si el año es bisiesto.<br>5. Según el camino que se tome, guardar 29 o 28 en `diasFebrero`. | El año ingresado<br>El veredicto: SI o NO es bisiesto<br>`diasFebrero`: 29 o 28 |

Hay un detalle del paso 5 que conviene mirar de una vez. El programa no imprime "29 días" en un camino y "28 días" en el otro: lo que hace es **guardar** el número en una variable dentro de cada camino, y la línea que lo muestra en pantalla se escribe una sola vez, después del `FinSi`. Es el mismo movimiento del Ejercicio 4, el del descuento, donde la decisión fijaba el porcentaje y las cuentas venían después. Cuando la decisión cambia un dato en lugar de cambiar un mensaje, el programa queda más corto y mucho más fácil de modificar.

### 2. Diccionario de datos

| Variable | Tipo | Por qué ese tipo |
|---|---|---|
| `anio` | Entero | Un año se cuenta de uno en uno: existe el 2024 y existe el 2025, pero no existe el año 2024.5. A esa razón se le suma otra que pesa todavía más: el operador `%` solo trabaja con números enteros. Si declaras `anio` Como Real, el programa arranca y hasta funciona mientras el usuario escriba números redondos, pero el día que alguien teclee `2024.5` PSeInt corta la ejecución en la línea del `Si` con `ERROR 298: Los operandos para el operador MOD deben ser enteros`. Declarándola Entero el freno llega antes y en un sitio mucho más fácil de entender, apenas el usuario escribe el dato: `ERROR 313: No coinciden los tipos (ANIO), el valor ingresado debe ser un entero.` Los dos mensajes están comprobados. Entre dos errores, prefiere siempre el que aparece más cerca de donde está la causa. |
| `diasFebrero` | Entero | Febrero tiene 28 o 29 días, nunca 28.5. Es un conteo de días completos, así que el tipo natural es Entero. Cuidado con declararla Como Caracter pensando que "es parte del mensaje que se imprime": si lo haces, las dos líneas de asignación fallan con `ERROR 125: No coinciden los tipos.`, porque 29 es un número y una variable Caracter guarda texto. Y cuidado también con no declararla: si se te olvida, el programa arranca, alcanza a pedir el año y se cae después con `ERROR 211: La variable (DIASFEBRERO) no esta definida.` |

Observa que `diasFebrero` es una variable que el usuario nunca teclea y que no sale de ninguna cuenta: nace de la decisión. Aun así se declara igual que las demás, al principio y con su tipo. En el perfil Estricto toda variable se declara antes de usarse, sin excepciones, y eso incluye a las que solo guardan un resultado intermedio.

### 3. La lógica explicada

**De dónde sale la regla, para que no te parezca arbitraria**

La Tierra no le da la vuelta al Sol en 365 días exactos, sino en unos 365.2422 días. Ese sobrante de casi un cuarto de día es el que obliga a inventar los años bisiestos, y de ahí salen las tres reglas del enunciado:

| Cómo se cuentan los años | Días que le asigna al año, en promedio | Qué tan lejos queda de 365.2422 |
|---|---|---|
| Todos los años de 365 días, sin bisiestos | 365 | Se atrasa 0.2422 días por año: en cuatro siglos, casi 97 días de corrimiento |
| Uno bisiesto cada 4 años, sin excepciones | 365.25 | Se adelanta 0.0078 días por año: en cuatro siglos, algo más de 3 días de sobra |
| La regla completa: 4, salvo 100, salvo 400 | 365.2425 | Se adelanta 0.0003 días por año: un día de más cada 3300 años |

La segunda fila es la regla que casi todo el mundo se sabe, y se pasa de largo. Por eso hay que quitarle tres días bisiestos cada 400 años, y la manera de quitarlos fue esta: de los cuatro años de siglo que caben en 400 años (1700, 1800, 1900 y 2000, por ejemplo), tres dejan de ser bisiestos y solo se salva el que es divisible entre 400. Haz la cuenta tú mismo: en 400 años hay 100 múltiplos de 4, se le restan los 4 años de siglo y se le devuelve 1, quedan 97 años bisiestos. Y 365 + 97/400 = 365.2425, que es exactamente el número de la tercera fila.

**Cómo se pregunta "es divisible entre N"**

En PSeInt no hay ninguna función que responda eso. La pregunta se arma con `%`, el operador que da el **residuo** de una división, el mismo del Ejercicio 8 del cuadernillo anterior. Si el residuo es cero, la división fue exacta, y una división exacta es precisamente lo que quiere decir "divisible".

Estos son los tres residuos de los cuatro años del ejercicio. Sácalos tú también en papel antes de seguir leyendo:

| Año | `anio % 4` | `anio % 100` | `anio % 400` |
|---|---|---|---|
| 2024 | 0 | 24 | 24 |
| 2023 | 3 | 23 | 23 |
| 1900 | 0 | 0 | 300 |
| 2000 | 0 | 0 | 0 |

Un ejemplo de cómo se comprueba una casilla, la de 1900 contra 400: 400 x 4 = 1600, y de 1600 a 1900 hay 300. Como sobran 300, la división no fue exacta y 1900 **no** es divisible entre 400. Esa casilla es la que decide todo el ejercicio, como vas a ver enseguida.

**Las tres preguntas, con nombre**

Para no perdernos entre paréntesis, le ponemos nombre a cada pedazo de la condición:

| Nombre | Cómo se escribe en PSeInt | Qué pregunta |
|---|---|---|
| A | `anio % 4 = 0` | ¿El año es divisible entre 4? |
| B | `anio % 100 <> 0` | ¿El año **no** es divisible entre 100? |
| C | `anio % 400 = 0` | ¿El año es divisible entre 400? |

Fíjate en B. La regla dice "no si es divisible entre 100", y esa palabra "no" se puede escribir de dos maneras: comparando el residuo contra cero con `<>`, que significa "distinto de", o negando la pregunta completa con `NO`. Más abajo se muestran las dos.

**La tabla de verdad de los cuatro años**

Esta es la tabla que resuelve el ejercicio. Cada casilla es Verdadero o Falso, y las dos columnas de la derecha se llenan combinando las tres de la izquierda:

| Año | A: `anio % 4 = 0` | B: `anio % 100 <> 0` | C: `anio % 400 = 0` | `A Y B` | `(A Y B) O C` | ¿Bisiesto? |
|---|---|---|---|---|---|---|
| 2024 | Verdadero | Verdadero | Falso | Verdadero | **Verdadero** | Sí |
| 2023 | Falso | Verdadero | Falso | Falso | **Falso** | No |
| 1900 | Verdadero | Falso | Falso | Falso | **Falso** | No |
| 2000 | Verdadero | Falso | Verdadero | Falso | **Verdadero** | Sí |

Lee la fila de 1900 y la de 2000 una debajo de la otra. Las columnas A y B son idénticas en las dos: los dos años son divisibles entre 4 y los dos son divisibles entre 100, así que en las dos `A Y B` da Falso. Lo único que las diferencia es la columna C, y esa columna sola alcanza para voltearle el resultado a 2000. Ahí está todo el ejercicio resumido: **una parte de la condición decide acompañada, y otra parte decide sola.**

**Qué hacen exactamente `Y` y `O`**

Son operadores que reciben dos condiciones y devuelven una sola respuesta:

| Condición izquierda | Condición derecha | `izquierda Y derecha` | `izquierda O derecha` |
|---|---|---|---|
| Verdadero | Verdadero | Verdadero | Verdadero |
| Verdadero | Falso | Falso | Verdadero |
| Falso | Verdadero | Falso | Verdadero |
| Falso | Falso | Falso | Falso |

Dicho en español de todos los días: `Y` es exigente, necesita que las dos cosas se cumplan al mismo tiempo, como cuando en la portería te dicen "te dejo entrar si traes la cédula **y** el carné". `O` es generoso, se conforma con que se cumpla una de las dos, como cuando en la tienda te dicen "puedes pagar en efectivo **o** con tarjeta". Nadie te está pidiendo que pagues de las dos formas.

Ahora vuelve a leer la regla del calendario con esos dos significados en la cabeza:

- "Es divisible entre 4 **pero no** entre 100" son dos exigencias que se piden al tiempo. Eso se escribe `A Y B`.
- "**Salvo** que sea divisible entre 400, en cuyo caso sí lo es" es una salvación que funciona ella sola, sin ayuda de nadie y aunque lo anterior haya fallado. Eso se escribe `O C`.

Y así queda la condición completa, que es la línea 12 del programa:

```
Si (anio % 4 = 0 Y anio % 100 <> 0) O (anio % 400 = 0) Entonces
```

**El error típico de este ejercicio, demostrado con números**

El error más común es quedarse en la primera pregunta y escribir solamente `Si anio % 4 = 0 Entonces`. Esa versión recortada se escribió y se ejecutó de verdad en PSeInt con los cuatro años, y esto fue lo que respondió:

| Año | Lo que responde `Si anio % 4 = 0` | Lo correcto | ¿Acierta? |
|---|---|---|---|
| 2024 | SI es bisiesto | SI es bisiesto | Sí |
| 2023 | NO es bisiesto | NO es bisiesto | Sí |
| 1900 | **SI es bisiesto** | NO es bisiesto | **No** |
| 2000 | SI es bisiesto | SI es bisiesto | Sí |

Tres aciertos de cuatro. Y ese es justamente el problema. Un programa que falla siempre se detecta el primer día; un programa que acierta el 75% de las veces se entrega tranquilo, se usa durante meses y revienta el día que alguien consulta 1700, 1800, 1900, 2100 o 2200. PSeInt no dice ni una palabra, porque la sintaxis está impecable: la línea está bien escrita, lo que está mal es lo que la línea dice. La única defensa contra este tipo de error es probar con casos escogidos a propósito para romper el programa, no con los tres primeros que se le vengan a uno a la cabeza.

**`Y` es más fuerte que `O`, y aun así se escriben los paréntesis**

Igual que en matemáticas la multiplicación se resuelve antes que la suma, en PSeInt el `Y` se resuelve antes que el `O`. Eso quiere decir que si escribes la condición sin paréntesis, la máquina la agrupa sola de la forma correcta. Se comprobó ejecutando las tres versiones:

| Lo que escribes | Cómo lo resuelve la máquina | 2024 | 2023 | 1900 | 2000 |
|---|---|---|---|---|---|
| `(anio % 4 = 0 Y anio % 100 <> 0) O (anio % 400 = 0)` | tal cual está escrito, `(A Y B) O C` | SI | NO | NO | SI |
| `anio % 4 = 0 Y anio % 100 <> 0 O anio % 400 = 0` | como `(A Y B) O C`, porque `Y` va primero | SI | NO | NO | SI |
| `(anio % 4 = 0 O anio % 100 <> 0) Y (anio % 400 = 0)` | como `(A O B) Y C`, que ya es otra regla | **NO** | NO | NO | SI |

Las dos primeras filas dan exactamente lo mismo. La tercera es la misma línea con la `Y` y la `O` intercambiadas de puesto, y se equivoca con 2024: le dice a la secretaria que un año bisiesto de los corrientes no lo es. Tampoco da ningún error, porque para PSeInt esa condición es perfectamente válida; lo que pasa es que ya no es la regla del calendario gregoriano, es otra regla que nadie pidió.

Entonces, si la máquina agrupa bien sola, ¿para qué escribir los paréntesis? Por quien lee el programa después. La versión sin paréntesis obliga a que quien la lea se acuerde de la regla de precedencia y la aplique mentalmente; la versión con paréntesis se lee de corrido. Y esa persona que lee después puedes ser tú mismo dentro de dos semanas. **Los paréntesis no cambian el resultado: cambian el tiempo que uno tarda en entender la línea.**

**Por qué `<>` y no `!=`**

En otros lenguajes de programación "distinto de" se escribe `!=`, y es muy fácil que se te venga a la mano si ya los viste en alguna parte. En PSeInt no funciona. Si escribes `anio % 100 != 0`, el chequeo de sintaxis se detiene con este mensaje, que fue provocado a propósito y copiado de una ejecución real:

```
Lin 12 (inst 1): ERROR 207: No coinciden los tipos (<, >, <=, >=, <> o =). No se puede comparar variables o expresiones de distinto tipo.
```

El mensaje te está listando entre paréntesis los operadores de comparación que sí acepta, y `!=` no aparece en esa lista. Este error es de los buenos, porque el programa ni siquiera arranca y te obliga a corregir. `<>` se recuerda fácil: es el símbolo de "menor" pegado al de "mayor", o sea "menor o mayor, cualquier cosa menos igual".

**El error silencioso más peligroso: cambiar `<> 0` por `= 0`**

Este vale la pena mirarlo despacio, porque es un solo carácter de diferencia y las consecuencias son enormes. Si en lugar de `anio % 100 <> 0` escribes `anio % 100 = 0`, la condición queda pidiendo lo contrario de lo que dice la regla. Esa versión también se ejecutó, y estos son los resultados reales:

| Año | Con `anio % 100 <> 0` (correcto) | Con `anio % 100 = 0` (invertido) | Lo correcto |
|---|---|---|---|
| 2024 | SI es bisiesto | **NO es bisiesto** | SI es bisiesto |
| 2023 | NO es bisiesto | NO es bisiesto | NO es bisiesto |
| 1900 | NO es bisiesto | **SI es bisiesto** | NO es bisiesto |
| 2000 | SI es bisiesto | SI es bisiesto | SI es bisiesto |

El programa invertido se equivoca justo al revés que el anterior: acierta con los años de siglo y falla con los años bisiestos normales, que son la inmensa mayoría. Otra vez, cero errores de sintaxis y cero avisos. Cuando una condición te dé resultados raros, léela en voz alta traduciéndola al español: "si el año es divisible entre 4 **y** el residuo de dividirlo entre 100 es igual a cero". Al oírla te vas a dar cuenta de que eso no es lo que dice la regla del calendario.

**La otra forma de escribir la misma condición, con `NO`**

El operador `NO` le da la vuelta a una condición: convierte Verdadero en Falso y Falso en Verdadero. Con él, la pregunta B se escribe así:

```
Si (anio % 4 = 0 Y NO (anio % 100 = 0)) O (anio % 400 = 0) Entonces
```

Se ejecutaron las dos versiones con los cuatro años y dan exactamente los mismos resultados. Las dos son correctas y puedes usar la que quieras. El programa de esta solución usa `<>` porque es más corta y porque no obliga a llevar la cuenta de un paréntesis más; si a ti te resulta más natural leer "y no es divisible entre 100", la segunda versión es igual de válida. Lo que no debes hacer es escoger a la loca: quédate con la que puedas leer en voz alta sin trabarte.

**Sobre los años raros**

Este programa no revisa el dato que entra. Si alguien escribe `0`, responde que sí es bisiesto, porque efectivamente `0 % 400` da 0; y si alguien escribe `-4`, responde lo mismo. Aritméticamente las dos respuestas están bien, pero el calendario gregoriano no tiene año 0 ni años negativos, así que en el mundo real no significan nada. Se dice aquí en voz alta en vez de disimularlo: **este programa confía en que el dato que le entra tiene sentido.** Revisar que un dato sea razonable antes de usarlo es el tema del Ejercicio 7, y de ahí en adelante lo vas a hacer siempre.

### 4. El código completo

Este es el archivo `PSC/Ejercicio_06_AnioBisiesto.psc` tal cual:

```
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
```

Veinte líneas, y una sola de ellas es la que tiene toda la dificultad del ejercicio. Así suele ser: el trabajo duro no está en escribir mucho, está en escribir bien la línea que decide.

### 5. El código explicado bloque por bloque

**Advertencia importante: los comentarios que empiezan con `//` que vas a ver aquí abajo existen SOLO en esta explicación. NO los copies a tu archivo `.psc`.** PSeInt dibuja cada comentario como una caja extra dentro del diagrama de flujo (`Ctrl + D`), y el diagrama termina lleno de cajitas de texto que no aportan nada y estorban para leerlo. El archivo que entregas va limpio, sin un solo `//`. Fíjate además en que estos comentarios van escritos sin tildes, por la misma razón que el resto del código.

**Bloque 1: el encabezado y la declaración**

```
Algoritmo AnioBisiesto
	Definir anio, diasFebrero Como Entero;   // Las dos variables del programa, las dos de tipo Entero
```

El nombre que va después de `Algoritmo` tiene que ser el mismo del archivo sin el prefijo `Ejercicio_06_` y sin la extensión. Las dos variables se declaran en una sola línea porque comparten el tipo; si fueran de tipos distintos harían falta dos líneas `Definir`.

**Bloque 2: el banner que ve el usuario**

```
	Escribir "==================================================";   // Linea de 50 signos igual
	Escribir "  VERIFICAR SI UN ANIO ES BISIESTO";                    // Titulo, con dos espacios de sangria
	Escribir "==================================================";   // Se cierra el marco del titulo
	Escribir "";                                                      // Linea en blanco, para que la pantalla respire
```

Un programa que arranca escupiendo una pregunta seca no le dice al usuario dónde está parado. El banner cuesta cuatro líneas y hace que el programa se vea terminado. El `Escribir ""` imprime una línea vacía: es puro orden visual, y el orden visual también se programa.

**Bloque 3: pedir el año**

```
	Escribir Sin Saltar "Escriba el anio que quiere verificar: ";   // Sin Saltar deja el cursor en la MISMA linea
	Leer anio;                                                      // Lo que teclee el usuario queda guardado en anio
```

`Escribir Sin Saltar` no baja el cursor al terminar, así que el usuario escribe justo al lado de los dos puntos y no una línea más abajo. Nunca pongas un `Leer` pelado: el usuario vería la pantalla quieta sin saber qué se espera de él.

**Bloque 4: cerrar la zona de preguntas y devolver el dato**

```
	Escribir "";                                                      // Separa la zona de preguntas de la zona de respuestas
	Escribir "------------------- RESULTADOS -------------------";   // Encabezado de resultados, tambien de 50 caracteres
	Escribir "Anio ingresado: ", anio;                                // Se devuelve el dato para que el usuario lo confirme
```

Devolverle al usuario el dato que acaba de escribir parece innecesario y no lo es. Si la secretaria quería consultar 1900 y por un dedazo escribió 1090, esta línea se lo muestra de inmediato; sin ella, se llevaría una respuesta correcta a una pregunta que no hizo.

**Bloque 5: la decisión, que es todo el ejercicio**

```
	Si (anio % 4 = 0 Y anio % 100 <> 0) O (anio % 400 = 0) Entonces
		Escribir "El anio ", anio, " SI es bisiesto";   // Solo se ejecuta si la condicion dio Verdadero
		diasFebrero <- 29;                              // Febrero de un anio bisiesto tiene 29 dias
	SiNo
		Escribir "El anio ", anio, " NO es bisiesto";   // Solo se ejecuta si la condicion dio Falso
		diasFebrero <- 28;                              // Febrero de un anio normal tiene 28 dias
	FinSi
```

La máquina resuelve primero los tres residuos, después las tres comparaciones, después el `Y`, después el `O`, y con ese último Verdadero o Falso escoge el camino. **Solo uno de los dos bloques se ejecuta; el otro se salta entero, como si no estuviera escrito.** Eso incluye la asignación: si el año es bisiesto, la línea `diasFebrero <- 28;` nunca corre.

Fíjate en que cada rama hace dos cosas: escribe un mensaje y guarda un número. No están repitiendo trabajo, están haciendo cosas distintas. El mensaje sale de una vez; el número se guarda para usarlo tres líneas más abajo.

La sangría con TAB no es decoración: las dos líneas de cada rama llevan dos TAB porque están **adentro** del `Si`, mientras que `Si`, `SiNo` y `FinSi` llevan uno solo porque están al mismo nivel entre ellas. Cuando empieces a anidar decisiones, esa sangría va a ser lo único que te permita ver de un vistazo qué está dentro de qué.

**Bloque 6: la línea que va después del `FinSi`**

```
	Escribir "Febrero tiene: ", diasFebrero, " dias";   // Va DESPUES del FinSi, asi que se ejecuta siempre
FinAlgoritmo
```

Esta línea está fuera del `Si`, así que se ejecuta pase lo que pase, por los dos caminos. Lo único que cambia es el valor que quedó guardado en `diasFebrero`. Si en lugar de esto hubieras escrito la misma línea dos veces, una dentro de cada rama, el programa funcionaría igual pero tendrías el mismo texto duplicado, y el día que quieras cambiarlo por "Febrero de este anio tiene" te toca acordarte de los dos sitios. Escribir una cosa una sola vez no es pereza: es lo que hace que un programa se pueda mantener.

### 6. Prueba de escritorio

Ahora hacemos de computador. Seguimos el programa instrucción por instrucción con `anio = 2024`, anotando cuánto vale cada variable después de cada paso. El signo `?` significa que la variable ya está declarada pero todavía no tiene ningún valor guardado, y la **negrita** marca el valor que acaba de cambiar en ese paso.

| Paso | Instrucción que se ejecuta | anio | diasFebrero | Qué aparece en pantalla |
|---|---|---|---|---|
| 0 | `Definir anio, diasFebrero Como Entero;` | ? | ? | (nada) |
| 1 | `Escribir "=========...=========";` | ? | ? | `==================================================` |
| 2 | `Escribir "  VERIFICAR SI UN ANIO ES BISIESTO";` | ? | ? | `  VERIFICAR SI UN ANIO ES BISIESTO` |
| 3 | `Escribir "=========...=========";` | ? | ? | `==================================================` |
| 4 | `Escribir "";` | ? | ? | (una línea en blanco) |
| 5 | `Escribir Sin Saltar "Escriba el anio que quiere verificar: ";` | ? | ? | `Escriba el anio que quiere verificar: ` y el cursor se queda ahí |
| 6 | `Leer anio;` y el usuario teclea 2024 | **2024** | ? | (lo que el usuario escribe) |
| 7 | `Escribir "";` | 2024 | ? | (una línea en blanco) |
| 8 | `Escribir "-------- RESULTADOS --------";` | 2024 | ? | `------------------- RESULTADOS -------------------` |
| 9 | `Escribir "Anio ingresado: ", anio;` | 2024 | ? | `Anio ingresado: 2024` |
| 10 | `Si (anio % 4 = 0 Y anio % 100 <> 0) O (anio % 400 = 0) Entonces` | 2024 | ? | (nada; la condición da Verdadero y se entra por la rama de arriba) |
| 11 | `Escribir "El anio ", anio, " SI es bisiesto";` | 2024 | ? | `El anio 2024 SI es bisiesto` |
| 12 | `diasFebrero <- 29;` | 2024 | **29** | (nada) |
| 13 | (se saltan las dos líneas del `SiNo`) | 2024 | 29 | (nada) |
| 14 | `FinSi` | 2024 | 29 | (nada) |
| 15 | `Escribir "Febrero tiene: ", diasFebrero, " dias";` | 2024 | 29 | `Febrero tiene: 29 dias` |

**El paso crítico es el 10**, así que lo hacemos a mano, de adentro hacia afuera, tal como lo hace la máquina:

1. `2024 % 4` da 0, porque 4 x 506 = 2024 y no sobra nada. Entonces `2024 % 4 = 0` es **Verdadero**.
2. `2024 % 100` da 24, porque 100 x 20 = 2000 y sobran 24. Entonces `2024 % 100 <> 0` pregunta si 24 es distinto de 0, y sí lo es: **Verdadero**.
3. Se resuelve el `Y`: Verdadero Y Verdadero da **Verdadero**. Ya con esto el año es bisiesto, pero la máquina termina de leer la línea.
4. `2024 % 400` da 24, porque 400 x 5 = 2000 y sobran 24. Entonces `2024 % 400 = 0` es **Falso**.
5. Se resuelve el `O`: Verdadero O Falso da **Verdadero**, porque a `O` le alcanza con que una de las dos partes se cumpla.

La condición dio Verdadero, así que se ejecutan las dos líneas del `Entonces` y las dos del `SiNo` no se tocan. Por eso en el paso 13 no pasa nada: esas instrucciones existen en el archivo, pero en esta corrida no se ejecutaron.

**Qué habría pasado con otros datos.** Estos son los otros tres casos obligatorios, con las tres preguntas resueltas y el camino que toma cada uno:

| Si en el `Leer` se escribe | `anio % 4 = 0` | `anio % 100 <> 0` | `anio % 400 = 0` | La condición completa da | Camino que se toma | `diasFebrero` queda en |
|---|---|---|---|---|---|---|
| 2023 | Falso | Verdadero | Falso | Falso | el del `SiNo` | 28 |
| 1900 | Verdadero | Falso | Falso | Falso | el del `SiNo` | 28 |
| 2000 | Verdadero | Falso | Verdadero | Verdadero | el del `Entonces` | 29 |

Mira las filas de 1900 y 2000: las cuatro primeras columnas son iguales salvo la de 400, y sin embargo terminan en caminos contrarios. Esa columna, ella sola, es la que le devuelve a 2000 la condición de bisiesto que la regla de los 100 años le había quitado.

### 7. Ejecución real verificada

Estas son las salidas textuales que produjo PSeInt al ejecutar el archivo `Ejercicio_06_AnioBisiesto.psc` bajo el perfil Estricto. El chequeo de sintaxis no reportó ni un solo error. Lo que aparece después del signo `>` es lo que se escribió por teclado; ese `>` no lo imprime tu programa, lo agrega la herramienta de consola con la que se capturó la salida, así que si en tu pantalla no aparece, todo está bien.

**Corrida 1.** Datos escritos por teclado: `2024`.

```
==================================================
  VERIFICAR SI UN ANIO ES BISIESTO
==================================================

Escriba el anio que quiere verificar: > 2024

------------------- RESULTADOS -------------------
Anio ingresado: 2024
El anio 2024 SI es bisiesto
Febrero tiene: 29 dias
```

Verificación a mano: 2024 % 4 = 0 (Verdadero), 2024 % 100 = 24, o sea distinto de cero (Verdadero), y Verdadero Y Verdadero da Verdadero. La condición se cumple sin necesidad de mirar el 400. Febrero de 2024 tuvo 29 días, y quien haya visto un calendario de ese año lo puede confirmar. La salida coincide exactamente con la prueba de escritorio del punto 6.

**Corrida 2.** Datos escritos por teclado: `2023`.

```
==================================================
  VERIFICAR SI UN ANIO ES BISIESTO
==================================================

Escriba el anio que quiere verificar: > 2023

------------------- RESULTADOS -------------------
Anio ingresado: 2023
El anio 2023 NO es bisiesto
Febrero tiene: 28 dias
```

Verificación a mano: 4 x 505 = 2020, así que 2023 % 4 da 3. Como 3 no es 0, la pregunta A es Falsa, y con A falsa el `Y` ya da Falso sin importar lo que responda B. Falta la última oportunidad, el `O`: 2023 % 400 da 23, distinto de 0, así que C también es Falsa. Falso O Falso da Falso, y el programa se va por el `SiNo`. Correcto: 2023 no fue bisiesto.

**Corrida 3.** Datos escritos por teclado: `1900`. Este es el caso frontera, el que rompe la regla de "cada cuatro años".

```
==================================================
  VERIFICAR SI UN ANIO ES BISIESTO
==================================================

Escriba el anio que quiere verificar: > 1900

------------------- RESULTADOS -------------------
Anio ingresado: 1900
El anio 1900 NO es bisiesto
Febrero tiene: 28 dias
```

Verificación a mano: 1900 % 4 da 0, así que A es Verdadera y hasta ahí todo apunta a bisiesto. Pero 1900 % 100 también da 0, y B pregunta si ese residuo es **distinto** de cero, así que B es Falsa. Verdadero Y Falso da Falso. Queda el `O`: 1900 % 400 da 300, que no es 0, así que C es Falsa. Falso O Falso da Falso. Febrero de 1900 tuvo 28 días, y este es el año con el que se descubre si tu programa quedó bien o si te quedaste en la primera pregunta.

**Corrida 4.** Datos escritos por teclado: `2000`. La excepción de la excepción.

```
==================================================
  VERIFICAR SI UN ANIO ES BISIESTO
==================================================

Escriba el anio que quiere verificar: > 2000

------------------- RESULTADOS -------------------
Anio ingresado: 2000
El anio 2000 SI es bisiesto
Febrero tiene: 29 dias
```

Verificación a mano: 2000 % 4 da 0 y 2000 % 100 también da 0, exactamente igual que 1900, así que `A Y B` vuelve a dar Falso. La diferencia está en el último pedazo: 2000 % 400 da 0, porque 400 x 5 = 2000 justo. C es Verdadera, y Falso O Verdadero da **Verdadero**. Febrero de 2000 tuvo 29 días. Compara esta corrida con la 3 poniéndolas lado a lado: son los dos años más parecidos del ejercicio y dan respuestas contrarias, y toda la diferencia cabe en el paréntesis de la derecha.

**¿Y si alguien escribe un año con decimales?** Se probó tecleando `2024.5` y PSeInt no lo acepta: muestra `ERROR 313: No coinciden los tipos (ANIO), el valor ingresado debe ser un entero.` y ahí se detiene, sin alcanzar a mostrar ningún resultado. No es una falla de tu programa: es la consecuencia de haber declarado `anio` como Entero, y para este problema está bien, porque los años no tienen mitades.

### 8. Errores comunes en este ejercicio

| Lo que escribe el estudiante | Qué pasa | Cómo se arregla |
|---|---|---|
| `Si anio % 4 = 0 Entonces` y nada más | **Este es el error del ejercicio.** PSeInt no dice nada: la sintaxis es correcta y el programa corre perfecto. Acierta con 2024, con 2023 y con 2000, y falla solo con 1900, donde responde `El anio 1900 SI es bisiesto`. Tres aciertos de cuatro alcanzan para que uno lo entregue confiado y para que el error se descubra meses después, con un año de siglo. | Escribir la condición completa, con las tres preguntas: `(anio % 4 = 0 Y anio % 100 <> 0) O (anio % 400 = 0)`. Y probar siempre con los cuatro años, no solo con los que uno cree que va a acertar. |
| `anio % 100 = 0` en vez de `anio % 100 <> 0` | Otro error silencioso, y de un solo carácter. La condición queda diciendo lo contrario de la regla: el programa responde `NO es bisiesto` para 2024 y `SI es bisiesto` para 1900, o sea que se equivoca justo con los años más comunes. Cero errores de sintaxis y cero avisos. | Usar `<>`, que significa "distinto de". La regla dice "no es divisible entre 100", y "no divisible" quiere decir que el residuo **no** es cero. Lee la línea en voz alta en español y vas a oír el error. |
| `anio % 100 != 0` | El chequeo de sintaxis se detiene con `ERROR 207: No coinciden los tipos (<, >, <=, >=, <> o =). No se puede comparar variables o expresiones de distinto tipo.` El programa no arranca. `!=` es de otros lenguajes; PSeInt no lo reconoce, y el propio mensaje te lista entre paréntesis los operadores que sí acepta. | Cambiarlo por `<>`. |
| `(anio % 4 = 0 AND anio % 100 <> 0) OR (anio % 400 = 0)` | PSeInt marca cuatro veces `ERROR 91: Se esperaba Entonces o fin de expresión.` sobre la línea 12 y no ejecuta nada. `AND` y `OR` son las palabras del inglés; PSeInt trabaja en español. | Escribir `Y` y `O`. También existe `NO` para la negación. Son tres letras en total y hay que aprendérselas de una vez. |
| Olvidar el `FinSi` al final de la decisión | PSeInt lo detecta antes de ejecutar y muestra `ERROR 117: Falta cerrar SI.` señalando la línea donde empieza el `Si`, que es la 12. El programa no corre. Este error es más frecuente de lo que parece cuando uno empieza a anidar decisiones. | Cada `Si` que se abre lleva su `FinSi`. Escribe el `Si`, el `SiNo` y el `FinSi` de una vez, los tres seguidos, y solo después rellena lo que va adentro. Así nunca se te olvida ninguno. |
| Escribir `Definir año, diasFebrero Como Entero;` o poner `"El año SI es bisiesto"` con tilde | La ñ y las tildes no son ASCII, y PSeInt las rechaza: aparece `ERROR 68: Caracter no válido (ñ).` seguido de una cascada de errores más en cada línea donde aparezca el carácter, porque a partir de ahí el intérprete ya no entiende nada de esa línea. El programa no arranca. | Dentro del `.psc` se escribe `anio` y `El anio SI es bisiesto`, sin tildes y sin ñ. En este documento `.md` sí escribimos "año" con su ortografía completa; en el código, nunca. |
| Poner comentarios dentro del `.psc`, como `Leer anio; // leo el anio` | El programa corre igual y da el resultado correcto, así que parece inofensivo. El problema aparece al abrir el diagrama de flujo con `Ctrl + D`: PSeInt dibuja una caja de texto extra por cada comentario, y el diagrama, que es lo que se revisa en clase, queda lleno de cajitas que estorban para leerlo. | El `.psc` va limpio, sin un solo `//`. Las explicaciones van en este documento, que es el sitio donde caben completas y con tildes. |

---

## Solución del Ejercicio 7 — Clasificar un triángulo por sus lados

### 1. Análisis antes de programar

Este análisis se hace **antes de tocar el computador**, con lápiz y papel. En los ejercicios del cuadernillo anterior el análisis era una lista de cuentas encadenadas; aquí no hay ni una sola cuenta que guardar. Lo que hay es un **árbol de preguntas**, y lo que tienes que dejar claro en el papel es cuáles son esas preguntas y en qué orden se hacen.

| Entradas | Proceso | Salidas |
|---|---|---|
| `ladoA`: medida del primer lado, en centímetros | 1. Mostrar las tres medidas que quedaron registradas. Esto ocurre siempre, sirvan o no sirvan los datos | Las tres medidas registradas, cada una con su unidad en centímetros |
| `ladoB`: medida del segundo lado, en centímetros | 2. Preguntar si alguna de las tres medidas es menor o igual que cero. Si la respuesta es sí, avisar que la medida no es válida y no hacer nada más | Aviso de medida no válida, cuando alguno de los lados no es un número positivo |
| `ladoC`: medida del tercer lado, en centímetros | 3. Si las tres medidas sirven, comprobar la desigualdad triangular: cada pareja de lados tiene que superar al lado que queda. Son tres comprobaciones | Aviso de triángulo imposible, cuando las medidas son positivas pero no cierran ninguna figura |
| | 4. Si la figura existe, preguntar si los tres lados son iguales. Si lo son, es EQUILATERO | El tipo de triángulo: EQUILATERO, ISOSCELES o ESCALENO, con la indicación de cómo se corta |
| | 5. Si no lo son, preguntar si hay al menos una pareja de lados iguales. Si la hay, es ISOSCELES | |
| | 6. Y si tampoco la hay, es ESCALENO | |

Fíjate en dos cosas de esa tabla. La primera: de los cinco mensajes posibles del final, en cada ejecución aparece **uno solo**. Nunca dos. La segunda: los pasos 4, 5 y 6 no se pueden reordenar a gusto, porque el paso 4 y el paso 5 se pisan. Un triángulo de 5, 5 y 5 cumple la condición del paso 4, pero también cumple la del paso 5, y el que se pregunte primero es el que va a ganar. Esa decisión de orden es parte de la solución, tanto como las condiciones mismas.

Si te ayuda, dibuja el árbol en el papel antes de escribir nada. Cuando el dibujo está bien hecho, escribir el programa se vuelve casi transcribirlo.

### 2. Diccionario de datos

| Variable | Tipo | Por qué ese tipo |
|---|---|---|
| `ladoA` | Real | Es una medida de longitud, y las medidas se parten. Una lámina puede quedar de 7.5 cm de lado, o de 12.25 cm. Si la declaras `Entero`, el programa arranca bien, muestra el banner y hasta alcanza a preguntar, pero en el momento en que el maestro teclea `7.5` se detiene con `ERROR 313: No coinciden los tipos (LADOA), el valor ingresado debe ser un entero.` y no llega nunca a clasificar nada. Elegir mal el tipo no es un detalle de estilo: deja el programa inservible para medidas perfectamente normales. |
| `ladoB` | Real | La misma razón que `ladoA`, y además una razón nueva: los tres lados se suman entre sí y se comparan entre sí. Cuando tres variables van a mezclarse en las mismas expresiones, se declaran del mismo tipo. Declarar dos como Real y una como Entero es pedir problemas sin ganar nada. |
| `ladoC` | Real | Igual que las otras dos. Y ten presente que los decimales en PSeInt se escriben con punto, nunca con coma: `7.5`, no `7,5`. Dentro del lenguaje la coma sirve para separar elementos en un `Definir` o en un `Escribir`, así que un `7,5` se lee como dos cosas distintas y no como un número. |

Este programa tiene **tres variables y las tres son de entrada**. No hay ninguna variable que guarde el resultado. Eso es distinto de lo que hiciste en el Ejercicio 5, donde el nivel de desempeño se guardaba en `desempeno` antes de mostrarlo. La regla para decidir es esta: **se guarda en una variable lo que se va a volver a usar**. Allá el nivel se guardaba porque el programa lo imprimía después, ya fuera de la escalera. Aquí cada camino escribe su propio mensaje ahí mismo y nadie vuelve a preguntar por él, así que una variable extra sería una caja vacía dando vueltas.

### 3. La lógica explicada

**El programa dejó de ser una lista y se volvió un árbol.**

Hasta el Ejercicio 6 tus programas preguntaban una sola vez y se acababa. Este pregunta hasta cuatro veces, y cada pregunta solo tiene sentido si la anterior salió de una manera determinada. Así queda el árbol completo:

```
                    ¿alguna medida es menor o igual que cero?
                       /                            \
                     SI                              NO
                      |                               |
             "Medida no valida"        ¿se cumple la desigualdad triangular?
                                          /                        \
                                        SI                          NO
                                         |                           |
                          ¿los tres lados son iguales?    "No se puede armar"
                              /                \
                            SI                  NO
                             |                   |
                       EQUILATERO      ¿hay al menos una pareja igual?
                                            /              \
                                          SI                NO
                                           |                 |
                                     ISOSCELES           ESCALENO
```

Ese árbol tiene cinco puntas, y cada corrida del programa termina en una sola de ellas. Todo lo que sigue en esta sección es la explicación de cómo se escribe cada una de esas cuatro preguntas y por qué se escribe así.

**Primera pregunta: la validación, y por qué lleva `O`.**

La regla en castellano es: "si **alguno** de los tres lados no sirve, el dato está malo". La palabra *alguno* es la que decide el conector. Con `O`, una sola condición verdadera ya hace verdadera toda la expresión, que es exactamente lo que quiere decir *alguno*.

Probemos con el caso 5 de las pruebas, `ladoA = 0`, `ladoB = 4`, `ladoC = 5`:

| Condición | La máquina la resuelve así | Valor |
|---|---|---|
| `ladoA <= 0` | ¿0 es menor o igual que 0? Sí, es igual | Verdadero |
| `ladoB <= 0` | ¿4 es menor o igual que 0? No | Falso |
| `ladoC <= 0` | ¿5 es menor o igual que 0? No | Falso |

Y ahora las dos formas de unirlas:

| Lo que escribes | Cómo lo resuelve la máquina | Resultado |
|---|---|---|
| `(ladoA <= 0) O (ladoB <= 0) O (ladoC <= 0)` | `Verdadero O Falso O Falso`. Con `O`, un solo Verdadero manda | **Verdadero**: el programa entra por la rama del aviso y responde `Medida no valida` |
| `(ladoA <= 0) Y (ladoB <= 0) Y (ladoC <= 0)` | `Verdadero Y Falso Y Falso`. Con `Y` tienen que ser Verdadero las tres | **Falso**: el programa se va por el `SiNo` como si los datos estuvieran bien |

La segunda versión no da ningún error. Sigue de largo, llega a la desigualdad triangular y se encuentra con que `0 + 4 = 4`, que no supera a 5, así que termina imprimiendo `Con estas medidas no se puede armar un triangulo`. Esa salida se comprobó ejecutando el programa con el `Y` puesto a propósito, y es peor de lo que parece: el maestro leería que el problema es la geometría, cuando el problema real es que alguien anotó un cero. Un mensaje equivocado manda a buscar el error donde no está.

**El detalle del `<=`: por qué `< 0` no alcanza.**

| Medida | `ladoA < 0` | `ladoA <= 0` |
|---|---|---|
| -2 | Verdadero | Verdadero |
| 0 | **Falso** | **Verdadero** |
| 4 | Falso | Falso |

Las dos condiciones se comportan igual con los negativos y con los positivos. Se diferencian en un solo valor: el cero. Y el cero es justo el que aparece en la vida real, porque nadie anota `-4` en una orden de corte, pero se deja una casilla vacía y entra un cero todo el tiempo. Un lado de cero centímetros no es un lado corto: es un lado que no existe. Con `< 0` en lugar de `<= 0`, los datos 0, 4 y 5 vuelven a salir por el mensaje equivocado del triángulo imposible, también verificado ejecutándolo.

**Segunda pregunta: la desigualdad triangular, y por qué lleva `Y`.**

Aquí la regla en castellano es la contraria: "las **tres** comprobaciones se tienen que cumplir". Si una sola falla, la figura no cierra. Y *todas* se traduce como `Y`.

Comparemos el caso 3 (3, 4, 5, un triángulo que sí existe) con el caso 4 (1, 2, 10, el de las dos varillas que se quedan cortas):

| Comprobación | Con 3, 4 y 5 | Con 1, 2 y 10 |
|---|---|---|
| `ladoA + ladoB > ladoC` | 3 + 4 = 7, y 7 > 5 → Verdadero | 1 + 2 = 3, y 3 no supera a 10 → **Falso** |
| `ladoA + ladoC > ladoB` | 3 + 5 = 8, y 8 > 4 → Verdadero | 1 + 10 = 11, y 11 > 2 → Verdadero |
| `ladoB + ladoC > ladoA` | 4 + 5 = 9, y 9 > 3 → Verdadero | 2 + 10 = 12, y 12 > 1 → Verdadero |
| Las tres unidas con `Y` | Verdadero → se clasifica | **Falso** → se avisa que no se puede armar |
| Las tres unidas con `O` | Verdadero → se clasifica | **Verdadero** → se clasifica un triángulo que no existe |

Mira la última fila con cuidado. Con `O`, dos de las tres comprobaciones dan Verdadero y eso alcanza para que toda la condición sea verdadera. El programa se pone a clasificar unas medidas imposibles y, como 1, 2 y 10 son tres números distintos, responde `Tipo de triangulo: ESCALENO`. También se ejecutó con el `O` puesto a propósito, y eso es lo que sale. El maestro corta la lámina y pierde el pedazo, que es exactamente lo que el programa venía a evitar.

Queda entonces esta regla, que te sirve para cualquier condición compuesta que escribas de aquí en adelante:

| Cómo suena la regla en castellano | Conector que va |
|---|---|
| "alguno", "al menos uno", "con una sola ya es suficiente" | `O` |
| "todos", "las tres", "ninguna puede fallar" | `Y` |

Y fíjate en el espejo que se forma dentro de este mismo programa: la validación busca un **defecto** y con encontrar uno ya sobra, por eso va con `O`; la desigualdad triangular exige que **todo** esté bien, por eso va con `Y`. El conector no se escoge de memoria ni por costumbre. Se escoge leyendo la regla en voz alta.

**El caso frontera de la desigualdad: por qué `>` y no `>=`.**

Prueba mentalmente con 3, 4 y 7. La primera comprobación dice `3 + 4 > 7`, o sea `7 > 7`, que es Falso. ¿Está bien que sea Falso? Sí. Con esas medidas las dos varillas cortas alcanzan a tocarse, pero solo si se acuestan encima de la larga: los tres puntos quedan en línea recta y el triángulo queda aplastado, sin nada adentro. Eso no es un triángulo. Si escribieras `>=`, el programa aceptaría esa figura plana y la clasificaría como ESCALENO. El programa como está responde que no se puede armar, que es lo correcto.

**Tercera pregunta: por qué EQUILATERO se pregunta antes que ISOSCELES.**

Este es el error típico del ejercicio, y hay que verlo con números para que se entienda de verdad. Tomemos el caso 1, los tres lados en 5:

| Condición | Con 5, 5 y 5 la máquina resuelve | Valor |
|---|---|---|
| `(ladoA = ladoB) Y (ladoB = ladoC)`, la del equilátero | `(5 = 5) Y (5 = 5)` → `Verdadero Y Verdadero` | **Verdadero** |
| `(ladoA = ladoB) O (ladoA = ladoC) O (ladoB = ladoC)`, la del isósceles | `(5 = 5) O (5 = 5) O (5 = 5)` → `Verdadero O Verdadero O Verdadero` | **Verdadero** |

Las dos condiciones son verdaderas **al mismo tiempo**, y no es un accidente: un triángulo con tres lados iguales también tiene dos lados iguales. El equilátero es un caso especial del isósceles. Cuando dos condiciones se pisan así, la respuesta del programa no la decide la lógica: la decide el orden en que están escritas, porque la primera que dé Verdadero se lleva el camino y la otra ni se evalúa.

| Orden de las preguntas | Con 5, 5, 5 | Con 5, 5, 8 | Con 3, 4, 5 |
|---|---|---|---|
| Primero EQUILATERO, después ISOSCELES | EQUILATERO, correcto | ISOSCELES, correcto | ESCALENO, correcto |
| Primero ISOSCELES, después EQUILATERO | **ISOSCELES, equivocado** | ISOSCELES, correcto | ESCALENO, correcto |

Un programa con el orden invertido acierta en dos de cada tres pruebas y no da ni una advertencia. Se ejecutó con las preguntas volteadas y con 5, 5 y 5 responde `Tipo de triangulo: ISOSCELES`. El estudiante prueba con 3, 4 y 5, le funciona; prueba con 5, 5 y 8, le funciona; entrega. Y el error aparece el día que alguien pide un triángulo equilátero, que es precisamente el único que se cortaba con plantilla.

La regla general que te llevas: **cuando dos condiciones se solapan, primero va la más exigente**, la que describe el caso especial. Es la misma lección de la escalera de notas del Ejercicio 5 y de la excepción del 400 en el Ejercicio 6, escrita de otra manera.

Una observación pequeña sobre la condición del equilátero. Podrías pensar que hacen falta tres comparaciones, `ladoA = ladoB`, `ladoB = ladoC` y `ladoA = ladoC`. No hacen falta: si A mide lo mismo que B, y B mide lo mismo que C, entonces A mide lo mismo que C sin que nadie lo pregunte. Con dos comparaciones queda amarrado.

**Por qué no se puede escribir `ladoA = ladoB = ladoC`.**

En matemáticas esa cadena se escribe todo el tiempo y se entiende perfecto. En PSeInt no. La máquina resuelve de izquierda a derecha: primero calcula `ladoA = ladoB`, que no da un número sino un Verdadero o un Falso, y después intenta comparar ese Verdadero contra `ladoC`, que es un número con decimales. Comparar un Verdadero con un 5 no significa nada, y el intérprete lo dice así:

```
Lin 23 (inst 1): ERROR 207: No coinciden los tipos (<, >, <=, >=, <> o =). No se puede comparar variables o expresiones de distinto tipo.
```

Este es de los errores buenos, de los que avisan. La comparación encadenada se escribe con dos comparaciones separadas unidas por `Y`.

**Los cuatro `Si` y los cuatro `FinSi`.**

Cada pregunta del árbol es un `Si`, y cada `Si` vive dentro de una rama del anterior:

| Nivel | Qué pregunta | Dónde vive |
|---|---|---|
| 1 | ¿alguna medida es menor o igual que cero? | directo dentro del algoritmo |
| 2 | ¿se cumple la desigualdad triangular? | dentro del `SiNo` del nivel 1 |
| 3 | ¿los tres lados son iguales? | dentro del `Entonces` del nivel 2 |
| 4 | ¿hay al menos una pareja de lados iguales? | dentro del `SiNo` del nivel 3 |

Se abren en el orden 1, 2, 3, 4 y se cierran en el orden contrario: 4, 3, 2, 1. Ese es el sentido de la sangría con TAB: cada nivel se corre un TAB más a la derecha, y así el `FinSi` que le corresponde a un `Si` queda exactamente debajo de él, en la misma columna. No es adorno, es lo único que te deja contarlos de un vistazo.

Si te falta uno, PSeInt lo detecta. Se borró un `FinSi` a propósito y esto fue lo que respondió:

```
Lin 34 (inst 1): ERROR 322: No puede haber mas de un SiNo.
Lin 18 (inst 1): ERROR 117: Falta cerrar SI.
```

Vale la pena entender por qué se queja dos veces. Al faltar un `FinSi`, el `SiNo` que venía después queda colgando dentro de un `Si` que ya tenía su propio `SiNo`, y de ahí sale el ERROR 322. Y como consecuencia, el `Si` de la línea 18 se queda sin quien lo cierre, y de ahí sale el ERROR 117. Un solo `FinSi` que falta produce dos mensajes, y **el número de línea del segundo mensaje no es donde está el error, sino donde el intérprete se dio cuenta**. Eso te va a pasar seguido: cuando veas dos errores encadenados, arregla el primero y vuelve a ejecutar antes de tocar nada más.

**Una nota honesta sobre comparar decimales con `=`.**

Aquí se comparan variables de tipo Real con el signo `=` y funciona bien, porque los números entran tecleados directamente y quedan guardados tal cual. Ten presente para más adelante que cuando un número Real sale de una división o de una cadena de cuentas, compararlo con `=` puede fallar por diferencias mínimas que la máquina arrastra en los decimales. No es el caso de este programa, pero es bueno que sepas que la advertencia existe.

### 4. El código completo

Este es el archivo `PSC/Ejercicio_07_ClasificarTriangulo.psc` tal cual:

```
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
```

### 5. El código explicado bloque por bloque

**Advertencia importante: los comentarios que empiezan con `//` que vas a ver aquí abajo existen SOLO en esta explicación. NO los copies a tu archivo `.psc`.** El archivo que entregas va limpio, sin un solo `//`. La razón es práctica: PSeInt dibuja cada comentario como una caja extra dentro del diagrama de flujo que genera con `Ctrl + D`, y en un programa como este, que ya tiene cuatro decisiones anidadas, el diagrama se llena de cajas que no son ni entrada, ni proceso, ni salida, y deja de leerse. Los comentarios son para aprender aquí; el archivo es para ejecutar.

**Bloque 1: el encabezado y la declaración.**

```
Algoritmo ClasificarTriangulo
	// Los tres lados van Como Real porque una lamina puede medir 7.5 cm.
	// Se declaran los tres en la misma linea porque son del mismo tipo,
	// separados por comas.
	Definir ladoA, ladoB, ladoC Como Real;
```

El nombre que va después de `Algoritmo` tiene que ser el mismo del archivo sin el prefijo `Ejercicio_07_` y sin la extensión. No es un capricho del curso: cuando entregues diez archivos, ese nombre es lo único que le dice a quien los abre cuál programa está mirando.

**Bloque 2: el banner que ve el usuario.**

```
	// La linea de signos igual tiene exactamente 50 caracteres, los mismos
	// que el separador de RESULTADOS del final. Asi el bloque de pantalla
	// queda parejo por arriba y por abajo.
	Escribir "==================================================";
	Escribir "  CLASIFICAR UN TRIANGULO POR SUS LADOS";
	Escribir "==================================================";
	// Un Escribir con las comillas vacias deja una linea en blanco.
	Escribir "";
```

El título va con dos espacios de sangría adentro del banner para que quede despegado del borde. Fíjate en que dice `TRIANGULO`, sin tilde: el archivo `.psc` no lleva tildes ni siquiera dentro de los textos entre comillas.

**Bloque 3: la entrada de los tres lados.**

```
	// "Sin Saltar" deja el cursor en la MISMA linea, entonces el usuario
	// escribe la medida al lado de la pregunta y no debajo.
	Escribir Sin Saltar "Escriba la medida del lado A en cm: ";
	// Leer detiene el programa hasta que el usuario teclee algo y de Enter,
	// y guarda lo que tecleo dentro de la variable que se nombra despues.
	Leer ladoA;
	Escribir Sin Saltar "Escriba la medida del lado B en cm: ";
	Leer ladoB;
	// El orden de los tres Leer es el orden en que se llenan las variables.
	// Si los cambias de sitio, la tercera medida terminaria guardada en ladoA.
	Escribir Sin Saltar "Escriba la medida del lado C en cm: ";
	Leer ladoC;
```

Cada `Leer` va precedido de su propio `Escribir Sin Saltar`. Un programa que se queda callado esperando un número, sin decir cuál número quiere, es un programa que nadie sabe usar. Y la unidad va dicha en la pregunta, `en cm`, para que nadie teclee metros por descuido.

**Bloque 4: el separador y las medidas registradas.**

```
	Escribir "";
	// El separador mide 50 caracteres: 19 guiones, la palabra RESULTADOS
	// entre espacios, y otros 19 guiones.
	Escribir "------------------- RESULTADOS -------------------";
	// Estas tres lineas van ANTES de cualquier Si, o sea que se imprimen
	// siempre, sirvan o no sirvan las medidas. Quien usa el programa tiene
	// derecho a ver que fue lo que quedo registrado, sobre todo cuando el
	// dato esta malo: asi se da cuenta de cual de los tres numeros anoto mal.
	Escribir "Lado A: ", ladoA, " cm";
	Escribir "Lado B: ", ladoB, " cm";
	Escribir "Lado C: ", ladoC, " cm";
```

Que estas tres líneas queden fuera de toda decisión es una decisión de diseño, no un descuido. Compara la corrida 5 de la sección 7 con cualquier otra: cuando el dato está malo, el programa igual muestra `Lado A: 0 cm`, y ese cero en pantalla es lo que le permite al maestro entender de una qué fue lo que pasó.

**Bloque 5: nivel 1, la validación.**

```
	// Nivel 1. Se pregunta por lo que esta MAL, y para que el dato quede
	// descartado alcanza con que UNO solo de los tres lados falle: por eso
	// las tres condiciones van unidas con O.
	Si (ladoA <= 0) O (ladoB <= 0) O (ladoC <= 0) Entonces
		Escribir "Medida no valida";
		Escribir "Los tres lados tienen que ser mayores que cero";
	SiNo
```

Los paréntesis alrededor de cada comparación no son obligatorios, porque las comparaciones se resuelven antes que los conectores lógicos. Se escriben igual, porque una condición que se lee sola vale más que una que hay que descifrar.

Ese `SiNo` de la última línea es la puerta de entrada a todo el resto del programa. Lo que sigue en los bloques 6, 7 y 8 está adentro de esa rama: si el dato no sirve, nada de eso se ejecuta.

**Bloque 6: nivel 2, la desigualdad triangular.**

```
		// Nivel 2. Aqui tienen que cumplirse las TRES comprobaciones, una
		// por cada pareja de lados: por eso van unidas con Y. Si una sola
		// falla, la figura no cierra.
		Si (ladoA + ladoB > ladoC) Y (ladoA + ladoC > ladoB) Y (ladoB + ladoC > ladoA) Entonces
```

Es una sola línea, larga, y así se deja. Podrías partirla, pero las tres comprobaciones son una sola idea y leerlas juntas ayuda a verificar que no se te quedó ninguna pareja por fuera. Cuéntalas: A con B, A con C, B con C. Son las tres parejas que se pueden formar con tres lados, ni una más.

Dentro de la suma y la comparación conviven dos tipos de operador. Primero se resuelve la aritmética, `ladoA + ladoB`, y después la comparación de ese resultado contra `ladoC`. Es el mismo orden de siempre: las cuentas antes que las comparaciones, y las comparaciones antes que `Y` y `O`.

**Bloque 7: niveles 3 y 4, la clasificación.**

```
			// Nivel 3. El caso mas exigente va PRIMERO. Si los tres lados
			// son iguales ya no queda nada mas que preguntar.
			// Con dos comparaciones alcanza: si A es igual a B y B es igual
			// a C, entonces A tambien es igual a C.
			Si (ladoA = ladoB) Y (ladoB = ladoC) Entonces
				Escribir "Tipo de triangulo: EQUILATERO";
				Escribir "Los tres lados miden lo mismo, se corta con plantilla";
			SiNo
				// Nivel 4. A esta linea solo se llega si los tres lados NO
				// son iguales. Eso ya lo sabemos por el Si de arriba, y por
				// eso aqui se puede preguntar solo por las parejas.
				// Con que UNA pareja coincida ya es isosceles: van con O.
				Si (ladoA = ladoB) O (ladoA = ladoC) O (ladoB = ladoC) Entonces
					Escribir "Tipo de triangulo: ISOSCELES";
					Escribir "Dos lados miden lo mismo, se traza uno por uno";
				SiNo
					// Si no hubo ninguna pareja igual, los tres son distintos.
					// Este SiNo no necesita condicion: recoge todo lo demas.
					Escribir "Tipo de triangulo: ESCALENO";
					Escribir "Los tres lados son distintos, se traza uno por uno";
				FinSi
			FinSi
```

El comentario del nivel 4 dice algo que vale la pena repetir: **cada escalón arrastra la información de los anteriores**. Cuando el programa llega a la pregunta del isósceles, ya sabe con certeza que los tres lados no son iguales, porque de lo contrario se habría ido por la rama del equilátero y nunca habría llegado hasta ahí. Por eso la condición del isósceles se puede escribir corta, sin repetir "y además no son los tres iguales". Es la misma economía que usaste en la escalera de notas del Ejercicio 5.

El último `SiNo`, el del escaleno, no lleva condición y no la necesita. Si los tres lados no son iguales y tampoco hay ninguna pareja repetida, la única posibilidad que queda es que los tres sean distintos. No hay un cuarto tipo escondido.

**Bloque 8: el cierre de la estructura.**

```
		SiNo
			// Este SiNo es el del nivel 2: son medidas positivas, pero no
			// cierran ninguna figura. Se avisa y se explica por que, para
			// que el usuario sepa que revisar.
			Escribir "Con estas medidas no se puede armar un triangulo";
			Escribir "La suma de dos lados siempre tiene que superar al tercero";
		FinSi
	FinSi
FinAlgoritmo
```

Aquí es donde la sangría se gana el sueldo. Ese `SiNo` está corrido dos TAB, la misma columna del `Si` del nivel 2 del bloque 6, y por eso se sabe que le pertenece a ese y no a otro. Después vienen los dos `FinSi` que faltaban, cada uno un TAB más a la izquierda que el anterior, cerrando el nivel 2 y el nivel 1 en ese orden.

Un consejo para cuando lo escribas: **abre y cierra cada `Si` en el mismo momento**. Escribe `Si ... Entonces`, dale Enter y escribe de una vez el `FinSi`, y solo después llena el contenido en la mitad. Así nunca te va a faltar uno ni te van a quedar cruzados.

### 6. Prueba de escritorio

Hacer la prueba de escritorio es ponerse en el lugar del computador y recorrer el programa línea por línea, anotando qué tiene cada variable en cada momento. Se hace **en papel, antes de ejecutar**, y sirve para saber qué debería salir. Si la máquina te da otra cosa, el programa tiene un error.

Juego de datos: `ladoA = 5`, `ladoB = 5`, `ladoC = 8`, que es el caso 2. Escogí este y no el de los tres lados iguales porque es el que recorre más camino: pasa por la validación, por la desigualdad, falla en la pregunta del equilátero y acierta en la del isósceles.

El signo `?` significa que la variable ya está declarada pero todavía no tiene ningún valor guardado. En **negrita** va el valor que acaba de cambiar. Las cuatro líneas del banner no tocan ninguna variable, así que van agrupadas en una sola fila.

| Paso | Instrucción | ladoA | ladoB | ladoC | Qué aparece en pantalla |
|---|---|---|---|---|---|
| 1 | `Definir ladoA, ladoB, ladoC Como Real` | ? | ? | ? | nada |
| 2 | Las cuatro líneas del banner | ? | ? | ? | el banner y una línea en blanco |
| 3 | `Escribir Sin Saltar "Escriba la medida del lado A en cm: "` | ? | ? | ? | `Escriba la medida del lado A en cm: ` |
| 4 | `Leer ladoA`, se teclea 5 | **5** | ? | ? | el 5 que teclea el usuario |
| 5 | `Escribir Sin Saltar "Escriba la medida del lado B en cm: "` | 5 | ? | ? | `Escriba la medida del lado B en cm: ` |
| 6 | `Leer ladoB`, se teclea 5 | 5 | **5** | ? | el 5 que teclea el usuario |
| 7 | `Escribir Sin Saltar "Escriba la medida del lado C en cm: "` | 5 | 5 | ? | `Escriba la medida del lado C en cm: ` |
| 8 | `Leer ladoC`, se teclea 8 | 5 | 5 | **8** | el 8 que teclea el usuario |
| 9 | `Escribir ""` y el separador de RESULTADOS | 5 | 5 | 8 | una línea en blanco y `------------------- RESULTADOS -------------------` |
| 10 | `Escribir "Lado A: ", ladoA, " cm"` | 5 | 5 | 8 | `Lado A: 5 cm` |
| 11 | `Escribir "Lado B: ", ladoB, " cm"` | 5 | 5 | 8 | `Lado B: 5 cm` |
| 12 | `Escribir "Lado C: ", ladoC, " cm"` | 5 | 5 | 8 | `Lado C: 8 cm` |
| 13 | `Si (5 <= 0) O (5 <= 0) O (8 <= 0)` da Falso | 5 | 5 | 8 | nada; se salta el aviso y entra por el `SiNo` |
| 14 | `Si (5 + 5 > 8) Y (5 + 8 > 5) Y (5 + 8 > 5)` da Verdadero | 5 | 5 | 8 | nada; entra por el `Entonces` |
| 15 | `Si (5 = 5) Y (5 = 8)` da Falso | 5 | 5 | 8 | nada; se salta el equilátero y entra por el `SiNo` |
| 16 | `Si (5 = 5) O (5 = 8) O (5 = 8)` da Verdadero | 5 | 5 | 8 | nada; entra por el `Entonces` |
| 17 | `Escribir "Tipo de triangulo: ISOSCELES"` | 5 | 5 | 8 | `Tipo de triangulo: ISOSCELES` |
| 18 | `Escribir "Dos lados miden lo mismo, se traza uno por uno"` | 5 | 5 | 8 | `Dos lados miden lo mismo, se traza uno por uno` |
| 19 | Los cuatro `FinSi` y `FinAlgoritmo` | 5 | 5 | 8 | nada; el programa termina |

Lo primero que salta a la vista es que **desde el paso 8 en adelante ninguna variable vuelve a cambiar**. Este programa no calcula nada: lee tres números y con ellos escoge un camino. Todo lo que pasa de la fila 13 para abajo es puro movimiento por el árbol, y por eso las tres columnas de valores se quedan quietas mientras la columna de la pantalla es la que trabaja.

Ahora el paso crítico, el 15, hecho a mano y despacio. La condición es `(ladoA = ladoB) Y (ladoB = ladoC)`. Primero se resuelve el paréntesis de la izquierda: `ladoA` vale 5 y `ladoB` vale 5, así que `5 = 5` es **Verdadero**. Después el de la derecha: `ladoB` vale 5 y `ladoC` vale 8, así que `5 = 8` es **Falso**. Y ahora el conector: `Verdadero Y Falso`. Con `Y` se necesitan las dos partes verdaderas, y una falló, entonces toda la condición vale **Falso**. Por eso el programa no escribe EQUILATERO y se va al `SiNo`, donde encuentra la pregunta del isósceles del paso 16: ahí `(5 = 5)` ya da Verdadero en el primer paréntesis, y como esas tres van unidas con `O`, con ese primer Verdadero la condición completa queda decidida. Resultado esperado según el papel: **ISOSCELES**.

Con otros datos el recorrido cambia. Esta tabla muestra qué camino toma cada uno de los cinco casos de prueba, y lo más interesante de ella es la columna donde dice *no se evalúa*: las preguntas que quedaron dentro de una rama que no se tomó **no se hacen nunca**.

| Datos | Nivel 1: ¿medida mala? | Nivel 2: ¿existe? | Nivel 3: ¿equilátero? | Nivel 4: ¿isósceles? | Mensaje final |
|---|---|---|---|---|---|
| 5, 5, 5 | Falso | Verdadero | **Verdadero** | no se evalúa | EQUILATERO |
| 5, 5, 8 | Falso | Verdadero | Falso | **Verdadero** | ISOSCELES |
| 3, 4, 5 | Falso | Verdadero | Falso | Falso | ESCALENO |
| 1, 2, 10 | Falso | **Falso** | no se evalúa | no se evalúa | No se puede armar el triángulo |
| 0, 4, 5 | **Verdadero** | no se evalúa | no se evalúa | no se evalúa | Medida no válida |

Mira la última fila. Con `ladoA` en cero, el programa ni siquiera intenta sumar lados ni compararlos: contesta y se va. Esa es toda la idea de validar primero.

### 7. Ejecución real verificada

El archivo se ejecutó con el intérprete de PSeInt bajo el perfil Estricto, con los cinco juegos de datos de la tabla de arriba. El chequeo de sintaxis **no reportó ningún error** en ninguna de las cinco corridas. Lo que sigue es la salida literal del programa; el signo `>` lo pone PSeInt para avisar que está esperando un dato y no está en tu código.

**Corrida 1.** Datos escritos por teclado: `5`, `5` y `5`.

```
==================================================
  CLASIFICAR UN TRIANGULO POR SUS LADOS
==================================================

Escriba la medida del lado A en cm: > 5
Escriba la medida del lado B en cm: > 5
Escriba la medida del lado C en cm: > 5

------------------- RESULTADOS -------------------
Lado A: 5 cm
Lado B: 5 cm
Lado C: 5 cm
Tipo de triangulo: EQUILATERO
Los tres lados miden lo mismo, se corta con plantilla
```

Verificación a mano. Validación: ninguno de los tres es menor o igual que cero, la condición da Falso y se pasa al `SiNo`. Desigualdad: `5 + 5 = 10 > 5`, y las otras dos parejas dan lo mismo, las tres Verdadero, y `Verdadero Y Verdadero Y Verdadero` es Verdadero. Equilátero: `5 = 5` Verdadero y `5 = 5` Verdadero, unidas con `Y` dan Verdadero. Sale EQUILATERO en la primera pregunta de la clasificación y la del isósceles nunca se evalúa. Coincide con la salida.

**Corrida 2.** Datos escritos por teclado: `5`, `5` y `8`.

```
==================================================
  CLASIFICAR UN TRIANGULO POR SUS LADOS
==================================================

Escriba la medida del lado A en cm: > 5
Escriba la medida del lado B en cm: > 5
Escriba la medida del lado C en cm: > 8

------------------- RESULTADOS -------------------
Lado A: 5 cm
Lado B: 5 cm
Lado C: 8 cm
Tipo de triangulo: ISOSCELES
Dos lados miden lo mismo, se traza uno por uno
```

Verificación a mano. Desigualdad: `5 + 5 = 10 > 8` Verdadero, `5 + 8 = 13 > 5` Verdadero, `5 + 8 = 13 > 5` Verdadero. Equilátero: `5 = 5` Verdadero pero `5 = 8` Falso, y `Verdadero Y Falso` es Falso. Isósceles: `5 = 5` Verdadero, y con `O` esa sola ya decide. Sale ISOSCELES, que es exactamente lo que dijo la prueba de escritorio de la sección 6.

**Corrida 3.** Datos escritos por teclado: `3`, `4` y `5`.

```
==================================================
  CLASIFICAR UN TRIANGULO POR SUS LADOS
==================================================

Escriba la medida del lado A en cm: > 3
Escriba la medida del lado B en cm: > 4
Escriba la medida del lado C en cm: > 5

------------------- RESULTADOS -------------------
Lado A: 3 cm
Lado B: 4 cm
Lado C: 5 cm
Tipo de triangulo: ESCALENO
Los tres lados son distintos, se traza uno por uno
```

Verificación a mano. Desigualdad: `3 + 4 = 7 > 5` Verdadero, `3 + 5 = 8 > 4` Verdadero, `4 + 5 = 9 > 3` Verdadero. Equilátero: `3 = 4` Falso, y con `Y` ya no importa la otra parte, la condición es Falso. Isósceles: `3 = 4` Falso, `3 = 5` Falso, `4 = 5` Falso, y `Falso O Falso O Falso` es Falso. Se agotaron las dos preguntas y el programa cae en el último `SiNo`: ESCALENO.

**Corrida 4.** Datos escritos por teclado: `1`, `2` y `10`. Este es el caso frontera del ejercicio: tres medidas perfectamente válidas con las que no existe ningún triángulo.

```
==================================================
  CLASIFICAR UN TRIANGULO POR SUS LADOS
==================================================

Escriba la medida del lado A en cm: > 1
Escriba la medida del lado B en cm: > 2
Escriba la medida del lado C en cm: > 10

------------------- RESULTADOS -------------------
Lado A: 1 cm
Lado B: 2 cm
Lado C: 10 cm
Con estas medidas no se puede armar un triangulo
La suma de dos lados siempre tiene que superar al tercero
```

Verificación a mano. Validación: 1, 2 y 10 son todos mayores que cero, la condición da Falso y se pasa al `SiNo`. Desigualdad: `1 + 2 = 3`, y 3 no supera a 10, primera comprobación **Falso**. Las otras dos sí se cumplen, `1 + 10 = 11 > 2` y `2 + 10 = 12 > 1`, pero con `Y` una sola falla tumba toda la condición. Se va al `SiNo` del nivel 2 y avisa. Fíjate en que las tres preguntas de clasificación quedaron adentro del `Entonces` que no se tomó, así que ni se evaluaron: el programa nunca llegó a preguntarse si estos lados eran iguales o distintos.

**Corrida 5.** Datos escritos por teclado: `0`, `4` y `5`. Este es el caso inválido, el del dato mal anotado.

```
==================================================
  CLASIFICAR UN TRIANGULO POR SUS LADOS
==================================================

Escriba la medida del lado A en cm: > 0
Escriba la medida del lado B en cm: > 4
Escriba la medida del lado C en cm: > 5

------------------- RESULTADOS -------------------
Lado A: 0 cm
Lado B: 4 cm
Lado C: 5 cm
Medida no valida
Los tres lados tienen que ser mayores que cero
```

Verificación a mano. Validación: `0 <= 0` es Verdadero, y con `O` esa primera condición ya decide toda la expresión sin importar que `4 <= 0` y `5 <= 0` sean Falsas. Entra por el `Entonces`, avisa, y todo el resto del programa, que vive dentro del `SiNo`, se salta completo. Observa además que las tres medidas alcanzaron a imprimirse, incluido el `Lado A: 0 cm`, porque esas líneas están fuera de toda decisión. Ese cero en pantalla es la pista que necesita el maestro para saber cuál de los tres números fue el que se anotó mal.

Las cinco corridas recorren las cinco puntas del árbol de la sección 3. Un programa con decisiones no está probado hasta que cada camino se ejecutó por lo menos una vez, y aquí las corridas 4 y 5 son las que de verdad separan un ejercicio terminado de uno a medias.

### 8. Errores comunes en este ejercicio

| Lo que escribe el estudiante | Qué pasa | Cómo se arregla |
|---|---|---|
| Pregunta primero por el isósceles y después por el equilátero | El programa corre sin una sola advertencia y acierta con 3, 4, 5 y con 5, 5, 8. Con 5, 5 y 5 responde `Tipo de triangulo: ISOSCELES`, porque un triángulo de tres lados iguales también tiene dos lados iguales y la primera condición que da Verdadero se lleva el camino. Acierta dos de cada tres veces, que es justo lo que hace que el error pase la revisión. | El equilátero es un caso especial del isósceles, así que va primero. Cuando dos condiciones se solapan, la más exigente se pregunta antes. |
| `Si (ladoA + ladoB > ladoC) O (ladoA + ladoC > ladoB) O (ladoB + ladoC > ladoA) Entonces` | Con 1, 2 y 10 dos de las tres comprobaciones dan Verdadero, y con `O` eso alcanza para entrar a clasificar. El programa responde `Tipo de triangulo: ESCALENO` para una figura que no existe, sin dar ningún error. El maestro corta la lámina y la pierde. | Las tres comprobaciones se tienen que cumplir todas, así que van unidas con `Y`. Léelo en voz alta antes de escribirlo: si la regla dice *todas*, el conector es `Y`. |
| `Si (ladoA <- ladoB) Y (ladoB <- ladoC) Entonces` | PSeInt no lo rechaza, y eso lo vuelve peligrosísimo. Lee la flecha como dos símbolos sueltos, el `<` de menor y el `-` de negativo, así que la condición termina siendo `ladoA < -ladoB`, o sea "¿5 es menor que menos 5?". Con 5, 5 y 5 eso da Falso, el equilátero no se cumple y el programa responde ISOSCELES. | Dentro de un `Si` el signo que compara igualdad es `=`. La flecha `<-` sirve para guardar un valor en una variable y no tiene nada que hacer adentro de una condición. |
| `Si ladoA = ladoB = ladoC Entonces` | El intérprete detiene el programa con `ERROR 207: No coinciden los tipos (<, >, <=, >=, <> o =). No se puede comparar variables o expresiones de distinto tipo.` Resuelve de izquierda a derecha: `ladoA = ladoB` le da un Verdadero, y después intenta comparar ese Verdadero contra un número. | La cadena del cuaderno de matemáticas se parte en dos comparaciones unidas por `Y`: `(ladoA = ladoB) Y (ladoB = ladoC)`. |
| Se le olvida uno de los cuatro `FinSi` | El programa no arranca. PSeInt responde `ERROR 322: No puede haber mas de un SiNo.` y `ERROR 117: Falta cerrar SI.` Un solo `FinSi` que falta produce dos mensajes, y la línea del segundo no es donde está el error sino donde el intérprete se dio cuenta. | Escribe el `FinSi` en el mismo momento en que escribes el `Si`, antes de llenar el contenido. Y usa la sangría con TAB para verificar que cada `FinSi` quede en la misma columna de su `Si`. |
| Escribe `triángulo`, `Isósceles` o `daño` dentro de los textos entre comillas | PSeInt no se queja y el programa corre, pero el archivo deja de ser ASCII puro y la consola de Windows no siempre muestra bien esos caracteres: al usuario le puede llegar el mensaje roto justo en la palabra más importante. Además el entregable del curso pide el archivo sin tildes y sin ñ. | Escribir `triangulo`, `ISOSCELES` y `danio` dentro del `.psc`. Las tildes van completas en los documentos `.md`, no en el archivo que se ejecuta. |
| Deja comentarios `//` dentro del archivo `.psc` | El código sigue corriendo, pero el diagrama de flujo que genera PSeInt con `Ctrl + D` se llena de cajas de comentario. En un programa con cuatro decisiones anidadas como este, el diagrama se vuelve ilegible y deja de servir para lo único que sirve, que es ver los caminos de un vistazo. | Borrar todos los `//` del `.psc`. Las explicaciones van en este documento, no en el archivo que se entrega. |

---

## Solución del Ejercicio 8 — El día de la semana

### 1. Análisis antes de programar

Esto se hace **antes de tocar el computador**. Aquí el análisis tiene una trampa que conviene descubrir en el papel y no en la pantalla: el enunciado habla de siete días, pero el programa tiene que atender **ocho situaciones**. Las siete del 1 al 7, y una octava que es "cualquier otro número". Si esa octava no aparece en tu análisis, tampoco va a aparecer en tu código.

| Entradas | Proceso | Salidas |
|---|---|---|
| dia (Entero): el número del día de la cita, del 1 al 7, donde 1 es lunes | 1. Mostrar el banner y preguntar por el número del día | El número que recibió el programa |
| | 2. Leer dia | nombreDia: el nombre del día en palabras |
| | 3. Primer `Segun`: según el valor exacto de dia, llenar nombreDia con el nombre que le corresponde | tipoDia: si ese día es hábil o de fin de semana |
| | 4. Si dia no coincide con ninguno de los siete, `De Otro Modo` llena nombreDia con NO VALIDO | |
| | 5. Segundo `Segun`: los valores 1 a 5 llenan tipoDia con Dia habil, y el 6 y el 7 con Fin de semana | |
| | 6. Si dia no coincide con ninguno, `De Otro Modo` llena tipoDia con No aplica | |
| | 7. Mostrar las tres líneas del resultado | |

Fíjate en algo que ya viste en el cuadernillo anterior, en el ejercicio de intercambiar dos variables: `nombreDia` y `tipoDia` **no son entradas**. El usuario nunca las escribe. Nacen de la necesidad del proceso: son las dos cajas donde el programa va guardando lo que va decidiendo, para poder mostrarlo todo junto al final. Distinguir una variable que llena el usuario de una variable que llena el programa es parte de aprender a analizar.

Y fíjate en el orden. Los dos `Segun` van **antes** del separador de RESULTADOS, no después. Cuando el programa llega a la línea que muestra el nombre del día, la decisión ya está tomada y guardada; esa línea solo se asoma a la caja y lee lo que hay. Separar el momento de decidir del momento de mostrar es lo que hace que el bloque de resultados quede en tres renglones limpios en vez de estar repartido por todo el programa.

### 2. Diccionario de datos

| Variable | Tipo | Por qué ese tipo |
|---|---|---|
| dia | Entero | Es el número de un día de la semana. No existe el día 3.5 ni el día 6.2: los días se cuentan de uno en uno, y para eso está el tipo Entero. Hay una segunda razón, y es la que de verdad importa en este ejercicio: `Segun` compara contra **valores exactos**. Si declararas `dia` Como Real, el programa no se cae, y esa es justamente la trampa. Corriendo con 3.5, PSeInt no encuentra ningún caso que valga exactamente 3.5, se va por `De Otro Modo` y responde NO VALIDO y No aplica sin decir una palabra de que el problema fue el tipo. El Entero cierra esa puerta desde el principio. Además, si alguien teclea una palabra en lugar de un número, la caja Entero lo rechaza de una y el programa se detiene con `ERROR 120: No coinciden los tipos (DIA)`, que es un aviso claro y no un resultado equivocado |
| nombreDia | Caracter | Guarda texto: Lunes, Martes, Miercoles. No te dejes engañar por el nombre del tipo. En otros lenguajes "carácter" significa una sola letra, pero en PSeInt el tipo `Caracter` guarda una cadena de texto completa, así que `"Miercoles"` cabe entero sin problema. Si la declaras Como Entero, PSeInt ni siquiera arranca: reporta `ERROR 125: No coinciden los tipos.` una vez por **cada** línea donde se le intenta meter texto, o sea once errores de un solo golpe en este programa. Es incómodo de ver, pero es preferible a que corra mal |
| tipoDia | Caracter | Mismo razonamiento. Guarda `"Dia habil"`, `"Fin de semana"` o `"No aplica"`, que son frases con espacios adentro. Ninguna de las dos variables es Entero, Real ni Lógico: no se está contando nada, no se está midiendo nada y no se está respondiendo verdadero o falso. Se está guardando texto |

Las dos variables de texto se declaran en una sola línea, `Definir nombreDia, tipoDia Como Caracter;`, porque son del mismo tipo. `dia` va en su propia línea porque es de otro tipo: en un mismo `Definir` todas las variables comparten el tipo que va después del `Como`.

### 3. La lógica explicada

#### De dónde sale la estructura

Mira la tabla de la EPS y pregúntate qué forma tienen las condiciones que hay ahí adentro:

| Pregunta que hay que hacerle al dato | Forma de la pregunta |
|---|---|
| ¿dia vale exactamente 1? | igualdad contra un valor exacto |
| ¿dia vale exactamente 2? | igualdad contra un valor exacto |
| ... y así hasta el 7 | igualdad contra un valor exacto |

Las siete preguntas son la misma pregunta sobre la misma variable, cambiando solo el número. Cuando un problema tiene esa forma —**una sola variable comparada contra una lista de valores exactos**— existe una estructura hecha a la medida, y es `Segun`.

Podrías resolverlo con la escalera de `Si` del Ejercicio 5. Compara las dos formas de escribir exactamente lo mismo:

```
Si dia = 1 Entonces
	nombreDia <- "Lunes";
SiNo
	Si dia = 2 Entonces
		nombreDia <- "Martes";
	SiNo
		Si dia = 3 Entonces
			nombreDia <- "Miercoles";
		SiNo
			...
```

```
Segun dia Hacer
	1:
		nombreDia <- "Lunes";
	2:
		nombreDia <- "Martes";
	3:
		nombreDia <- "Miercoles";
	...
```

Los dos hacen lo mismo. Pero la escalera necesita siete `FinSi` en cascada al final, repite el nombre de la variable siete veces y se corre hacia la derecha hasta salirse de la pantalla. El `Segun` nombra la variable **una sola vez**, en la primera línea, y todo lo demás queda alineado. Cuando el problema encaja, `Segun` gana por lejos.

#### Cuándo NO sirve `Segun`

Esta es la parte que hay que tener clara, porque es la que decide cuál de las dos estructuras usar en cada ejercicio:

| Lo que necesitas preguntar | ¿Sirve `Segun`? | Por qué |
|---|---|---|
| ¿dia vale exactamente 3? | Sí | Es una igualdad contra un valor exacto. Se escribe `3:` |
| ¿dia vale 1, 2, 3, 4 o 5? | Sí | Son cinco igualdades contra valores exactos. Se escribe `1,2,3,4,5:` |
| ¿nota es menor que 4? | No | `Segun` no sabe preguntar `<` ni `>`. Eso solo lo hace un `Si` |
| ¿consumo está entre 150 y 350? | No | Es un rango, no un valor. `Segun` no entiende rangos |
| ¿ladoA + ladoB es mayor que ladoC? | No | Es una condición calculada, no una comparación contra una lista |

Por eso el Ejercicio 5, el de clasificar la nota, **no se puede escribir con `Segun`**: allá las condiciones eran `nota < 3`, `nota < 4`, `nota <= 4.5`. Una nota puede valer 3.7 o 4.23 o cualquier cosa entre 0 y 5, y no hay forma de escribir un caso por cada valor posible. Aquí, en cambio, los valores posibles son siete y se pueden listar.

#### Cómo recorre la máquina un `Segun`

Sigamos qué hace PSeInt con `dia` valiendo 3, paso por paso:

| Lo que hace la máquina | Cómo lo resuelve | Resultado |
|---|---|---|
| Llega a `Segun dia Hacer` y mira cuánto vale dia | dia vale 3 | Se queda con el 3 en la mano |
| Compara 3 contra el caso `1:` | 3 no es 1 | No entra. Sigue |
| Compara 3 contra el caso `2:` | 3 no es 2 | No entra. Sigue |
| Compara 3 contra el caso `3:` | 3 sí es 3 | **Entra.** Ejecuta `nombreDia <- "Miercoles";` |
| Termina lo que hay dentro de ese caso | — | **Salta directo al `FinSegun`** |

Ese último renglón es importante y es donde más se equivoca la gente al leer un `Segun` por primera vez. Cuando un caso coincide, PSeInt hace lo que hay adentro de ese caso y **se sale**. No sigue bajando a mirar los casos 4, 5, 6 y 7, y tampoco entra a `De Otro Modo`. Por eso `nombreDia` termina valiendo `"Miercoles"` y no `"Domingo"`, que sería lo que quedaría si el programa siguiera ejecutando hacia abajo pisando el valor anterior.

#### Las comas: un caso que atiende varios valores

El segundo `Segun` responde una pregunta distinta sobre la misma variable, y aquí cinco valores tienen exactamente la misma respuesta. En vez de escribir cinco casos idénticos, se escriben los cinco valores en un solo caso, separados por comas:

```
	1,2,3,4,5:
		tipoDia <- "Dia habil";
```

Eso se lee "si dia vale 1, o 2, o 3, o 4, o 5". Y ojo con esto, porque es un error que PSeInt **no** te va a reportar:

| Lo que escribes en el caso | Qué entiende PSeInt | Qué pasa con dia = 3 |
|---|---|---|
| `1,2,3,4,5:` | Cinco valores exactos: el 1, el 2, el 3, el 4 y el 5 | El 3 está en la lista. tipoDia queda en `"Dia habil"`. Correcto |
| `1-5:` | No es un rango. Es la resta 1 menos 5, o sea el valor **-4** | El 3 no es -4, así que no coincide con ningún caso y cae en `De Otro Modo`. tipoDia queda en `"No aplica"` |

Esto está verificado: con `1-5:` en el segundo `Segun` y digitando un 3, el programa responde `Dia de la semana: Miercoles` y en el renglón siguiente `Tipo de dia     : No aplica`. Un miércoles que no es día hábil. El chequeo de sintaxis pasa sin una sola queja, porque `1-5` es una operación aritmética perfectamente válida. **El guion no existe como separador de valores en un `Segun`. Los valores van con comas.**

#### `De Otro Modo`: el caso que decide si el ejercicio quedó bien

`De Otro Modo` es exactamente lo mismo que el último `SiNo` de una escalera de decisiones: es la red que recoge todo lo que no encajó arriba. Y en este programa no es un adorno. Quitémoslo de los dos `Segun` y comparemos las dos versiones con los mismos datos:

| dia | Programa CON `De Otro Modo` | Programa SIN `De Otro Modo` |
|---|---|---|
| 3 | Miercoles / Dia habil | Miercoles / Dia habil |
| 7 | Domingo / Fin de semana | Domingo / Fin de semana |
| 9 | NO VALIDO / No aplica | Se detiene en seco: `ERROR 215: Variable no inicializada (NOMBREDIA).` |

Lee esa tabla despacio. Las dos primeras filas son **idénticas**. Un programa sin `De Otro Modo` responde perfecto con el 3 y perfecto con el 7, pasa el chequeo de sintaxis con `F9` sin una queja y se ve terminado. La falla solo aparece cuando alguien digita un número que no está en la lista, y entonces no aparece con un resultado raro: aparece con el programa **cortado a la mitad**, sin alcanzar a mostrar la última línea.

La razón es directa. Si ningún caso coincide y no hay `De Otro Modo`, el `Segun` no hace absolutamente nada y `nombreDia` se queda como estaba: vacía, sin ningún valor adentro. Y cuando la línea `Escribir "Dia de la semana: ", nombreDia;` intenta mostrar una caja que nunca se llenó, PSeInt no se inventa un texto en blanco. Se detiene y avisa que esa variable no fue inicializada.

Por eso el caso de prueba del 9 no es opcional. Es el único de los tres que distingue un programa terminado de uno que parece terminado.

#### Por qué dos `Segun` y no uno solo

Podrías responder las dos preguntas en un solo `Segun`, poniendo dos asignaciones dentro de cada caso:

```
	1:
		nombreDia <- "Lunes";
		tipoDia <- "Dia habil";
	2:
		nombreDia <- "Martes";
		tipoDia <- "Dia habil";
```

Funciona. Pero fíjate que `"Dia habil"` te va a tocar escribirlo cinco veces, una por cada día hábil, y esas cinco copias tienen que quedar exactamente iguales para siempre. El día que la EPS cambie el texto a `"Atencion normal"`, hay que acordarse de los cinco sitios. Y hay un riesgo peor que el trabajo repetido, que es olvidar un valor. Esto está verificado: escribiendo los días hábiles como casos separados y dejando por fuera el 5, el programa corrido con un 5 responde:

```
Dia de la semana: Viernes
Tipo de dia     : No aplica
```

Un viernes con nombre correcto y tipo equivocado, sin ningún error, sin ninguna advertencia. El primer `Segun` sí tenía su caso `5:` y por eso el nombre salió bien; al segundo se le olvidó, el 5 no coincidió con nada y cayó en `De Otro Modo`. Con las comas ese olvido es mucho más difícil, porque los cinco valores están a la vista en un solo renglón: `1,2,3,4,5:`.

Los dos `Segun` van **uno detrás del otro**, no uno dentro del otro. Son dos preguntas independientes sobre el mismo dato, y cada una tiene su `FinSegun`.

#### Las fronteras de este ejercicio

Los valores que hay que mirar con lupa son los de los extremos. El 1 y el 7 son los últimos válidos; el 0 y el 8 son los primeros inválidos de cada lado:

| dia | nombreDia | tipoDia | Comentario |
|---|---|---|---|
| 0 | NO VALIDO | No aplica | Primer inválido por debajo. La semana empieza en 1, no en 0 |
| 1 | Lunes | Dia habil | Frontera de abajo. Tiene que entrar |
| 7 | Domingo | Fin de semana | Frontera de arriba. Tiene que entrar |
| 8 | NO VALIDO | No aplica | Primer inválido por encima |

Las cuatro filas se comprobaron ejecutando el programa. Que el 0 quede fuera es fácil de olvidar, porque a nadie se le ocurre que un día pueda ser el cero, pero a un dedo se le va la tecla más de lo que uno cree.

### 4. El código completo

Este es el archivo `PSC/Ejercicio_08_DiaDeLaSemana.psc` tal cual:

```
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
```

### 5. El código explicado bloque por bloque

**Advertencia importante: los comentarios que empiezan con `//` que vas a ver aquí abajo existen SOLO en esta explicación. NO los copies a tu archivo `.psc`.** La razón es práctica: PSeInt dibuja cada comentario como una caja extra dentro del diagrama de flujo que se genera con `Ctrl + D`. Un programa como este, que ya tiene once ramas repartidas entre los dos `Segun`, con comentarios queda convertido en un diagrama ilegible. Las explicaciones viven en este documento; el archivo que entregas va limpio.

**Bloque 1: el encabezado y las declaraciones**

```
Algoritmo DiaDeLaSemana
	Definir dia Como Entero;                    // el numero del dia, del 1 al 7
	Definir nombreDia, tipoDia Como Caracter;   // dos cajas de texto que llena el programa, no el usuario
```

La primera línea le pone nombre al algoritmo y tiene que coincidir con el nombre del archivo sin el prefijo `Ejercicio_08_`. Las dos siguientes crean las tres cajas de memoria. Van en dos líneas separadas porque son de tipos distintos: en un mismo `Definir` todas las variables comparten el tipo que va después del `Como`.

Toda variable se declara **antes** de usarla. Aquí eso es especialmente fácil de olvidar con `nombreDia` y `tipoDia`, porque como el usuario nunca las escribe, uno tiende a no verlas como variables. Lo son igual, y si se te queda alguna sin declarar, la revisión de sintaxis pasa sin quejarse pero el programa se detiene al ejecutarse con `ERROR 211: La variable (NOMBREDIA) no esta definida`.

**Bloque 2: el banner y la pregunta**

```
	Escribir "==================================================";
	Escribir "  DIA DE LA SEMANA";                    // el titulo va con dos espacios de sangria
	Escribir "==================================================";
	Escribir "";                                      // linea en blanco, para que el banner respire
	Escribir Sin Saltar "Escriba el numero del dia, de 1 a 7, donde 1 es lunes: ";
	Leer dia;                                         // lo que teclee la persona entra a la caja dia
```

Nada nuevo respecto al cuadernillo anterior: `Escribir` muestra y baja de línea, `Escribir Sin Saltar` muestra y deja el cursor donde mismo, y `Leer` detiene el programa hasta que la persona teclee algo.

Lo que sí vale la pena mirar es el texto de la pregunta. No dice "Escriba el dia:" a secas: dice de 1 a 7 y aclara que el 1 es lunes. Un programa que le pide un número al usuario sin explicarle qué significa ese número está obligando a adivinar, y de esas adivinanzas salen los datos inválidos que después hay que atrapar con `De Otro Modo`.

**Bloque 3: el primer `Segun`, el que llena el nombre del día**

```
	Segun dia Hacer                            // mira cuanto vale dia y busca el caso con ese valor exacto
		1:
			nombreDia <- "Lunes";
		2:
			nombreDia <- "Martes";
		3:
			nombreDia <- "Miercoles";          // sin tilde: dentro del .psc no van tildes
		4:
			nombreDia <- "Jueves";
		5:
			nombreDia <- "Viernes";
		6:
			nombreDia <- "Sabado";             // sin tilde tambien
		7:
			nombreDia <- "Domingo";
		De Otro Modo:
			nombreDia <- "NO VALIDO";          // recoge todo lo que no sea del 1 al 7
	FinSegun                                   // cierra el primer Segun; no lleva punto y coma
```

Siete casos, uno por día, y aquí sí toca escribirlos uno por uno porque cada día tiene un nombre distinto: no hay nada que agrupar. Fíjate en la forma de cada caso: el valor, dos puntos, y en la línea siguiente y con una sangría más lo que se hace. Los dos puntos son obligatorios y el valor va solo, sin comillas y sin la palabra `caso` adelante.

`De Otro Modo:` va escrito así, con esas tres palabras y sus dos puntos, y va de último. No es opcional: es lo único que llena `nombreDia` cuando el número no está en la lista.

`FinSegun` cierra el bloque y **no lleva punto y coma**, igual que `Algoritmo`, `Si`, `SiNo` y `FinSi`. Si se te olvida, PSeInt lo detecta antes de ejecutar nada y avisa con `ERROR 118: Falta cerrar SEGUN.`

**Bloque 4: el segundo `Segun`, el que decide si el día es hábil**

```
	Segun dia Hacer                            // el mismo dia, pero ahora se pregunta otra cosa
		1,2,3,4,5:
			tipoDia <- "Dia habil";            // un solo caso atiende los cinco valores
		6,7:
			tipoDia <- "Fin de semana";
		De Otro Modo:
			tipoDia <- "No aplica";
	FinSegun                                   // cada Segun cierra con su propio FinSegun
```

Aquí está la otra forma de escribir un caso. Los cinco días hábiles comparten exactamente la misma respuesta, así que van juntos en un mismo caso con los valores separados por comas. Siete situaciones resueltas en tres casos.

Este `Segun` empieza justo después del `FinSegun` del anterior, al mismo nivel de sangría. Son dos estructuras hermanas, no una dentro de otra. Cuando PSeInt llega aquí, `dia` sigue valiendo lo mismo que valía arriba: el primer `Segun` solo leyó esa caja, no la modificó.

**Bloque 5: los resultados**

```
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Numero recibido : ", dia;         // la coma pega la etiqueta con el valor
	Escribir "Dia de la semana: ", nombreDia;   // aqui se ve lo que dejo el primer Segun
	Escribir "Tipo de dia     : ", tipoDia;     // y aqui lo que dejo el segundo
FinAlgoritmo
```

Tres renglones limpios, y ninguno de los tres toma decisiones: las decisiones ya se tomaron arriba y quedaron guardadas en las cajas. Estas líneas solo se asoman a mirar qué hay adentro.

Los espacios dentro de las etiquetas están puestos a propósito. `"Numero recibido : "` y `"Tipo de dia     : "` tienen espacios de relleno para que los tres signos de dos puntos queden en la misma columna y los valores arranquen alineados. Es la misma idea del Ejercicio 10 del cuadernillo anterior: una salida alineada se lee de un vistazo, una salida desalineada obliga a buscar.

### 6. Prueba de escritorio

Una prueba de escritorio es hacer de computador con lápiz y papel: recorrer el programa instrucción por instrucción anotando qué vale cada variable. Vamos con `dia` valiendo **3**. El símbolo `?` significa que la variable ya existe pero todavía no tiene ningún valor adentro, y la **negrita** marca el valor que acaba de cambiar en ese paso.

| Paso | Instrucción que se ejecuta | dia | nombreDia | tipoDia | Qué aparece en pantalla |
|---|---|---|---|---|---|
| 1 | `Definir dia Como Entero;` | **?** | todavía no existe | todavía no existe | (nada) |
| 2 | `Definir nombreDia, tipoDia Como Caracter;` | ? | **?** | **?** | (nada) |
| 3 | Las tres líneas del banner y la línea en blanco | ? | ? | ? | El banner de iguales con el título DIA DE LA SEMANA |
| 4 | `Escribir Sin Saltar` con la pregunta | ? | ? | ? | Escriba el numero del dia, de 1 a 7, donde 1 es lunes: |
| 5 | `Leer dia;` | **3** | ? | ? | > 3 |
| 6 | `Segun dia Hacer` compara 3 con el caso `1:` | 3 | ? | ? | (nada) |
| 7 | Compara 3 con el caso `2:` | 3 | ? | ? | (nada) |
| 8 | Compara 3 con el caso `3:` y coincide | 3 | ? | ? | (nada) |
| 9 | `nombreDia <- "Miercoles";` | 3 | **Miercoles** | ? | (nada) |
| 10 | Salta hasta `FinSegun` sin mirar los casos 4, 5, 6, 7 ni `De Otro Modo` | 3 | Miercoles | ? | (nada) |
| 11 | El segundo `Segun dia Hacer` compara 3 con la lista `1,2,3,4,5:` y coincide | 3 | Miercoles | ? | (nada) |
| 12 | `tipoDia <- "Dia habil";` | 3 | Miercoles | **Dia habil** | (nada) |
| 13 | Salta hasta el segundo `FinSegun` | 3 | Miercoles | Dia habil | (nada) |
| 14 | La línea en blanco y el separador de RESULTADOS | 3 | Miercoles | Dia habil | ------------------- RESULTADOS ------------------- |
| 15 | `Escribir "Numero recibido : ", dia;` | 3 | Miercoles | Dia habil | Numero recibido : 3 |
| 16 | `Escribir "Dia de la semana: ", nombreDia;` | 3 | Miercoles | Dia habil | Dia de la semana: Miercoles |
| 17 | `Escribir "Tipo de dia     : ", tipoDia;` | 3 | Miercoles | Dia habil | Tipo de dia     : Dia habil |
| 18 | `FinAlgoritmo` | 3 | Miercoles | Dia habil | (el programa termina) |

**El paso crítico son el 8, el 9 y el 10, y hay que hacerlos a mano para entenderlos.** En el paso 8 la máquina tiene el 3 en la mano y lo compara contra el valor del caso. Coinciden, así que entra. En el paso 9 ejecuta la única instrucción que hay adentro de ese caso y la caja `nombreDia`, que venía vacía, queda con el texto `Miercoles`.

El paso 10 es el que la gente no espera. Terminado el caso 3, PSeInt **no** sigue bajando. Se salta los casos 4, 5, 6 y 7, se salta también `De Otro Modo`, y se va derecho al `FinSegun`. Si siguiera ejecutando hacia abajo, la línea del caso 7 pisaría el valor y `nombreDia` terminaría valiendo `Domingo` para todo el mundo. Un caso que coincide se ejecuta y se sale; los demás ni se miran.

Fíjate también en algo que dicen los pasos 6 a 13: **ninguno de ellos imprime nada**. Los dos `Segun` completos, con sus dieciséis casos entre los dos, son invisibles en pantalla. Lo único que se ve de todo ese trabajo son los dos renglones de los pasos 16 y 17.

**Qué habría pasado con otros datos.** Estas son las ocho situaciones posibles, con el caso por el que entra cada una en cada `Segun`. Las ocho se comprobaron ejecutando el programa:

| dia | Caso que coincide en el primer `Segun` | nombreDia | Caso que coincide en el segundo `Segun` | tipoDia |
|---|---|---|---|---|
| 1 | `1:` | Lunes | `1,2,3,4,5:` | Dia habil |
| 2 | `2:` | Martes | `1,2,3,4,5:` | Dia habil |
| 4 | `4:` | Jueves | `1,2,3,4,5:` | Dia habil |
| 5 | `5:` | Viernes | `1,2,3,4,5:` | Dia habil |
| 6 | `6:` | Sabado | `6,7:` | Fin de semana |
| 7 | `7:` | Domingo | `6,7:` | Fin de semana |
| 0 | ninguno, entra por `De Otro Modo:` | NO VALIDO | ninguno, entra por `De Otro Modo:` | No aplica |
| 8 | ninguno, entra por `De Otro Modo:` | NO VALIDO | ninguno, entra por `De Otro Modo:` | No aplica |

Mira la columna del medio y la de la derecha en las filas del 1 al 5: cinco casos distintos en el primer `Segun` y **un solo caso** en el segundo. Ahí se ve para qué sirven las comas.

### 7. Ejecución real verificada

El archivo se revisó con el chequeo de sintaxis bajo el perfil Estricto y **no reportó ningún error**. Estas son las tres corridas, tal cual las produjo PSeInt.

**Corrida 1.** Datos escritos por teclado: **3**.

```
==================================================
  DIA DE LA SEMANA
==================================================

Escriba el numero del dia, de 1 a 7, donde 1 es lunes: > 3

------------------- RESULTADOS -------------------
Numero recibido : 3
Dia de la semana: Miercoles
Tipo de dia     : Dia habil
```

Verificación a mano. En el primer `Segun` el 3 coincide con el caso `3:`, que asigna `"Miercoles"`. En el segundo, el 3 está dentro de la lista `1,2,3,4,5`, así que entra por el caso de los días hábiles y `tipoDia` queda en `"Dia habil"`. Coincide renglón por renglón con la prueba de escritorio de la sección anterior.

**Corrida 2.** Datos escritos por teclado: **7**.

```
==================================================
  DIA DE LA SEMANA
==================================================

Escriba el numero del dia, de 1 a 7, donde 1 es lunes: > 7

------------------- RESULTADOS -------------------
Numero recibido : 7
Dia de la semana: Domingo
Tipo de dia     : Fin de semana
```

Verificación a mano. Este es el caso frontera de arriba: el 7 es el último valor válido. En el primer `Segun` recorre los casos 1, 2, 3, 4, 5 y 6 sin coincidir, y entra en el séptimo, que asigna `"Domingo"`. En el segundo `Segun` el 7 no está en la lista `1,2,3,4,5`, así que ese caso no coincide; sí coincide con `6,7:` y `tipoDia` queda en `"Fin de semana"`. Fíjate en lo que acaba de pasar: **el mismo número entró por el séptimo caso en la primera estructura y por el segundo caso en la segunda**. Cada `Segun` agrupa los valores como le convenga a la pregunta que está respondiendo.

**Corrida 3.** Datos escritos por teclado: **9**. Este es el caso inválido, y es el que decide si el programa está bien hecho.

```
==================================================
  DIA DE LA SEMANA
==================================================

Escriba el numero del dia, de 1 a 7, donde 1 es lunes: > 9

------------------- RESULTADOS -------------------
Numero recibido : 9
Dia de la semana: NO VALIDO
Tipo de dia     : No aplica
```

Verificación a mano. El 9 se compara contra los siete casos del primer `Segun` y no coincide con ninguno, así que entra por `De Otro Modo:` y `nombreDia` queda en `"NO VALIDO"`. En el segundo `Segun` pasa lo mismo: no está ni en `1,2,3,4,5` ni en `6,7`, entra por `De Otro Modo:` y `tipoDia` queda en `"No aplica"`.

Lo importante de esta corrida es que el programa **llega hasta el final** y muestra las tres líneas completas. Sin las dos ramas de `De Otro Modo` no llegaría: se detendría en la penúltima línea con `ERROR 215: Variable no inicializada (NOMBREDIA).`, dejando el resultado a medias. Las tres corridas juntas cubren un día hábil, un día de fin de semana y un número fuera de rango, que son los tres comportamientos distintos que tiene este programa.

### 8. Errores comunes en este ejercicio

| Lo que escribe el estudiante | Qué pasa | Cómo se arregla |
|---|---|---|
| Deja los `Segun` sin la rama `De Otro Modo:` | Con el 3 y con el 7 el programa responde perfecto y pasa el chequeo de sintaxis sin una queja, así que parece terminado. Con el 9 se corta a la mitad: alcanza a mostrar `Numero recibido : 9` y ahí se detiene con `ERROR 215: Variable no inicializada (NOMBREDIA).`, porque ningún caso llenó esa caja | Agregar `De Otro Modo:` como último caso de **los dos** `Segun`, con `"NO VALIDO"` en uno y `"No aplica"` en el otro. Y probar siempre con un número fuera de rango, no solo con los que se sabe que funcionan |
| Escribe el caso de los días hábiles como `1-5:` creyendo que es un rango | No hay error de ninguna clase, ni de sintaxis ni de ejecución. PSeInt lee `1-5` como la resta 1 menos 5, o sea el valor -4, y ese caso no va a coincidir nunca con un día de la semana. Con dia = 3 el nombre sale bien, `Miercoles`, pero el tipo sale `No aplica`: un miércoles que no es día hábil | Los valores de un caso van separados por **comas**: `1,2,3,4,5:`. El guion no existe como separador en un `Segun`, y `Segun` no entiende rangos de ninguna forma |
| Escribe los cinco días hábiles en cinco casos separados, copiando y pegando, y se le queda uno sin escribir | Silencioso otra vez. Si el que falta es el 5, el programa corrido con un 5 responde `Dia de la semana: Viernes` y `Tipo de dia     : No aplica`. El nombre sale bien porque el primer `Segun` sí tiene su caso `5:`; el tipo sale mal porque el segundo no, y el 5 se fue por `De Otro Modo` | Agrupar los cinco valores en un solo caso con comas. Así los cinco quedan a la vista en un renglón y es mucho más difícil que se pierda uno |
| Se le olvida el `FinSegun`, o pone uno solo para los dos `Segun` | Este sí lo detecta PSeInt antes de ejecutar nada: `ERROR 118: Falta cerrar SEGUN.` El mensaje señala la línea del `Segun` que quedó abierto, no la del final del programa | Cada `Segun` se cierra con su propio `FinSegun`. Si hay dos `Segun`, hay dos `FinSegun`. Ninguno de los dos lleva punto y coma |
| Escribe la asignación dentro de un caso con el signo `=`, como en `nombreDia = "Miercoles";` | PSeInt no deja arrancar el programa: `ERROR 106: Instruccion no valida.` En pseudocódigo el `=` sirve para comparar dentro de un `Si`, no para meter un valor en una caja | La asignación se escribe con la flecha `<-`, que muestra hacia dónde viaja el valor: `nombreDia <- "Miercoles";` |
| Escribe los nombres con tilde dentro del `.psc`: `"Miércoles"`, `"Sábado"` | No hay ningún error y el programa corre completo, y por eso se pasa por alto. Pero la consola de Windows no muestra esas tildes: en el renglón del resultado aparecen caracteres rotos en lugar de la letra acentuada, y el mensaje que ve el paciente queda ilegible | Dentro del `.psc` se escribe `"Miercoles"` y `"Sabado"`, sin tildes y sin eñes, ni siquiera adentro de las comillas. En este documento sí van con tilde, porque el `.md` sí las muestra bien |
| Le pone comentarios `//` al `.psc` para acordarse de qué hace cada caso | El programa corre igual, así que no parece un problema. El daño aparece al generar el diagrama de flujo con `Ctrl + D`: PSeInt dibuja **una caja extra por cada comentario**, y este programa, que ya tiene once ramas repartidas entre los dos `Segun`, queda convertido en un diagrama imposible de leer | El `.psc` va limpio, sin un solo `//`. Las explicaciones van en el documento, que es donde alguien las va a leer con calma |

---

## Solución del Ejercicio 9 — Calculadora con menú de opciones

### 1. Análisis antes de programar

Antes de escribir una sola línea hay que separar tres cosas: qué te dan, qué tienes que hacer con eso y qué vas a devolver. En este ejercicio esa tabla tiene una columna que hasta ahora no habías necesitado: no alcanza con preguntarse **qué se calcula**, hay que preguntarse también **qué puede salir mal**.

| Entradas | Proceso | Salidas |
|---|---|---|
| `opcion`: el número de la operación que el usuario escogió en el menú | 1. Poner `operacionValida` en `Verdadero` antes de empezar, es decir dar por hecho que la operación sí se va a poder hacer | `nombreOperacion`: la operación escrita en palabras |
| `num1`: el primer número de la operación | 2. Mostrar el menú, leer la opción y después leer los dos números | `num1` y `num2`: los dos números tal como los escribió el usuario |
| `num2`: el segundo número de la operación | 3. Según la opción, guardar el nombre de la operación y hacer la cuenta que corresponda | `resultado`: el resultado, **solo si la operación sí se pudo hacer** |
|  | 4. En el caso de la división, y **antes** de dividir, revisar si `num2` vale cero. Si vale cero, avisar y apagar `operacionValida` | Aviso de que no se puede dividir entre cero |
|  | 5. Si la opción no está en el menú, avisar y apagar `operacionValida` | Aviso de que esa opción no está en el menú |
|  | 6. Al final, mostrar el resultado únicamente si `operacionValida` sigue encendida |  |

Mira los pasos 4 y 5. Ninguno de los dos calcula nada: los dos existen para **evitar** un cálculo. En los ejercicios anteriores todo el trabajo del programa era producir un número; aquí una parte del trabajo es reconocer los casos en que no hay ningún número que producir, y decirlo con todas las letras.

Y mira el paso 1. Encender la bandera antes de empezar parece un detalle menor, pero es lo que le permite al programa tener una respuesta lista para el final sin importar por dónde se haya ido. Arranca suponiendo que todo va a salir bien, y solo los caminos que fallan se encargan de desmentirlo.

### 2. Diccionario de datos

| Variable | Tipo | Por qué ese tipo |
|---|---|---|
| `opcion` | Entero | Es el número de una opción de un menú: existe la 1, la 2, la 3 y la 4, y no existe nada entre medias. No hay ninguna operación 2.5. Declararla Entero le sirve de filtro al programa: si el usuario teclea `3.5`, PSeInt lo rechaza en el momento mismo de leerlo, con `ERROR 313: No coinciden los tipos (OPCION), el valor ingresado debe ser un entero.`, y no lo deja entrar. Si la declararas Real, ese `3.5` sí entraría, llegaría hasta el `Segun`, no encontraría ningún caso que le corresponda y terminaría cayendo en el `De Otro Modo`. Funciona, pero es dejar pasar un dato que nunca tuvo sentido para después botarlo. |
| `num1` | Real | Es un número cualquiera que el usuario quiere operar, y en una calculadora eso incluye decimales. Si lo declararas Entero, la calculadora dejaría de servir para 12.5 o para 0.75, que son números normalísimos. |
| `num2` | Real | La misma razón, y además es el divisor. Una calculadora que no puede dividir entre 2.5 no es una calculadora. |
| `resultado` | Real | Este tiene que ser Real sin discusión, y la culpa la tiene la división. Aunque los dos números que entren sean enteros, el cociente casi nunca lo es: `12 / 5` da `2.4`. Se probó de verdad qué pasa si se declara Entero, y con esos mismos datos el programa se detiene justo en la línea de la división con `ERROR 314: No coinciden los tipos, el valor a asignar debe ser un entero.` El tipo se elige por lo que la variable **puede** llegar a valer, no por lo que valió en la primera prueba. |
| `operacionValida` | Logico | Solo tiene que guardar una de dos cosas: o la operación se pudo hacer, o no se pudo. Para eso existe el tipo `Logico`, que únicamente admite `Verdadero` o `Falso`. Podrías intentar lo mismo con un Caracter que guarde las palabras `"si"` y `"no"`, pero PSeInt no te deja llegar lejos: declarándola Caracter, la línea que le asigna `Verdadero` falla con `ERROR 125: No coinciden los tipos.` y el `Si` del final falla con `ERROR 92: No coinciden los tipos.` Cada tipo existe para un trabajo, y este es el trabajo del `Logico`. |
| `nombreOperacion` | Caracter | Guarda texto: `Suma`, `Resta`, `Multiplicacion`, `Division` o `NINGUNA`. En PSeInt el tipo `Caracter` guarda una cadena completa, no una sola letra, así que `"Multiplicacion"` cabe entera. Si por error la declararas Entero, PSeInt marca de una vez las cinco líneas que le asignan texto, cada una con su `ERROR 125: No coinciden los tipos.`, y el programa ni siquiera arranca. |

Fíjate en que este programa usa variables de cuatro tipos distintos: Entero, Real, Logico y Caracter. Es el primero del cuadernillo que los necesita todos a la vez, y no es por adorno: cada dato pide el suyo.

### 3. La lógica explicada

**Por qué la estructura es un `Segun` y no una escalera de `Si`.**

Lo que el programa compara es una variable contra una lista de valores exactos: la opción es 1, o es 2, o es 3, o es 4. No hay rangos, no hay mayores ni menores. Esa es justamente la situación para la que existe `Segun`, como se vio en el Ejercicio 8. Con una escalera de `Si` también funcionaría, pero quedarían cuatro condiciones repitiendo la misma variable (`Si opcion = 1`, `SiNo Si opcion = 2`, y así) y tres `FinSi` en cascada al final. El `Segun` dice lo mismo con menos ruido.

**Por qué el caso 4 no se parece a los otros tres.**

Aquí está lo nuevo del ejercicio. Los casos 1, 2 y 3 se resuelven derecho, sin preguntar nada, y hay una razón concreta para eso:

| Operación | ¿Se puede hacer con cualquier pareja de números? | Por qué |
|---|---|---|
| Suma | Sí | Dos números cualesquiera siempre tienen una suma |
| Resta | Sí | Siempre hay una diferencia, aunque salga negativa |
| Multiplicación | Sí | Siempre hay un producto, incluso si uno de los dos es cero |
| División | **No** | Falla, y falla exactamente en un caso: cuando el segundo número es cero |

Vale la pena entender **por qué** falla, porque no es un capricho de PSeInt. Dividir 12 entre 4 es hacerse una pregunta: ¿qué número multiplicado por 4 da 12? La respuesta es 3, y por eso `12 / 4` da `3`. Hazte ahora la misma pregunta con el cero: ¿qué número multiplicado por 0 da 12? Ninguno. Cualquier número multiplicado por cero da cero, jamás 12. La pregunta no tiene respuesta. Por eso se dice que la división entre cero **no está definida**: no es que el resultado sea muy grande, ni que sea infinito, es que no existe.

Y un computador no puede entregar lo que no existe. Si le pides que divida entre cero, se detiene.

**El corazón del ejercicio: preguntar antes, no después.**

Casi todo el mundo escribe primero la división y después la pregunta, porque así es como se piensa de corrido: "divido, y si el divisor era cero, lo arreglo". Veamos las dos versiones con los mismos datos, `num1 = 12` y `num2 = 0`:

| Lo que escribes | Cómo lo resuelve la máquina | Resultado |
|---|---|---|
| `Si num2 = 0 Entonces` primero, y `resultado <- num1 / num2;` adentro del `SiNo` | Evalúa `0 = 0`, que da Verdadero, entra por la rama del `Entonces`, escribe el aviso y **nunca llega** a la línea de la división, porque esa línea vive en la otra rama | El programa termina completo y muestra el aviso |
| `resultado <- num1 / num2;` primero, y `Si num2 = 0 Entonces` dos renglones más abajo | Llega a la división y la ejecuta de una. No hay nada que la detenga, porque la pregunta todavía no ha ocurrido | El programa se muere ahí mismo. Nunca alcanza la pregunta |

La segunda versión se escribió de verdad en un archivo aparte y se ejecutó con la opción 4, el 12 y el 0. Este es el final literal de esa corrida:

```
Escriba el numero de la operacion (1 a 4): > 4
Escriba el primer numero: > 12
Escriba el segundo numero: > 0
Lin 34 (inst 1): ERROR 296: Division por cero
```

Fíjate sobre todo en lo que **no** aparece: no salió la línea de RESULTADOS, ni la operación, ni los dos números, ni ningún aviso. El programa no terminó mal; es que no terminó. Y la pregunta `Si num2 = 0` que el estudiante sí había escrito estaba dos renglones más abajo, esperando un turno que nunca le llegó. Una guarda que se revisa tarde no es una guarda: mirar si el piso estaba mojado después de caerse no sirve de nada.

**La condición se escribe con `=`, no con `<-`. Y aquí PSeInt no te avisa.**

Esto ya salió en el Ejercicio 2: dentro de un `Si` el signo `=` compara, y la flecha `<-` es para guardar valores, fuera de las condiciones. Lo que hace especial este caso es lo que pasa cuando uno se equivoca. Se probó `Si num2 <- 0 Entonces` de verdad, y PSeInt **no reporta ningún error de sintaxis**: el programa arranca y corre. Lo que ocurre es que lo lee de otra manera. Parte la flecha en dos pedazos, el `<` de "menor que" y el `-` de número negativo, y entiende `num2 < -0`, o sea "num2 es menor que cero negativo". Como cero negativo es cero, la condición termina preguntando si el número es negativo, que no tiene nada que ver con lo que el estudiante quería preguntar.

Las tres filas de abajo salen de tres corridas reales de esa versión dañada:

| `num2` | Lo que el estudiante creía preguntar (`num2 = 0`) | Lo que PSeInt pregunta de verdad (`num2 < -0`) | Qué pasa en la corrida real |
|---|---|---|---|
| 4 | Falso, entonces divide | Falso, entonces divide | Muestra `Resultado: 3`. Correcto, pero de pura casualidad |
| 0 | Verdadero, entonces avisa | Falso, entonces **divide** | `ERROR 296: Division por cero`. La guarda no protegió nada |
| −5 | Falso, entonces divide | Verdadero, entonces **avisa** | Dice "no se puede dividir entre cero" con un número que no es cero, y se niega a hacer una división perfectamente posible |

Un error que se equivoca en las dos direcciones a la vez: deja pasar lo que debía frenar y frena lo que debía dejar pasar. Y con la primera prueba que uno hace, la del 12 dividido entre 4, parece que todo está en orden.

**La bandera: qué es `operacionValida` y para qué sirve.**

`operacionValida` es de tipo `Logico`. Una variable `Logico` no guarda números ni palabras: guarda una sola de dos cosas, `Verdadero` o `Falso`. Nada más.

Este programa la usa como una bandera. Se iza al principio, antes del `Segun`, con `operacionValida <- Verdadero;`, y se arría en los dos caminos que terminan sin ningún resultado que mostrar. Al final del programa, una sola pregunta consulta la bandera y decide.

| Camino que toma el programa | ¿Se arría la bandera? | `operacionValida` al llegar al final |
|---|---|---|
| Opción 1, 2 o 3 | No | Verdadero |
| Opción 4 con `num2` distinto de cero | No | Verdadero |
| Opción 4 con `num2` igual a cero | Sí | Falso |
| Opción que no está en el menú | Sí | Falso |

Cuatro caminos, dos desenlaces y una sola línea al final que decide entre ellos. La alternativa sería repetir el `Escribir` del resultado dentro de los cuatro caminos que sí calculan algo, y el día que quieras cambiarle el texto a esa línea te tocaría acordarte de los cuatro sitios. La bandera existe para que la decisión se tome una vez y se consulte una vez.

**Cómo se pregunta por una variable `Logico`.**

| Lo que escribes | Cómo lo resuelve la máquina | Resultado |
|---|---|---|
| `Si operacionValida Entonces` | Un `Si` necesita algo que valga Verdadero o Falso. Abre la variable, encuentra `Verdadero`, y con eso ya sabe qué hacer | Entra |
| `Si operacionValida = Verdadero Entonces` | Abre la variable, encuentra `Verdadero`, y compara `Verdadero` contra `Verdadero`. Esa comparación da `Verdadero`. Y con eso ya sabe qué hacer | Entra igual, después de un paso de más |

Las dos versiones se ejecutaron de verdad con los mismos datos y produjeron exactamente la misma salida, línea por línea. La segunda no es un error, es un rodeo: una variable `Logico` ya es una condición completa, no le hace falta compararse con nada para volverse una. Cuando quieras preguntar por lo contrario tampoco compares: se escribe `Si NO operacionValida Entonces`, con el operador `NO` del Ejercicio 6.

**Avisar y arriar la bandera son dos cosas distintas, y hay que hacer las dos.**

Es frecuente escribir el mensaje de aviso y olvidar el `operacionValida <- Falso;` que va a su lado. El resultado es un programa que avisa bien y después se contradice solo. Esta es la corrida real de esa versión, con la opción 4, el 12 y el 0:

```
Escriba el segundo numero: > 0

AVISO: no se puede dividir entre cero.
       La division entre cero no esta definida en matematicas.

------------------- RESULTADOS -------------------
Operacion elegida: Division
Primer numero    : 12
Segundo numero   : 0
Resultado        : Lin 54 (inst 1): ERROR 215: Variable no inicializada (RESULTADO).
```

Mira la última línea con calma, porque explica bastante de cómo funciona un `Escribir`. El programa alcanzó a imprimir la etiqueta `Resultado        : `, que es texto entre comillas y siempre está disponible, y cuando fue a buscar el valor de `resultado` se encontró con que ahí nunca se guardó nada, porque la división no llegó a hacerse. Ahí se detuvo. El aviso estaba bien escrito; lo que faltó fue impedir que el final del programa siguiera creyendo que había un resultado.

**Por qué el `De Otro Modo` no es un adorno.**

Lo mismo pasa, y peor, si se omite el `De Otro Modo:`. Con una opción válida el programa se ve impecable; el problema aparece el día que alguien teclea un 7. Corrida real de la versión sin `De Otro Modo`, con la opción 7:

```
------------------- RESULTADOS -------------------
Operacion elegida: Lin 45 (inst 1): ERROR 215: Variable no inicializada (NOMBREOPERACION).
```

El `Segun` no encontró ningún caso que coincidiera con el 7 y, como no había `De Otro Modo`, no hizo absolutamente nada: `nombreOperacion` se quedó vacía y `operacionValida` se quedó encendida por error. Dos líneas después el programa se cae. Con el `De Otro Modo` puesto, ese mismo 7 produce un aviso claro y el programa termina bien. Es la única pieza que separa un programa que explica de uno que se rompe.

**Por qué los dos `Leer` de los números van antes del `Segun`.**

Puede que te llame la atención que el programa pida los dos números incluso cuando la opción es un 7 que no existe. Es cierto, y es a propósito: los tres `Leer` se ejecutan siempre, uno detrás de otro, antes de que empiece cualquier decisión. Se podría organizar de otra manera, pero el precio sería meter los `Leer` adentro de cada caso del `Segun` y repetirlos cinco veces. Se prefirió la versión que se lee de un tirón: primero se recoge todo lo que hace falta, y después se decide qué hacer con ello.

### 4. El código completo

Este es el archivo `PSC/Ejercicio_09_MenuCalculadora.psc` tal cual:

```
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
```

### 5. El código explicado bloque por bloque

**Advertencia importante: los comentarios que empiezan con `//` que vas a ver aquí abajo existen SOLO en esta explicación. NO los copies a tu archivo `.psc`.** La razón es concreta: PSeInt dibuja una caja extra dentro del diagrama de flujo por cada comentario que encuentre, así que un programa comentado genera un diagrama lleno de cajas que no son ni entrada, ni proceso, ni salida, y el diagrama deja de servir para lo que sirve. Los comentarios son para entender aquí; el archivo es para ejecutar. Y como el archivo tampoco lleva tildes, los comentarios de abajo también van sin ellas.

**Bloque 1: las variables y la bandera izada.**

```
Algoritmo MenuCalculadora
	// La opcion es un numero de menu: 1, 2, 3 o 4. No existe la opcion 2.5,
	// asi que va Entero. De paso, PSeInt rechaza solo un 3.5 en el Leer.
	Definir opcion Como Entero;
	// Los dos numeros y el resultado van Real. La division 12 / 5 da 2.4 y
	// eso no cabe en un Entero.
	Definir num1, num2, resultado Como Real;
	// Logico guarda una sola de dos cosas: Verdadero o Falso. Nada mas.
	Definir operacionValida Como Logico;
	// Caracter guarda texto completo, no una sola letra: "Multiplicacion" cabe.
	Definir nombreOperacion Como Caracter;
	// La bandera se iza ANTES de decidir nada. Se da por hecho que la
	// operacion si se va a poder hacer, y los caminos que fallan la arrian.
	operacionValida <- Verdadero;
```

Esa última línea es la que casi todo el mundo olvida, y es la que sostiene el final del programa. Si la borras, los caminos 1, 2 y 3 nunca le guardan nada a `operacionValida`, y al llegar al `Si` del final PSeInt se detiene con `ERROR 215: Variable no inicializada (OPERACIONVALIDA).` Se probó de verdad con la opción 3, y el programa alcanza a mostrar la operación y los dos números antes de caerse.

Fíjate también en que `operacionValida <- Verdadero;` no lleva comillas. `Verdadero` no es la palabra "Verdadero" escrita en un texto: es uno de los dos valores que el lenguaje reconoce para el tipo `Logico`. Si le pusieras comillas estarías guardando texto en una variable que no admite texto.

**Bloque 2: el banner y el menú.**

```
	Escribir "==================================================";
	Escribir "  CALCULADORA CON MENU DE OPCIONES";
	Escribir "==================================================";
	Escribir "";
	// El menu son cuatro Escribir con texto. No hay ninguna instruccion
	// nueva aqui: lo unico que importa es que el usuario vea con claridad
	// que numero le corresponde a que operacion.
	Escribir "  1. Sumar";
	Escribir "  2. Restar";
	Escribir "  3. Multiplicar";
	Escribir "  4. Dividir";
	Escribir "";
```

El menú no tiene nada de misterioso: es texto. Vale la pena decirlo porque la palabra "menú" suena a que hiciera falta alguna instrucción especial, y no. Un menú es una lista impresa en pantalla más una variable que recoge lo que el usuario escogió. Los `Escribir ""` de arriba y de abajo dejan una línea en blanco a cada lado de la lista, para que el menú se despegue del banner y de la pregunta.

**Bloque 3: la entrada de datos.**

```
	// Sin Saltar deja el cursor en la MISMA linea, entonces el usuario
	// escribe su respuesta al lado de la pregunta y no debajo.
	Escribir Sin Saltar "Escriba el numero de la operacion (1 a 4): ";
	Leer opcion;
	// Los dos numeros se leen SIEMPRE, antes de decidir nada. Cuando el
	// Segun empiece, ya va a tener a la mano todo lo que necesita.
	Escribir Sin Saltar "Escriba el primer numero: ";
	Leer num1;
	Escribir Sin Saltar "Escriba el segundo numero: ";
	Leer num2;
```

El orden de estos tres `Leer` es el orden en que el usuario va a escribir los datos, y no se puede cambiar sin cambiar también el programa. Primero la opción, después el primer número, después el segundo.

**Bloque 4: los tres casos que se resuelven derecho.**

```
	// Segun compara la variable contra valores exactos: 1, 2, 3 o 4.
	// Entra en UN caso y sale del Segun; no revisa los demas.
	Segun opcion Hacer
		1:
			// Cada caso hace dos cosas: guarda el nombre de la operacion
			// para poder mostrarlo despues, y hace la cuenta.
			nombreOperacion <- "Suma";
			resultado <- num1 + num2;
		2:
			nombreOperacion <- "Resta";
			resultado <- num1 - num2;
		3:
			nombreOperacion <- "Multiplicacion";
			resultado <- num1 * num2;
```

Los tres son iguales entre sí y no preguntan nada, porque sumar, restar y multiplicar se puede hacer siempre, con cualquier pareja de números. No hay ninguna manera de que estas tres líneas fallen.

Ojo con un detalle de PSeInt: en un `Segun`, cuando un caso termina, el programa se sale del `Segun` completo. No sigue de largo revisando los casos de abajo. Si la opción fue 1, las líneas de los casos 2, 3 y 4 no se ejecutan nunca.

**Bloque 5: el caso 4, la guarda de la división.**

```
		4:
			// El nombre se guarda siempre, se pueda dividir o no, porque la
			// operacion que el usuario pidio si fue la division.
			nombreOperacion <- "Division";
			// Esta es la guarda. Se pregunta ANTES de dividir, no despues.
			// Dentro de un Si, el signo = compara. La flecha <- no va aqui.
			Si num2 = 0 Entonces
				// Camino que no produce resultado: se arria la bandera.
				operacionValida <- Falso;
				Escribir "";
				Escribir "AVISO: no se puede dividir entre cero.";
				Escribir "       La division entre cero no esta definida en matematicas.";
			SiNo
				// La division vive AQUI ADENTRO. Si num2 vale cero, esta linea
				// no se ejecuta nunca, y por eso el programa no se cae.
				resultado <- num1 / num2;
			FinSi
```

Este es el bloque nuevo del ejercicio: un `Si` completo, con su `Entonces`, su `SiNo` y su `FinSi`, viviendo adentro de un caso de un `Segun`. La sangría lo cuenta a simple vista: el `Si` está más adentro que el `4:`, y las dos ramas están más adentro que el `Si`.

Lo importante no es que el `Si` esté ahí, sino **dónde quedó la división**. Está adentro del `SiNo`, es decir en el camino al que solo se llega cuando `num2` no vale cero. Esa es toda la protección. Si sacaras esa línea del `SiNo` y la pusieras suelta arriba, el `Si` seguiría existiendo, seguiría estando bien escrito, y no serviría de nada.

El `FinSi` cierra el `Si` antes de que empiece el `De Otro Modo`. No es opcional ni es cuestión de estilo: si lo borras, PSeInt no arranca y responde con cuatro errores encadenados, `ERROR 321: DE OTRO MODO mal colocado.`, `ERROR 107: FinSegun mal colocado.`, `ERROR 117: Falta cerrar SI.` y `ERROR 118: Falta cerrar SEGUN.` Cuando veas una lista así de larga, casi siempre el culpable es un solo bloque sin cerrar, y los demás mensajes son el efecto dominó.

**Bloque 6: el `De Otro Modo`, para lo que no está en el menú.**

```
		De Otro Modo:
			// Aqui cae cualquier opcion que no sea 1, 2, 3 ni 4.
			// Se le guarda un nombre a nombreOperacion igual, porque el
			// final del programa la va a mostrar pase lo que pase.
			nombreOperacion <- "NINGUNA";
			operacionValida <- Falso;
			Escribir "";
			// La coma pega texto y valor en una sola linea: el aviso le
			// repite al usuario el numero que escribio.
			Escribir "AVISO: la opcion ", opcion, " no esta en el menu.";
			Escribir "       Las opciones validas son 1, 2, 3 y 4.";
	FinSegun
```

Este bloque hace exactamente las mismas dos cosas que la rama del cero: arría la bandera y avisa. La diferencia es que además le guarda a `nombreOperacion` la palabra `"NINGUNA"`, y esa línea es la que evita que el programa se caiga en la salida.

El aviso repite el número que el usuario escribió (`", opcion, "`) en vez de decir un genérico "opción inválida". Es un detalle pequeño y cambia mucho: quien se equivocó ve en pantalla su propio 7 y entiende de inmediato qué fue lo que pasó.

**Bloque 7: la salida, y la única pregunta que decide.**

```
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	// Estas tres lineas se escriben SIEMPRE, haya resultado o no.
	Escribir "Operacion elegida: ", nombreOperacion;
	Escribir "Primer numero    : ", num1;
	Escribir "Segundo numero   : ", num2;
	// Una variable Logico ya vale Verdadero o Falso por si sola: es una
	// condicion completa. No hace falta escribir = Verdadero.
	Si operacionValida Entonces
		Escribir "Resultado        : ", resultado;
	FinSi
FinAlgoritmo
```

Las tres primeras líneas de resultados salen siempre porque siempre hay algo que decir: qué operación se pidió y con qué números. La cuarta línea es la que depende de la bandera.

Fíjate en los espacios adentro de las comillas de las etiquetas: `"Primer numero    : "` lleva cuatro espacios antes de los dos puntos para que todos los dos puntos queden en la misma columna en pantalla. Es la misma alineación del Ejercicio 10 de Ejercicios_1. No cambia nada del cálculo, pero una salida alineada se lee de un vistazo y una desalineada toca leerla palabra por palabra.

### 6. Prueba de escritorio

La prueba de escritorio consiste en ponerse uno en el lugar del computador y recorrer el programa instrucción por instrucción, anotando qué tiene cada variable en cada momento. Se hace **en papel y antes de ejecutar**, para saber qué resultado deberías obtener. Si después la máquina te da otra cosa, es que el programa tiene un error.

Vamos a recorrer el camino más interesante de todos: `opcion = 4`, `num1 = 12`, `num2 = 0`. El signo `?` significa que la variable ya está declarada pero todavía no tiene ningún valor guardado, y el valor en **negrita** es el que acaba de cambiar en ese paso.

| Paso | Instrucción | opcion | num1 | num2 | resultado | operacionValida | nombreOperacion | Qué aparece en pantalla |
|---|---|---|---|---|---|---|---|---|
| 1 | Se declaran las 6 variables | ? | ? | ? | ? | ? | ? | nada |
| 2 | `operacionValida <- Verdadero` | ? | ? | ? | ? | **Verdadero** | ? | nada |
| 3 | Los `Escribir` del banner y del menú | ? | ? | ? | ? | Verdadero | ? | el banner y las cuatro opciones |
| 4 | `Leer opcion` (se teclea 4) | **4** | ? | ? | ? | Verdadero | ? | la pregunta de la opción |
| 5 | `Leer num1` (se teclea 12) | 4 | **12** | ? | ? | Verdadero | ? | la pregunta del primer número |
| 6 | `Leer num2` (se teclea 0) | 4 | 12 | **0** | ? | Verdadero | ? | la pregunta del segundo número |
| 7 | `Segun opcion Hacer` con `opcion` = 4 | 4 | 12 | 0 | ? | Verdadero | ? | nada: salta al caso `4:` |
| 8 | `nombreOperacion <- "Division"` | 4 | 12 | 0 | ? | Verdadero | **Division** | nada |
| 9 | `Si num2 = 0 Entonces`: `0 = 0` da Verdadero | 4 | 12 | 0 | ? | Verdadero | Division | nada: entra por el `Entonces` |
| 10 | `operacionValida <- Falso` | 4 | 12 | 0 | ? | **Falso** | Division | nada |
| 11 | Los tres `Escribir` del aviso | 4 | 12 | 0 | ? | Falso | Division | las dos líneas del AVISO |
| 12 | `FinSi` y `FinSegun` | 4 | 12 | 0 | ? | Falso | Division | nada |
| 13 | Los `Escribir` de RESULTADOS | 4 | 12 | 0 | ? | Falso | Division | la línea de RESULTADOS y las tres líneas de operación y números |
| 14 | `Si operacionValida Entonces`: la bandera vale Falso | 4 | 12 | 0 | ? | Falso | Division | nada: **no entra** |
| 15 | `FinSi` y `FinAlgoritmo` | 4 | 12 | 0 | ? | Falso | Division | el programa termina |

El paso crítico es el 9, y conviene hacerlo a mano: la máquina toma lo que hay guardado en `num2`, que es `0`, lo compara contra el `0` que está escrito en la condición, y como los dos son iguales la condición vale Verdadero. Con eso entra por la rama del `Entonces` y **la línea de la división, que está en la otra rama, no se ejecuta**. Ahí es donde el programa se salva.

Y el otro paso que hay que mirar es el 14. Fíjate en que la columna de `resultado` tiene un `?` de principio a fin: en este camino nunca se le guardó nada, y por eso mostrarla habría sido mostrar basura. La bandera, que se apagó en el paso 10, es lo que impide que eso pase.

Con otros datos el programa toma otros caminos. Esta tabla resume cuál toma cada uno:

| opcion | num1 | num2 | Camino que toma el `Segun` | ¿Se evalúa `Si num2 = 0`? | `operacionValida` al final | Qué muestra |
|---|---|---|---|---|---|---|
| 1 | 12 | 4 | caso `1:` | No, ese `Si` vive en el caso 4 | Verdadero | Suma y `Resultado: 16` |
| 2 | 12 | 4 | caso `2:` | No | Verdadero | Resta y `Resultado: 8` |
| 3 | 12 | 4 | caso `3:` | No | Verdadero | Multiplicacion y `Resultado: 48` |
| 4 | 12 | 4 | caso `4:` | Sí, y da Falso: se va por el `SiNo` y divide | Verdadero | Division y `Resultado: 3` |
| 4 | 12 | 0 | caso `4:` | Sí, y da Verdadero: se va por el `Entonces` y avisa | Falso | El aviso, y ninguna línea de resultado |
| 7 | 12 | 4 | `De Otro Modo:` | No | Falso | El aviso, y ninguna línea de resultado |

Seis juegos de datos, cinco caminos distintos por dentro y dos formas de terminar. Esa es la diferencia entre este programa y los del cuadernillo anterior, donde todos los datos recorrían siempre las mismas líneas en el mismo orden.

### 7. Ejecución real verificada

El archivo se ejecutó con el intérprete de PSeInt bajo el perfil Estricto, con seis juegos de datos distintos. El chequeo de sintaxis **no reportó ningún error** en ninguna de las corridas. Las salidas que siguen son literales: son lo que el programa escribió en pantalla, sin retocar. El signo `>` lo pone PSeInt para indicar que está esperando un dato; no está en tu código.

**Corrida 1.** Datos escritos por teclado: `3`, `12` y `4`.

```
==================================================
  CALCULADORA CON MENU DE OPCIONES
==================================================

  1. Sumar
  2. Restar
  3. Multiplicar
  4. Dividir

Escriba el numero de la operacion (1 a 4): > 3
Escriba el primer numero: > 12
Escriba el segundo numero: > 4

------------------- RESULTADOS -------------------
Operacion elegida: Multiplicacion
Primer numero    : 12
Segundo numero   : 4
Resultado        : 48
```

Verificación a mano: la opción 3 es la multiplicación, y 12 por 4 son 48. Coincide.

**Corrida 2.** Datos escritos por teclado: `4`, `12` y `4`.

```
==================================================
  CALCULADORA CON MENU DE OPCIONES
==================================================

  1. Sumar
  2. Restar
  3. Multiplicar
  4. Dividir

Escriba el numero de la operacion (1 a 4): > 4
Escriba el primer numero: > 12
Escriba el segundo numero: > 4

------------------- RESULTADOS -------------------
Operacion elegida: Division
Primer numero    : 12
Segundo numero   : 4
Resultado        : 3
```

Verificación a mano: la opción 4 es la división. La guarda preguntó si `num2` valía cero; `num2` vale 4, así que la condición dio Falso y el programa se fue por el `SiNo`. Y 12 entre 4 son 3. Coincide.

**Corrida 3. El caso que le da sentido al ejercicio.** Datos escritos por teclado: `4`, `12` y `0`.

```
==================================================
  CALCULADORA CON MENU DE OPCIONES
==================================================

  1. Sumar
  2. Restar
  3. Multiplicar
  4. Dividir

Escriba el numero de la operacion (1 a 4): > 4
Escriba el primer numero: > 12
Escriba el segundo numero: > 0

AVISO: no se puede dividir entre cero.
       La division entre cero no esta definida en matematicas.

------------------- RESULTADOS -------------------
Operacion elegida: Division
Primer numero    : 12
Segundo numero   : 0
```

Verificación a mano: `num2` vale 0, la condición `num2 = 0` dio Verdadero, el programa entró por el `Entonces`, escribió el aviso y apagó la bandera. Cuenta las líneas que hay debajo del separador de RESULTADOS: son **tres**, no cuatro. La del resultado no está, y no está porque el `Si operacionValida Entonces` del final encontró la bandera apagada. Y nota además que el programa **terminó completo**: llegó hasta el final, no se cayó. Compara esto con lo que le pasa a la versión que divide antes de preguntar, en la sección 3.

**Corrida 4. El caso inválido.** Datos escritos por teclado: `7`, `12` y `4`.

```
==================================================
  CALCULADORA CON MENU DE OPCIONES
==================================================

  1. Sumar
  2. Restar
  3. Multiplicar
  4. Dividir

Escriba el numero de la operacion (1 a 4): > 7
Escriba el primer numero: > 12
Escriba el segundo numero: > 4

AVISO: la opcion 7 no esta en el menu.
       Las opciones validas son 1, 2, 3 y 4.

------------------- RESULTADOS -------------------
Operacion elegida: NINGUNA
Primer numero    : 12
Segundo numero   : 4
```

Verificación a mano: el 7 no coincide con ninguno de los cuatro casos, así que el programa cayó en el `De Otro Modo:`, guardó `"NINGUNA"` en `nombreOperacion` y apagó la bandera. Otra vez son tres líneas de resultados y no cuatro. Fíjate también en que el programa **sí pidió los dos números** antes de darse cuenta de que la opción no existía: los `Leer` van antes del `Segun` y se ejecutan siempre.

**Corrida 5.** Datos escritos por teclado: `1`, `12` y `4`.

```
==================================================
  CALCULADORA CON MENU DE OPCIONES
==================================================

  1. Sumar
  2. Restar
  3. Multiplicar
  4. Dividir

Escriba el numero de la operacion (1 a 4): > 1
Escriba el primer numero: > 12
Escriba el segundo numero: > 4

------------------- RESULTADOS -------------------
Operacion elegida: Suma
Primer numero    : 12
Segundo numero   : 4
Resultado        : 16
```

**Corrida 6.** Datos escritos por teclado: `2`, `12` y `4`.

```
==================================================
  CALCULADORA CON MENU DE OPCIONES
==================================================

  1. Sumar
  2. Restar
  3. Multiplicar
  4. Dividir

Escriba el numero de la operacion (1 a 4): > 2
Escriba el primer numero: > 12
Escriba el segundo numero: > 4

------------------- RESULTADOS -------------------
Operacion elegida: Resta
Primer numero    : 12
Segundo numero   : 4
Resultado        : 8
```

Verificación a mano de las dos últimas: 12 más 4 son 16, y 12 menos 4 son 8. Coinciden. Con estas seis corridas quedan probados los cuatro casos del `Segun`, las dos ramas del `Si` que vive adentro del caso 4, y el `De Otro Modo`. No queda ninguna línea del programa sin ejecutar al menos una vez, y eso es lo que uno debería buscar siempre al escoger los datos de prueba: no probar seis veces lo mismo, sino probar seis cosas distintas.

### 8. Errores comunes en este ejercicio

| Lo que escribe el estudiante | Qué pasa | Cómo se arregla |
|---|---|---|
| Poner `resultado <- num1 / num2;` de una y preguntar después `Si num2 = 0 Entonces` | Mientras el segundo número no sea cero, el programa da los resultados correctos y nada delata el problema: con 12 y 4 muestra un 3 impecable. El día que alguien escribe un cero, PSeInt se detiene en la línea de la división con `ERROR 296: Division por cero` y no alcanza a imprimir ni la línea de RESULTADOS. La pregunta que el estudiante sí escribió estaba dos renglones más abajo y nunca llegó a ejecutarse. | La pregunta va **antes** y la división va **adentro del `SiNo`**. Una guarda solo protege lo que tiene detrás. |
| `Si num2 <- 0 Entonces`, con la flecha de asignar en vez del `=` | PSeInt no reporta ningún error de sintaxis: parte la flecha en `<` y `-` y entiende `num2 < -0`, o sea "num2 es menor que cero negativo". El programa corre, y se equivoca en las dos direcciones. Con `num2` en 0 la condición da Falso, divide igual y se cae con `ERROR 296: Division por cero`. Con `num2` en −5 la condición da Verdadero y avisa que no se puede dividir entre cero para un número que no es cero. | Dentro de un `Si` se compara con `=`. La flecha `<-` solo sirve para guardar un valor en una variable, y eso nunca ocurre adentro de una condición. |
| Escribir el aviso del cero pero olvidar el `operacionValida <- Falso;` que va al lado | El aviso sale bien y el programa se contradice tres líneas después: alcanza a imprimir la etiqueta `Resultado        : ` y se detiene con `ERROR 215: Variable no inicializada (RESULTADO).`, porque la división nunca se hizo y en `resultado` no hay nada. | Avisar y apagar la bandera son dos cosas distintas y las dos van en el mismo camino. Donde haya un aviso de que no hubo resultado, tiene que haber un `operacionValida <- Falso;`. |
| Omitir el `De Otro Modo:` del `Segun` | Con opciones válidas el programa se ve perfecto, y por eso el error sobrevive a las primeras pruebas. Con una opción como el 7 el `Segun` no ejecuta nada, `nombreOperacion` se queda vacía y el programa imprime `Operacion elegida: ` y muere con `ERROR 215: Variable no inicializada (NOMBREOPERACION).` | Escribir siempre el `De Otro Modo:` y llenar ahí las mismas variables que llenan los demás casos. Es lo que recoge todo lo que no encajó, igual que el último `SiNo` de una escalera. |
| Olvidar el `FinSi` que cierra el `Si` de adentro del caso 4 | El programa ni siquiera arranca, y PSeInt responde con cuatro mensajes de una vez: `ERROR 321: DE OTRO MODO mal colocado.`, `ERROR 107: FinSegun mal colocado.`, `ERROR 117: Falta cerrar SI.` y `ERROR 118: Falta cerrar SEGUN.` La lista asusta, pero el culpable es uno solo. | Cerrar el `Si` con su `FinSi` antes de que empiece el `De Otro Modo:`. Cuando veas una cascada de errores así, busca el bloque abierto más adentro, no el primer mensaje de la lista. |
| `nombreOperacion <- "Multiplicación";` o `Escribir "La opción no existe";`, con tildes adentro de las comillas | El programa corre sin quejarse, pero la letra acentuada sale rota en pantalla: en lugar de la vocal aparece un carácter extraño, y la palabra queda ilegible justo en el mensaje que el usuario tenía que leer. Pasa lo mismo con la eñe. | Escribir `Multiplicacion`, `Division`, `opcion` y `matematicas` sin tildes dentro del `.psc`. Las tildes van en los documentos `.md`, no en el código. |
| Dejar comentarios `//` adentro del archivo `.psc` | El programa sigue corriendo igual, pero el diagrama de flujo que genera PSeInt con `Ctrl + D` se llena de cajas de comentario que no son ni entrada, ni proceso, ni salida, y deja de leerse. Además el entregable del curso pide el archivo limpio. | Borrar todos los `//` del `.psc`. Las explicaciones viven en este documento, que para eso existe. |

---

## Solución del Ejercicio 10 — Liquidación de la factura de energía

### 1. Análisis antes de programar

Este es el programa más largo del cuadernillo y por eso es en el que más se nota si uno se sentó a pensar antes de teclear. El cuadro de siempre, pero con una diferencia: la columna del proceso ya no son tres líneas, son siete decisiones encadenadas. Llénalo con lápiz y papel antes de abrir PSeInt.

| Entradas | Proceso | Salidas |
|---|---|---|
| `estrato`: el estrato socioeconómico de la vivienda, del 1 al 6. | **Decisión 0 (validar).** `Si estrato < 1 O estrato > 6 O consumo < 0 O diasMora < 0` los datos no sirven y no se liquida nada. Todo lo demás vive dentro del `SiNo`. | `tarifa`: el precio del kWh que le tocó a ese consumo. |
| `consumo`: la energía consumida en el mes, en kWh. | **Decisión 1 (tarifa).** Una escalera de rangos sobre `consumo` que deja 520, 640 o 780 guardado en `tarifa`. | `valorConsumo`: lo que vale la energía consumida. |
| `diasMora`: los días que lleva vencida la factura anterior. | **Cálculo.** `valorConsumo <- consumo * tarifa;` | `tipoAjuste`: SUBSIDIO, CONTRIBUCION o NINGUNO. |
| | **Decisión 2 (estrato).** Un `Segun estrato` que deja el porcentaje con su signo en `porcentajeAjuste`. | `ajuste`: el valor en pesos del subsidio o de la contribución, con signo. |
| | **Cálculo.** `ajuste <- valorConsumo * porcentajeAjuste / 100;` | `interes`: lo que se cobra por los días de mora. |
| | **Decisión 3 (nombre del ajuste).** Un `Si` anidado de tres caminos que mira el **signo** de `porcentajeAjuste` y llena `tipoAjuste`. | `reconexion`: el cargo fijo, cuando aplica. |
| | **Decisión 4 (mora).** Otra escalera de rangos sobre `diasMora` que deja 0, el 3% o el 6% en `interes`. | `alumbrado`: el cobro del alumbrado público. |
| | **Decisión 5 (reconexión).** `Si diasMora > 60` son $28.000, si no, $0. | `total`: el total a pagar. |
| | **Decisión 6 (alumbrado).** `Si estrato = 5 O estrato = 6` son $12.000, si no, $6.000. | Aviso de datos inválidos, cuando la decisión 0 dice que los datos no sirven. |
| | **Cálculo final.** `total <- valorConsumo + ajuste + interes + reconexion + alumbrado;` | |

Mira la columna del medio de arriba abajo y fíjate en una cosa: **cada decisión solo necesita lo que ya está calculado más arriba**. La tarifa no sabe nada del estrato. El `Segun` del estrato necesita `valorConsumo`, que se calculó en la línea anterior. El interés necesita `valorConsumo` también, no el ajuste. Y el total no decide nada: llega de último y suma lo que las seis decisiones ya dejaron listo.

Eso es lo que hace que este programa se pueda armar por pedazos. No es un bloque de sesenta renglones que hay que entender de un solo golpe: son siete pedacitos que ya sabes hacer, puestos en el orden correcto. Escribe uno, ejecútalo con `F5`, comprueba que sirve, y solo entonces escribe el siguiente. Si te sientas a escribirlo completo y ejecutas al final, cuando algo falle vas a tener siete sospechosos en vez de uno.

### 2. Diccionario de datos

Doce variables. Parecen muchas, pero cada una tiene un oficio y un tipo que se puede justificar en una frase.

| Variable | Tipo | Por qué ese tipo |
|---|---|---|
| `estrato` | Entero | Los estratos son 1, 2, 3, 4, 5 y 6. No existe el estrato 2.5. Además el `Segun` de PSeInt trabaja con valores exactos de variables Entero o Caracter, y este dato va justamente adentro de un `Segun`. Hay un beneficio extra: si el usuario escribe 2.5, PSeInt lo rechaza de una con `ERROR 313: No coinciden los tipos (ESTRATO), el valor ingresado debe ser un entero.` El tipo está haciendo de filtro. |
| `diasMora` | Entero | Los días se cuentan de uno en uno. Nadie debe 3.5 días. Aquí el tipo Entero también protege: una mora escrita como 12.7 se rechaza antes de que llegue a los cálculos, con ese mismo `ERROR 313`. |
| `consumo` | Real | El contador de energía marca decimales: 210.5 kWh es una lectura perfectamente normal. Si la declararas Entero, el programa se caería en el momento en que alguien escribiera esa cifra, con `ERROR 313: No coinciden los tipos (CONSUMO), el valor ingresado debe ser un entero.` Real acepta también los números redondos como 200, así que no pierdes nada. |
| `tarifa` | Real | Hoy vale 520, 640 o 780, que son enteros, y da la tentación de declararla Entero. No lo hagas: es un precio, y los precios cambian. El día que la resolución de tarifas la deje en 645.30, la línea `tarifa <- 645.30;` te va a responder `ERROR 314: No coinciden los tipos, el valor a asignar debe ser un entero.` Declararla Real desde ahora te ahorra ese día. |
| `valorConsumo` | Real | Nace de `consumo * tarifa`, y `consumo` ya es Real. Multiplicar un Real por cualquier cosa da un Real. Además es el número del que cuelgan el ajuste y el interés, así que conviene que conserve todos sus decimales. |
| `porcentajeAjuste` | Real | Guarda -60, -50, -15, 0 o 20. Fíjate en que puede ser **negativo**: eso es intencional y es el truco central del ejercicio. Real y no Entero por lo mismo que la tarifa: el día que aparezca un -12.5% no quieres tener que ir a cambiar la declaración. |
| `ajuste` | Real | Es `valorConsumo * porcentajeAjuste / 100`. Ahí hay una división, y una división casi nunca da entero: el 15% de 78.000 da 11.700 redondo, pero el 3% de 62.333 da 1.869,99. Real por obligación. |
| `interes` | Real | Mismo caso: es un porcentaje del valor del consumo, o sea otra división entre 100. |
| `reconexion` | Real | Vale 28000 o 0, dos enteros. Se declara Real de todas formas porque es un valor en pesos que entra en la suma del total junto con otros Reales, y porque mañana ese cargo puede quedar en 28.500. Mantener un mismo tipo para todos los conceptos de la factura evita sorpresas. |
| `alumbrado` | Real | Igual que la reconexión: 12000 o 6000 hoy, pero es plata y es una tarifa que vuelven a fijar cada año. |
| `total` | Real | Es la suma de cinco Reales. No hay forma de que sea otra cosa. |
| `tipoAjuste` | Caracter | Guarda la palabra `"SUBSIDIO"`, `"CONTRIBUCION"` o `"NINGUNO"`. En PSeInt el tipo Caracter guarda **un texto completo**, no una sola letra, igual que en el Ejercicio 8 con los nombres de los días. Dos avisos: si la declararas Entero, las tres asignaciones te responderían `ERROR 125: No coinciden los tipos.`; y si escribieras el valor sin comillas, `tipoAjuste <- SUBSIDIO;`, PSeInt saldría a buscar una variable llamada SUBSIDIO y te diría `ERROR 210: Variable no definida (SUBSIDIO).` Las comillas son las que convierten esa palabra en un texto. |

Dos variables Enteras, nueve Reales y una de texto. La regla que hay detrás es la de siempre: **Entero para lo que se cuenta, Real para lo que se mide o se cobra, Caracter para lo que se lee.**

### 3. La lógica explicada

Aquí está el corazón del ejercicio. No hay una fórmula difícil: hay siete decisiones, y en cinco de ellas se puede meter la pata sin que PSeInt diga ni una palabra. Vamos una por una, con números de verdad.

El caso que vamos a usar de referencia casi siempre es este, porque cae en dos fronteras al mismo tiempo:

**estrato = 3, consumo = 150 kWh, diasMora = 60 días.** Resultado correcto: total **$76.980**.

#### Decisión 0: la validación, y por qué va con `O`

La regla dice que los datos no sirven si el estrato se sale de 1 a 6, **o** si el consumo es negativo, **o** si los días de mora son negativos. Esa palabra "o" del enunciado se traduce tal cual:

```
Si estrato < 1 O estrato > 6 O consumo < 0 O diasMora < 0 Entonces
```

Son cuatro preguntas pegadas con `O`. `O` significa "con que una sola sea verdadera, todo es verdadero". Y eso es exactamente lo que se necesita: **basta un dato malo para que la factura no se pueda liquidar.**

Mira qué pasaría si las unieras con `Y`, que es el error de traducción más común, usando el dato inválido del caso 4 (estrato 8, consumo 200, mora 0):

| Pregunta | Con estrato 8, consumo 200, mora 0 |
|---|---|
| `estrato < 1` | 8 < 1 es **Falso** |
| `estrato > 6` | 8 > 6 es **Verdadero** |
| `consumo < 0` | 200 < 0 es **Falso** |
| `diasMora < 0` | 0 < 0 es **Falso** |
| Unidas con `O` | Falso O **Verdadero** O Falso O Falso da **Verdadero**, así que avisa que los datos no sirven. Correcto. |
| Unidas con `Y` | Falso Y Verdadero Y Falso Y Falso da **Falso**, así que se va por el `SiNo` y liquida la factura. Desastre. |

Con `Y` tendrían que fallar los cuatro datos a la vez para que el programa avisara, y eso no pasa nunca. Un estrato 8 pasaría derecho.

¿Y qué tan grave es que pase derecho? Muy grave, y de la peor manera: **en silencio**. Quité la validación, corrí el programa con estrato 8, consumo 200 y mora 0, y no se cayó ni se quejó. Le puso tarifa de 640, calculó 128.000 de consumo, no encontró el estrato 8 en el `Segun` y se fue por `De Otro Modo`, que deja el porcentaje en 0, le sumó el alumbrado de los estratos 1 a 4 y mostró tan tranquilo:

```
TOTAL A PAGAR      : 134000 pesos
```

Ese número está inventado. No corresponde a ningún estrato que exista, porque el estrato 8 no existe. Y el programa lo imprimió con la misma cara con la que imprime un total correcto. **Por eso la validación va primero y toda la liquidación vive dentro de su `SiNo`:** no es para quedar bien, es para que sea imposible producir un número falso.

#### Decisión 1: la escalera de la tarifa, y la palabra "hasta"

La tabla del enunciado dice:

| Consumo del mes | Tarifa por kWh |
|---|---|
| Hasta 150 kWh | $520 |
| Más de 150 y hasta 350 kWh | $640 |
| Más de 350 kWh | $780 |

Léela con lupa. Dice **"hasta 150"**, no "menos de 150". Eso quiere decir que los 150 exactos **entran** en el primer rango, y eso se escribe `consumo <= 150`, con el igual pegado. La segunda fila dice "más de 150 y hasta 350": el 150 ya salió, y el 350 entra, así que es `consumo <= 350`.

Y aquí viene el punto que ya conoces del Ejercicio 5: el segundo escalón no necesita preguntar por el 150 otra vez.

```
Si consumo <= 150 Entonces
	tarifa <- 520;
SiNo
	Si consumo <= 350 Entonces
		tarifa <- 640;
	SiNo
		tarifa <- 780;
	FinSi
FinSi
```

Para que la máquina llegue a la línea `Si consumo <= 350`, la pregunta de arriba tuvo que dar Falso. O sea que en ese punto ya se sabe, sin preguntarlo, que el consumo es mayor que 150. La escalera arrastra esa información sola. Escribir `Si consumo > 150 Y consumo <= 350` no está mal, pero sobra la mitad.

Ahora el error silencioso. Si escribes `<` en vez de `<=`, con la mayoría de las facturas no pasa nada:

| consumo | Con `<= 150` y `<= 350` (correcto) | Con `< 150` y `< 350` (mal escrito) | ¿Se nota? |
|---|---|---|---|
| 100 | 520 | 520 | No |
| 149 | 520 | 520 | No |
| **150** | **520** | **640** | **Sí** |
| 200 | 640 | 640 | No |
| **350** | **640** | **780** | **Sí** |
| 420 | 780 | 780 | No |

De seis consumos, el programa mal escrito acierta en cuatro. Parece que sirve. Pero mira lo que le hace a la factura del caso de referencia, con consumo de 150 exactos:

| Concepto | Correcto (`<= 150`) | Mal escrito (`< 150`) |
|---|---|---|
| Tarifa | 520 | 640 |
| Valor del consumo | 150 × 520 = 78000 | 150 × 640 = 96000 |
| Ajuste (subsidio del 15%) | -11700 | -14400 |
| Interés (6% del valor del consumo) | 4680 | 5760 |
| Alumbrado | 6000 | 6000 |
| **TOTAL** | **76980** | **93360** |

**$16.380 de más**, en una factura de estrato 3. Un solo carácter de diferencia: el signo igual que faltó. Y PSeInt no reporta absolutamente nada, porque `<` es un operador perfectamente válido. El programa hizo bien lo que le pediste; lo que pasa es que le pediste otra cosa.

#### Decisión 2: el `Segun` del estrato y el porcentaje con signo

El estrato no es un rango: es una lista de seis valores exactos. Cuando se compara una variable contra valores exactos, la estructura que corresponde es `Segun`, no una escalera de `Si`. Y como los estratos 5 y 6 comparten el mismo porcentaje, se agrupan con una coma en un solo caso, igual que los días hábiles del Ejercicio 8.

Ahora, lo importante. Fíjate en que los porcentajes se guardan **con su propio signo**: -60, -50, -15, 0 y 20. Eso no es un capricho de presentación: es lo que permite que después haya **una sola** línea de cálculo del ajuste,

```
ajuste <- valorConsumo * porcentajeAjuste / 100;
```

y **una sola** línea de total, con un `+` en la mitad, que sirve para los seis estratos:

```
total <- valorConsumo + ajuste + interes + reconexion + alumbrado;
```

Mira cómo el signo hace el trabajo solo, sobre un valor de consumo de $78.000:

| Estrato | `porcentajeAjuste` | `ajuste` = 78000 × porcentaje ÷ 100 | Al sumarlo al total |
|---|---|---|---|
| 1 | -60 | -46800 | resta 46800. Es un subsidio. |
| 2 | -50 | -39000 | resta 39000. |
| 3 | -15 | -11700 | resta 11700. |
| 4 | 0 | 0 | no hace nada. |
| 5 | 20 | 15600 | suma 15600. Es una contribución. |
| 6 | 20 | 15600 | suma 15600. |

Sumar un número negativo es restar. Por eso la fórmula del total nunca tiene que preguntar si el usuario recibe subsidio o paga contribución: **el signo ya viene dentro del número.**

La alternativa, que es lo que a mucha gente se le ocurre primero, es guardar los porcentajes en positivo (60, 50, 15, 0, 20) y después escribir otro `Si` que reste en unos casos y sume en otros. Eso funciona, pero te obliga a mantener dos fórmulas del total en vez de una y a acordarte de cuál estrato va en cuál. Con seis estratos ya es incómodo; con los veinte conceptos que tiene una factura de verdad, es insostenible.

**Y el estrato 4 hay que escribirlo aunque su porcentaje sea cero.** Da pereza escribir un caso que no hace nada, pero no escribirlo tiene consecuencias. Borré el caso `4:` junto con el `De Otro Modo` y ejecuté con estrato 4, consumo 200 y mora 0. Esto fue lo que salió:

```
Lin 47 (inst 1): ERROR 215: Variable no inicializada (PORCENTAJEAJUSTE).
```

El programa alcanzó a mostrar los tres datos de entrada y ahí se detuvo. La razón: sin ese caso, el `Segun` no encontró dónde meter el estrato 4, salió sin asignarle nada a `porcentajeAjuste`, y la línea siguiente le pidió a la máquina que multiplicara por una variable vacía. Cuando un caso vale cero, **el cero se escribe**.

#### Decisión 3: `tipoAjuste` sale del signo, no del estrato

La palabra SUBSIDIO, CONTRIBUCION o NINGUNO se podría sacar del estrato, con un `Segun` de seis casos más. Sería repetir información que ya se tiene. Sale más limpio de mirar el signo del porcentaje que se acaba de guardar:

```
Si porcentajeAjuste < 0 Entonces
	tipoAjuste <- "SUBSIDIO";
SiNo
	Si porcentajeAjuste > 0 Entonces
		tipoAjuste <- "CONTRIBUCION";
	SiNo
		tipoAjuste <- "NINGUNO";
	FinSi
FinSi
```

Es el mismo `Si` anidado de tres caminos de Ana y Carlos, en el Ejercicio 3, y por la misma razón: negativo, positivo y cero son **tres** posibilidades, no dos. Si lo resolvieras con un solo `Si/SiNo` (negativo es SUBSIDIO y todo lo demás es CONTRIBUCION), el estrato 4 saldría en la factura como CONTRIBUCION de $0, que es una frase que no significa nada y que un usuario reclamaría con toda la razón. El caso del medio, el del cero, es el que casi todo el mundo olvida.

Además, escrito así, el día que la empresa le cambie el porcentaje al estrato 3 de -15% a +5% no hay que tocar esta parte: `tipoAjuste` se acomoda solo, porque no depende del estrato sino del signo.

#### Decisión 4: la escalera de la mora va de menor a mayor

| Días de mora | Interés |
|---|---|
| 0 | $0 |
| De 1 a 30 | 3% del valor del consumo |
| Más de 30 | 6% del valor del consumo |

La escalera empieza preguntando `Si diasMora = 0`, sigue con `Si diasMora <= 30` y termina en el `SiNo` con el 6%. Como en la tarifa, el segundo escalón no tiene que preguntar si los días son 1 o más: para llegar hasta ahí, `diasMora = 0` ya dio Falso.

¿Y si inviertes el orden y preguntas primero por `diasMora <= 30`? PSeInt no dice nada, porque el programa está perfectamente escrito. Pero el cero también es menor o igual que 30, así que **todos los usuarios que están al día caen en el primer escalón y les cobras el 3%**. Lo probé con el caso 1 (estrato 2, consumo 200, mora 0):

| Concepto | Escalera correcta | Escalera invertida |
|---|---|---|
| Valor del consumo | 128000 | 128000 |
| Interés | 0 | 3840 |
| **TOTAL** | **70000** | **73840** |

$3.840 cobrados de más a alguien que no debe un peso. Y no le pasa a un caso raro de frontera: le pasa a **todos** los usuarios que pagan a tiempo, que son la mayoría. La regla general de las escaleras es esta: **el escalón más estrecho va arriba.** `diasMora = 0` deja pasar un solo valor; `diasMora <= 30` deja pasar treinta y uno. Si pones el ancho primero, al estrecho no se llega nunca.

#### Decisión 5: la reconexión y la palabra "supera"

La regla 4 dice que si la mora **pasa** de 60 días se cobran $28.000. "Pasa de 60" es 61 en adelante, así que se escribe `diasMora > 60`, sin el igual. Con 60 días exactos **no** se cobra reconexión.

| diasMora | Con `> 60` (correcto) | Con `>= 60` (mal escrito) |
|---|---|---|
| 30 | 0 | 0 |
| 59 | 0 | 0 |
| **60** | **0** | **28000** |
| 61 | 28000 | 28000 |
| 75 | 28000 | 28000 |

Otra vez, un solo valor de diferencia. Y otra vez, en el caso de referencia el daño es de miles de pesos: con estrato 3, consumo 150 y **60 días exactos**, el total correcto es $76.980 y el del programa mal escrito es **$104.980**. Le cobraste una reconexión a alguien al que ni siquiera le habían cortado el servicio.

Fíjate en el patrón, porque es la lección que se repite en tres decisiones distintas: **las tablas del mundo real están escritas en castellano, y las palabras "hasta", "desde", "más de" y "pasa de" son las que deciden si va `<` o `<=`.** Antes de escribir la condición, subraya esa palabra en el enunciado.

#### Decisión 6: el alumbrado, dos estratos con `O`

```
Si estrato = 5 O estrato = 6 Entonces
	alumbrado <- 12000;
SiNo
	alumbrado <- 6000;
FinSi
```

Un detalle de sintaxis que cuesta la primera vez: hay que repetir el nombre de la variable a cada lado del `O`. `Si estrato = 5 O 6` no es una condición válida, porque el `O` une **dos preguntas completas**, no dos valores. La segunda pregunta también tiene que decir de quién está hablando.

Y aquí `O` es lo correcto y `Y` sería absurdo: un estrato no puede ser 5 y 6 al mismo tiempo, así que con `Y` la condición daría Falso siempre y todo el mundo pagaría $6.000. Compáralo con la validación de la decisión 0, donde `O` también era lo correcto pero por una razón distinta: allá porque basta un dato malo, aquí porque basta pertenecer a uno de los dos estratos.

#### El error típico de este ejercicio: sobre qué se calculan los porcentajes

Este es el que más veces he visto y el más difícil de detectar, porque el programa entrega una factura completa, bien presentada y creíble.

Las reglas 2 y 3 dicen, las dos, "se calcula **sobre el valor del consumo**". No sobre el total, no sobre lo que va quedando. Pero uno viene escribiendo el programa en cadena (calculo el consumo, le aplico el subsidio, ahora sigue el interés) y le sale natural seguir con el número que acaba de obtener. Así:

```
interes <- (valorConsumo + ajuste) * 6 / 100;
```

Se ve razonable. Hasta suena justo. Pero no es lo que dice la regla. Con el caso de referencia:

| Concepto | Correcto: 6% de `valorConsumo` | Mal: 6% de `valorConsumo + ajuste` |
|---|---|---|
| Valor del consumo | 78000 | 78000 |
| Ajuste (subsidio del 15%) | -11700 | -11700 |
| Base sobre la que se saca el interés | 78000 | 78000 - 11700 = 66300 |
| Interés | 78000 × 6 ÷ 100 = 4680 | 66300 × 6 ÷ 100 = 3978 |
| Alumbrado | 6000 | 6000 |
| **TOTAL** | **76980** | **76278** |

Setecientos dos pesos de diferencia en una sola factura. En una no se nota; en las cincuenta mil que emite la comercializadora en un mes, es plata de verdad y es un lío jurídico. Y no hay ningún error que buscar: las dos versiones corren, las dos imprimen los ocho renglones, las dos se ven bien.

La defensa contra esto es de las que no se olvidan: **cuando el enunciado dice "sobre X", en el código tiene que aparecer X y nada más que X.** Si la regla dice "sobre el valor del consumo", la línea empieza con `valorConsumo *`. Si hubiera querido decir otra cosa, lo habría dicho.

#### El total: por qué es la última línea y por qué es una sola

```
total <- valorConsumo + ajuste + interes + reconexion + alumbrado;
```

Cinco sumandos, un `+` entre cada par, ninguna resta y ningún `Si`. Va de última porque necesita que las seis decisiones ya hayan terminado: si la pusieras antes del `Si` del alumbrado, `alumbrado` todavía no tendría valor y PSeInt te detendría el programa con un `ERROR 215: Variable no inicializada`, igual que en el caso del estrato 4.

Y no lleva ninguna resta porque el subsidio ya viene negativo. Ese es el pago de haber guardado el porcentaje con signo tres decisiones atrás: una línea que se lee de corrido y que no hay que reescribir cada vez que se le agrega un concepto nuevo a la factura.

### 4. El código completo

Este es el archivo `PSC/Ejercicio_10_LiquidacionFacturaEnergia.psc` tal cual:

```
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
```

Noventa renglones. Se ven muchos, pero ya viste en el punto 3 que son siete decisiones que conoces una por una. Sin comentarios, sin tildes, sin eñes y sin emojis.

### 5. El código explicado bloque por bloque

**Advertencia importante: los comentarios que empiezan con `//` que vas a ver aquí abajo existen SOLO en esta explicación. NO los copies a tu archivo `.psc`.** PSeInt dibuja una caja extra en el diagrama de flujo (`Ctrl + D`) por cada comentario que encuentre, y en un programa de este tamaño, con siete decisiones, el diagrama ya es grande de por sí. Llenarlo de cajas que no son ni entradas, ni procesos, ni salidas lo vuelve ilegible. El archivo que entregas va limpio.

**Bloque 1: el encabezado y las declaraciones**

```
Algoritmo LiquidacionFacturaEnergia
	Definir estrato, diasMora Como Entero;                                 // Lo que se cuenta: estratos y dias.
	Definir consumo, tarifa, valorConsumo, porcentajeAjuste Como Real;     // Lo que se mide y los dos numeros de los que cuelga todo.
	Definir ajuste, interes, reconexion, alumbrado, total Como Real;       // Los cinco conceptos que se suman en la factura.
	Definir tipoAjuste Como Caracter;                                      // Texto: SUBSIDIO, CONTRIBUCION o NINGUNO.
```

Doce variables en cuatro líneas. Se pueden declarar varias en la misma línea cuando comparten el tipo, y aquí las líneas están agrupadas a propósito: la primera son los datos que se cuentan, la segunda y la tercera los que se miden y se cobran, y la cuarta el único texto.

Esa agrupación no es decoración. Cuando un programa tiene doce variables, poder mirar cuatro renglones y decir "las de arriba son enteras, las del medio son plata y la de abajo es una palabra" te ahorra volver a subir a buscar cada vez. Ojo con el detalle de siempre: la línea `Algoritmo` **no lleva punto y coma**, las cuatro líneas `Definir` **sí**.

**Bloque 2: el banner y los tres datos de entrada**

```
	Escribir "==================================================";
	Escribir "  LIQUIDACION DE LA FACTURA DE ENERGIA";
	Escribir "==================================================";
	Escribir "";
	Escribir Sin Saltar "Escriba el estrato de la vivienda (1 a 6): ";   // El mensaje dice el rango valido. Es la primera defensa.
	Leer estrato;
	Escribir Sin Saltar "Escriba el consumo del mes en kWh: ";           // Dice la unidad: kWh, no pesos.
	Leer consumo;
	Escribir Sin Saltar "Escriba los dias de mora de la factura anterior: ";
	Leer diasMora;
```

Los tres `Leer` van en este orden, y ese orden es el que hay que respetar cuando uno prueba el programa. Cada uno viene inmediatamente después de su pregunta, nunca las tres preguntas de un lado y los tres `Leer` del otro: si lo hicieras así, el usuario vería tres preguntas de golpe y no sabría cuál está respondiendo.

Fíjate en el primer mensaje: dice `(1 a 6)`. Eso no es un adorno, es la manera más barata de evitar un error. La validación del bloque 4 sigue siendo obligatoria, porque el usuario puede escribir 8 de todas formas, pero un mensaje que dice qué se espera evita la mayoría de las equivocaciones antes de que ocurran.

**Bloque 3: mostrar lo que se recibió**

```
	Escribir "";
	Escribir "------------------- RESULTADOS -------------------";
	Escribir "Estrato            : ", estrato;
	Escribir "Consumo del mes    : ", consumo, " kWh";
	Escribir "Dias de mora       : ", diasMora, " dias";
	Escribir "";
```

Los tres datos se devuelven en pantalla **antes** de decidir nada, y a propósito quedan por fuera del `Si` que viene. Así aparecen siempre: cuando la factura se liquida y cuando no.

Esto es lo que en una oficina se llama dejar rastro. Si doña Marlene liquida una factura y el total le parece raro, lo primero que necesita saber es qué fue lo que ella tecleó. Y en el caso del estrato 8, ver `Estrato : 8` justo encima del aviso de datos inválidos le dice de una cuál fue el dato que sobró.

**Bloque 4: la validación, la decisión que protege a todas las demás**

```
	Si estrato < 1 O estrato > 6 O consumo < 0 O diasMora < 0 Entonces    // Basta que UNA sea verdadera para no liquidar.
		Escribir "DATOS INVALIDOS: la factura no se puede liquidar.";
		Escribir "El estrato debe estar entre 1 y 6.";
		Escribir "El consumo y los dias de mora no pueden ser negativos.";
	SiNo
		// De aqui en adelante, y hasta el FinSi del final, va TODA la liquidacion.
```

Cuatro preguntas unidas con `O`. No llevan paréntesis porque las cuatro están unidas con el mismo operador y no hay ninguna ambigüedad posible: da igual en qué orden las agrupe la máquina, el resultado es el mismo.

El aviso son tres renglones y no uno. El primero dice qué pasó y los otros dos dicen qué se esperaba, para que el usuario pueda corregir sin ir a preguntarle a nadie. Un mensaje de error que solo dice "datos inválidos" deja a la persona igual de perdida que antes.

Y ahora lo importante de este bloque, que es lo que no se ve: ese `SiNo` abre un espacio que se cierra sesenta renglones más abajo. **Todo lo que viene después vive adentro.** Si por descuido dejas los cálculos afuera, el programa va a liquidar el estrato 8 sin decir ni pío y te va a mostrar un total de 134000 pesos que no significa nada.

**Bloque 5: la escalera de la tarifa y el valor del consumo**

```
		Si consumo <= 150 Entonces        // "Hasta 150" incluye el 150. Por eso <= y no <.
			tarifa <- 520;
		SiNo
			Si consumo <= 350 Entonces    // Aqui ya se sabe que el consumo pasa de 150: la pregunta de arriba fallo.
				tarifa <- 640;
			SiNo
				tarifa <- 780;            // Todo lo que paso de 350.
			FinSi
		FinSi
		valorConsumo <- consumo * tarifa;   // Este numero es la base de casi todo lo que sigue.
```

Los dos `FinSi` en cascada al final son el punto donde más gente se enreda. Cada `Si` que abres tiene que cerrarse, y se cierran en orden inverso al que se abrieron: primero el de adentro, después el de afuera. La sangría con TAB no es decoración: es lo que te deja ver de un vistazo cuál `FinSi` le pertenece a cuál `Si`.

Después de la escalera, la variable `tarifa` tiene uno de tres valores y ya no importa cómo llegó ahí. La línea del `valorConsumo` es una sola y sirve para los tres rangos. Ese es el mismo truco del Ejercicio 4, el del descuento: la decisión guarda un número, y el cálculo que viene después se escribe una sola vez.

**Bloque 6: el `Segun` del estrato y el ajuste**

```
		Segun estrato Hacer
			1:
				porcentajeAjuste <- -60;    // Negativo: es un subsidio, rebaja la factura.
			2:
				porcentajeAjuste <- -50;
			3:
				porcentajeAjuste <- -15;
			4:
				porcentajeAjuste <- 0;      // Escrito aunque no haga nada. Si se omite, el estrato 4 queda sin valor.
			5,6:
				porcentajeAjuste <- 20;     // Dos estratos con el mismo porcentaje: un solo caso, separados por coma.
			De Otro Modo:
				porcentajeAjuste <- 0;      // Red de seguridad. Con la validacion de arriba no deberia llegar nadie aqui.
		FinSegun
		ajuste <- valorConsumo * porcentajeAjuste / 100;   // Una sola linea para los seis estratos, gracias al signo.
```

Seis estratos en cinco casos, porque el 5 y el 6 comparten porcentaje y se agrupan con una coma, igual que los días hábiles del Ejercicio 8. Escribirlos por separado también funciona, pero el día que cambie el porcentaje de la contribución te tocaría acordarte de cambiarlo en dos sitios.

El `De Otro Modo` aquí parece innecesario: la validación del bloque 4 ya garantizó que el estrato está entre 1 y 6, así que ningún dato debería llegar hasta esa rama. Se escribe de todos modos, por dos razones. La primera es que si mañana alguien toca la validación y se equivoca, el `De Otro Modo` evita que el programa se caiga con la variable sin valor. La segunda es que deja constancia de que el caso se pensó: quien lea el programa dentro de un año no va a quedarse con la duda de si al autor se le olvidó.

**Bloque 7: cómo se llama ese ajuste**

```
		Si porcentajeAjuste < 0 Entonces
			tipoAjuste <- "SUBSIDIO";           // Comillas dobles: es texto, no una variable.
		SiNo
			Si porcentajeAjuste > 0 Entonces
				tipoAjuste <- "CONTRIBUCION";
			SiNo
				tipoAjuste <- "NINGUNO";        // El caso del cero. Es el que todos olvidan.
			FinSi
		FinSi
```

Tres caminos para tres posibilidades: negativo, positivo y cero. La estructura es exactamente la misma del Ejercicio 3, el de Ana y Carlos, donde el tercer camino era el empate. Aquí el empate se llama estrato 4.

Las comillas dobles son obligatorias. Sin ellas, `tipoAjuste <- SUBSIDIO;` hace que PSeInt salga a buscar una variable con ese nombre y conteste `ERROR 210: Variable no definida (SUBSIDIO).` Las comillas son las que le dicen al lenguaje "esto no es un nombre, es un texto".

**Bloque 8: el interés por mora**

```
		Si diasMora = 0 Entonces
			interes <- 0;                              // El escalon mas estrecho va primero: solo el cero entra aqui.
		SiNo
			Si diasMora <= 30 Entonces
				interes <- valorConsumo * 3 / 100;     // Sobre el valor del consumo, NO sobre lo que ya lleva la factura.
			SiNo
				interes <- valorConsumo * 6 / 100;     // Mas de 30 dias.
			FinSi
		FinSi
```

Otra escalera, con la misma forma que la de la tarifa. Y otra vez el escalón más estrecho arriba: si preguntaras primero `diasMora <= 30`, el cero también cumpliría esa condición y le cobrarías el 3% a todo el que paga a tiempo.

Fíjate bien en las dos líneas del interés: las dos empiezan con `valorConsumo *`. No con `total *`, no con `(valorConsumo + ajuste) *`. La regla del negocio dice "sobre el valor del consumo" y en el código aparece `valorConsumo`, exactamente eso. Este es el punto donde se pierde el ejercicio sin darse cuenta.

**Bloque 9: reconexión y alumbrado, dos decisiones de un renglón**

```
		Si diasMora > 60 Entonces      // "Pasa de 60" es 61 en adelante: > y no >=.
			reconexion <- 28000;
		SiNo
			reconexion <- 0;           // El cero se escribe. Si no, la variable queda sin valor.
		FinSi
		Si estrato = 5 O estrato = 6 Entonces   // Hay que repetir "estrato" en los dos lados del O.
			alumbrado <- 12000;
		SiNo
			alumbrado <- 6000;
		FinSi
```

Estos dos `Si` son los más sencillos del programa: una línea por rama y ninguna anidación. Pero mira el `SiNo` de la reconexión, que asigna 0. Da la tentación de borrarlo, total no cobra nada. No lo borres: si lo quitas, el usuario que no tiene reconexión deja a `reconexion` sin ningún valor, y la suma del total se detiene con `ERROR 215: Variable no inicializada`.

Esa es la diferencia entre "no cobrar" y "no tener valor". El programa necesita que la variable diga cero; no le sirve que no diga nada.

**Bloque 10: el total y las ocho salidas**

```
		total <- valorConsumo + ajuste + interes + reconexion + alumbrado;   // Solo sumas: el subsidio ya viene negativo.
		Escribir "Tarifa aplicada    : ", tarifa, " pesos por kWh";
		Escribir "Valor del consumo  : ", valorConsumo, " pesos";
		Escribir "Tipo de ajuste     : ", tipoAjuste;
		Escribir "Valor del ajuste   : ", ajuste, " pesos";
		Escribir "Interes por mora   : ", interes, " pesos";
		Escribir "Reconexion         : ", reconexion, " pesos";
		Escribir "Alumbrado publico  : ", alumbrado, " pesos";
		Escribir "TOTAL A PAGAR      : ", total, " pesos";
	FinSi                                        // Este FinSi cierra el Si de la validacion, sesenta renglones mas arriba.
FinAlgoritmo
```

Los ocho conceptos salen uno por línea, con su etiqueta y su unidad, y los dos puntos alineados con espacios. Eso no es coquetería: la oficina necesita mostrarle al usuario que reclama de dónde salió cada peso, y ocho números sueltos en una fila no le sirven a nadie. Un total solo, sin el desglose, es exactamente el problema que tenía la hoja de cálculo que nadie entendía.

Y el `FinSi` con una sola sangría, el penúltimo renglón, es el que cierra la validación del bloque 4. Cuando lo veas en tu pantalla, sube hasta encontrar el `Si` que le corresponde: si el bloque que quedó adentro es toda la liquidación, el programa está bien armado.

### 6. Prueba de escritorio

Hagamos de computador con el caso más interesante de todos: **estrato = 3, consumo = 150 y diasMora = 60**, que cae en dos fronteras a la vez. Como son doce variables, la prueba va en dos tablas, primero la mitad de arriba del programa y después la de abajo. El símbolo `?` significa que la variable ya existe pero todavía no tiene ningún valor útil, y la **negrita** marca el valor que acaba de cambiar en ese paso.

**Primera parte: leer los datos y elegir la tarifa.**

| Paso | Instrucción | estrato | consumo | diasMora | tarifa | valorConsumo | Qué aparece en pantalla |
|---|---|---|---|---|---|---|---|
| 1 | Las cuatro líneas `Definir` | ? | ? | ? | ? | ? | nada |
| 2 | Los tres `Escribir` del banner | ? | ? | ? | ? | ? | el banner con el título |
| 3 | `Leer estrato;` (el usuario escribe 3) | **3** | ? | ? | ? | ? | `Escriba el estrato de la vivienda (1 a 6): > 3` |
| 4 | `Leer consumo;` (el usuario escribe 150) | 3 | **150** | ? | ? | ? | `Escriba el consumo del mes en kWh: > 150` |
| 5 | `Leer diasMora;` (el usuario escribe 60) | 3 | 150 | **60** | ? | ? | `Escriba los dias de mora de la factura anterior: > 60` |
| 6 | El separador y los tres `Escribir` de los datos | 3 | 150 | 60 | ? | ? | `Estrato : 3`, `Consumo del mes : 150 kWh`, `Dias de mora : 60 dias` |
| 7 | `Si estrato < 1 O estrato > 6 O consumo < 0 O diasMora < 0 Entonces` | 3 | 150 | 60 | ? | ? | nada. Da Falso, así que se va por el `SiNo` |
| 8 | `Si consumo <= 150 Entonces` | 3 | 150 | 60 | ? | ? | nada. 150 <= 150 da **Verdadero** |
| 9 | `tarifa <- 520;` | 3 | 150 | 60 | **520** | ? | nada |
| 10 | `valorConsumo <- 150 * 520;` | 3 | 150 | 60 | 520 | **78000** | nada |

**Segunda parte: los cinco conceptos y el total.** De aquí en adelante `estrato`, `consumo`, `diasMora`, `tarifa` y `valorConsumo` ya no cambian: valen 3, 150, 60, 520 y 78000 hasta el final.

| Paso | Instrucción | porcentajeAjuste | ajuste | tipoAjuste | interes | reconexion | alumbrado | total | Qué aparece en pantalla |
|---|---|---|---|---|---|---|---|---|---|
| 11 | `Segun estrato Hacer` | ? | ? | ? | ? | ? | ? | ? | nada. Entra por el caso `3:` |
| 12 | `porcentajeAjuste <- -15;` | **-15** | ? | ? | ? | ? | ? | ? | nada |
| 13 | `ajuste <- 78000 * -15 / 100;` | -15 | **-11700** | ? | ? | ? | ? | ? | nada |
| 14 | `Si porcentajeAjuste < 0 Entonces` | -15 | -11700 | ? | ? | ? | ? | ? | nada. -15 < 0 da **Verdadero** |
| 15 | `tipoAjuste <- "SUBSIDIO";` | -15 | -11700 | **SUBSIDIO** | ? | ? | ? | ? | nada |
| 16 | `Si diasMora = 0 Entonces` | -15 | -11700 | SUBSIDIO | ? | ? | ? | ? | nada. 60 = 0 da Falso, sigue por el `SiNo` |
| 17 | `Si diasMora <= 30 Entonces` | -15 | -11700 | SUBSIDIO | ? | ? | ? | ? | nada. 60 <= 30 da Falso, sigue por el `SiNo` |
| 18 | `interes <- 78000 * 6 / 100;` | -15 | -11700 | SUBSIDIO | **4680** | ? | ? | ? | nada |
| 19 | `Si diasMora > 60 Entonces` | -15 | -11700 | SUBSIDIO | 4680 | ? | ? | ? | nada. 60 > 60 da **Falso**, se va por el `SiNo` |
| 20 | `reconexion <- 0;` | -15 | -11700 | SUBSIDIO | 4680 | **0** | ? | ? | nada |
| 21 | `Si estrato = 5 O estrato = 6 Entonces` | -15 | -11700 | SUBSIDIO | 4680 | 0 | ? | ? | nada. Falso O Falso da Falso |
| 22 | `alumbrado <- 6000;` | -15 | -11700 | SUBSIDIO | 4680 | 0 | **6000** | ? | nada |
| 23 | `total <- 78000 + (-11700) + 4680 + 0 + 6000;` | -15 | -11700 | SUBSIDIO | 4680 | 0 | 6000 | **76980** | nada |
| 24 | Los ocho `Escribir` de la liquidación | -15 | -11700 | SUBSIDIO | 4680 | 0 | 6000 | 76980 | los ocho renglones de la factura |

Los pasos que hay que mirar con lupa son el 8 y el 19, porque son los dos que deciden si este programa está bien o solo lo parece.

En el **paso 8** la máquina pregunta `150 <= 150`. Un número siempre es menor o igual que sí mismo, así que la respuesta es Verdadero y la tarifa queda en 520. Si en tu programa esa línea dijera `consumo < 150`, la respuesta sería Falso, bajaría al segundo escalón y la tarifa quedaría en 640. A partir de ahí **todos** los números de la segunda tabla cambiarían, porque todos cuelgan de `valorConsumo`, y el total terminaría en 93360 en vez de 76980.

En el **paso 19** pregunta `60 > 60`. Sesenta no es mayor que sesenta: es igual. La respuesta es Falso y no se cobra reconexión, que es justo lo que dice la regla, porque el cargo aplica cuando la mora **pasa** de 60 días. Si esa línea dijera `>=`, se cobrarían $28.000 de más y el total sería 104980.

Y ahora el paso 23, que es donde se ve el pago de haber guardado el porcentaje con signo: `78000 + (-11700)` da 66300, más 4680 da 70980, más 0 sigue en 70980, y más 6000 da **76980**. Cinco sumas, ninguna resta, y el subsidio rebajó igual.

**Qué habría pasado con otros datos.** Los mismos noventa renglones, recorridos por otros cinco juegos de datos:

| Datos (estrato / consumo / mora) | Validación | Escalón de la tarifa | Caso del `Segun` | Escalón de la mora | Reconexión | Alumbrado | Total |
|---|---|---|---|---|---|---|---|
| 2 / 200 / 0 | pasa | segundo: 640 | caso `2:` da -50 | primero: interés 0 | no, 0 > 60 es Falso | 6000 | 70000 |
| 6 / 420 / 75 | pasa | tercero: 780 | caso `5,6:` da 20 | tercero: 6% | sí, 75 > 60 | 12000 | 452776 |
| 1 / 120 / 10 | pasa | primero: 520 | caso `1:` da -60 | segundo: 3% | no | 6000 | 32832 |
| 4 / 350 / 30 | pasa | segundo: 640, y 350 es frontera | caso `4:` da 0 | segundo: 3%, y 30 es frontera | no | 6000 | 236720 |
| 8 / 200 / 0 | **no pasa** | no se llega | no se llega | no se llega | no se llega | no se llega | ninguno: avisa y termina |

Fíjate en la última fila: en el camino del estrato 8 no se ejecuta ni una sola de las seis decisiones de la liquidación. El programa muestra los tres datos, entra por la rama verdadera del `Si` de la validación, imprime los tres renglones del aviso y salta hasta `FinAlgoritmo`. Eso es lo que significa que la liquidación viva dentro del `SiNo`.

### 7. Ejecución real verificada

Estas seis corridas son la salida textual que produjo PSeInt al ejecutar el archivo con el perfil Estricto. No están reescritas a mano: son copia directa del intérprete. En las seis, el chequeo de sintaxis bajo el perfil Estricto no reportó ningún error.

**Corrida 1.** Datos escritos por teclado: estrato 2, consumo 200, días de mora 0. Un usuario de estrato medio que está al día.

```
==================================================
  LIQUIDACION DE LA FACTURA DE ENERGIA
==================================================

Escriba el estrato de la vivienda (1 a 6): > 2
Escriba el consumo del mes en kWh: > 200
Escriba los dias de mora de la factura anterior: > 0

------------------- RESULTADOS -------------------
Estrato            : 2
Consumo del mes    : 200 kWh
Dias de mora       : 0 dias

Tarifa aplicada    : 640 pesos por kWh
Valor del consumo  : 128000 pesos
Tipo de ajuste     : SUBSIDIO
Valor del ajuste   : -64000 pesos
Interes por mora   : 0 pesos
Reconexion         : 0 pesos
Alumbrado publico  : 6000 pesos
TOTAL A PAGAR      : 70000 pesos
```

Verificación a mano: 200 kWh no es menor o igual que 150, pero sí es menor o igual que 350, así que cae en el segundo escalón y la tarifa es 640. El valor del consumo es 200 × 640 = 128.000. El estrato 2 tiene -50%, o sea 128000 × (-50) ÷ 100 = -64.000, y como el porcentaje es negativo el tipo de ajuste sale SUBSIDIO. Con 0 días de mora entra por el primer escalón y el interés es 0. Como 0 no es mayor que 60, la reconexión es 0. El estrato 2 no es 5 ni 6, así que el alumbrado es 6.000. Total: 128000 - 64000 + 0 + 0 + 6000 = **70.000**.

**Corrida 2.** Datos escritos por teclado: estrato 6, consumo 420, días de mora 75. El caso más caro: consumo alto, contribución, mora larga y reconexión.

```
==================================================
  LIQUIDACION DE LA FACTURA DE ENERGIA
==================================================

Escriba el estrato de la vivienda (1 a 6): > 6
Escriba el consumo del mes en kWh: > 420
Escriba los dias de mora de la factura anterior: > 75

------------------- RESULTADOS -------------------
Estrato            : 6
Consumo del mes    : 420 kWh
Dias de mora       : 75 dias

Tarifa aplicada    : 780 pesos por kWh
Valor del consumo  : 327600 pesos
Tipo de ajuste     : CONTRIBUCION
Valor del ajuste   : 65520 pesos
Interes por mora   : 19656 pesos
Reconexion         : 28000 pesos
Alumbrado publico  : 12000 pesos
TOTAL A PAGAR      : 452776 pesos
```

Verificación a mano: 420 pasa de 350, así que la tarifa es 780 y el valor del consumo es 420 × 780 = 327.600. El estrato 6 tiene +20%, o sea 327600 × 20 ÷ 100 = 65.520, y como el porcentaje es positivo el tipo sale CONTRIBUCION: aquí el ajuste **suma**, no resta. Con 75 días de mora falla `diasMora = 0` y falla `diasMora <= 30`, así que el interés es el 6%: 327600 × 6 ÷ 100 = 19.656. Como 75 sí es mayor que 60, se cobran los 28.000 de reconexión. El estrato 6 paga alumbrado de 12.000. Total: 327600 + 65520 = 393120, más 19656 son 412776, más 28000 son 440776, y más 12000 dan **452.776**.

**Corrida 3.** Datos escritos por teclado: estrato 1, consumo 120, días de mora 10. Consumo bajo, subsidio grande y mora corta.

```
==================================================
  LIQUIDACION DE LA FACTURA DE ENERGIA
==================================================

Escriba el estrato de la vivienda (1 a 6): > 1
Escriba el consumo del mes en kWh: > 120
Escriba los dias de mora de la factura anterior: > 10

------------------- RESULTADOS -------------------
Estrato            : 1
Consumo del mes    : 120 kWh
Dias de mora       : 10 dias

Tarifa aplicada    : 520 pesos por kWh
Valor del consumo  : 62400 pesos
Tipo de ajuste     : SUBSIDIO
Valor del ajuste   : -37440 pesos
Interes por mora   : 1872 pesos
Reconexion         : 0 pesos
Alumbrado publico  : 6000 pesos
TOTAL A PAGAR      : 32832 pesos
```

Verificación a mano: 120 es menor o igual que 150, primer escalón, tarifa 520. El valor del consumo es 120 × 520 = 62.400. El estrato 1 tiene -60%: 62400 × (-60) ÷ 100 = -37.440. Con 10 días de mora falla `diasMora = 0` pero se cumple `diasMora <= 30`, así que el interés es el 3%: 62400 × 3 ÷ 100 = 1.872. Como 10 no pasa de 60, no hay reconexión. Alumbrado de 6.000. Total: 62400 - 37440 = 24960, más 1872 son 26832, y más 6000 dan **32.832**. Fíjate en que el subsidio del estrato 1 se llevó más de la mitad de la factura.

**Corrida 4.** Datos escritos por teclado: estrato 8, consumo 200, días de mora 0. **Este es el caso inválido y es la corrida obligatoria**: es la que demuestra que la validación funciona.

```
==================================================
  LIQUIDACION DE LA FACTURA DE ENERGIA
==================================================

Escriba el estrato de la vivienda (1 a 6): > 8
Escriba el consumo del mes en kWh: > 200
Escriba los dias de mora de la factura anterior: > 0

------------------- RESULTADOS -------------------
Estrato            : 8
Consumo del mes    : 200 kWh
Dias de mora       : 0 dias

DATOS INVALIDOS: la factura no se puede liquidar.
El estrato debe estar entre 1 y 6.
El consumo y los dias de mora no pueden ser negativos.
```

Verificación a mano: la condición de la validación pregunta cuatro cosas. `8 < 1` da Falso, `8 > 6` da **Verdadero**, `200 < 0` da Falso y `0 < 0` da Falso. Como están unidas con `O`, con una sola verdadera alcanza: la condición completa da Verdadero y el programa entra por la rama del aviso.

Lo importante de esta corrida es lo que **no** aparece. Después del aviso no hay tarifa, ni valor del consumo, ni total. El programa no calculó nada, y por eso no hay ningún número inventado en pantalla. Compáralo con lo que mostré en el punto 3, donde el mismo programa sin la validación se inventó un total de 134.000 pesos con la misma tranquilidad.

**Corrida 5.** Datos escritos por teclado: estrato 3, consumo 150, días de mora 60. **La corrida de las dos fronteras**, y la misma de la prueba de escritorio del punto 6.

```
==================================================
  LIQUIDACION DE LA FACTURA DE ENERGIA
==================================================

Escriba el estrato de la vivienda (1 a 6): > 3
Escriba el consumo del mes en kWh: > 150
Escriba los dias de mora de la factura anterior: > 60

------------------- RESULTADOS -------------------
Estrato            : 3
Consumo del mes    : 150 kWh
Dias de mora       : 60 dias

Tarifa aplicada    : 520 pesos por kWh
Valor del consumo  : 78000 pesos
Tipo de ajuste     : SUBSIDIO
Valor del ajuste   : -11700 pesos
Interes por mora   : 4680 pesos
Reconexion         : 0 pesos
Alumbrado publico  : 6000 pesos
TOTAL A PAGAR      : 76980 pesos
```

Verificación a mano: 150 es menor **o igual** que 150, así que entra en el primer escalón y la tarifa es 520, no 640. El valor del consumo es 150 × 520 = 78.000. El estrato 3 tiene -15%: 78000 × (-15) ÷ 100 = -11.700. Con 60 días de mora falla `diasMora = 0` y falla `diasMora <= 30`, así que el interés es el 6% del valor del consumo: 78000 × 6 ÷ 100 = 4.680. Y 60 **no** es mayor que 60, así que no hay reconexión. Alumbrado de 6.000. Total: 78000 - 11700 + 4680 + 0 + 6000 = **76.980**, exactamente el mismo número del paso 23 de la prueba de escritorio.

Los ocho números de esta corrida coinciden uno por uno con la tabla que llenamos a mano en el punto 6. Eso es lo que confirma que el razonamiento en papel y lo que hace la máquina son la misma cosa.

**Corrida 6.** Datos escritos por teclado: estrato 4, consumo 350, días de mora 30. Otras dos fronteras, y el estrato que no recibe ni paga nada.

```
==================================================
  LIQUIDACION DE LA FACTURA DE ENERGIA
==================================================

Escriba el estrato de la vivienda (1 a 6): > 4
Escriba el consumo del mes en kWh: > 350
Escriba los dias de mora de la factura anterior: > 30

------------------- RESULTADOS -------------------
Estrato            : 4
Consumo del mes    : 350 kWh
Dias de mora       : 30 dias

Tarifa aplicada    : 640 pesos por kWh
Valor del consumo  : 224000 pesos
Tipo de ajuste     : NINGUNO
Valor del ajuste   : 0 pesos
Interes por mora   : 6720 pesos
Reconexion         : 0 pesos
Alumbrado publico  : 6000 pesos
TOTAL A PAGAR      : 236720 pesos
```

Verificación a mano: 350 no es menor o igual que 150, pero sí es menor **o igual** que 350, así que la tarifa es 640 y no 780. El valor del consumo es 350 × 640 = 224.000. El estrato 4 tiene 0%: el ajuste es 224000 × 0 ÷ 100 = 0, y como el porcentaje no es negativo ni positivo, el tipo de ajuste sale NINGUNO por el tercer camino del `Si` anidado. Con 30 días de mora falla `diasMora = 0` pero se cumple `diasMora <= 30`, así que el interés es el 3%: 224000 × 3 ÷ 100 = 6.720. Sin reconexión y con alumbrado de 6.000. Total: 224000 + 0 + 6720 + 0 + 6000 = **236.720**.

Esta corrida vale por tres: comprueba la frontera de los 350 kWh, la de los 30 días de mora y el caso del estrato 4, que es el que se cae con `ERROR 215` cuando a alguien se le olvida escribir el caso que vale cero.

### 8. Errores comunes en este ejercicio

Las tres primeras filas son errores silenciosos: el programa corre, imprime la factura completa y no avisa absolutamente nada. Son los peligrosos, y por eso van de primeras.

| Lo que escribe el estudiante | Qué pasa | Cómo se arregla |
|---|---|---|
| `Si estrato < 1 Y estrato > 6 Y consumo < 0 Y diasMora < 0 Entonces`, o dejar la liquidación por fuera del `SiNo` de la validación | Con `Y` tendrían que estar malos los cuatro datos a la vez para que avise, y eso no pasa nunca. Con estrato 8 el programa liquida igual: le pone tarifa 640, no encuentra el estrato en el `Segun`, se va por `De Otro Modo` y muestra `TOTAL A PAGAR : 134000 pesos`. Ese total no corresponde a ningún estrato que exista. | Unir las cuatro condiciones con `O`, porque **basta un dato malo** para no liquidar. Y meter las siete decisiones dentro del `SiNo`, de modo que sea imposible llegar a un total con datos que no sirven. |
| Armar mal una escalera: `Si consumo < 150` en vez de `<= 150`, `Si diasMora >= 60` en vez de `> 60`, o preguntar `Si diasMora <= 30` antes que `Si diasMora = 0` | Los tres son silenciosos. Los dos primeros aciertan con casi todos los datos y fallan solo en el valor exacto de la frontera: con estrato 3, consumo 150 y 60 días, el total correcto es 76.980, pero da 93.360 con el primero y 104.980 con el segundo. El tercero es peor, porque el cero también es menor o igual que 30 y entonces **todos** los que están al día pagan el 3%: en el caso 1 el total pasa de 70.000 a 73.840. | Para las fronteras, volver al enunciado y subrayar la palabra: **"hasta 150"** incluye el 150, así que es `<=`, y **"pasa de 60"** no incluye el 60, así que es `>`. Para el orden, poner siempre el escalón más estrecho arriba: si el ancho va primero, al estrecho no se llega nunca. Y probar con 150, 350, 30 y 60 exactos. |
| `interes <- (valorConsumo + ajuste) * 6 / 100;`, es decir, calcular el interés sobre lo que ya lleva la factura | La factura sale completa y creíble, pero el interés está mal. Con estrato 3, consumo 150 y 60 días de mora, el interés correcto es 4.680 y este da 3.978, y el total pasa de 76.980 a 76.278. Setecientos dos pesos por factura, multiplicados por todas las facturas del mes. | Escribir `interes <- valorConsumo * 6 / 100;`. Cuando la regla dice "sobre el valor del consumo", en el código tiene que aparecer `valorConsumo` y nada más. Lo mismo aplica al ajuste. |
| Omitir el caso `4:` del `Segun` porque su porcentaje es cero, o borrar el `SiNo` que pone `reconexion <- 0;` | Aquí PSeInt sí lo detecta, pero solo cuando llega un dato que toma ese camino. Con estrato 4 el programa muestra los tres datos de entrada y se detiene con `ERROR 215: Variable no inicializada (PORCENTAJEAJUSTE).`, porque el `Segun` salió sin asignarle nada a la variable y la línea siguiente la necesitaba. | Escribir el caso aunque valga cero. "No cobrar" y "no tener valor" no son lo mismo: el programa necesita que la variable diga cero, no le sirve que no diga nada. |
| Perder un `FinSi` o el `FinSegun` entre los siete niveles de anidamiento | El programa no arranca. Si falta el `FinSi` del alumbrado, PSeInt responde `ERROR 117: Falta cerrar SI.` señalando la línea 22, que es el `Si` de la validación. Si falta el `FinSegun`, salen tres a la vez: `ERROR 110: FinSi mal colocado.`, `ERROR 118: Falta cerrar SEGUN.` y `ERROR 117: Falta cerrar SI.` | Fijarse en la línea que señala el mensaje: es la del bloque que quedó **abierto**, no la del error. Y usar la sangría con TAB como guía, porque cada `FinSi` tiene que quedar a la misma altura que su `Si`. Si armas el programa por partes, este error no aparece nunca. |
| Escribir tildes o eñes en el código, por ejemplo llamar `reconexión` a la variable o poner `"Alumbrado público"` en un `Escribir` | Si la tilde está en el nombre de una variable, el programa ni siquiera arranca: PSeInt contesta `ERROR 68: Caracter no válido (ó).` y `ERROR 106: Instrucción no válida.` Si está dentro de un texto entre comillas el programa corre, pero la consola de Windows muestra el carácter roto y además desalinea los dos puntos de esa fila. | Escribir todo el `.psc` sin tildes y sin eñes, ni siquiera dentro de las comillas: `reconexion`, `Alumbrado publico`, `dias`, `Interes`. Las tildes van en los documentos `.md`, no en el código. |
| Poner comentarios `//` dentro del `.psc` para acordarse de qué hace cada decisión | El programa corre sin problema, pero el diagrama de flujo (`Ctrl + D`) se llena de cajas que no son ni entradas, ni procesos, ni salidas. En este ejercicio, que ya tiene siete decisiones dibujadas, el diagrama se vuelve imposible de leer. | Dejar el `.psc` limpio. Si necesitas anotaciones para estudiar, guárdalas en un archivo aparte o en el cuaderno. Los comentarios del punto 5 de esta solución existen solo aquí. |

---

## Lo que se llevan de este cuadernillo

Diez ejercicios, diez conceptos. Vale la pena releer la lista completa ahora que ya los resolviste, porque leída al final significa mucho más que leída al principio:

| # | Concepto | La idea de fondo |
|---|---|---|
| 1 | `Si ... Entonces ... SiNo` | El programa deja de ser una línea recta y se parte en caminos |
| 2 | La condición se calcula | A veces hay que calcular algo antes de poder preguntar |
| 3 | `Si` anidado | Cuando los casos son tres, `SiNo` no alcanza: hay que volver a preguntar |
| 4 | La decisión cambia un número | Guardar el valor que cambia y calcular una sola vez |
| 5 | Escalera de rangos | Cada condición hereda lo que las anteriores descartaron |
| 6 | `Y`, `O` y paréntesis | Una condición puede juntar varias preguntas |
| 7 | Validar antes de calcular | Primero se descarta lo imposible, después se trabaja |
| 8 | `Segun ... Hacer` | Comparar contra valores exactos se escribe distinto que comparar rangos |
| 9 | Un `Si` dentro de un `Segun` | Antes de hacer una operación, hay que comprobar que se puede hacer |
| 10 | Todo junto | Un problema grande no es un problema difícil: es muchos problemas pequeños |

Y una idea que atraviesa los diez y no aparece en ninguna tabla:

**El error más caro de este cuadernillo no es el que PSeInt subraya en rojo.** Un `FinSi` que falta o un punto y coma perdido se arreglan en diez segundos, porque el programa se niega a correr y te dice exactamente dónde. El error caro es el otro: el `>` que debía ser `>=`, el `SiNo` donde faltaba un caso, la escalera escrita al revés. Ninguno de esos da error. El programa corre, no se queja y entrega un resultado con toda naturalidad. Solo que es el resultado equivocado.

Contra ese error hay una sola defensa, y es la que se practicó en los diez ejercicios: **probar cada camino por separado, incluido el de la frontera, y comprobar los números a mano.**

---

## Y ahora qué sigue

Todos los programas de este cuadernillo toman una decisión **una sola vez** y terminan. El de la calculadora hace una operación y se cierra; el de la factura liquida un mes y se cierra.

La pregunta que queda abierta es qué hacer cuando algo tiene que repetirse: liquidar las facturas de un barrio entero, pedirle al usuario que corrija un dato hasta que lo escriba bien, sumar las notas de todo un salón sin saber de antemano cuántos estudiantes hay.

Eso son las **estructuras de repetición** — `Mientras`, `Para`, `Repetir` — y son el tema del siguiente cuadernillo. Se apoyan por completo en lo que acabas de aprender: un ciclo no es más que una decisión que se vuelve a tomar cada vuelta.
