- ¿Por qué es mala práctica usar SELECT * en producción? Mencioná al menos dos razones concretas (rendimiento, mantenibilidad, seguridad).

Usar SELECT * en producción es mala práctica, ya que no siempre se necesita la totalidad de columnas de una tabla. La herramienta SELECT se la puede hacer sacar provecho para ser específicos y trabajar la eficiencia en los reportes y en la sintaxis. Y, además, al trabajar con grandes volúmenes de datos puede llevar bajar el rendimiento con la carga de datos. 
Por ejemplo, para la tabla sales de este módulo, si se necesita  conocer el precio unitario de cada producto, no es conveniente realizar:
                                  SELECT * FROM sales;
Nos encontraremos con datos que no nos interesa conocer y perderíamos tiempo en la lectura.
Al hacer:
                                  SELECT product_id, unit_price FROM sales;
Damos con los datos específicos de la consulta y nos da la seguridad de los datos que queremos saber. No estaríamos perdiendo el tiempo en la lectura. 
Otra razón para no usar SELECT * es la mantenibilidad. Si la tabla camia de estructura, un SELECT * altera o rompe los reportes.

- ¿Por qué son importantes los alias para un stakeholder no técnico? Explicá con un ejemplo concreto cómo un alias transforma total_amount en algo que cualquier persona del área de finanzas puede interpretar directamente.

Los alias son importantes para demostrar la claridad de la lectura de los datos y los nombres de los atributos. Algunos nombres técnicos dentro de las tablas son difíciles de entender y dificultan la comprensión a la hora de mostrarlos a los stakeholders. El alias realiza una referencia y representa el nombre "fácil" de las columnas con nombres abreviados o en otro idioma. 
Por ejemplo, total_amount es un nombre en inglés. No necesariamente una persona del área de finanzas debe conocer el término (aunque debería). Por lo que es conveniente asignarle un alias para su fácil comprensión. Le asignaré el nombre de "monto_total", y la sentencia será:
                                  SELECT total_amount AS monto_total FROM sales;
De esta manera, la consulta traerá todos los "total_amount" pero la columna se llamará "monto_total".
