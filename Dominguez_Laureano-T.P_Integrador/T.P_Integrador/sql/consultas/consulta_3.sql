--Empleados mas activos. Es decir, los empleados que más logs e incidentes reportaron.

SELECT 
    E.id_usuario,
    U.nombre,
    U.apellido,
    COUNT(DISTINCT L.id_log) AS accesos_sistema,
    COUNT(DISTINCT I.id_incidente) AS incidentes_reportados,
    A.nombre_area
FROM EMPLEADOS E
JOIN USUARIOS U ON E.id_usuario = U.id_usuario
LEFT JOIN LOGS L ON E.id_usuario = L.id_usuario
LEFT JOIN INCIDENTES I ON E.id_usuario = I.id_usuario
LEFT JOIN AREAS A ON E.id_area = A.id_area
GROUP BY E.id_usuario, U.nombre, U.apellido, A.nombre_area
HAVING COUNT(DISTINCT L.id_log) > 5
ORDER BY accesos_sistema DESC;