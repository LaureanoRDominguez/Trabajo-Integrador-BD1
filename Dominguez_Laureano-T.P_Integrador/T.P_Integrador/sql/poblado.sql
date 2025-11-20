-- =====================================================================
--               Script de Población Masiva
-- =====================================================================

DO $$
DECLARE
    -- Arrays para almacenar IDs y mantener la coherencia de las FK
    arr_roles INT[];
    arr_usuarios INT[];
    arr_clientes INT[];
    arr_empleados INT[];
    arr_categorias INT[];
    arr_promociones INT[];
    arr_eventos INT[];
    arr_areas INT[];
    arr_maquinas INT[];
    arr_accesos INT[];
    arr_reservas INT[];
    
    -- Arrays para nombres y apellidos realistas
    arr_nombres TEXT[] := ARRAY['Juan', 'Carlos', 'Ana', 'Maria', 'Luis', 'Pedro', 'Sofia', 'Lucia', 'Miguel', 'Jose', 'Elena', 'Laura', 'David', 'Javier', 'Carmen', 'Paula', 'Marcos', 'Daniel', 'Marta', 'Valeria', 'Diego', 'Camila', 'Andres', 'Florencia', 'Martin'];
    arr_apellidos TEXT[] := ARRAY['Garcia', 'Martinez', 'Rodriguez', 'Lopez', 'Sanchez', 'Perez', 'Gomez', 'Fernandez', 'Diaz', 'Gonzalez', 'Ruiz', 'Alvarez', 'Romero', 'Torres', 'Navarro', 'Soto', 'Ramirez', 'Vargas', 'Molina', 'Castillo', 'Ortega', 'Reyes', 'Mora', 'Guerrero', 'Vega'];
    
    v_nombre TEXT;
    v_apellido TEXT;
    v_email TEXT;
    v_id_usuario INT;
BEGIN

    -- 1. Poblar tablas maestras (sin dependencias)
    WITH inserted_data AS (
        INSERT INTO ROLES (id_rol, nombre_rol, permisos) VALUES
            (1, 'Gerencia', 'Acceso total'),
            (2, 'Seguridad', 'Acceso a logs, incidentes y cámaras'),
            (3, 'Cliente_App', 'Acceso a perfil personal, puntos y reservas'),
            (4, 'Operador', 'Acceso a gestion de maquinas')
        RETURNING id_rol
    )
    SELECT array_agg(id_rol) FROM inserted_data INTO arr_roles;

    WITH inserted_data AS (
        INSERT INTO CATEGORIAS (id_categoria, nombre_categoria, beneficios) VALUES
            (1, 'Estándar', 'Acceso a promociones generales'),
            (2, 'Oro', 'Acceso a salon VIP y 10% descuento en restaurante'),
            (3, 'Platino', 'Todo Oro + shows privados y parking gratis')
        RETURNING id_categoria
    )
    SELECT array_agg(id_categoria) FROM inserted_data INTO arr_categorias;

    WITH inserted_data AS (
        INSERT INTO AREAS (id_area, nombre_area)
        SELECT i, 'Area ' || i FROM generate_series(1, 10) AS i
        RETURNING id_area
    )
    SELECT array_agg(id_area) FROM inserted_data INTO arr_areas;

    WITH inserted_data AS (
        INSERT INTO PROMOCIONES (id_promocion, nombre_promocion, descripcion, fecha_inicio, fecha_final)
        SELECT
            i,
            'Promocion ' || i,
            'Descripcion de la promo ' || i,
            NOW() - (random() * 1095) * interval '1 day', -- Rango de 3 años
            NOW() - (random() * 1000) * interval '1 day'  -- Rango de ~3 años
        FROM generate_series(1, 50) AS i
        RETURNING id_promocion
    )
    SELECT array_agg(id_promocion) FROM inserted_data INTO arr_promociones;

    WITH inserted_data AS (
        INSERT INTO EVENTOS (id_evento, nombre_evento, fecha_hora, lugar, capacidad)
        SELECT
            i,
            'Evento Especial ' || i,
            NOW() - (random() * 1095) * interval '1 day', -- Rango de 3 años
            'Salon Principal',
            (100 + random() * 100)::INT
        FROM generate_series(1, 20) AS i
        RETURNING id_evento
    )
    SELECT array_agg(id_evento) FROM inserted_data INTO arr_eventos;

    -- 2. Poblar USUARIOS (Creamos 500 usuarios con nombres realistas)
    FOR i IN 1..500 LOOP
        -- Seleccionar nombre y apellido aleatorios
        v_nombre := arr_nombres[ (1 + floor(random() * array_length(arr_nombres, 1)))::INT ];
        v_apellido := arr_apellidos[ (1 + floor(random() * array_length(arr_apellidos, 1)))::INT ];
        
        -- Crear email único y realista
        v_email := lower(v_nombre) || '.' || lower(v_apellido) || i || '@casino.com';
        
        -- Insertar el nuevo usuario
        INSERT INTO USUARIOS (id_usuario, DNI, nombre, apellido, email, fecha_registro)
        VALUES (
            i,
            (10000000 + i)::VARCHAR,
            v_nombre,
            v_apellido,
            v_email,
            NOW() - (random() * 1095) * interval '1 day' -- Rango de 3 años
        )
        RETURNING id_usuario INTO v_id_usuario;
        
        -- Guardar el ID en el array de usuarios
        arr_usuarios[i] := v_id_usuario;
        
    END LOOP;

    -- 3. Poblar CUENTAS, CLIENTES y EMPLEADOS
    -- (Separamos 400 clientes y 100 empleados)
    
    -- CLIENTES (400)
    FOR i IN 1..400 LOOP
        arr_clientes[i] := arr_usuarios[i]; -- Guardamos el ID del cliente
        
        INSERT INTO CLIENTES (id_usuario, datos_biometricos, puntos, id_categoria)
        VALUES (
            arr_usuarios[i],
            NULL,
            (random() * 5000)::INT,
            arr_categorias[ (1 + floor(random() * array_length(arr_categorias, 1)))::INT ] -- Categoria aleatoria
        );
        
        INSERT INTO CUENTAS (id_cuenta, usuario, password, tipo_cuenta, estado, id_rol, id_usuario)
        VALUES (
            i,
            'cliente' || arr_usuarios[i],
            'hash_password_cliente_' || i, -- En un proyecto real, esto sería un hash
            'APP',
            'Activa',
            3, -- id_rol de 'Cliente_App'
            arr_usuarios[i]
        );
    END LOOP;
    
    -- EMPLEADOS (100)
    FOR i IN 401..500 LOOP
        arr_empleados[i-400] := arr_usuarios[i]; -- Guardamos el ID del empleado
        
        INSERT INTO EMPLEADOS (id_usuario, id_area)
        VALUES (
            arr_usuarios[i],
            arr_areas[ (1 + floor(random() * array_length(arr_areas, 1)))::INT ] -- Area aleatoria
        );
        
        INSERT INTO CUENTAS (id_cuenta, usuario, password, tipo_cuenta, estado, id_rol, id_usuario)
        VALUES (
            i,
            'empleado' || arr_usuarios[i],
            'hash_password_empleado_' || i, -- En un proyecto real, esto sería un hash
            'INTERNA',
            'Activa',
            arr_roles[ (1 + floor(random() * 2))::INT ], -- Rol aleatorio (Gerencia o Seguridad)
            arr_usuarios[i]
        );
    END LOOP;

    -- 4. Poblar tablas dependientes (500 tuplas cada una)

    -- MAQUINAS
    WITH inserted_data AS (
        INSERT INTO MAQUINAS (id_maquina, modelo, ubicacion, estado, id_area)
        SELECT
            i,
            'Modelo ' || (1 + floor(random() * 9))::INT,
            'Fila ' || (1 + floor(random() * 20))::INT,
            CASE (random() * 2)::INT WHEN 0 THEN 'Activa' WHEN 1 THEN 'En Mantenimiento' ELSE 'Fuera de Servicio' END,
            arr_areas[ (1 + floor(random() * array_length(arr_areas, 1)))::INT ]
        FROM generate_series(1, 500) AS i
        RETURNING id_maquina
    )
    SELECT array_agg(id_maquina) FROM inserted_data INTO arr_maquinas;
    
    -- ACCESOS
    WITH inserted_data AS (
        INSERT INTO ACCESOS (id_punto_acceso, nombre, tipo, id_area)
        SELECT
            i,
            'Acceso ' || i,
            CASE (random() * 2)::INT WHEN 0 THEN 'Molinete' WHEN 1 THEN 'Lector QR' ELSE 'Puerta' END,
            arr_areas[ (1 + floor(random() * array_length(arr_areas, 1)))::INT ]
        FROM generate_series(1, 20) AS i
        RETURNING id_punto_acceso
    )
    SELECT array_agg(id_punto_acceso) FROM inserted_data INTO arr_accesos;

    -- RESERVAS (500 tuplas)
    WITH inserted_data AS (
        INSERT INTO RESERVAS (id_reserva, fecha_hora_reserva, tipo_reserva, estado, id_usuario)
        SELECT
            i,
            NOW() - (random() * 1095) * interval '1 day', -- Rango de 3 años
            CASE (random() * 2)::INT WHEN 0 THEN 'Restaurante' WHEN 1 THEN 'Hotel' ELSE 'Show' END,
            CASE (random() * 2)::INT WHEN 0 THEN 'Confirmada' WHEN 1 THEN 'Pendiente' ELSE 'Cancelada' END,
            arr_clientes[ (1 + floor(random() * array_length(arr_clientes, 1)))::INT ] -- Cliente aleatorio
        FROM generate_series(1, 500) AS i
        RETURNING id_reserva
    )
    SELECT array_agg(id_reserva) FROM inserted_data INTO arr_reservas;
    
    -- LOGS (500 tuplas)
    INSERT INTO LOGS (id_log, fecha_hora_acceso, terminal, ip, id_usuario)
    SELECT
        i,
        NOW() - (random() * 1095) * interval '1 day', -- Rango de 3 años
        'Terminal-' || (1 + floor(random() * 10))::INT,
        '192.168.1.' || (10 + floor(random() * 100))::INT,
        arr_empleados[ (1 + floor(random() * array_length(arr_empleados, 1)))::INT ] -- Empleado aleatorio
    FROM generate_series(1, 500) AS i;
    
    -- INCIDENTES (500 tuplas)
    INSERT INTO INCIDENTES (id_incidente, descripcion, fecha_hora, id_usuario, id_area)
    SELECT
        i,
        'Descripcion del incidente ' || i,
        NOW() - (random() * 1095) * interval '1 day', -- Rango de 3 años
        arr_empleados[ (1 + floor(random() * array_length(arr_empleados, 1)))::INT ], -- Empleado aleatorio
        arr_areas[ (1 + floor(random() * array_length(arr_areas, 1)))::INT ] -- Area aleatoria
    FROM generate_series(1, 500) AS i;
    
    -- NOTIFICACIONES (500 tuplas)
    INSERT INTO NOTIFICACIONES (id_notificacion, mensaje, tipo, fecha_hora_envio, id_usuario)
    SELECT
        i,
        'Mensaje de notificacion ' || i,
        CASE (random() * 2)::INT WHEN 0 THEN 'Push' WHEN 1 THEN 'Email' ELSE 'Interna' END,
        NOW() - (random() * 1095) * interval '1 day', -- Rango de 3 años
        arr_usuarios[ (1 + floor(random() * array_length(arr_usuarios, 1)))::INT ] -- Usuario aleatorio (cliente o empleado)
    FROM generate_series(1, 500) AS i;

    -- 5. Poblar tablas intermedias y débiles (500 tuplas cada una)

    -- Otorga (Relaciona Promociones y Categorias)
    INSERT INTO Otorga (id_categoria, id_promocion)
    SELECT
        arr_categorias[ (1 + floor(random() * array_length(arr_categorias, 1)))::INT ], -- Categoria aleatoria
        id_promocion
    FROM PROMOCIONES
    ON CONFLICT (id_categoria) DO NOTHING;
    
    -- Corresponde (Relaciona Reservas y Eventos)
    INSERT INTO Corresponde (id_reserva, id_evento)
    SELECT
        arr_reservas[i],
        arr_eventos[ (1 + floor(random() * array_length(arr_eventos, 1)))::INT ]
    FROM generate_series(1, array_length(arr_reservas, 1)) AS i
    WHERE random() < 0.3; -- Solo el 30% de las reservas son para eventos
    
    -- PUNTOS (500 tuplas)
    INSERT INTO PUNTOS (id_usuario, fecha_hora, cantidad_puntos, motivo)
    SELECT
        arr_clientes[ (1 + floor(random() * array_length(arr_clientes, 1)))::INT ], -- Cliente aleatorio
        NOW() - (random() * 1095) * interval '1 day', -- Rango de 3 años
        (random() * 1000 - 200)::INT, -- Puede ser positivo (acumula) o negativo (canjea)
        CASE (random() * 1)::INT WHEN 0 THEN 'Acumulacion por juego' ELSE 'Canje en restaurante' END
    FROM generate_series(1, 500) AS i;
    
    -- VISITAS (500 tuplas)
    INSERT INTO VISITAS (id_usuario, fecha_hora_entrada, fecha_hora_salida, id_punto_acceso)
    SELECT
        arr_clientes[ (1 + floor(random() * array_length(arr_clientes, 1)))::INT ], -- Cliente aleatorio
        NOW() - (random() * 1095) * interval '1 day', -- Rango de 3 años
        NULL, -- Asumimos que la visita está activa
        arr_accesos[ (1 + floor(random() * array_length(arr_accesos, 1)))::INT ] -- Acceso aleatorio
    FROM generate_series(1, 500) AS i;

END $$;
