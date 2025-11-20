--Evolución por año de las tres categorías.

SELECT 
    EXTRACT(YEAR FROM u.fecha_registro) as año_registro,
    cat.nombre_categoria,
    COUNT(DISTINCT c.id_usuario) as total_clientes,
    COUNT(v.id_usuario) as visitas_totales
FROM CLIENTES c
JOIN USUARIOS u ON c.id_usuario = u.id_usuario
JOIN CATEGORIAS cat ON c.id_categoria = cat.id_categoria
LEFT JOIN VISITAS v ON c.id_usuario = v.id_usuario 
    AND v.fecha_hora_entrada >= CURRENT_DATE - INTERVAL '90 days'
GROUP BY EXTRACT(YEAR FROM u.fecha_registro), cat.nombre_categoria
HAVING COUNT(DISTINCT c.id_usuario) > 3
ORDER BY año_registro DESC, total_clientes DESC;