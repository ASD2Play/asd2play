-- Ver el registro antes de eliminarlo
SELECT * FROM transaction WHERE id = '02C6201E-D90A-1859-B4EE-88D2986D3B02';

-- Eliminar el registro
DELETE FROM transaction WHERE id = '02C6201E-D90A-1859-B4EE-88D2986D3B02';

-- Verificar que el registro se eliminó
SELECT * FROM transaction WHERE id = '02C6201E-D90A-1859-B4EE-88D2986D3B02';