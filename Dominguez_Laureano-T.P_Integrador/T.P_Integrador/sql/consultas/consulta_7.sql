--Análisis de las métricas de los puntos por mes

SELECT 
    EXTRACT(YEAR FROM P.fecha_hora) as año,
    EXTRACT(MONTH FROM P.fecha_hora) as mes,
    COUNT(DISTINCT P.id_usuario) as clientes_activos,
    SUM(P.cantidad_puntos) as puntos_netos,
    SUM(CASE WHEN P.cantidad_puntos > 0 THEN P.cantidad_puntos ELSE 0 END) as puntos_acumulados,
    SUM(CASE WHEN P.cantidad_puntos < 0 THEN ABS(P.cantidad_puntos) ELSE 0 END) as puntos_canjeados,
    ROUND(AVG(P.cantidad_puntos), 2) as promedio_por_transaccion
FROM PUNTOS P
WHERE P.fecha_hora >= '2024-01-01'
GROUP BY EXTRACT(YEAR FROM P.fecha_hora), EXTRACT(MONTH FROM P.fecha_hora)
HAVING COUNT(DISTINCT P.id_usuario) > 0
ORDER BY año DESC, mes DESC;
