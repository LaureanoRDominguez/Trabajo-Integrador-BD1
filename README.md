Proyecto integrador individual aprobado de la materia de Base de Datos I de la Universidad Nacional del Oeste.
Incluye los diseños de diagramas, normalización, creación de la base de datos, poblado y consultas complejas.
Incluye además una extensión de administración de base de datos en PostgreSQL: roles y permisos, backups automatizados y una prueba de rendimiento con índices.

# Tecnologías utilizadas
- PostgreSQL
- SQL
- psql y Git
- Diagramas (Draw.io)

# Contenido del proyecto

 **Diseño**
- Diagrama Entidad-Relación (DER)
- Modelo Relacional (MR)
- Diagrama del Modelo Relacional (DMR)
- Justificación del diseño

 **Scripts SQL**
- `creacion.sql` – creación de tablas, claves y restricciones
- `poblado.sql` – inserción de datos
- Carpeta `consultas` – 10 consultas pedidas en el trabajo integrador

 **Informe**
- Explicación completa del sistema, entidades, atributos, claves, relaciones, normalización y consultas.

 **Administración de la base de datos**
- `roles_permisos.sql` – roles `auditor` y `rrhh` con permisos diferenciados
- Carpeta `backups` – documentación y script automatizado de respaldos
- `performance.sql` – prueba de rendimiento con índice sobre `logs.id_usuario`

# Prueba de rendimiento: índice sobre logs.id_usuario

## Objetivo

Evaluar el efecto de un índice B-tree sobre la columna `id_usuario` de la tabla `logs` en el tiempo de ejecución de una consulta de filtrado por empleado, consulta habitual en tareas de auditoría de accesos.

## Metodología

La prueba se realizó sobre `casino_perf`, una copia de la base `casino` creada con `CREATE DATABASE ... TEMPLATE casino`. De este modo, la base original no fue modificada.

La tabla `logs` contiene 500 registros originales. Para que el efecto del índice fuera medible, se generaron 499.500 registros sintéticos adicionales mediante `INSERT ... SELECT` con `generate_series`, para un total de 500.000 filas. Los valores de fecha, terminal, dirección IP e `id_usuario` se generaron de forma aleatoria. Los valores de `id_usuario` se limitaron al rango 401–500, que corresponde a los empleados existentes, para respetar la restricción de clave foránea.

La consulta evaluada fue:

```sql
SELECT * FROM logs WHERE id_usuario = 450;
```

Se midió con `EXPLAIN ANALYZE` antes y después de crear el índice:

```sql
CREATE INDEX idx_logs_id_usuario ON logs (id_usuario);
```

Cada medición se ejecutó dos veces y se registró la segunda, dado que la primera puede incluir la carga inicial de datos en memoria. Antes de la prueba, el único índice de la tabla era el de la clave primaria (`id_log`). PostgreSQL no crea índices de forma automática sobre las claves foráneas.

## Resultados

| Situación | Plan de ejecución | Tiempo de ejecución |
|---|---|---|
| Sin índice | Parallel Seq Scan | 36,703 ms |
| Con índice | Bitmap Index Scan + Bitmap Heap Scan | 1,699 ms |

La consulta devolvió 5.030 filas en ambos casos. El tiempo de ejecución se redujo aproximadamente 21 veces.

## Análisis

Sin índice, el motor debe recorrer la tabla completa (Seq Scan) y evaluar la condición sobre cada fila. En el plan registrado, los tres procesos paralelos descartaron en conjunto cerca de 495.000 filas (164.990 por proceso) para conservar las 5.030 que cumplían el filtro. Además, se leyeron 9.340 bloques de memoria.

Con el índice, el motor consulta primero la estructura ordenada por `id_usuario` (Bitmap Index Scan), obtiene la ubicación de las filas coincidentes y accede únicamente a los bloques que las contienen (Bitmap Heap Scan). Se leyeron 3.113 bloques, aproximadamente un tercio de los anteriores, y no fue necesario evaluar el resto de la tabla.

El optimizador seleccionó un recorrido de tipo bitmap, y no un Index Scan simple, porque la consulta devuelve alrededor del 1 % de la tabla. Con ese volumen de coincidencias resulta más eficiente agrupar las ubicaciones y leer cada bloque una sola vez. Para consultas que devuelvan una única fila, la mejora relativa sería mayor.

## Limitaciones

- Los datos son sintéticos y con distribución uniforme, por lo que no reproducen el comportamiento de un sistema en producción.
- La medición se realizó en un entorno local, y los tiempos dependen del equipo y de su carga en el momento de la ejecución.
- Los valores varían entre corridas porque los datos se generan aleatoriamente. El orden de magnitud de la diferencia se mantiene.
- Un índice acelera las lecturas, pero ocupa espacio y agrega costo a las operaciones de escritura sobre la tabla. Esto no se evaluó en esta prueba.

## Reproducción

1. Crear la copia de la base (sin conexiones activas a `casino`):
   `psql -U postgres -h localhost -c "CREATE DATABASE casino_perf TEMPLATE casino;"`
2. Ejecutar el script sobre la copia:
   `psql -U postgres -h localhost -d casino_perf -f administracion/performance.sql`

El script elimina registros de `logs` (`id_log > 500`) antes de regenerarlos. Debe ejecutarse únicamente sobre `casino_perf`, nunca sobre `casino`.

Los planes de ejecución completos se encuentran en `administracion/performance_resultados.txt`.

# Estado
- Trabajo **aprobado** – Año 2025.
- Extensión de administración de base de datos (roles, backups y rendimiento) agregada en 2026.