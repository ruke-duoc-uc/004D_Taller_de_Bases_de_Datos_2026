-- Tipo de dato EXCEPTION
-- El usuario puede crear un tipo de ERROR personalizado en un bloque anonimo
UPDATE EVENTO SET ESTADO = 'CANCELADO'
--Al dejar solo la primera linea se actualizarian todos los eventos
--esto nos obliga a ser especificos con un where
WHERE EVENTO_ID =1;
COMMIT;

DECLARE
e_evento_cancelado EXCEPTION;
v_estado EVENTO.estado%TYPE;
BEGIN
    SELECT ESTADO
    INTO v_estado 
    FROM EVENTO 
    WHERE EVENTO_ID =1;
    IF v_estado = 'CANCELADO' THEN
        RAISE e_evento_cancelado;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Evento disponible para venta');
EXCEPTION 
    WHEN e_evento_cancelado THEN
        DBMS_OUTPUT.PUT_LINE('El evento se cancelo');
END;
/

DECLARE
v_stock LOCALIDAD_EVENTO.STOCK_DISPONIBLE%TYPE;
BEGIN
    SELECT STOCK_DISPONIBLE 
    INTO v_stock
    FROM LOCALIDAD_EVENTO
    WHERE localidad_evento_id = 1;
    IF v_stock <=0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Mensaje de error personilado'
        );
    END IF;
    DBMS_OUTPUT.PUT_LINE('Ejecucion exitosa');
    DBMS_OUTPUT.PUT_LINE('Stock disponible: '|| v_stock);
END;
/
DECLARE
    e_fk_violada EXCEPTION;
  --Esta linea asocia el EXCEPTION 
  --personalizado al error de el codigo declarado
    PRAGMA EXCEPTION_INIT(e_fk_violada,-2292);
    
BEGIN
    DELETE FROM RECINTO
    WHERE nombre = 'Movistar Arena';
EXCEPTION
    WHEN e_fk_violada THEN
    DBMS_OUTPUT.PUT_LINE('No se puede eliminar, tiene datos asociados');
END;
/