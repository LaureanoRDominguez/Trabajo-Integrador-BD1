--Top 15 de los clientes mas activos. En este caso, se busca los clientes que mas reservas, visitas, 
--movimientos de puntos y notificaciones hayan recibido.

SELECT C.id_usuario, U.nombre, U.apellido,
    COUNT(DISTINCT V.fecha_hora_entrada) AS total_visitas,
    COUNT(DISTINCT R.id_reserva) AS total_reservas,
    COUNT(DISTINCT P.fecha_hora) AS movimientos_puntos,
    COUNT(DISTINCT N.id_notificacion) AS notificaciones
FROM CLIENTES C
JOIN USUARIOS U ON U.id_usuario = C.id_usuario
LEFT JOIN VISITAS V ON V.id_usuario = C.id_usuario
LEFT JOIN RESERVAS R ON R.id_usuario = C.id_usuario
LEFT JOIN PUNTOS P ON P.id_usuario = C.id_usuario
LEFT JOIN NOTIFICACIONES N ON N.id_usuario = C.id_usuario
GROUP BY C.id_usuario, U.nombre, U.apellido
HAVING COUNT(DISTINCT V.fecha_hora_entrada) > 0
ORDER BY (COUNT(DISTINCT V.fecha_hora_entrada) + COUNT(DISTINCT R.id_reserva) + COUNT(DISTINCT P.fecha_hora)) DESC
LIMIT 15;