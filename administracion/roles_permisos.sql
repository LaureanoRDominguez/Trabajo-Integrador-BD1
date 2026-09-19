-- Rol de solo lectura: auditoría/reportes
CREATE ROLE auditor WITH LOGIN PASSWORD 'auditoria';
GRANT SELECT ON ALL TABLES IN SCHEMA public TO auditor;

-- Rol de RRHH: acceso limitado a empleados y roles
CREATE ROLE rrhh WITH LOGIN PASSWORD 'recursos';
GRANT SELECT, INSERT, UPDATE ON empleados TO rrhh;
GRANT SELECT ON roles TO rrhh;
