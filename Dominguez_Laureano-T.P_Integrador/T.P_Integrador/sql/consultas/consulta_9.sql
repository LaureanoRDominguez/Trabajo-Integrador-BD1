--Reservas por cliente y categoria

SELECT 
    cat.nombre_categoria,
    COUNT(DISTINCT r.id_usuario) as clientes_con_reserva,
    COUNT(r.id_reserva) as total_reservas,
    SUM(CASE WHEN r.estado = 'Confirmada' THEN 1 ELSE 0 END) as reservas_confirmadas,
    SUM(CASE WHEN r.estado = 'Cancelada' THEN 1 ELSE 0 END) as reservas_canceladas,
	SUM(CASE WHEN R.estado = 'Pendiente' THEN 1 ELSE 0 END) as reservas_en_espera
FROM RESERVAS r
JOIN CLIENTES c ON r.id_usuario = c.id_usuario
JOIN CATEGORIAS cat ON c.id_categoria = cat.id_categoria
WHERE r.fecha_hora_reserva >= CURRENT_DATE - INTERVAL '180 days'
GROUP BY cat.nombre_categoria
HAVING COUNT(r.id_reserva) > 5
ORDER BY total_reservas DESC;

