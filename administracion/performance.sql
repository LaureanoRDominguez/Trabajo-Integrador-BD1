-- performance.sql
-- Prueba de rendimiento: efecto de un indice sobre logs.id_usuario
-- Entorno: PostgreSQL local, 500000 filas sinteticas en logs.
--
-- Preparacion (desde la terminal, una sola vez):
--   psql -U postgres -h localhost -c "CREATE DATABASE casino_perf TEMPLATE casino;"
-- Ejecucion:
--   psql -U postgres -h localhost -d casino_perf -f administracion/performance.sql

-- 0. Limpieza, para poder repetir la prueba
DROP INDEX IF EXISTS idx_logs_id_usuario;
DELETE FROM logs WHERE id_log > 500;

-- 1. Carga de datos sinteticos (ids 501 a 500000)
INSERT INTO logs (id_log, fecha_hora_acceso, terminal, ip, id_usuario)
SELECT
    g,
    localtimestamp - random() * interval '365 days',
    'TERM-' || (floor(random() * 20) + 1)::int,
    '192.168.' || floor(random() * 256)::int || '.' || (floor(random() * 254) + 1)::int,
    floor(random() * 100)::int + 401
FROM generate_series(501, 500000) AS g;
ANALYZE logs;

-- 2. Medicion ANTES del indice (la segunda ejecucion es la que se registra)
EXPLAIN ANALYZE SELECT * FROM logs WHERE id_usuario = 450;
EXPLAIN ANALYZE SELECT * FROM logs WHERE id_usuario = 450;

-- 3. Creacion del indice
CREATE INDEX idx_logs_id_usuario ON logs (id_usuario);
ANALYZE logs;

-- 4. Medicion DESPUES del indice
EXPLAIN ANALYZE SELECT * FROM logs WHERE id_usuario = 450;
EXPLAIN ANALYZE SELECT * FROM logs WHERE id_usuario = 450;

-- Resultados obtenidos (segunda ejecucion de cada medicion):
--   Antes:   Parallel Seq Scan, 37.866 ms
--   Despues: Bitmap Index Scan, 2.763 ms
-- Los tiempos dependen de la maquina y de los datos generados al azar.

