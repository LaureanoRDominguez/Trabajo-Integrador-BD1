--Actividad general por área en los últimos 6 meses. 
--Es decir, cantidad de clientes que la visitaron, cantidad de reportes de los empleados sobre estas áreas especificas
--y la cantidad de maquinas activas dentro de las misma. 

SELECT A.nombre_area, COUNT(DISTINCT V.id_usuario) AS visitas_clientes, 
COUNT(DISTINCT I.id_incidente) AS incidentes_reportados, 
COUNT(DISTINCT M.id_maquina) FILTER (WHERE M.estado = 'Activa') AS maquinas_activas
FROM AREAS A
LEFT JOIN ACCESOS AC ON A.id_area = AC.id_area
LEFT JOIN VISITAS V ON AC.id_punto_acceso = V.id_punto_acceso
LEFT JOIN INCIDENTES I ON A.id_area = I.id_area
LEFT JOIN MAQUINAS M ON A.id_area = M.id_area
WHERE (V.fecha_hora_entrada IS NULL OR V.fecha_hora_entrada >= '2025-05-01') 
and (I.fecha_hora IS NULL OR I.fecha_hora >= '2025-05-01')
GROUP BY A.nombre_area
ORDER BY visitas_clientes DESC;








