#Enunciado

## Segundo Parcial 1c 2022 - Algoritmos 3 - FIUBA

Como sabemos la afición de nuestro cliente es estudiar las avispas simulando su ciclo reproductivo. Con nuestro trabajo anterior ha podido obtener conclusiones interesantes, pero para poder avanzar necesita controlar las poblaciones de orugas y polillas de las cuales se alimentan las avispas.

## Variación poblacional

Debido a que el ciclo de vida de las avispas es por temporada (1 año) se requiere poder definir cuántas orugas y polillas hay disponibles en cada temporada. Al final de cada temporada tanto las orugas como las polillas mueren y vuelve a gestarse una nueva generación. Para ello, nuestro modelo debe soportar las siguientes formas de variación:

1. **Variación poblacional constante:** temporada tras temporada se gestará el mismo número de individuos. Por ejemplo, se debe poder indicar una población de 20 orugas y una de 35 polillas, y  temporada tras temporada se volverán a gestar 20 orugas y 35 polillas. Es importante notar que ese número de individuos debe ser mayor o igual a cero.
2. **Variación según población actual:** en cada nueva temporada el tamaño de la población se modifica según una **tasa** (por ejemplo 20/100) **del tamaño de la población que finalizó la temporada anterior**. La fórmula es la siguiente, sea t la tasa, f la población al fin de la temporada, entonces la población de la siguiente temporada será:
`f + (f*t) truncated`
Por ejemplo, si la tasa de variación es 20/100 y la población al finalizar la temporada cero es de 9 orugas, en la temporada uno la población de orugas será de 10 (9 + (9*20/100)),y  en la temporada dos será de 12 (10 + (10*20/100)), y así sucesivamente, esto asumiendo que no varió la población en el transcurso de la temporada. Notar aquí que se incrementa únicamente la parte entera de 9*20/100 y 10*20/100. Esto en Cuis lo pueden resolver utilizando el menaje `#truncated`.

3. **Variación según población inicial:** en cada nueva temporada el tamaño de la población se modifica a partir de una **tasa del tamaño de la población que inició la temporada anterior**. La fórmula es la siguiente, sea t la tasa, i la población al inicio de temporada, entonces la población de la siguiente temporada será: 
`i + (i*t) truncated`
Por ejemplo, si la tasa de variación es 20/100 y la población inicial de orugas es de 10, en la temporada uno la población de orugas será de 12 (10 + (10*20/100)). Y en la temporada dos será de 14 (12 + (12*20/100)). Notar nuevamente que se incrementa únicamente la parte entera.

Recordar que las poblaciones de orugas y polillas pueden variar a lo largo de una temporada, es decir el tamaño de la población al terminar la temporada puede ser diferente al del inicio. Esto puede ocurrir usando los mensajes `Habitat >> #tomarUnaOrugaSiNoHayHace:` y `Habitat >> #tomarUnaPolillaSiNoHayHace:`

## Variación poblacional selectiva

Por último, el cliente necesita **establecer para determinados números de temporadas una variación poblacional y para el resto otra diferente**. Es decir quiere elegir cualquier conjunto de temporadas e indicar cualquiera de las tres formas de variaciones antes detalladas y para las temporadas no incluidas en el conjunto anterior poder indicar otra variación diferente. Con esta funcionalidad se podría por ejemplo establecer que para las temporadas 1, 5 y 7 una variación según población inicial y para el resto una variación según población actual. 

## Extensibilidad de las variaciones poblaciones

El cliente nos ha comentado que en el corto plazo espera poder agregar otras variaciones poblacionales, por lo que nuestro modelo debe ser lo suficientemente flexible para poder incluir fácilmente estos futuros requerimientos.

## Extensibilidad de las poblaciones

También se quiere más adelante agregar otro tipo de poblaciones (el cliente habló de arañas)

## Modalidad de trabajo

Nuestra tarea es **modelar lo pedido mediante TDD y siguiendo las heurísticas de diseño** vistas durante toda la cursada de la materia.
En su modelo final **deben pasar todos los tests**. Tanto los que agregue en su recorrido en TDD como los ya existentes en el código inicial.

## Ayudas:

Pueden cargar como código inicial AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4.Inicial.st, ahí encontrarán un código muy similar a la solución del parcial anterior. La modificación más sustancial es que el `Habitat` es inicializado con un tamaño para la población de orugas y otro tamaño para la población de polillas. Además se borraron los mensajes `Habitat >> #gestarCantidadDeOrugas:` y `Habitat >> #gestarCantidadDePolillas:`. Les recomendamos continuar su trabajo usando la clase de test `ControlPoblacionalTest`. 

Prioricen la calidad del trabajo en este orden:
 
i. TDD (tener tests en un orden y granularidad acorde a TDD)
ii. Modelo (nombres, no repetir código, claridad, etc)
iii. Correctitud de tests (repetición de código, claridad, etc)
iv. Nombre de los tests (nombres claros de los tests)

# Entrega del examen 

1. Tienen tiempo para entregarlo hasta las 14hs. No serán tomadas en cuenta las entregas posteriores a ese horario (estricto). 
2. Recuerden grabar la imagen con frecuencia e ir haciendo file-outs de lo que vayan haciendo. No se aceptarán explicaciones del estilo “se me colgó la máquina” o “perdí todo” como motivos de no entrega. 
3. Entregar el fileout de la categoría “AlgoIII-2022-1C-2Parcial-AvispasYAbejas-P4”, que debe incluir toda la solución (modelo y tests). 
4. Entregar también el archivo que se llama CuisUniversity-nnnn.user.changes. 
5. Probar que el archivo generado en el paso 1 se cargue correctamente en una imagen “limpia” (o sea, sin la solución que crearon) y que todo funcione correctamente. Verifiquen que los nombres de los colaboradores sean los correctos (y no temp1). Esto es fundamental para que no haya problemas de que falten clases/métodos/objetos en la entrega. 
6. Realizar la entrega enviando mail A LA LISTA DE DOCENTES 
fiuba-algoritmos-iii-doc@googlegroups.com con el Asunto: "Nro Padrón: nnnn - Solución del 2do Parcial 2022 1c" 
7. Al enviar la solución deben esperar a recibir una confirmación de recepción ANTES de retirarse del aula. Recién una vez recibida la confirmación, puede retirarse. 


