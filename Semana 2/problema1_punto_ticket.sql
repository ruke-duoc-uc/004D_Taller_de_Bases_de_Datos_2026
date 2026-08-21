SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_plata_evento_l IS
        SELECT
            L_E.NOMBRE_LOCALIDAD,
            SUM(L_E.PRECIO),
            COUNT(R_T.ESTADO)
        FROM RESERVA_TEMPORAL R_T
        JOIN LOCALIDAD_EVENTO L_E ON L_E.LOCALIDAD_EVENTO_ID = R_T.LOCALIDAD_EVENTO_ID
        WHERE R_T.ESTADO = 'CONVERTIDA'
        GROUP BY L_E.NOMBRE_LOCALIDAD,R_T.ESTADO;
    -- Se cambia el tipo al nombre de la localidad para que coincida con la consulta
    v_nombre_localidad LOCALIDAD_EVENTO.NOMBRE_LOCALIDAD%TYPE;
    v_ganancias        LOCALIDAD_EVENTO.PRECIO%TYPE;
    v_conteo NUMBER(5);
BEGIN
   DBMS_OUTPUT.PUT_LINE('-----GANANCIAS DE LOS EVENTOS-----');
    OPEN c_plata_evento_l;
 
    LOOP
        FETCH c_plata_evento_l INTO v_nombre_localidad, v_ganancias,v_conteo;
        
        EXIT WHEN c_plata_evento_l%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ganancias de la localidad ' || v_nombre_localidad || ': ' || v_ganancias);
        DBMS_OUTPUT.PUT_LINE('Numero de asistentes: '||v_conteo);
    END LOOP;
    CLOSE c_plata_evento_l;
       DBMS_OUTPUT.PUT_LINE('-----FIN DEL PROGRAMA-----');
END;
/

    