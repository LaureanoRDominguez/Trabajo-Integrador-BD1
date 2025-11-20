--Eficiencia de los empleados

SELECT 
    a.nombre_area,
    u.nombre,
    u.apellido,
    COUNT(DISTINCT i.id_incidente) as incidentes_reportados,
    COUNT(DISTINCT l.id_log) as accesos_sistema,
    COUNT(DISTINCT n.id_notificacion) as notificaciones_enviadas
FROM EMPLEADOS E
JOIN USUARIOS u ON e.id_usuario = u.id_usuario
JOIN AREAS a ON e.id_area = a.id_area
LEFT JOIN INCIDENTES i ON e.id_usuario = i.id_usuario
    AND i.fecha_hora >= CURRENT_DATE - INTERVAL '60 days'
LEFT JOIN LOGS l ON e.id_usuario = l.id_usuario
    AND l.fecha_hora_acceso >= CURRENT_DATE - INTERVAL '60 days'
LEFT JOIN NOTIFICACIONES n ON e.id_usuario = n.id_usuario
    AND n.fecha_hora_envio >= CURRENT_DATE - INTERVAL '60 days'
GROUP BY a.nombre_area, u.nombre, u.apellido
HAVING COUNT(DISTINCT l.id_log) > 0
ORDER BY incidentes_reportados DESC;