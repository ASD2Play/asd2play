-- En tu empresa, se plantea un nuevo proyecto para lanzar algunas campañas publicitarias para hacer competencia a la compañía 'Non Institute'. Para ello, te piden la lista de todas las transacciones realizadas por empresas que están situadas en el mismo país que esta compañía.
-- Solución con JOIN y subconsulta
SELECT t.*
FROM transaction t
JOIN company c ON t.company_id = c.id
WHERE c.country = (SELECT country
					FROM company
                    WHERE company_name = 'Non Institute');
                    
-- Solución solo con subconsultas
SELECT t.*
FROM transaction t
WHERE t.company_id IN (SELECT id
						FROM company
                        WHERE country = (SELECT country
										FROM company
                                        WHERE company_name ='Non Institute'));

