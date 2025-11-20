--Puntos acumulados por categoría de clientes desde el 2023 hasta 2024.

SELECT 
    C.nombre_categoria,
    EXTRACT(YEAR FROM P.fecha_hora) as año,
    EXTRACT(MONTH FROM P.fecha_hora) as mes,
    COUNT(DISTINCT P.id_usuario) as clientes_activos,
    SUM(P.cantidad_puntos) as puntos_totales,
    AVG(P.cantidad_puntos) as promedio_puntos,
    MIN(P.cantidad_puntos) as minimo_puntos,
    MAX(P.cantidad_puntos) as maximo_puntos
FROM PUNTOS P
JOIN CLIENTES C ON P.id_usuario = C.id_usuario
JOIN CATEGORIAS CAT ON C.id_categoria = CAT.id_categoria
WHERE P.fecha_hora BETWEEN '2023-01-01' AND '2024-12-31'
    AND P.cantidad_puntos > 0
GROUP BY CAT.nombre_categoria, EXTRACT(YEAR FROM P.fecha_hora), EXTRACT(MONTH FROM P.fecha_hora)
HAVING SUM(P.cantidad_puntos) > 1000
ORDER BY año ASC, mes ASC, puntos_totales DESC;