# Ejercicios — Estructuras de decisión

### Cuadernillo de práctica en PSeInt · 10 ejercicios sin resolver

> **Asignatura:** Lógica de Programación
> **Criterio de evaluación:** plantear una solución algorítmica que use **estructuras de decisión** — condicionales simples, compuestas, anidadas y de selección múltiple — para que el programa tome un camino u otro según los datos que reciba.
> **Requisito previo:** haber hecho [Ejercicios_1](../Ejercicios_1/Ejercicios.md). Aquí se da por sabido leer un dato, calcular con él y mostrarlo.
> **Soluciones:** están en [Soluciones.md](Soluciones.md) — no las abras hasta haber intentado.

---

## Antes de empezar

### 1. Configura el perfil correcto

Los diez ejercicios están pensados para **PSeInt en perfil Estricto**, el mismo del cuadernillo anterior.

1. Abre PSeInt.
2. Ve a **Configurar → Opciones del lenguaje (perfiles)**.
3. Elige **Estricto**.
4. Acepta.

Lo que el perfil Estricto te sigue exigiendo:

| Regla | Ejemplo correcto | Ejemplo que da error |
|---|---|---|
| Declarar toda variable antes de usarla | `Definir edad Como Entero;` | usar `edad` sin declararla |
| Terminar cada instrucción con punto y coma | `Leer edad;` | `Leer edad` |
| Asignar con la flecha `<-` | `porcentaje <- 10;` | `porcentaje = 10;` |
| Respetar el tipo de dato | `Definir nota Como Real;` | guardar `3.5` en un `Entero` |

### 2. Lo que cambia en este cuadernillo

En Ejercicios_1 todos los programas eran una línea recta:

```
ENTRADA    ->    PROCESO    ->    SALIDA
```

Se ejecutaban todas las instrucciones, siempre, en el mismo orden, sin importar qué datos escribiera el usuario.

Aquí el programa se parte en caminos:

```
        ENTRADA
           |
      ¿condición?
        /      \
      sí        no
       |         |
   camino A   camino B
        \      /
         SALIDA
```

Según el valor del dato se ejecuta **uno** de los caminos, y el otro no se ejecuta ni una sola vez. Esa es toda la idea de una estructura de decisión.

La forma básica en PSeInt es esta:

```
Si <condición> Entonces
	<lo que pasa cuando la condición se cumple>
SiNo
	<lo que pasa cuando no se cumple>
FinSi
```

La `<condición>` es una pregunta que solo puede responderse con **sí** o con **no**. No hay término medio. `edad >= 18` es una condición; `edad` a secas no lo es.

### 3. Las herramientas que vas a usar

Todo lo que necesitas para los diez ejercicios cabe en estas tres tablas.

**Operadores relacionales** — sirven para escribir la condición:

| Operador | Significa | Ejemplo | Resultado |
|---|---|---|---|
| `>` | mayor que | `5 > 3` | Verdadero |
| `<` | menor que | `5 < 3` | Falso |
| `>=` | mayor o igual que | `5 >= 5` | Verdadero |
| `<=` | menor o igual que | `4 <= 5` | Verdadero |
| `=` | igual a | `5 = 5` | Verdadero |
| `<>` | distinto de | `5 <> 3` | Verdadero |

**Operadores lógicos** — sirven para juntar varias condiciones en una sola:

| Operador | Significa | Es verdadero cuando... |
|---|---|---|
| `Y` | y | se cumplen **las dos** condiciones |
| `O` | o | se cumple **al menos una** de las dos |
| `NO` | no | la condición que sigue es falsa |

**Estructuras de decisión:**

| Estructura | Para qué sirve |
|---|---|
| `Si ... Entonces ... FinSi` | Hacer algo solo cuando se cumple una condición |
| `Si ... Entonces ... SiNo ... FinSi` | Elegir entre dos caminos |
| Un `Si` dentro de otro `Si` | Elegir entre tres o más caminos |
| `Segun ... Hacer ... FinSegun` | Comparar una variable contra una lista de valores exactos |

### 4. Prueba cada camino, no el programa

Este es el cambio de hábito más importante del cuadernillo, y conviene entenderlo antes de escribir la primera línea.

En Ejercicios_1 bastaba con ejecutar el programa una vez: si el número salía bien, el programa estaba bien. Aquí eso ya no alcanza. **Si tu programa tiene dos caminos y solo probaste uno, no sabes nada del otro.** El camino que no probaste puede estar completamente roto y el programa nunca te lo va a decir.

Por eso cada enunciado trae una tabla de casos de prueba con los datos exactos que debes usar y lo que debe salir en cada uno. Esa tabla no es opcional: es parte del ejercicio. Entre esos casos siempre hay uno escogido a propósito para caer justo en la **frontera** entre un camino y el otro, porque ahí es donde se esconden los errores.

### 5. Cómo entregar cada ejercicio

Cada ejercicio te dice cómo se debe llamar su archivo y cómo se debe llamar el algoritmo. Respétalo: así es como se revisa.

```
Ejercicios_2/
└── PSC/
    ├── Ejercicio_01_MayorDeEdad.psc
    ├── Ejercicio_02_NumeroParImpar.psc
    └── ...
```

### 6. Teclas que vas a usar

| Tecla | Qué hace |
|---|---|
| `F9` | Revisa la sintaxis sin ejecutar |
| `F5` | Ejecuta el algoritmo |
| `F4` | Ejecuta **paso a paso** y te deja ver el valor de cada variable |
| `Ctrl + D` | Genera el diagrama de flujo |

> **En este cuadernillo `F4` vale doble.** Cuando el programa tome el camino equivocado, ejecuta paso a paso y mira qué valor tiene la variable **justo antes** del `Si`. Ahí se ve de inmediato por qué se fue para el lado que no era.

> **Y `Ctrl + D` también.** El diagrama de flujo de un programa con decisiones dibuja un rombo por cada `Si`, con una flecha por cada camino. Es la forma más rápida de ver si te faltó un caso.

### 7. Reglas de escritura del código

Las mismas de siempre:

- **El punto decimal es punto, no coma.** Se escribe `2.5`, nunca `2,5`.
- **No pongas tildes ni la letra ñ dentro del `.psc`**, ni siquiera dentro de los textos entre comillas. La consola de Windows las muestra rotas. Escribe `anio`, `desempeno`, `Miercoles`.
- **No pongas comentarios en el `.psc`.** PSeInt dibuja cada comentario como una caja extra en el diagrama de flujo y lo ensucia. Las explicaciones van en el documento, no en el código.

---

## Los diez ejercicios

| # | Ejercicio | Lo que practicas | Dificultad |
|---|---|---|---|
| 1 | ¿Es mayor de edad? | El `Si ... SiNo` y los operadores relacionales | ● ○ ○ |
| 2 | ¿Par o impar? | Calcular la condición antes de preguntarla | ● ○ ○ |
| 3 | ¿Quién vendió más? | El `Si` anidado y el caso que todos olvidan | ● ● ○ |
| 4 | Descuento por monto de compra | Que la decisión cambie un número, no un mensaje | ● ● ○ |
| 5 | Clasificar el desempeño de una nota | La escalera de rangos y por qué el orden importa | ● ● ○ |
| 6 | ¿El año es bisiesto? | Los operadores `Y`, `O` y los paréntesis | ● ● ● |
| 7 | Clasificar un triángulo por sus lados | Validar antes de calcular | ● ● ● |
| 8 | El día de la semana | La estructura `Segun ... Hacer` | ● ● ● |
| 9 | Calculadora con menú de opciones | Un `Si` dentro de un `Segun` | ● ● ● |
| 10 | Liquidación de la factura de energía | Integrar todo lo anterior en un solo programa | ● ● ● ● |

**Sobre el ejercicio 10.** Es el único con cuatro puntos, y conviene decir por qué: no es que tenga un concepto más difícil, es que tiene **todos** los conceptos juntos. Cada pieza suya ya la resolviste en alguno de los nueve anteriores. Se arma por partes, probando cada parte antes de seguir con la siguiente. Hecho así, sale solo.

---

## Ejercicio 1 — ¿Es mayor de edad?

### Lo que vas a practicar

La estructura `Si ... Entonces ... SiNo ... FinSi`. Es la primera vez que un programa tuyo deja de ser una línea recta. En el cuadernillo anterior todos los programas hacían siempre lo mismo, en el mismo orden, sin importar qué datos les dieras: leer, calcular, mostrar. De aquí en adelante el programa **mira el dato y decide**: si se cumple una condición hace una cosa, y si no se cumple hace otra distinta. Una de las dos, nunca las dos.

También vas a practicar los operadores relacionales, que son los que se usan para escribir esa condición. Y muy en particular la diferencia entre "mayor que" y "mayor o igual que", que uno en la conversación diaria usa casi como si fueran lo mismo, pero que para el computador son dos preguntas distintas. Ese detalle es el que decide si este ejercicio te queda bien o te queda mal.

### El problema

La biblioteca pública del barrio expide dos tipos de carné. El de adulto lo tramita la persona sola, con su documento y nada más. El juvenil necesita que un acudiente firme la autorización, porque la biblioteca responde por el material que se lleva un menor de edad.

Quien atiende el mostrador es una auxiliar que lleva años decidiendo eso de memoria: pregunta la edad y resuelve ahí mismo. Con un señor de 40 no se equivoca nunca, y con un niño de 9 tampoco. El problema son los que llegan con 18 años recién cumplidos: unas veces les pide la firma del acudiente y otras no, y ya hubo reclamos por eso. Entonces pidió un programa que responda siempre lo mismo, sin depender de la memoria de nadie.

Escribe ese programa. Debe pedir la edad de la persona en años cumplidos, mostrarla registrada en pantalla y después decir dos cosas: el veredicto, es decir si es mayor o menor de edad, y cuál de los dos carnés le corresponde.

### Datos de entrada

| Variable | Tipo | Qué significa |
|---|---|---|
| `edad` | Entero | La edad de la persona en años cumplidos. Los años cumplidos se cuentan completos, por eso este dato no lleva decimales |

### Datos de salida

| Salida | Qué significa |
|---|---|
| Edad registrada | La misma edad que escribió el usuario, repetida en pantalla para que la auxiliar confirme que no se equivocó al teclear |
| Veredicto | Si la persona es mayor de edad o menor de edad |
| Carné que le corresponde | El de adulto, que se tramita solo, o el juvenil, que necesita la firma de un acudiente |

### La lógica que necesitas

El dato del problema, el que no tienes que deducir porque te lo da la ley, es este: **en Colombia una persona es mayor de edad desde el día en que cumple 18 años.** A quien cumplió 18 hoy no le falta nada, ya es mayor de edad. Guarda esa frase, porque de ahí sale toda la decisión.

La estructura que necesitas, escrita en pseudocódigo genérico, es esta:

```
Si <condicion> Entonces
    <lo que se hace cuando la condicion es verdadera>
SiNo
    <lo que se hace cuando la condicion es falsa>
FinSi
```

Léela así: PSeInt evalúa la condición, que es una pregunta que solo puede responderse con verdadero o con falso. Si la respuesta es verdadero, ejecuta el primer bloque y **se salta el segundo por completo**, como si no estuviera escrito. Si es falso, hace exactamente lo contrario. Nunca ejecuta los dos bloques, y nunca deja de ejecutar alguno.

La condición se arma comparando dos valores con un operador relacional. Estos son los que tienes disponibles en PSeInt:

| Operador | Se lee | Ejemplo verdadero | Ejemplo falso |
|---|---|---|---|
| `>` | mayor que | `7 > 3` | `3 > 7` |
| `<` | menor que | `3 < 7` | `7 < 3` |
| `>=` | mayor o igual que | `5 >= 5` | `4 >= 5` |
| `<=` | menor o igual que | `5 <= 5` | `6 <= 5` |
| `=` | igual a | `5 = 5` | `4 = 5` |
| `<>` | distinto de | `4 <> 5` | `5 <> 5` |

Compara la primera fila con la tercera. `5 >= 5` es verdadero, pero `5 > 5` es **falso**: un número no es mayor que sí mismo. Ahí está la única decisión difícil de este ejercicio, y te toca a ti tomarla. Elige el operador que deja a una persona de 18 años exactos del lado que le corresponde según la ley.

El orden de las instrucciones es el de siempre: el banner, una línea en blanco, la pregunta con `Escribir Sin Saltar`, el `Leer`, otra línea en blanco, el separador de RESULTADOS, la línea con la edad registrada y, después de todo eso, el `Si`. Dentro de cada una de las dos ramas van dos `Escribir`: uno para el veredicto y otro para el carné.

### Así se debe ver funcionando

Estas son tres corridas del programa terminado. Lo que aparece después del signo `>` es lo que escribió el usuario por teclado antes de presionar Enter; todo lo demás lo escribió el programa.

Una persona de 20 años:

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

Una persona de 15 años:

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

Y esta tercera corrida es la que de verdad importa, la que la auxiliar nunca supo resolver: alguien que acaba de cumplir 18 años.

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

Si tu programa responde bien las dos primeras corridas pero en la tercera dice `ES MENOR DE EDAD`, todavía no lo tienes: lo tienes bueno en dos de cada tres casos, que no es lo mismo. Prueba siempre con 18.

### Pistas

1. Este programa tiene una sola variable, `edad`, y va declarada como **Entero**, porque los años cumplidos se cuentan completos: nadie tiene 17.5 años cumplidos. Recuerda declararla antes de usarla, que es lo primero que te exige el perfil Estricto.

2. Antes de escribir una sola línea de código, responde esta pregunta en papel: la persona de 18 años exactos, ¿recibe carné de adulto o carné juvenil? Cuando tengas esa respuesta escrita, y solo entonces, vuelve a la tabla de operadores y escoge el que la cumple. Escribir la condición primero y pensarla después es lo que hace que este ejercicio se pierda.

3. **Cuidado, este es el error típico de este ejercicio:** escribir la condición como "la edad es mayor que 18". Suena bien en español y el programa arranca sin una sola queja, porque `F9` no encuentra nada raro: la sintaxis está perfecta. Con 20 responde bien y con 15 también, así que uno queda convencido de que quedó. Pero con 18 exactos responde lo contrario de lo que debe, y ese era justamente el caso que la auxiliar no sabía resolver. PSeInt no te va a avisar de esto nunca. Los errores que el computador no detecta son los que hay que cazar con casos de prueba, y el caso de prueba de este ejercicio es el 18.

4. Los dos símbolos de un operador de comparación doble van pegados y en un orden fijo. Si los inviertes y escribes `=>`, el programa ni siquiera arranca: PSeInt responde `ERROR 234: Falta operando (antes de >).` Ese es de los errores buenos, de los que se ven de una vez y se corrigen en dos segundos.

5. El `SiNo` va solo: no lleva condición, no lleva `Entonces` y no lleva punto y coma. Significa "en todos los demás casos", y eso ya lo dice todo. El bloque completo se cierra con `FinSi`, que tampoco lleva punto y coma; si se te olvida, PSeInt te lo marca al revisar con `F9`, antes de que alcances a ejecutar. Cuida también la sangría: las líneas de adentro del `Si` llevan un TAB más que la línea del `Si`. No cambia el resultado, pero es lo que te va a permitir leer tu propio programa dentro de un mes.

### Cómo se debe llamar tu archivo

Guarda tu programa en:

```
PSC/Ejercicio_01_MayorDeEdad.psc
```

Y la primera línea del archivo, el nombre del algoritmo, debe ser exactamente:

```
Algoritmo MayorDeEdad
```

Respeta las mayúsculas tal cual aparecen. El archivo va limpio: **sin comentarios**, porque PSeInt dibuja cada comentario como una caja extra en el diagrama de flujo (`Ctrl + D`) y lo ensucia, y **sin tildes ni eñes**, ni siquiera dentro de los textos que van entre comillas, porque según la consola en la que se ejecute pueden verse partidas o cambiadas por símbolos raros. Dentro del código se escribe `anios`, `carne`, `veredicto`. En este documento `.md` sí van con su ortografía completa.

---

## Ejercicio 2 — ¿Par o impar?

### Lo que vas a practicar

Que la condición de un `Si` casi nunca viene servida en el dato. En el ejercicio anterior la pregunta era directa: la edad ya estaba escrita por teclado y solo había que compararla contra 18. Aquí no. Nadie te va a escribir "soy par" en la pantalla: eso hay que **calcularlo primero** y después comparar el resultado de ese cálculo. El operador que lo hace ya lo conoces: es el residuo `%`, el mismo que usaste en el Ejercicio 8 del cuadernillo anterior para saber cuántos segundos sobraban después de sacar los minutos.

De paso vas a aclarar una confusión que le pasa a todo el mundo la primera semana. Dentro de un `Si`, el signo `=` **pregunta** si dos cosas valen lo mismo y no guarda nada. Guardar un valor en una variable sigue siendo trabajo de la flecha `<-`, y eso se hace afuera, en su propia línea. Son dos operaciones distintas que se parecen mucho al leerlas.

### El problema

El profesor de educación física del colegio arma la clase por parejas: estiramiento en parejas, calentamiento en parejas, todo en parejas. El problema es que la asistencia cambia todos los días. Si el número de estudiantes que llegó es par, la clase queda perfecta y todos tienen con quién trabajar. Si es impar, siempre queda uno suelto, y a ese le toca hacer la rutina con el profesor.

Él necesita saberlo apenas termina de llamar a lista, antes de mandarlos a formar, porque organizar el grupo y después descubrir que sobra uno le desordena toda la clase.

Escribe un programa que le pida al profesor cuántos estudiantes asistieron hoy y le responda si esa cantidad es par o impar, diciéndole además qué significa eso en la práctica: si todos quedan emparejados o si le va a tocar hacer pareja con alguien. El programa también debe mostrar en pantalla el residuo que usó para decidir, porque así el profesor (y tú) ve de dónde salió la respuesta.

### Datos de entrada

| Variable | Tipo | Qué significa |
|---|---|---|
| `cantidad` | Entero | Cuántos estudiantes asistieron hoy a la clase |

### Datos de salida

| Salida | Qué significa |
|---|---|
| Estudiantes que asistieron | La cantidad que escribió el profesor, repetida para confirmar que se leyó bien |
| Residuo de dividir entre 2 | Lo que sobra al repartir esa cantidad en grupos de dos. Es el número del que depende toda la decisión |
| Veredicto | Si la cantidad es PAR o IMPAR, más la consecuencia práctica para la clase |

### La lógica que necesitas

La regla matemática es la de siempre, dicha con palabras:

> Un número es **par** cuando se puede repartir en grupos de dos sin que sobre nada. Es **impar** cuando sobra exactamente uno.

Fíjate en que esa definición no habla del resultado de la división, habla de **lo que sobra**. Y lo que sobra en una división se llama residuo, y en PSeInt se saca con `%`. Un recordatorio de cómo funciona ese operador, con números que no tienen nada que ver con este ejercicio:

    17 % 5   vale 2

Porque el 5 cabe tres veces dentro del 17 (eso son 15) y de ahí al 17 sobran 2. El operador `%` no te dice cuántas veces cabe: te dice **qué quedó por fuera**.

Con eso, tu programa tiene esta forma:

```
residuo <- <la cuenta que dice cuánto sobra al repartir la cantidad en grupos de dos>

Si <condición sobre el residuo> Entonces
    ... la cantidad es par, todos quedan emparejados ...
SiNo
    ... la cantidad es impar, queda uno suelto ...
FinSi
```

Dos cosas de esa forma que valen oro:

- El cálculo del residuo va **antes** del `Si` y en su propia línea. Un `Si` no calcula nada, solo pregunta.
- La condición que va en el espacio marcado con `<...>` la tienes que deducir tú a partir de la definición de arriba. Es una comparación cortísima, de tres símbolos.

### Así se debe ver funcionando

Estas son tres corridas reales del programa. Lo que aparece después del signo `>` es lo que escribió el usuario por teclado.

**Un día con asistencia par:**

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

**Un día con asistencia impar:**

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

**El caso frontera, el día que no llegó nadie.** Este es el que tienes que probar sí o sí, porque es donde la mayoría duda: mucha gente cree que el cero no es ni par ni impar. Sí lo es, y tu programa tiene que responderlo sin trampas ni casos especiales:

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

### Pistas

1. Son dos variables y las dos son **Entero**: `cantidad`, que la lees del teclado, y `residuo`, que la calculas tú. Las puedes declarar en una sola línea separadas por coma.

2. Muestra el residuo en pantalla aunque el profesor no te lo haya pedido con esas palabras. Cuando una decisión depende de un número intermedio, verlo impreso es la forma más rápida de descubrir por qué el programa respondió lo que respondió. Si el veredicto te sale al revés, mira primero el residuo.

3. **Cuidado, este es el error típico de este ejercicio:** confundir la división con el residuo. Haz la cuenta a mano antes de escribir la condición: si el profesor reporta 8 estudiantes, ¿cuánto da 8 dividido entre 2? ¿Ese número es cero? Si tu condición pregunta por el resultado de la división en lugar de preguntar por lo que sobra, tu programa va a responder que 8 es IMPAR y no te va a mostrar ni un error, porque para la máquina la cuenta está bien hecha: la que está mal planteada es la pregunta. `/` y `%` responden dos cosas distintas sobre la misma división.

4. Segundo error, y también silencioso: escribir la flecha `<-` dentro de la condición del `Si`. PSeInt no lo rechaza ni te avisa nada. Lo interpreta como otra cosa completamente distinta, se ejecuta feliz y te devuelve respuestas que no tienen sentido. Recuerda para qué sirve cada símbolo: la flecha guarda, y guardar no es preguntar.

5. Prueba con 8, con 7 y con 0. Si los tres te dan lo que muestran las corridas de arriba, el programa está bien. Si quieres una prueba extra, escribe 1: debería salir IMPAR con residuo 1.

### Cómo se debe llamar tu archivo

- Guarda el archivo como: `PSC/Ejercicio_02_NumeroParImpar.psc`
- El algoritmo se debe llamar exactamente `NumeroParImpar`, así que la primera línea del programa es `Algoritmo NumeroParImpar`.
- El archivo va limpio: sin comentarios, sin emojis, sin tildes ni eñes dentro del código, ni siquiera dentro de los textos entre comillas. En este documento `.md` sí se escribe todo con ortografía completa; en el `.psc` no.

---

## Ejercicio 3 — ¿Quién vendió más?

### Lo que vas a practicar

El `Si` anidado: un `Si` completo metido adentro del `SiNo` de otro. En los dos ejercicios anteriores tu programa escogía entre dos caminos, y para dos caminos el `Si-Entonces-SiNo` sobra y basta. Aquí los caminos posibles son **tres**, y ahí es donde se descubre lo que de verdad significa `SiNo`: no significa "lo contrario", significa "en todos los demás casos". Y dentro de ese "todos los demás casos" pueden caber varias situaciones distintas que a ti te toca separar.

De paso vas a volver a usar `abs`, la función que devuelve un número sin signo. Ya apareció en el recordatorio de sintaxis del cuadernillo anterior.

### El problema

En una tienda de barrio en Cali trabajan dos vendedores, Ana y Carlos. A fin de mes el dueño suma lo que vendió cada uno y le entrega un bono al que más vendió. Hasta ahí el asunto es sencillo y siempre había funcionado.

El mes pasado pasó algo que él nunca había contemplado: los dos vendieron exactamente lo mismo, peso por peso. Se quedó mirando la hoja sin saber qué hacer, porque en su cabeza la pregunta siempre había sido "¿ganó Ana o ganó Carlos?" y nunca "¿y si no ganó ninguno de los dos?". Terminó dándole el bono a Carlos porque le tocó decidir en el momento, y Ana quedó con toda la razón para reclamar.

Escribe un programa que reciba lo que vendió Ana y lo que vendió Carlos durante el mes, muestre las dos ventas, muestre la diferencia entre ellas y diga quién se gana el bono: Ana, Carlos, o los dos por igual si hubo empate. Los tres casos tienen que estar contemplados. Un programa que solo sabe responder dos de los tres está mal, aunque acierte casi siempre.

### Datos de entrada

| Variable | Tipo | Qué significa |
|---|---|---|
| `ventaAna` | Real | Total vendido por Ana durante el mes, en pesos |
| `ventaCarlos` | Real | Total vendido por Carlos durante el mes, en pesos |

### Datos de salida

| Salida | Qué significa |
|---|---|
| `ventaAna` | La venta de Ana, tal como quedó registrada |
| `ventaCarlos` | La venta de Carlos, tal como quedó registrada |
| `diferencia` | Por cuántos pesos le ganó uno al otro, sin importar cuál de los dos fue |
| Veredicto del bono | Quién se lleva el bono: ANA, CARLOS o EMPATE, con una frase que explique por qué |

### La lógica que necesitas

**La diferencia.** Es la resta de las dos ventas, pero sin signo. Si Ana vendió $1.500.000 y Carlos $980.000, la diferencia es $520.000; y si es al revés, la diferencia sigue siendo $520.000, porque lo que interesa es el tamaño de la ventaja y no quién la tiene. En notación matemática:

```
diferencia = valor absoluto de ( ventaAna - ventaCarlos )
```

PSeInt tiene una función que hace exactamente eso y se llama `abs`. Se usa como cualquier otra función: le pasas una expresión entre paréntesis y te devuelve el resultado.

**La decisión.** Escrito en castellano, el razonamiento es este:

- Si Ana vendió más que Carlos, el bono es de Ana y no hay nada más que preguntar.
- Si eso no se cumple, todavía **no** sabes quién ganó. Puede que haya vendido más Carlos o puede que estén empatados. Son dos situaciones distintas metidas en la misma bolsa, así que toca hacer una segunda pregunta.
- Si en esa segunda pregunta resulta que Carlos vendió más que Ana, el bono es de Carlos.
- Y si la segunda pregunta tampoco se cumple, ya no queda ninguna otra posibilidad: vendieron lo mismo, hay empate.

Esa segunda pregunta es un `Si` completo que vive **adentro** del `SiNo` de la primera, con su propio `FinSi`. La forma queda así, con las condiciones en blanco para que las escribas tú:

```
Si <condicion 1> Entonces
    ... gana Ana ...
SiNo
    Si <condicion 2> Entonces
        ... gana Carlos ...
    SiNo
        ... empate ...
    FinSi
FinSi
```

Fíjate en dos cosas de esa forma. La primera: hay **dos** `FinSi`, y el de adentro se cierra antes que el de afuera, igual que unos paréntesis. La segunda: el último `SiNo` no lleva pregunta, y no la lleva porque no hace falta. Si la primera condición falló y la segunda también, la única posibilidad que sobrevive es el empate. Ese `SiNo` final es justo el que le faltaba al dueño de la tienda.

### Así se debe ver funcionando

Estas son tres corridas del programa. En las tres, lo que aparece después del signo `>` es lo que escribió el usuario por teclado; todo lo demás lo escribió el programa.

Primera corrida, Ana vendió más:

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

Segunda corrida, los mismos dos números pero al revés:

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

Tercera corrida, el empate:

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

**La tercera corrida es la que decide si tu programa está bien.** Las dos primeras las acierta casi cualquier intento; la del empate es la que se le escapa a la mayoría, y es exactamente el caso que dejó al dueño sin saber qué hacer. Cuando pruebes tu programa, no lo pruebes solo con las dos primeras.

### Pistas

1. Escribe primero la parte que ya sabes hacer y pruébala: pedir las dos ventas, calcular la diferencia y mostrar las tres líneas de resultados. Cuando eso te funcione, y solo entonces, agrégale la decisión. Un programa se arma por pedazos y cada pedazo se prueba; no se escribe entero y se ejecuta al final a ver qué sale.

2. Las tres variables van declaradas como **Real**, no como Entero. Aunque en los ejemplos las ventas sean números redondos, una venta del mes bien puede terminar en $980.500.

3. Cuida la sangría. Cada vez que abres un `Si` adentro de otro, el bloque de adentro se corre un TAB más a la derecha. No es adorno: la sangría es lo que te deja ver de un vistazo cuál `FinSi` cierra cuál `Si`. Si escribes todo pegado al margen izquierdo, el día que aparezca un error no vas a saber en qué nivel estás parado.

4. **Cuidado, este es el error típico de este ejercicio:** resolverlo con un solo `Si/SiNo`, así: si Ana vende más gana Ana, y si no, gana Carlos. Suena razonable y además funciona perfecto con las dos primeras corridas de arriba. Pero corre ese programa con las dos ventas iguales y lee bien lo que responde. No te va a dar ningún error, no se va a caer, no te va a advertir nada: te va a entregar una respuesta falsa con toda tranquilidad. La pregunta que tienes que hacerte es cuántas situaciones distintas caben adentro de ese `SiNo`.

5. El otro error frecuente es más benigno, porque este sí lo detecta PSeInt cuando revisas la sintaxis con `F9`: dejar un solo `FinSi` habiendo abierto dos `Si`, o cerrarlos en el orden equivocado. Cuenta los `Si` que abriste y asegúrate de que haya la misma cantidad de `FinSi`, cerrados de adentro hacia afuera.

### Cómo se debe llamar tu archivo

- Guarda el archivo como: `PSC/Ejercicio_03_MayorDeDosNumeros.psc`
- El algoritmo se debe llamar exactamente `MayorDeDosNumeros`, así que la primera línea del programa es `Algoritmo MayorDeDosNumeros`.
- El archivo va limpio: sin comentarios, sin emojis, sin tildes ni eñes dentro del código, ni siquiera dentro de los textos entre comillas. Adentro del `.psc` se escribe `vendio`, `duenio`, `numero`. En este documento `.md` sí va todo con ortografía completa.

---

## Ejercicio 4 — Descuento por monto de compra

### Lo que vas a practicar

Hasta ahora la decisión solo cambiaba el mensaje que salía en pantalla: mayor o menor de edad, par o impar, quién vendió más. Aquí la decisión cambia **un número**, y ese número se usa después en una cuenta. Dentro del `Si` no vas a escribir ningún resultado: vas a guardar un porcentaje en una variable, y las fórmulas que vienen después se escriben **una sola vez** y sirven para los dos caminos.

Ese cambio de mentalidad es el que importa. Un `Si` no está obligado a imprimir algo; muchas veces lo único que hace es dejar una variable lista para el cálculo que viene más abajo.

### El problema

La papelería del barrio sacó una promoción para la temporada escolar: a quien compre **más de $100.000** le hacen el 10 % de descuento, y por debajo de esa cifra se paga el precio completo. La dueña puso el aviso en la vitrina y a los dos días ya estaba arrepentida, porque cada vez que llega un cliente le toca sacar la cuenta de memoria mientras la fila crece.

Ella te pide una calculadora sencilla: que le pregunte cuánto sumó la compra y que le responda de una vez qué porcentaje de descuento aplica, cuántos pesos se le rebajan y cuánto tiene que pagar el cliente. Quiere ver los tres números, no solo el total, porque cuando alguien reclama necesita mostrarle de dónde salió cada peso.

Escribe un programa que pida el valor de la compra en pesos y muestre el valor registrado, el porcentaje de descuento que se aplicó, el valor del descuento en pesos y el total a pagar.

### Datos de entrada

| Variable | Tipo | Qué significa |
|---|---|---|
| `valorCompra` | Real | Valor total de la compra antes del descuento, en pesos |

### Datos de salida

| Salida | Qué significa |
|---|---|
| `valorCompra` | El valor de la compra tal como lo escribió la cajera, para que quede a la vista |
| `porcentaje` | El porcentaje de descuento que le tocó a esa compra: 10 o 0 |
| `descuento` | Cuántos pesos se le rebajan al cliente |
| `total` | Lo que el cliente paga finalmente en la caja |

### La lógica que necesitas

La promoción de la papelería, escrita como tabla. Esto son datos del problema, no la solución:

| Valor de la compra | Porcentaje de descuento |
|---|---|
| Más de $100.000 | 10 % |
| $100.000 o menos | 0 % |

Lee bien la primera fila: dice **más de** $100.000, no "desde" $100.000. Una compra de exactamente $100.000 **no** entra en la promoción. Ese detalle del enunciado es el corazón del ejercicio.

Las dos fórmulas son las de siempre, las mismas del Ejercicio 6 del cuadernillo anterior:

```
descuento = valor de la compra × porcentaje ÷ 100

total a pagar = valor de la compra − descuento
```

Y esta es la forma que tiene que tener tu programa. Los espacios entre `< >` los llenas tú:

```
Si <condición sobre el valor de la compra> Entonces
    <guardar en porcentaje el descuento que aplica>
SiNo
    <guardar en porcentaje el descuento que aplica>
FinSi

<calcular el descuento>
<calcular el total>
```

Fíjate en dónde quedan las dos últimas líneas: **después del `FinSi`**, no adentro de las ramas. Esas dos líneas se ejecutan siempre, pase lo que pase, con el porcentaje que haya quedado guardado. Si la compra fue grande, `porcentaje` vale 10 y el descuento sale positivo; si fue pequeña, `porcentaje` vale 0 y la multiplicación por cero deja el descuento en cero solita, sin que tú tengas que hacer nada especial. Ese es el truco del ejercicio.

### Así se debe ver funcionando

Estas son tres corridas del programa. Lo que aparece después del signo `>` es lo que escribió el usuario por teclado; todo lo demás lo imprime el programa.

**Una compra que sí entra en la promoción:**

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

**Una compra que no alcanza:**

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

**El caso frontera, el que decide si tu programa está bien o está mal.** La compra es de exactamente $100.000, y la promoción dice "más de", así que esta compra **no** tiene descuento:

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

Cuando termines, prueba tu programa con estos tres valores en este orden. Si los dos primeros te dan bien pero el tercero te muestra un descuento de $10.000, ya sabes exactamente en qué línea está el problema.

### Pistas

1. Son cuatro variables y todas van **Real**: `valorCompra`, que la lees del teclado, y `porcentaje`, `descuento` y `total`, que las calcula el programa. Declararlas todas de una vez en un solo `Definir` está permitido y deja el código más corto.

2. El `Si` de este ejercicio no imprime nada. Su único trabajo es dejar guardado un número en `porcentaje`. Si te salen `Escribir` adentro de las ramas con el total ya calculado, es que te fuiste por el camino largo: vuelve a mirar la estructura vacía de arriba.

3. Sacar un porcentaje siempre es lo mismo: **multiplicar por el número del porcentaje y dividir entre 100**. Si en `porcentaje` guardaste `10`, la operación es `× 10 ÷ 100`. No guardes `0.10` y además dividas entre 100, porque estarías dividiendo dos veces y el descuento te quedaría cien veces más pequeño de lo que debe.

4. **Cuidado, este es el error típico de este ejercicio:** el signo de la comparación en la frontera de los $100.000. La promoción dice "más de", y hay dos operadores que se parecen muchísimo al escribirlos pero que tratan de forma distinta al cliente que compra exactamente esa cifra. Si eliges el que no era, tu programa acierta con $150.000, acierta con $80.000, no muestra ni un error, y le regala $10.000 a quien no le corresponde. Antes de teclear esa línea, léete otra vez la fila de la tabla y decide si el número $100.000 entra o no entra.

5. Hay otra forma de resolverlo que también funciona: calcular el total multiplicado por 0.9 dentro de una rama y dejarlo intacto en la otra, repitiendo las fórmulas dos veces. Piensa qué pasa el día que la dueña cambie la promoción al 15 %: te toca acordarte de tocar dos sitios, y basta con que te olvides de uno para que el programa quede dando dos precios distintos según el camino. Por eso aquí se guarda el porcentaje y se calcula una sola vez.

### Cómo se debe llamar tu archivo

Guarda tu programa en:

```
PSC/Ejercicio_04_DescuentoPorCompra.psc
```

Y la primera línea del archivo, el nombre del algoritmo, debe ser exactamente:

```
Algoritmo DescuentoPorCompra
```

Respeta las mayúsculas tal cual aparecen: el nombre del algoritmo no lleva espacios ni tildes. El archivo se entrega limpio, sin comentarios `//`, sin emojis y sin tildes ni eñes dentro del código, tampoco en los textos entre comillas. En este documento `.md` sí van con ortografía completa.

---

## Ejercicio 5 — Clasificar el desempeño de una nota

### Lo que vas a practicar

La **escalera de condiciones**: varios `Si` anidados, cada uno metido dentro del `SiNo` del anterior, para repartir un valor en rangos. En el Ejercicio 3 ya anidaste un `Si` para llegar a tres caminos; aquí vas a llegar a cuatro, y el mecanismo es el mismo, solo que con un escalón más.

Lo importante de este ejercicio no es escribir muchos `Si`, sino entender que **el orden en que preguntas no es libre**. Cada condición de la escalera solo se evalúa cuando todas las anteriores fallaron, y ese hecho te regala información: para llegar al segundo escalón, la pregunta del primero ya tuvo que responder que no. Eso te permite escribir condiciones cortas, de una sola comparación, en lugar de condiciones largas de dos partes. Y si te equivocas en el orden, el programa sigue corriendo sin dar ni un error y responde mal.

### El problema

En Colombia el Decreto 1290 no deja las notas como números sueltos: exige que al lado de cada una aparezca el **nivel de desempeño** que le corresponde. Un profesor de un colegio de Cali tiene que escribir ese nivel en la planilla cada vez que cierra un periodo, y con 40 estudiantes por materia y varias materias a cargo, hacerlo a mano es lento y se presta para equivocaciones. Las que más se le repiten son las notas que caen justo en el borde de un rango.

Esta es la tabla oficial con la que trabaja el colegio:

| Nivel de desempeño | Rango de la nota |
|---|---|
| Bajo | menor que 3.0 |
| Básico | de 3.0 a 3.9 |
| Alto | de 4.0 a 4.5 |
| Superior | de 4.6 a 5.0 |

Escribe un programa que le pida al profesor la nota definitiva del periodo y le responda con el nivel de desempeño que le corresponde según esa tabla. El nivel se guarda en una variable y se muestra al final, junto con la nota que se registró.

### Datos de entrada

| Variable | Tipo | Qué significa |
|---|---|---|
| `nota` | Real | La nota definitiva del periodo, en la escala colombiana de 0.0 a 5.0 |

### Datos de salida

| Salida | Qué significa |
|---|---|
| `nota` | La nota que registró el profesor, para que pueda confirmar que la escribió bien |
| `desempeno` | El nivel que le corresponde a esa nota: BAJO, BASICO, ALTO o SUPERIOR |

`desempeno` guarda texto y no un número, así que se declara **Como Caracter**. En PSeInt el tipo `Caracter` guarda una palabra completa o una frase entera, no una sola letra como su nombre haría pensar.

### La lógica que necesitas

Son cuatro niveles, así que hay cuatro caminos posibles y el programa tiene que tomar exactamente uno. Esta es la forma de la escalera, con los huecos para que tú los llenes:

```
Si <primera condicion> Entonces
	<el nivel que corresponde>
SiNo
	Si <segunda condicion> Entonces
		<el nivel que corresponde>
	SiNo
		Si <tercera condicion> Entonces
			<el nivel que corresponde>
		SiNo
			<el nivel que queda>
		FinSi
	FinSi
FinSi
```

Fíjate en un detalle que vale oro: hay **cuatro caminos pero solo tres preguntas**. El último nivel no se pregunta, se deduce, porque el `SiNo` más profundo significa "en todos los demás casos" y ahí adentro ya no cabe ninguna otra posibilidad. Fíjate también en los tres `FinSi` en cascada del final: cada `Si` cierra el suyo, y se cierran en el orden inverso al que se abrieron.

Las condiciones concretas las decides tú a partir de la tabla oficial. Antes de escribirlas, dos cosas del enunciado que tienes que tener en cuenta:

**Las fronteras pertenecen al rango.** Una nota de 3.0 exacta es Básico, no Bajo: la tabla dice "de 3.0 a 3.9". Una nota de 4.0 exacta es Alto. Esos son los valores que hay que probar con más cuidado, porque son los que deciden si tu condición quedó bien escrita.

**La tabla oficial tiene un hueco y hay que taparlo.** Entre 4.5 y 4.6 no hay ninguna fila: una nota de 4.55 no aparece en ningún rango. Eso pasa todo el tiempo con las tablas del mundo real, y cuando pasa le toca al programador decidir. Aquí la decisión ya está tomada y es esta: **el nivel Alto llega hasta 4.5 inclusive, y todo lo que pase de 4.5 es Superior.** Así ninguna nota se queda sin nivel.

### Así se debe ver funcionando

Estas son corridas reales del programa. Lo que aparece después del signo `>` es lo que escribió el usuario por teclado.

Una nota baja, el escalón más corto de la escalera:

```
==================================================
  CLASIFICAR EL DESEMPENO DE UNA NOTA
==================================================

Escriba la nota definitiva del periodo (0.0 a 5.0): > 2.4

------------------- RESULTADOS -------------------
Nota definitiva    : 2.4 puntos
Nivel de desempeno : BAJO
```

**El caso frontera.** Una nota de 3.0 exacta, la que separa Bajo de Básico:

```
==================================================
  CLASIFICAR EL DESEMPENO DE UNA NOTA
==================================================

Escriba la nota definitiva del periodo (0.0 a 5.0): > 3.0

------------------- RESULTADOS -------------------
Nota definitiva    : 3 puntos
Nivel de desempeno : BASICO
```

Mira la línea de la nota: escribiste `3.0` y el programa muestra `3`. No es un error tuyo ni del programa. PSeInt no imprime los decimales que valen cero, y para la máquina `3` y `3.0` son exactamente el mismo número. Lo que importa aquí es el nivel, y es BASICO, que es lo que dice la tabla.

**El caso del hueco.** Una nota de 4.55, que no aparece en ninguna fila de la tabla oficial:

```
==================================================
  CLASIFICAR EL DESEMPENO DE UNA NOTA
==================================================

Escriba la nota definitiva del periodo (0.0 a 5.0): > 4.55

------------------- RESULTADOS -------------------
Nota definitiva    : 4.55 puntos
Nivel de desempeno : SUPERIOR
```

Sale SUPERIOR porque así se acordó tapar el hueco de la tabla. Si tu programa responde otra cosa con 4.55, revisa dónde le pusiste el límite al nivel Alto.

Con estos datos tienes que probar tu programa antes de entregarlo, uno por uno. No sirve probar solo el primero:

| # | nota | Nivel esperado | Por qué está en la lista |
|---|---|---|---|
| 1 | 2.4 | BAJO | Un valor cómodo dentro del primer rango |
| 2 | 3.5 | BASICO | Un valor cómodo dentro del segundo rango |
| 3 | 4.2 | ALTO | Un valor cómodo dentro del tercer rango |
| 4 | 4.8 | SUPERIOR | Un valor cómodo dentro del cuarto rango |
| 5 | 3.0 | BASICO | Frontera exacta entre Bajo y Básico |
| 6 | 4.5 | ALTO | Frontera exacta entre Alto y Superior |
| 7 | 4.55 | SUPERIOR | El hueco de la tabla oficial |

### Pistas

1. Son dos variables y nada más: `nota`, que se lee del teclado y es **Real** porque las notas llevan decimales, y `desempeno`, que es **Caracter** porque guarda una palabra. Si declaras `nota` como Entero, el programa se cae apenas alguien escriba 3.5. Y acuérdate de que el punto decimal es punto, no coma: se escribe `4.55`.

2. No muestres el nivel con un `Escribir` dentro de cada rama de la escalera. Guárdalo en `desempeno` y muéstralo una sola vez al final, después del separador de RESULTADOS. Así, el día que el colegio cambie la palabra por otra, la cambias en un solo sitio, y de paso la escalera queda mucho más corta de leer.

3. **Cuidado, este es el error típico de este ejercicio:** hay un orden de las preguntas con el que **todas** las notas caen en el primer escalón y el programa siempre responde lo mismo, con 2.4 y con 4.8 por igual. PSeInt no dice absolutamente nada: no hay error de sintaxis, no hay advertencia, `F9` pasa limpio y el programa corre feliz contestando mal. Piensa qué le pasa a una nota de 2.4 cuando la primera pregunta de la escalera es demasiado ancha. Y antes de ejecutar nada, dibuja tu escalera en papel, escribe al lado las siete notas de la tabla de prueba y sigue con el dedo por dónde entra cada una: si dos notas de rangos distintos terminan en el mismo escalón, ya sabes que hay algo que corregir.

4. Si te descubres escribiendo una condición de dos partes unidas por `Y` para el segundo escalón, párate un momento. No está mal, pero sobra. Pregúntate qué te dijo el escalón anterior sobre la nota por el solo hecho de haber fallado. Esa es la idea completa de la escalera.

5. Los `FinSi` son tres y quedan uno debajo del otro al final. Si te falta uno o te sobra, `F9` te lo dice antes de ejecutar. Usa el TAB para que cada `Si` quede más adentro que el anterior: la sangría no cambia lo que hace el programa, pero es lo único que te deja ver de un vistazo cuál `SiNo` pertenece a cuál `Si`.

### Cómo se debe llamar tu archivo

Guarda tu programa en:

```
PSC/Ejercicio_05_ClasificarNota.psc
```

Y la primera línea del archivo, el nombre del algoritmo, debe ser exactamente:

```
Algoritmo ClasificarNota
```

Respeta las mayúsculas tal cual aparecen. El archivo va limpio: sin comentarios, sin tildes y sin eñes, ni siquiera dentro de los textos entre comillas. Por eso la variable se llama `desempeno` y el nivel se escribe `BASICO` dentro del código. En este documento `.md` sí van con su ortografía completa.

---

## Ejercicio 6 — ¿El año es bisiesto?

### Lo que vas a practicar

Los operadores lógicos `Y`, `O` y `NO`, y los paréntesis que deciden cómo se agrupan. Hasta ahora cada `Si` que escribiste preguntaba **una sola cosa**: si la edad llegaba a 18, si el residuo era cero, si una venta era mayor que otra. Aquí, por primera vez, una sola condición tiene que juntar **tres preguntas** y combinarlas de manera que el resultado sea el correcto.

Esa es toda la novedad del ejercicio, y es de las cosas más útiles que vas a aprender en este cuadernillo: la vida real casi nunca decide con una sola pregunta. "Si es mayor de edad **y** trae la cédula", "si paga en efectivo **o** con tarjeta débito", "si el estudiante faltó **y no** presentó excusa". Todas esas frases se pueden escribir dentro de un solo `Si`, y aquí vas a aprender cómo.

### El problema

En un colegio de Cali, la secretaria arma cada año el calendario académico. Entre otras cosas tiene que anotar cuántos días va a tener cada mes, y con once meses no hay ningún problema. El que la hace dudar siempre es febrero, porque unos años tiene 28 días y otros 29.

Ella creció con la regla de que "cada cuatro años hay uno bisiesto", y con esa regla se equivocó en un calendario: el año 1900 es divisible entre 4 y **no** fue bisiesto, mientras que el año 2000, que también es divisible entre 4, **sí** lo fue. La regla verdadera del calendario gregoriano tiene una excepción, y esa excepción tiene a su vez otra excepción. Por eso casi nadie la recuerda completa, y por eso vale la pena que sea el computador el que la aplique.

Escribe un programa que le pida a la secretaria un año, le diga si ese año es bisiesto o no, y le muestre cuántos días tiene febrero ese año: 29 si es bisiesto, 28 si no lo es.

### Datos de entrada

| Variable | Tipo | Qué significa |
|---|---|---|
| `anio` | Entero | El año que se quiere verificar. Un año siempre es un número entero: no existe el año 2024.5 |

### Datos de salida

| Salida | Qué significa |
|---|---|
| El año ingresado | Se muestra de vuelta para que la secretaria confirme que no se equivocó al teclear |
| El veredicto | Una línea que diga si ese año **sí** es bisiesto o **no** lo es |
| `diasFebrero` | Cuántos días tiene febrero ese año: 29 o 28 |

### La lógica que necesitas

**La regla oficial del calendario gregoriano.** Esto es un dato del problema, así que te la damos completa:

1. Un año es bisiesto si es **divisible entre 4**,
2. pero **no** lo es si además es divisible entre 100,
3. **salvo** que también sea divisible entre 400, en cuyo caso sí lo es.

Lee las tres líneas otra vez, despacio. La 1 pone la regla general, la 2 le quita un pedazo y la 3 le devuelve un pedazo a lo que la 2 le había quitado.

**Cómo se pregunta "es divisible entre N".** En PSeInt no existe ninguna función que responda eso; la tienes que armar tú con el operador `%`, el mismo del Ejercicio 8 del cuadernillo anterior, el de los segundos. `anio % 4` es **lo que sobra** al dividir el año entre 4. Si no sobra nada, es porque la división fue exacta, y eso es exactamente lo que quiere decir "divisible entre 4".

**Los operadores que vas a necesitar.** Los tres primeros son nuevos. El cuarto te va a servir para escribir la palabra "no" de la regla 2:

| Operador | Cómo se lee | La condición completa es verdadera cuando... |
|---|---|---|
| `Y` | "y" | las dos condiciones que une son verdaderas **al mismo tiempo** |
| `O` | "o" | **por lo menos una** de las dos condiciones que une es verdadera |
| `NO` | "no" | la condición que lleva adelante es falsa, es decir, le da la vuelta |
| `<>` | "distinto de" | los dos valores que compara **no** son iguales |

**La estructura del programa** es la misma que ya conoces. Lo único que cambia es lo que va en el lugar de la condición:

```
Si <aquí va tu condicion, y ese es todo el ejercicio> Entonces
    ... el anio SI es bisiesto ...
    ... febrero tiene 29 ...
SiNo
    ... el anio NO es bisiesto ...
    ... febrero tiene 28 ...
FinSi
```

**Antes de escribir esa condición, llena esta tabla en papel.** La última columna ya te la damos; las tres del medio son tu trabajo. Responde cada casilla con Verdadero o Falso:

| Año | ¿Divisible entre 4? | ¿Divisible entre 100? | ¿Divisible entre 400? | ¿Es bisiesto? |
|---|---|---|---|---|
| 2024 | | | | Sí |
| 2023 | | | | No |
| 1900 | | | | No |
| 2000 | | | | Sí |

Cuando la tengas llena, léela de a dos filas. Fíjate sobre todo en 1900 y 2000: dan resultados contrarios, así que algo los tiene que diferenciar. Ahí está la clave del ejercicio. Hay dos preguntas que se tienen que cumplir **al mismo tiempo** para que un año corriente sea bisiesto, y hay una tercera pregunta que, cuando se cumple, **basta por sí sola** para que el año sea bisiesto aunque las otras digan que no. Uno de esos dos comportamientos se escribe con `Y` y el otro con `O`. Te toca decidir cuál es cuál, y usar paréntesis para que quede claro qué va agrupado con qué.

### Así se debe ver funcionando

Estas son tres corridas del programa terminado. Lo que aparece después del signo `>` es lo que escribió el usuario por teclado.

**Un año bisiesto corriente:**

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

**El caso que rompe la regla de "cada cuatro años".** 1900 es divisible entre 4, así que casi todo el mundo diría que fue bisiesto. No lo fue:

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

**Y la excepción de la excepción.** 2000 es divisible entre 4 y también es divisible entre 100, igual que 1900, y sin embargo el resultado es el contrario:

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

Si tu programa acierta con 2024 pero se equivoca con 1900, o acierta con 1900 pero se equivoca con 2000, no lo des por bueno: te falta una de las tres preguntas. Pruébalo siempre con los cuatro años (2024, 2023, 1900 y 2000) antes de decir que ya quedó.

### Pistas

1. Empieza por lo pequeño. Antes de armar la condición completa, escribe un programa de tres líneas que solo muestre en pantalla cuánto valen `anio % 4`, `anio % 100` y `anio % 400` para el año que se teclee. Córrelo con los cuatro años de arriba y compara esos números con la tabla que llenaste en papel. Cuando veas que coinciden, ya tienes las tres piezas del ejercicio y lo único que falta es unirlas.

2. **Cuidado, este es el error típico de este ejercicio:** preguntar únicamente si el año es divisible entre 4 y quedarse ahí. Ese programa acierta con 2024, acierta con 2023 y acierta con 2000. Tres de cada cuatro. Un programa que acierta tres de cada cuatro veces parece correcto, se entrega tranquilo y solo falla el día que alguien consulta un año de siglo. PSeInt no te va a avisar nada: la sintaxis queda perfecta, el programa corre sin quejarse y la respuesta está mal. La única manera de darte cuenta es probar con 1900.

3. La palabra "no" de la regla 2 se puede escribir de dos maneras distintas dentro de tu condición: negando la pregunta completa, o comparando el residuo contra cero con el operador de "distinto de" que está en la tabla de arriba. Las dos funcionan y las dos dan lo mismo. Escoge la que a ti te resulte más fácil de leer en voz alta, porque una condición que se entiende sola vale más que una que hay que descifrar.

4. Los paréntesis no son adorno. PSeInt tiene sus propias reglas sobre cuál operador lógico resuelve primero, igual que resuelve la multiplicación antes que la suma. Si escribes la condición sin paréntesis puede que te funcione, pero quien la lea después no va a estar seguro de lo que querías decir, y tú tampoco dentro de una semana. Agrupa con paréntesis lo que va junto.

5. Mira las corridas con cuidado: la línea de febrero aparece siempre, por los dos caminos, y lo único que cambia es el número. Eso te está diciendo que el 29 o el 28 se decide **adentro** del `Si`, guardándolo en `diasFebrero`, y que la línea que lo muestra en pantalla se escribe **una sola vez**, después del `FinSi`. Si terminas escribiendo esa misma línea dos veces, una en cada rama, párate y piénsalo otra vez.

### Cómo se debe llamar tu archivo

- Guarda el archivo como: `PSC/Ejercicio_06_AnioBisiesto.psc`
- El algoritmo se debe llamar exactamente `AnioBisiesto`, así que la primera línea del programa es `Algoritmo AnioBisiesto`.
- El archivo va limpio: sin comentarios, sin emojis, sin tildes ni eñes dentro del código. Por eso la variable se llama `anio` y no `año`, y por eso los mensajes que muestra el programa dicen `El anio 2024 SI es bisiesto`, sin tilde. En este documento `.md` sí escribimos "año" con su ortografía completa; dentro del `.psc` no.

---

## Ejercicio 7 — Clasificar un triángulo por sus lados

### Lo que vas a practicar

Validar primero, clasificar después. Hasta ahora tus programas confiaban en que el dato que entraba servía; este no puede darse ese lujo. Un `Si` exterior revisa que las medidas tengan sentido, y **todo el resto del programa vive dentro de su `SiNo`**: si los datos no sirven, no se clasifica nada, porque no habría nada que clasificar.

Además vas a usar `Y` y `O` en el mismo programa, en condiciones distintas. En el ejercicio anterior los conociste; aquí toca decidir cuál de los dos va en cada sitio, y esa decisión no se toma de memoria: se toma preguntándote si tienen que cumplirse todas las condiciones o si con una sola ya basta.

### El problema

En un taller de ornamentación en Yumbo cortan láminas triangulares para las rejas de las ventanas. El maestro recibe las tres medidas del triángulo que le pidieron y, antes de prender la cortadora, necesita saber dos cosas. La primera, si con esas tres medidas de verdad se puede armar un triángulo, porque no cualquier terna de números da una figura cerrada. La segunda, de qué tipo es, porque los triángulos de tres lados iguales se cortan con una plantilla que ya tienen hecha y los demás hay que trazarlos uno por uno sobre la lámina.

Más de una vez han dañado lámina cortando con medidas imposibles: alguien anotó mal un número, nadie lo revisó, y el pedazo se perdió. Lámina de esa no es barata.

Te pidieron un programa que reciba las tres medidas en centímetros y responda con claridad: o bien que la medida no es válida, o bien que con esos números no existe ningún triángulo, o bien de qué tipo es el triángulo que van a cortar.

### Datos de entrada

| Variable | Tipo | Qué significa |
|---|---|---|
| `ladoA` | Real | Longitud del primer lado, en centímetros |
| `ladoB` | Real | Longitud del segundo lado, en centímetros |
| `ladoC` | Real | Longitud del tercer lado, en centímetros |

### Datos de salida

| Salida | Qué significa |
|---|---|
| Los tres lados | Las medidas que quedaron registradas, cada una con su unidad en centímetros |
| Aviso de medida no válida | Cuando alguna de las tres medidas no puede ser la longitud de un lado |
| Aviso de triángulo imposible | Cuando las tres medidas son válidas pero con ellas no se cierra ninguna figura |
| Tipo de triángulo | `EQUILATERO`, `ISOSCELES` o `ESCALENO`, junto con la indicación de si se corta con plantilla o se traza a mano |

De esos tres últimos mensajes aparece **uno solo** en cada ejecución. Nunca dos.

### La lógica que necesitas

Son tres preguntas encadenadas, y el orden en que se hacen no es negociable.

**Primera pregunta: ¿las medidas sirven?**

El lado de un triángulo es una distancia, y una distancia no puede ser cero ni negativa. Si alguna de las tres medidas es menor o igual que cero, el dato está malo y ahí se acaba el trabajo: se avisa y no se clasifica nada.

**Segunda pregunta: ¿con esas medidas existe un triángulo?**

Aquí entra una regla de geometría que se llama **desigualdad triangular**, y es un dato del problema, no algo que tengas que deducir. Dice que la suma de cada par de lados tiene que ser mayor que el lado que queda. Son tres comprobaciones, una por cada pareja posible:

```
lado A + lado B   tiene que ser mayor que   lado C
lado A + lado C   tiene que ser mayor que   lado B
lado B + lado C   tiene que ser mayor que   lado A
```

La razón se ve fácil con dos varillas. Clava sobre la mesa una varilla de 10 cm: ese es el lado C. Ahora toma una de 1 cm y otra de 2 cm, únelas cada una a un extremo de la primera y trata de juntar sus puntas libres para cerrar la figura. Entre las dos suman 3 cm y tienen que cubrir 10 cm de distancia: se quedan cortas, las puntas nunca se tocan y el triángulo no existe. Números perfectamente válidos, figura imposible.

**Tercera pregunta: ¿de qué tipo es?**

Solo se llega hasta aquí si el triángulo existe. La clasificación por lados es esta:

| Tipo | Cuándo se le dice así |
|---|---|
| EQUILATERO | Los tres lados miden lo mismo |
| ISOSCELES | Hay al menos una pareja de lados que miden lo mismo |
| ESCALENO | Los tres lados son distintos entre sí |

Así queda el esqueleto del programa. Las condiciones que faltan las tienes que deducir tú; lo que te estoy mostrando es solamente cómo se encajan las estructuras una dentro de otra:

```
Si <alguna medida no sirve> Entonces
    avisar que la medida no es valida
SiNo
    Si <con estas tres medidas si existe un triangulo> Entonces
        Si <...> Entonces
            es EQUILATERO
        SiNo
            Si <...> Entonces
                es ISOSCELES
            SiNo
                es ESCALENO
            FinSi
        FinSi
    SiNo
        avisar que no se puede armar el triangulo
    FinSi
FinSi
```

Cuenta los `FinSi`: son cuatro, uno por cada `Si` que abriste, y se cierran en el orden inverso al que se abrieron. La sangría con TAB no es decoración: es lo único que te va a dejar ver de un vistazo cuál `FinSi` le corresponde a cuál `Si`.

### Así se debe ver funcionando

Estas son corridas reales del programa. El signo `>` no lo escribes tú: lo pone PSeInt para avisarte que está esperando un dato. Lo que aparece después del `>` es lo que tecleó el usuario y luego oprimió Enter; todo lo demás lo imprimió el programa.

Un triángulo de tres lados iguales, el que se corta con plantilla:

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

Ahora el caso de las dos varillas que se quedan cortas. Las tres medidas son positivas, ninguna está mala, y aun así no hay triángulo:

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

Y el caso del dato malo. Fíjate en que el programa ni siquiera alcanza a hablar de tipos de triángulo: se queda en la primera pregunta y no sigue:

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

Estas dos últimas corridas son las que separan un programa terminado de uno a medias. Pruébalas siempre.

### Pistas

1. Escribe el programa por capas, no de un solo golpe. Empieza con la validación: solo el `Si` exterior, con un `Escribir` en cada rama que diga "sirven" y "no sirven". Ejecútalo con 0, 4 y 5, y también con 3, 4 y 5, y comprueba que cae donde debe. Cuando eso funcione, reemplaza la rama de "sirven" por la desigualdad triangular y vuelve a probar. Y de último, la clasificación. Cada capa que agregues se prueba antes de seguir con la siguiente.
2. Para escoger el conector de cada condición hazte esta pregunta: ¿cuántas cosas tienen que pasar? En la validación, con que **un solo** lado esté malo el dato ya no sirve; no hace falta que estén malos los tres. En la desigualdad triangular es al revés: si falla una sola de las tres comprobaciones no hay figura, así que **las tres** se tienen que cumplir. Esas dos frases, "con una basta" y "tienen que ser todas", son exactamente los dos conectores que aprendiste en el ejercicio anterior.
3. **Cuidado, este es el error típico de este ejercicio: preguntar por el isósceles antes que por el equilátero.** Con 3, 4 y 5 tu programa va a acertar. Con 5, 5 y 8 también. Y con 5, 5 y 5 te va a responder ISOSCELES sin dar ni un solo mensaje de error, porque un triángulo de tres lados iguales también tiene dos lados iguales. Piensa cuál de los dos tipos es un caso especial del otro y a cuál le toca preguntarse primero. Compara tu salida contra la primera corrida de arriba antes de dar el ejercicio por bueno.
4. Los tres lados van de tipo Real, no Entero: una lámina puede medir 7.5 cm de lado. Y los decimales se escriben con punto, nunca con coma: `7.5`, no `7,5`.
5. Dentro de un `Si`, el signo `=` compara, no asigna. Para preguntar si dos lados miden lo mismo se escribe `ladoA = ladoB`; la flecha `<-` ahí adentro no tiene nada que hacer.

### Cómo se debe llamar tu archivo

Guarda tu solución en `PSC/Ejercicio_07_ClasificarTriangulo.psc` y ponle al algoritmo el nombre `ClasificarTriangulo`, de modo que la primera línea del archivo sea exactamente `Algoritmo ClasificarTriangulo`.

El archivo va limpio: sin un solo comentario `//`, sin tildes y sin la letra ñ, ni siquiera dentro de los textos que van entre comillas. Por eso el programa escribe `Tipo de triangulo` y `Medida no valida`, sin tilde.

---

## Ejercicio 8 — El día de la semana

### Lo que vas a practicar

Una estructura nueva: `Segun ... Hacer ... FinSegun`. Hasta ahora, cada vez que el programa tenía que escoger entre varias opciones, te tocaba encadenar un `Si` dentro del `SiNo` de otro `Si`, como en el Ejercicio 5. Cuando lo que se compara es una variable contra una lista de **valores exactos** —el 1, el 2, el 3...— existe una forma más corta y mucho más fácil de leer. Esa forma es `Segun`.

Con ella vienen dos cosas más: `De Otro Modo`, que recoge todo lo que no encajó en ningún caso, y la posibilidad de atender varios valores en un mismo caso separándolos por comas. Además es la primera vez que vas a trabajar en serio con el tipo `Caracter`, que en PSeInt no guarda una sola letra: guarda un texto completo.

### El problema

El sistema de turnos de una EPS en Cali guarda el día de la cita como un número del 1 al 7, donde el 1 es lunes y el 7 es domingo. Para la base de datos eso es cómodo, pero el mensaje que le llega al paciente al celular no puede decir "su cita es el día 3": tiene que decir "Miércoles", que es lo que entiende una persona.

Hay un detalle más. En esa sede, sábados y domingos solo se atienden urgencias, así que el recordatorio también tiene que advertirle al paciente si el día que le asignaron es un día hábil o si cae en fin de semana. Y como el número lo digita una persona, de vez en cuando se le va el dedo y escribe un 9 o un 0. Cuando eso pasa, el programa no se puede quedar callado ni inventarse un día: tiene que decir claramente que ese número no es válido.

Escribe un programa que reciba el número del día y muestre tres cosas: el número que recibió, el nombre del día que le corresponde y si ese día es hábil o de fin de semana.

### Datos de entrada

| Variable | Tipo | Qué significa |
|---|---|---|
| `dia` | Entero | Número del día de la semana, del 1 al 7, donde 1 es lunes |

### Datos de salida

| Salida | Qué significa |
|---|---|
| Número recibido | El mismo número que digitó el usuario, para que quede a la vista en el resultado |
| `nombreDia` | El nombre del día en palabras: Lunes, Martes, Miercoles, y así hasta Domingo |
| `tipoDia` | Si ese día es día hábil o si cae en fin de semana |

### La lógica que necesitas

Esta es la tabla de la EPS. Es un dato del problema, no es la solución: úsala tal cual.

| Número | Nombre del día | Tipo de día |
|---|---|---|
| 1 | Lunes | Día hábil |
| 2 | Martes | Día hábil |
| 3 | Miércoles | Día hábil |
| 4 | Jueves | Día hábil |
| 5 | Viernes | Día hábil |
| 6 | Sábado | Fin de semana |
| 7 | Domingo | Fin de semana |
| Cualquier otro número | NO VALIDO | No aplica |

La estructura que vas a usar tiene esta forma. Lo que está entre `<` y `>` son los huecos que te toca llenar a ti:

```
Segun <variable> Hacer
	<valor>:
		<lo que se hace cuando la variable vale ese valor>
	<otro valor>:
		<lo que se hace cuando la variable vale ese otro valor>
	De Otro Modo:
		<lo que se hace cuando no coincidio con ningun caso>
FinSegun
```

Se lee de arriba abajo: PSeInt mira cuánto vale la variable, busca el caso que tenga ese valor exacto, ejecuta lo que hay adentro de ese caso y se salta todo lo demás hasta el `FinSegun`. Si ningún caso coincide, entra por `De Otro Modo`.

Un mismo caso puede atender varios valores a la vez. Se escriben separados por comas, antes de los dos puntos:

```
	<valor>,<valor>,<valor>:
		<lo que se hace para cualquiera de esos tres valores>
```

Tu programa necesita **dos** `Segun`, los dos preguntando por la misma variable `dia`, y van uno detrás del otro, no uno dentro del otro:

1. El primero llena `nombreDia`. Lleva siete casos, uno por cada día, y aquí sí te toca escribirlos uno por uno, porque cada día tiene un nombre distinto.
2. El segundo llena `tipoDia`. Aquí no necesitas siete casos: hay valores que comparten exactamente la misma respuesta, y para eso sirven las comas.

Los dos llevan su `De Otro Modo`, con los textos que dice la última fila de la tabla.

Tres cosas que hay que saber de `Segun` antes de empezar:

- Compara contra **valores exactos**, nunca contra rangos. No existe un caso que diga "de 3 en adelante" ni uno que diga "menor que 4". Por eso el Ejercicio 5, el de clasificar la nota, no se puede escribir con `Segun`: allá las condiciones eran del estilo `nota < 4`, y eso solo lo sabe hacer un `Si`.
- En PSeInt la variable del `Segun` tiene que ser de tipo **Entero** o **Caracter**. Con una variable Real no funciona.
- `De Otro Modo` es el equivalente del último `SiNo` de una escalera de decisiones: es la red que atrapa todo lo que no encajó arriba.

### Así se debe ver funcionando

Estas son tres corridas reales del programa. Lo que aparece después del signo `>` es lo que escribió el usuario por teclado.

Un miércoles, que es día hábil:

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

Un domingo. Fíjate en que el mismo número entra por un caso en el primer `Segun` y por otro caso distinto en el segundo:

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

Y ahora la corrida que de verdad importa, la que decide si tu programa quedó bien o quedó mal: alguien digitó un 9.

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

Si en esta tercera corrida tu programa muestra un día inventado, o deja esas dos líneas raras o vacías, es porque le falta algo. Vuelve a leer la última fila de la tabla.

### Pistas

1. `nombreDia` y `tipoDia` no se leen del teclado: el usuario nunca los escribe. Son variables que tu programa **llena solo**, adentro de los casos. Se declaran Como `Caracter`. Y no te asustes con el nombre del tipo: en PSeInt `Caracter` no guarda una sola letra, guarda un texto completo, así que `"Miercoles"` y `"Fin de semana"` caben enteros.

2. Ármalo por partes. Escribe primero el `Segun` del nombre del día, ejecútalo con `F5` y comprueba que con el 3 sale Miercoles. Solo cuando ese funcione, agrégale el segundo `Segun`. Es mucho más fácil encontrar un error en catorce renglones que en treinta.

3. En el segundo `Segun` no copies y pegues el mismo renglón cinco veces, uno por cada día hábil. Así funciona, sí, pero el día que la EPS cambie el texto del mensaje te toca acordarte de cambiarlo en cinco sitios distintos, y con seguridad se te queda uno sin cambiar. Para eso existen las comas.

4. **Cuidado, este es el error típico de este ejercicio:** dejar el `Segun` sin la rama que recoge lo que no encajó en ningún caso. El programa te va a pasar el chequeo de sintaxis con `F9` sin una sola queja, y con el 3 y con el 7 va a responder perfecto, así que parece terminado. Pruébalo con 9 y mira con calma qué aparece en las dos últimas líneas de la pantalla. Ahí está el ejercicio completo.

5. Dentro del `.psc` los nombres de los días van **sin tildes**: se escribe `Miercoles` y `Sabado`. En este documento sí llevan tilde, pero en el código no, porque la consola de Windows las muestra rotas. Es la misma regla del cuadernillo anterior.

### Cómo se debe llamar tu archivo

- Guarda el archivo como: `PSC/Ejercicio_08_DiaDeLaSemana.psc`
- El algoritmo se debe llamar exactamente `DiaDeLaSemana`, así que la primera línea del programa es `Algoritmo DiaDeLaSemana`.
- El archivo va limpio: sin comentarios, sin emojis, sin tildes ni eñes dentro del código. Las explicaciones van en el documento, nunca dentro del `.psc`.

---

## Ejercicio 9 — Calculadora con menú de opciones

### Lo que vas a practicar

Un `Si` metido **dentro** de un caso de un `Segun`. En el ejercicio anterior cada caso hacía una sola cosa: guardar un texto y ya. Aquí tres de los cuatro casos siguen siendo así de sencillos, pero el cuarto no: antes de calcular tiene que asegurarse de que la operación sea posible.

A eso, en programación, se le llama poner una **guarda**: revisar que algo se pueda hacer antes de intentar hacerlo. Es la costumbre que separa un programa que aguanta a un usuario real de uno que solo funciona cuando los datos llegan perfectos. Y de paso vas a comprobar algo que ya se venía anunciando: las estructuras de decisión se pueden meter unas dentro de otras en cualquier combinación. Un `Si` dentro de otro `Si` ya lo hiciste en el Ejercicio 3 y en el 5. Un `Si` dentro de un `Segun` es exactamente la misma idea.

### El problema

En este mismo repositorio ya hay una calculadora: la de la carpeta `ProyectoCalculadoraSencilla`. Esa pide dos números y muestra de un solo golpe la suma, la resta, la multiplicación y la división. Funciona, pero es incómoda de usar: si lo único que necesitas es multiplicar, igual te toca leer los otros tres resultados para encontrar el que te interesaba.

La versión que te piden ahora trabaja al revés. Primero muestra un menú con las cuatro operaciones numeradas, el usuario escribe el número de la que quiere, y solo entonces el programa pide los dos números y hace **esa** operación y ninguna otra.

Y hay que taparle un hueco que la calculadora anterior tenía abierto. Si el usuario elige dividir y escribe cero como segundo número, el programa no puede seguir como si nada: la división entre cero no está definida en matemáticas. No existe ningún número que multiplicado por cero dé 12, así que ahí no hay ningún resultado correcto que mostrar; lo que hay es un aviso que dar. Lo mismo pasa si el usuario se equivoca al escoger y teclea un 7, que no está en el menú. Tu programa tiene que reaccionar a esas dos situaciones con un mensaje claro y sin inventarse ningún número.

### Datos de entrada

| Variable | Tipo | Qué significa |
|---|---|---|
| `opcion` | Entero | Número de la operación elegida en el menú, del 1 al 4 |
| `num1` | Real | Primer número de la operación |
| `num2` | Real | Segundo número de la operación |

Fíjate en el orden, porque importa: el programa muestra el menú y lee la **opción primero**, y solo después pide los dos números. Los `Leer` van en ese orden.

### Datos de salida

| Salida | Qué significa |
|---|---|
| `nombreOperacion` | La operación elegida escrita en palabras: Suma, Resta, Multiplicacion o Division |
| `num1` y `num2` | Los dos números tal como los escribió el usuario |
| `resultado` | El resultado de la operación, que **solo se muestra si la operación sí se pudo hacer** |
| Aviso en pantalla | El mensaje que explica por qué no hubo resultado: porque la opción no existe o porque se pidió dividir entre cero |

### La lógica que necesitas

Estas son las cuatro operaciones del menú. Es un dato del problema, no la solución:

| Opción | Nombre de la operación | Qué calcula |
|---|---|---|
| 1 | Suma | `num1 + num2` |
| 2 | Resta | `num1 - num2` |
| 3 | Multiplicacion | `num1 * num2` |
| 4 | Division | `num1 / num2`, pero solo si se puede |

Como lo que estás comparando es un valor exacto contra una lista de opciones, la estructura que corresponde es `Segun`, igual que en el ejercicio anterior. La forma general queda así, y lo que va entre `< >` es lo que tienes que resolver tú:

```
Segun <la opcion elegida> Hacer
	1:
		<guardar el nombre de la operacion y calcular>
	2:
		<guardar el nombre de la operacion y calcular>
	3:
		<guardar el nombre de la operacion y calcular>
	4:
		<guardar el nombre de la operacion>
		Si <condicion que tienes que deducir> Entonces
			<avisar que esta operacion no se puede hacer>
		SiNo
			<calcular>
		FinSi
	De Otro Modo:
		<avisar que esa opcion no esta en el menu>
FinSegun
```

Mira la diferencia entre los tres primeros casos y el cuarto. Los tres primeros se resuelven derecho, sin preguntar nada, porque sumar, restar y multiplicar siempre se puede. El cuarto necesita decidir antes de actuar, y por eso lleva adentro un `Si` completo con su `Entonces`, su `SiNo` y su `FinSi`. La condición de ese `Si` es corta, pero tienes que pensarla tú: ¿qué es exactamente lo que hace imposible la división?

Falta una pieza más. Hay **dos** caminos distintos que terminan sin resultado: el de la división entre cero y el de la opción que no existe. En los dos, la variable `resultado` se queda sin ningún valor guardado, y mostrarla sería mostrar basura. Para resolverlo sin repetir el mismo `Escribir` en varios sitios, usa una variable de tipo `Logico` llamada `operacionValida`: la pones en verdadero antes del `Segun`, la cambias a falso en los dos caminos que fallan, y al final el programa decide con ella si muestra o no la línea del resultado.

```
Si <la operacion si se pudo hacer> Entonces
	<mostrar el resultado>
FinSi
```

### Así se debe ver funcionando

Estas son corridas reales del programa. El signo `>` lo pone la propia consola de PSeInt cada vez que el programa se queda esperando un dato; lo que aparece después de ese signo es lo que escribió el usuario por teclado.

**Corrida 1.** El usuario elige la opción 3 y multiplica 12 por 4.

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

**Corrida 2.** El caso que le da sentido al ejercicio: el usuario elige dividir y escribe cero como segundo número.

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

Mira bien el final de esa corrida: se muestran la operación y los dos números, pero la línea del resultado **no aparece por ninguna parte**. No sale un cero, ni un guion, ni un espacio en blanco al lado de una etiqueta. Sencillamente esa línea no se ejecuta.

**Corrida 3.** El usuario se equivoca escogiendo y escribe una opción que no está en el menú.

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

El programa igual pidió los dos números, porque los `Leer` van antes del `Segun` y se ejecutan siempre. Lo que cambia es que no hay ninguna operación que hacer con ellos.

### Pistas

1. El menú no tiene nada de especial: son cuatro líneas de `Escribir` con texto, una por opción, escritas antes del `Escribir Sin Saltar` que pide la opción. No hay ninguna instrucción nueva ahí. Lo único que se necesita es que el usuario vea con claridad qué número corresponde a qué operación.
2. **Cuidado, este es el error típico de este ejercicio:** dejar que el caso 4 haga la división de una vez y preguntar después, ya con el resultado en la mano, si el segundo número era cero. Piénsalo con calma: cuando el programa llega a esa pregunta, la división **ya se ejecutó**. Lo que haya pasado, pasó, y no queda nada por rescatar. Una guarda que se revisa tarde no es una guarda. Acomoda tú el orden.
3. `operacionValida` es de tipo `Logico`, y una variable lógica ya vale por sí sola verdadero o falso: es una condición completa. No necesitas compararla contra nada dentro del `Si`. Escribirla comparada funciona igual, pero es como preguntar "¿es cierto que es cierto?".
4. El `De Otro Modo` aquí no es un adorno ni un detalle de estilo. Es lo único que separa un programa que avisa de uno que se queda callado mostrando una variable a la que nunca se le guardó nada. Antes de dar el ejercicio por terminado, pruébalo con una opción que no exista, como el 7 o el 0.
5. Arma el programa por partes y pruébalo en cada parte. Escribe primero el menú y el `Segun` con los casos 1, 2 y 3, ejecútalo y confirma que las tres operaciones dan bien. Solo cuando eso te funcione le metes el `Si` al caso 4, y de últimas el `De Otro Modo`. Es mucho más fácil encontrar un error entre las cinco líneas que acabas de agregar que entre cuarenta que escribiste de una sentada.

### Cómo se debe llamar tu archivo

Guarda tu programa como `PSC/Ejercicio_09_MenuCalculadora.psc` y el algoritmo se debe llamar exactamente `MenuCalculadora`, es decir, la primera línea del archivo es `Algoritmo MenuCalculadora`.

El archivo va limpio: **sin un solo comentario** `//`, porque PSeInt dibuja una caja extra por cada comentario en el diagrama de flujo y lo ensucia, y **sin tildes ni eñes**, ni siquiera dentro de los textos entre comillas. En el `.psc` se escribe `Multiplicacion`, `Division`, `opcion` y `matematicas`. Las tildes son de los documentos, no del código.

---

## Ejercicio 10 — Liquidación de la factura de energía

### Lo que vas a practicar

Nada nuevo. Léelo otra vez, que no es un error: este ejercicio no trae ni una sola estructura que no hayas usado ya. Trae el `Si ... SiNo` del Ejercicio 1, la escalera de rangos del Ejercicio 5, los operadores lógicos `O` del Ejercicio 6, la idea de validar primero y calcular después del Ejercicio 7, el `Segun ... Hacer` del Ejercicio 8 y los cálculos encadenados del cuadernillo anterior. Lo único nuevo es todo eso junto, en un solo programa.

Lo difícil aquí no es ninguna de las piezas: es la cantidad de piezas. Y eso se resuelve de una sola forma, armando el programa por partes y probando cada parte antes de escribir la siguiente. **Si hiciste los nueve ejercicios anteriores, este lo sacas solo**, sin ayuda de nadie y sin ayuda de ninguna inteligencia artificial. Puede tomarte una tarde entera y puede que te toque ejecutarlo veinte veces; así es como se programa de verdad.

### El problema

En la oficina de una comercializadora de energía del Valle del Cauca hay una auxiliar, doña Marlene, que liquida las facturas del mes. Cada factura depende de tres cosas: el estrato de la vivienda, cuánta energía consumió el usuario y si viene debiendo la factura anterior. Con esos tres datos ella saca la tarifa, el subsidio o la contribución que le corresponde al estrato, el interés de mora si lo hay, el cargo de reconexión si el usuario se atrasó mucho y el cobro del alumbrado público.

Hoy todo eso vive en una hoja de cálculo llena de fórmulas encadenadas que nadie más en la oficina entiende. Cuando doña Marlene sale a vacaciones, la liquidación se paraliza. El jefe quiere un programa que pueda ejecutar cualquiera: que pida los tres datos, que revise que tengan sentido antes de calcular nada y que muestre la liquidación completa con cada concepto por separado, no solo el total, porque cuando un usuario reclama hay que poder mostrarle de dónde salió cada peso.

Escribe ese programa. Si alguno de los tres datos no sirve, el programa no puede liquidar ni inventarse un número: tiene que avisar que los datos son inválidos y quedarse ahí.

### Datos de entrada

| Variable | Tipo | Qué significa |
|---|---|---|
| `estrato` | Entero | Estrato socioeconómico de la vivienda. Va del 1 al 6 |
| `consumo` | Real | Energía consumida durante el mes, en kilovatios hora (kWh) |
| `diasMora` | Entero | Días que lleva vencida la factura anterior. Vale 0 si el usuario está al día |

Los tres se piden en ese orden: primero el estrato, después el consumo y de último los días de mora.

### Datos de salida

| Salida | Qué significa |
|---|---|
| Los tres datos recibidos | El estrato, el consumo y los días de mora, para que queden a la vista antes de la liquidación |
| `tarifa` | El precio del kilovatio hora que le correspondió a ese consumo |
| `valorConsumo` | Lo que vale la energía consumida, antes de subsidios, intereses y demás cobros |
| `tipoAjuste` | Si al usuario le corresponde SUBSIDIO, CONTRIBUCION o NINGUNO |
| `ajuste` | El valor en pesos de ese subsidio o de esa contribución. Va con signo |
| `interes` | El interés que se cobra por los días de mora |
| `reconexion` | El cargo fijo de reconexión, cuando aplica |
| `alumbrado` | Lo que se cobra por alumbrado público |
| `total` | El total a pagar de la factura |
| Aviso de datos inválidos | Aparece cuando alguno de los tres datos no sirve. En ese caso no sale ninguna de las salidas anteriores |

### La lógica que necesitas

Estas son las reglas que te entregó la oficina. Son datos del problema, no la solución: úsalas tal cual.

**1. La tarifa depende del consumo.** Se le aplica **una sola tarifa a todo el consumo**, la del rango en el que caiga. No se cobra por tramos ni se acumula.

| Consumo del mes | Tarifa por kWh |
|---|---|
| Hasta 150 kWh | $520 |
| Más de 150 y hasta 350 kWh | $640 |
| Más de 350 kWh | $780 |

Con la tarifa ya elegida:

```
valorConsumo = consumo * tarifa
```

**2. El subsidio o la contribución dependen del estrato.** Se calculan sobre el valor del consumo. Los porcentajes negativos son subsidios y rebajan la factura; los positivos son contribuciones y la aumentan.

| Estrato | Porcentaje | Cómo se llama |
|---|---|---|
| 1 | -60% | Subsidio |
| 2 | -50% | Subsidio |
| 3 | -15% | Subsidio |
| 4 | 0% | Ninguno |
| 5 | +20% | Contribución |
| 6 | +20% | Contribución |

```
ajuste = valorConsumo * porcentaje / 100
```

Fíjate en que el porcentaje entra con su propio signo. Así una sola línea sirve para los seis estratos: cuando el porcentaje es negativo, el ajuste sale negativo y al sumarlo termina restando.

**3. El interés de mora se calcula sobre el valor del consumo.**

| Días de mora | Interés |
|---|---|
| 0 | $0 |
| De 1 a 30 | 3% del valor del consumo |
| Más de 30 | 6% del valor del consumo |

**4. Reconexión.** Si la mora pasa de 60 días se cobra un cargo fijo de $28.000. Si no, no se cobra nada.

**5. Alumbrado público.** Los estratos 5 y 6 pagan $12.000. Los estratos del 1 al 4 pagan $6.000.

**6. El total a pagar.**

```
total = valorConsumo + ajuste + interes + reconexion + alumbrado
```

**7. Validación.** Los datos no sirven si el estrato se sale del rango de 1 a 6, **o** si el consumo es negativo, **o** si los días de mora son negativos. Basta con que una sola de esas tres cosas ocurra para que la factura no se pueda liquidar.

Hasta aquí llegan las reglas del negocio. Ahora, la forma.

La validación es una sola pregunta con tres condiciones unidas por `O`, y **toda** la liquidación vive dentro de su `SiNo`. Lo que está entre `<` y `>` son los huecos que te toca llenar a ti:

```
Si <alguno de los tres datos no sirve> Entonces
	<avisar que la factura no se puede liquidar>
SiNo
	<aqui adentro va TODA la liquidacion>
FinSi
```

Adentro te esperan seis decisiones más, y ya sabes escribir todas. La tarifa es una escalera de rangos, igual a la de los desempeños del Ejercicio 5:

```
Si <primer rango de consumo> Entonces
	<tarifa que le corresponde>
SiNo
	Si <segundo rango de consumo> Entonces
		<tarifa que le corresponde>
	SiNo
		<tarifa del ultimo rango>
	FinSi
FinSi
```

El porcentaje del estrato no es un rango sino una lista de valores exactos, del 1 al 6, así que ahí va un `Segun`. Y hay dos estratos que comparten el mismo porcentaje, con lo cual ya sabes que no necesitas seis casos escritos uno por uno:

```
Segun <variable> Hacer
	<valor>:
		<porcentaje que le corresponde>
	<valor>,<valor>:
		<porcentaje que comparten esos dos>
	De Otro Modo:
		<...>
FinSegun
```

El interés es otra escalera de rangos. El `tipoAjuste` es un `Si` anidado de tres caminos, como el de Ana y Carlos del Ejercicio 3, y sale de mirar el signo del porcentaje, no del estrato. La reconexión y el alumbrado son dos `Si ... SiNo` sencillos, de un renglón por rama. Y el total es una sola suma, la última línea de todas.

### Así se debe ver funcionando

Estas son tres corridas reales del programa. Lo que aparece después del signo `>` es lo que escribió el usuario por teclado.

Un usuario de estrato 2 que está al día. Le corresponde tarifa de $640 porque 200 kWh cae en el rango del medio, y un subsidio del 50%, que es la razón por la que el valor del ajuste sale con signo menos:

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

Ahora una corrida que cae justo en dos fronteras al mismo tiempo: consumo de 150 kWh exactos y 60 días de mora exactos. Mira con lupa la tarifa y la reconexión, y compáralas con lo que dicen la tabla 1 y la regla 4. Aquí es donde este ejercicio separa a los programas que están bien de los que solo lo parecen:

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

Y la corrida del dato imposible: alguien digitó estrato 8. El programa muestra lo que recibió, avisa y no liquida nada. Fíjate en que después del aviso no aparece ni la tarifa ni el total:

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

Si con el estrato 8 tu programa alcanza a mostrar un total, es porque la liquidación no está donde debe estar.

### Pistas

1. **Ármalo por partes y prueba cada parte antes de seguir.** Esta es la pista más importante del cuadernillo entero y es la razón de ser de este ejercicio. No escribas los sesenta renglones de una sentada para ejecutarlos al final: si algo falla no vas a tener idea de en cuál de las siete decisiones está el error. Hazlo así: primero el banner y los tres `Leer`, ejecuta con `F5` y comprueba que los datos entran bien. Agrégale solo la escalera de la tarifa, muéstrala en pantalla y pruébala con 100, con 200 y con 400. Después el `Segun` del estrato, y muestra el porcentaje. Después el interés, y así hasta el total. Cada vez que agregues una pieza, ejecuta. Cuando algo falle, el error va a estar en lo último que escribiste, no en lo que ya habías probado. Buscar un error en diez renglones nuevos es fácil; buscarlo en sesenta es una pesadilla.

2. **La validación va afuera y la liquidación va adentro de su `SiNo`.** Si dejas los cálculos por fuera, con un estrato 8 el programa va a liquidar igual: le va a poner el porcentaje que le corresponda a "ningún estrato", va a sumar el alumbrado y va a mostrar un total con toda la calma del mundo. Ese total es falso y PSeInt no te va a advertir absolutamente nada. Por eso la corrida del estrato 8 es obligatoria antes de entregar.

3. **Cuidado, este es el error típico de este ejercicio:** el ajuste y el interés se calculan **sobre el valor del consumo**, no sobre lo que va quedando de la factura a medida que le vas agregando cobros. Es facilísimo escribir el interés sobre el valor ya subsidiado, porque uno viene pensando en cadena y le parece natural seguir con el número que acaba de calcular. Compruébalo tú mismo con la corrida del estrato 3: saca a mano el 6% de $78.000 y saca aparte el 6% de $78.000 menos el subsidio. Te van a dar dos números distintos, y el programa va a mostrar sin quejarse el que tú hayas escrito.

4. **El estrato 4 necesita su propio caso dentro del `Segun`, aunque su porcentaje sea cero.** Da la tentación de no escribirlo, total no rebaja ni suma nada. Pero si lo omites, el estrato 4 se va a ir por `De Otro Modo`, que es la rama de los datos que no existen, y de ahí en adelante esa variable deja de estar bajo tu control. Cuando un caso vale cero, el cero se escribe.

5. **Prueba las fronteras, no solo los casos cómodos.** Ejecuta con consumo de 150 y de 350 exactos, y con 30 y con 60 días de mora exactos. Las tablas dicen "hasta" en unas filas y "más de" en otras, y esa diferencia de una sola palabra es la que decide entre `<` y `<=`. Un programa que acierta con 200 kWh y falla con 150 se ve perfecto hasta el día en que llega una factura de 150.

### Cómo se debe llamar tu archivo

- Guarda el archivo como: `PSC/Ejercicio_10_LiquidacionFacturaEnergia.psc`
- El algoritmo se debe llamar exactamente `LiquidacionFacturaEnergia`, así que la primera línea del programa es `Algoritmo LiquidacionFacturaEnergia`.
- El archivo va limpio: sin comentarios, sin emojis, sin tildes ni eñes dentro del código, tampoco en los textos entre comillas. Este es el programa más largo del cuadernillo y va a llevar bastantes `Escribir`; revísalos uno por uno antes de entregar.

---

## Cuando termines los diez

Antes de entregar, revisa esta lista sobre **cada** archivo:

- [ ] El algoritmo se llama exactamente como pide el enunciado.
- [ ] Todas las variables están declaradas con `Definir ... Como ...;`.
- [ ] Todas las instrucciones terminan en punto y coma.
- [ ] Cada `Si` tiene su `FinSi`, y cada `Segun` tiene su `FinSegun`.
- [ ] **Ejecutaste el programa una vez por cada camino**, con los datos que pide la tabla de casos de prueba del enunciado.
- [ ] Probaste el caso de la frontera: el valor exacto donde cambia la respuesta.
- [ ] Los resultados de cada corrida los comprobaste a mano con una calculadora.
- [ ] No hay ni un comentario `//` dentro del `.psc`.
- [ ] No hay tildes ni ñ dentro del `.psc`, tampoco en los textos entre comillas.
- [ ] `F9` no reporta ningún error.
- [ ] Los datos se piden con un mensaje que explica qué se espera, no con un `Leer` a secas.
- [ ] Los resultados salen con una etiqueta, no como números sueltos.

Si algún ejercicio tiene un camino que nunca lograste ejecutar, no lo entregues todavía: o los datos de prueba están mal escogidos, o ese camino es inalcanzable y la condición está mal escrita. Las dos cosas hay que arreglarlas.

Las soluciones explicadas están en [Soluciones.md](Soluciones.md).
