# Ejercicios 2 — Estructuras de decisión

### Cuadernillo de 10 ejercicios en PSeInt

> **Criterio de evaluación que cubre:** plantear una solución algorítmica que use **estructuras de decisión** — condicionales simples, compuestas, anidadas y de selección múltiple — para que el programa tome un camino u otro según los datos que reciba.
> **Requisito previo:** haber hecho [Ejercicios_1](../Ejercicios_1/README.md). Aquí se da por sabido leer, calcular y mostrar.
> **Para quién es:** los mismos estudiantes de colegio y de primer semestre del cuadernillo anterior.
> **Perfil de PSeInt:** Estricto.

---

## Qué cambia respecto a Ejercicios_1

En el cuadernillo anterior todos los programas eran una línea recta: se leía, se calculaba y se mostraba, siempre en el mismo orden y siempre las mismas instrucciones. No importaba qué datos escribiera el usuario, el programa hacía exactamente lo mismo.

Aquí eso se acaba. Un programa con **decisiones** se parte en caminos, y según el dato que entre recorre uno y deja el otro sin ejecutar ni una sola vez.

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

Eso trae un problema nuevo que en Ejercicios_1 no existía: **ya no basta con probar el programa una vez.** Si tu programa tiene dos caminos y solo probaste uno, no sabes nada del otro. Por eso, de aquí en adelante, cada ejercicio se prueba con varios juegos de datos, y siempre hay uno escogido a propósito para caer justo en la frontera entre un camino y el otro.

---

## Qué hay en esta carpeta

| Archivo | Qué es | Cuándo se usa |
|---|---|---|
| [Ejercicios.md](Ejercicios.md) | Los 10 enunciados, **sin resolver** | Es lo primero que se abre |
| [Soluciones.md](Soluciones.md) | Las 10 soluciones explicadas paso a paso | Solo después de intentar |
| [PSC/](PSC/) | Los 10 programas `.psc` listos para abrir en PSeInt | Para ejecutar y comparar |

```
Ejercicios_2/
├── README.md            <- este archivo
├── Ejercicios.md        <- los 10 enunciados
├── Soluciones.md        <- las 10 soluciones explicadas
└── PSC/
    ├── Ejercicio_01_MayorDeEdad.psc
    ├── Ejercicio_02_NumeroParImpar.psc
    ├── Ejercicio_03_MayorDeDosNumeros.psc
    ├── Ejercicio_04_DescuentoPorCompra.psc
    ├── Ejercicio_05_ClasificarNota.psc
    ├── Ejercicio_06_AnioBisiesto.psc
    ├── Ejercicio_07_ClasificarTriangulo.psc
    ├── Ejercicio_08_DiaDeLaSemana.psc
    ├── Ejercicio_09_MenuCalculadora.psc
    └── Ejercicio_10_LiquidacionFacturaEnergia.psc
```

---

## Los diez ejercicios

Están ordenados de menor a mayor dificultad, y cada uno introduce **un** concepto nuevo. Ninguno repite el concepto del anterior: si te saltas uno, el siguiente te va a quedar cojo.

| # | Ejercicio | Concepto nuevo que introduce |
|---|---|---|
| 1 | ¿Es mayor de edad? | El `Si ... Entonces ... SiNo ... FinSi`: el programa se parte en dos caminos |
| 2 | ¿Par o impar? | La condición se calcula antes: `%` para el residuo, y `=` que compara en vez de asignar |
| 3 | ¿Quién vendió más? | El `Si` anidado: tres caminos posibles, incluido el empate |
| 4 | Descuento por monto de compra | La decisión cambia un **número**, no solo un mensaje |
| 5 | Clasificar el desempeño de una nota | La escalera de rangos: el orden de las condiciones no es libre |
| 6 | ¿El año es bisiesto? | Los operadores lógicos `Y`, `O`, `NO` y los paréntesis que los agrupan |
| 7 | Clasificar un triángulo por sus lados | Validar primero, clasificar después: `Y` y `O` en el mismo programa |
| 8 | El día de la semana | `Segun ... Hacer`, `De Otro Modo` y varios valores en un mismo caso |
| 9 | Calculadora con menú de opciones | Un `Si` dentro de un `Segun`: la guarda contra la división entre cero |
| 10 | Liquidación de la factura de energía | Integración: validación + escalera + `Segun` + lógicos + cálculos |

Los primeros nueve son de un solo concepto y se resuelven en pocos renglones. **El décimo es distinto:** es largo, junta todo lo anterior y es el que se parece a un programa de verdad. No es más difícil, es más grande — y se resuelve armándolo por partes, no de una sentada.

Ninguno de los diez necesita repeticiones (`Mientras`, `Para`, `Repetir`). Eso viene en el siguiente cuadernillo.

---

## Cómo trabajar

1. Abre PSeInt y ponlo en perfil **Estricto** (`Configurar → Opciones del lenguaje`).
2. Lee el enunciado del ejercicio en [Ejercicios.md](Ejercicios.md).
3. Antes de tocar el teclado, escribe en papel cuáles son las **entradas**, cuál es la **condición** que decide, qué pasa **si se cumple** y qué pasa **si no**.
4. Escribe tu programa y guárdalo con el nombre que indica el enunciado.
5. Revisa la sintaxis con `F9` y ejecútalo con `F5`.
6. **Ejecútalo una vez por cada camino.** Un programa con tres caminos se prueba tres veces, como mínimo. Cada enunciado te dice con qué datos probar y qué debe salir.
7. Si un resultado no cuadra, ejecuta con `F4` (paso a paso) y mira qué valor tiene la variable **justo antes** del `Si`. Ahí se ve por qué tomó el camino equivocado.
8. Cuando ya te funcione, compara con [Soluciones.md](Soluciones.md) y lee la sección de errores comunes.

---

## Lo que más se equivoca en este cuadernillo

Estos cuatro errores explican casi todo lo que sale mal aquí. Vale la pena leerlos antes de empezar, no después.

**1. Probar un solo camino.** Es el error de fondo de todo el cuadernillo. El programa corre, muestra algo razonable y uno lo da por bueno — pero solo se ejecutó una de las ramas. La otra puede estar completamente rota y no hay forma de enterarse sin probarla.

**2. Equivocarse en la frontera.** `>` y `>=` se parecen tanto que uno los escribe sin pensar. La diferencia aparece en un único valor: el del borde. Por eso casi todos los ejercicios traen un caso de prueba que cae justo ahí.

**3. Olvidar un caso.** El `SiNo` significa "en todos los demás casos", y adentro de "todos los demás" muchas veces caben dos situaciones distintas que había que separar. El empate del Ejercicio 3 es el ejemplo clásico.

**4. Confundir `=` con `<-`.** Dentro de un `Si`, el signo `=` **compara**. Fuera de un `Si`, para guardar un valor se usa la flecha `<-`. Son dos cosas distintas y PSeInt no las deja intercambiar.

Fíjate en algo que tienen en común los tres primeros: **PSeInt no avisa de ninguno.** No son errores de sintaxis, son errores de lógica. El programa corre, no se queja y entrega un resultado equivocado con toda naturalidad. La única defensa contra ellos es probar cada camino y comprobar los números a mano.

---

## Dos reglas del código que no son negociables

Las mismas de Ejercicios_1, y por las mismas razones.

**1. El `.psc` no lleva comentarios.** PSeInt dibuja cada comentario como una caja extra en el diagrama de flujo (`Ctrl + D`), lo ensucia y a veces impide generarlo. En este cuadernillo importa más que en el anterior: el diagrama de un programa con decisiones ya trae sus propios rombos y ramas, y llenarlo de cajas de texto lo vuelve ilegible. Todas las explicaciones viven en `Soluciones.md`.

**2. El `.psc` no lleva tildes ni ñ**, ni siquiera dentro de los textos entre comillas. La consola de Windows las muestra rotas. Se escribe `Area`, `numero`, `calculo`, `anio`, `desempeno`. Los documentos `.md` sí van con ortografía completa.

---

## Verificación

Los diez archivos `.psc` de esta carpeta fueron **ejecutados realmente** con el intérprete de PSeInt bajo el perfil Estricto, y **cada camino de cada programa se ejecutó por separado**. Las salidas que aparecen en la sección **7. Ejecución real verificada** de cada solución son la salida literal del programa, no un ejemplo escrito a mano.
