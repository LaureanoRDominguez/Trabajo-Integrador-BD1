--Incidentes por área y gravedad.

SELECT 
    A.nombre_area,
    EXTRACT(MONTH FROM I.fecha_hora) as mes,
    COUNT(I.id_incidente) as total_incidentes,
    COUNT(DISTINCT I.id_usuario) as reportantes_unicos,
    CASE 
        WHEN COUNT(I.id_incidente) > 15 THEN 'CRÍTICO'
        WHEN COUNT(I.id_incidente) > 8 THEN 'ALTO'
        WHEN COUNT(I.id_incidente) > 3 THEN 'MEDIO'
        ELSE 'BAJO'
    END as nivel_gravedad
FROM INCIDENTES I
JOIN AREAS A ON I.id_area = A.id_area
WHERE I.fecha_hora >= '2024-01-01'
GROUP BY A.nombre_area, EXTRACT(MONTH FROM I.fecha_hora)
HAVING COUNT(I.id_incidente) > 0
ORDER BY mes, total_incidentes DESC;