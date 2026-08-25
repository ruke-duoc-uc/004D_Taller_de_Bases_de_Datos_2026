SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_clientes IS
        SELECT * FROM CLIENTE;
BEGIN 
    FOR cada_cliente IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE(cada_cliente.NOMBRE);
END LOOP;
END;
/

-- CURSOR WHERE
DECLARE
    CURSOR c_clientes IS
    SELECT * FROM CLIENTE
-- en este where Like permite determinar que objetos
-- contienen la letra 'a'
    WHERE NOMBRE LIKE '%a%';
    v_contador NUMBER(2);
BEGIN
v_contador:= 1;

    DBMS_OUTPUT.PUT_LINE('-----TABLA DE CLIENTES CON "A" EN SU NOMBRE-----');
FOR clientes_a in c_clientes LOOP
    DBMS_OUTPUT.PUT_LINE('Vuelta: '||v_contador);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || clientes_a.NOMBRE || '| RUT: ' ||clientes_a.RUT);
    v_contador:=v_contador+1;
END LOOP;

    DBMS_OUTPUT.PUT_LINE('-----FIN DEL PROGRAMA-----');
END;
DECLARE
-- Hay que cambiar reserva por cliente    
    CURSOR c_plata_evento_l IS
        SELECT
            COUNT(L_E.ESTADO)
        FROM RESERVA_TEMPORAL R_T
        JOIN TRANSACCION_PAGO L_E ON L_E.RESERVA_ID = R_T.RESERVA_ID
        WHERE R_T.ESTADO = 'APROBADO';
    -- Se cambia el tipo al nombre de la localidad para que coincida con la consulta
-- Se supone que debemos imprimir un informe con los atributos directo en BEGIN
-- A lo bruto no mas
BEGIN
    FOR aprobados IN c_plata_evento_l LOOP
    DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('-----FIN DEL PROGRAMA-----');   
END;
/
-- Otro tipo de cursor
INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO)
VALUES ('11.111.111-1','FERNANDA','Vargas','fvargas@gmail.com','+56949857690',SYSTIMESTAMP);    

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO)
VALUES ('33.333.333-3','Dante','Torobolino','maguitoExplosivo@gmail.com','+56901234567',SYSTIMESTAMP);    

INSERT INTO CLIENTE(RUT, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_REGISTRO)
VALUES ('22.222.222-2','Gabriel','Vargas','gvargas@gmail.com','+56941579062',SYSTIMESTAMP);    
COMMIT;
SELECT * FROM CLIENTE;
DECLARE
    CURSOR c_cliente_apellidos(p_apellido VARCHAR2) IS
    SELECT cliente_id,nombre,apellido,email
    FROM CLIENTE
    WHERE APELLIDO = p_apellido;
    v_apellido_ingresado CLIENTE.APELLIDO%TYPE;
BEGIN
    FOR un_cliente IN c_cliente_apellidos('Vargas') LOOP
        DBMS_OUTPUT.PUT_LINE(un_cliente.nombre);
    END LOOP;
END;
/
