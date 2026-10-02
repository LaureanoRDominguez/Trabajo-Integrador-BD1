#!/bin/bash
# Script de backup para la base de datos "casino"
# Genera un archivo con la fecha del día, para mantener varios puntos de recuperación

FECHA=$(date +%Y%m%d)
ARCHIVO="backup_casino_${FECHA}.sql"

pg_dump -U postgres -d casino -f "$ARCHIVO"

echo "Backup generado: $ARCHIVO"
