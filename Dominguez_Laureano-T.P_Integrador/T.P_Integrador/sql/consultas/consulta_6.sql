--Fallas de las maquinas por área. 

SELECT 
    A.nombre_area,
    M.estado,
    COUNT(M.id_maquina) as total_maquinas,
    COUNT(DISTINCT I.id_incidente) as incidentes_asociados,
    ROUND(COUNT(DISTINCT I.id_incidente) * 100.0 / COUNT(M.id_maquina), 2) as tasa_incidentes
FROM MAQUINAS M
JOIN AREAS A ON M.id_area = A.id_area
LEFT JOIN INCIDENTES I ON M.id_area = I.id_area 
    AND I.fecha_hora >= CURRENT_DATE - INTERVAL '90 days'
GROUP BY A.nombre_area, M.estado
HAVING COUNT(M.id_maquina) > 0
ORDER BY A.nombre_area ASC, total_maquinas DESC;