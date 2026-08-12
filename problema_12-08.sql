DECLARE
    TYPE BOLETA_CLIENTE IS RECORD(
        nombre_cliente CLIENTE.NOMBRE%TYPE,
        monto_bruto_transaccion TRANSACCION_PAGO.MONTO_BRUTO%TYPE,
        descuento_aplicado TRANSACCION_PAGO.DESCUENTO%TYPE,
        monto_final_transaccion TRANSACCION_PAGO.MONTO_FINAL%TYPE,
        estado_pago TRANSACCION_PAGO.ESTADO%TYPE
    );
    v_record_boleta BOLETA_CLIENTE;
BEGIN
    SELECT
    C.NOMBRE,
    T_P.MONTO_BRUTO,
    T_P.DESCUENTO,
    T_P.MONTO_FINAL,
    T_P.ESTADO
    INTO 
    v_record_boleta.nombre_cliente,
    v_record_boleta.monto_bruto_transaccion,
    v_record_boleta.descuento_aplicado,
    v_record_boleta.monto_final_transaccion,
    v_record_boleta.estado_pago
    FROM CLIENTE C
    INNER JOIN RESERVA_TEMPORAL R_T ON R_T.CLIENTE_ID = C.CLIENTE_ID
    INNER JOIN TRANSACCION_PAGO T_P ON T_P.RESERVA_ID = R_T.RESERVA_ID
    WHERE C.CLIENTE_ID = 1;
    DBMS_OUTPUT.PUT_LINE('*****BOLETA ELECTRONICA PUNTO TICKET*****');
    DBMS_OUTPUT.PUT_LINE('NOMBRE : '||v_record_boleta.nombre_cliente);
    DBMS_OUTPUT.PUT_LINE('                      Neto $:  '||v_record_boleta.monto_bruto_transaccion);
    DBMS_OUTPUT.PUT_LINE('                 Descuento $:    '||v_record_boleta.descuento_aplicado);
    
END;