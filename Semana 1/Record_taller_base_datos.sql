SELECT * FROM CLIENTE;

DECLARE
    TYPE DATOS_CLIENTE IS RECORD(
        rut_cliente VARCHAR2(12),
        nombre_cliente VARCHAR2(80),
        apellido_cliente VARCHAR2(150)
    );
    -- DATOS_CLIENTE es un tipo de dato creado por nosotros
    -- Para manejarlo debemos crear una variable de tipo DATO_CLIENTE
    -- Un tipo de dato Record sirve para acotar la informacion de multiples variables
    -- en una sola
    -- AL DECLARAR UN RECORD PARA
    v_rut CLIENTE.RUT%TYPE;
    v_email CLIENTE.EMAIL%TYPE;
    v_nombre CLIENTE.NOMBRE%TYPE;
    v_apellido CLIENTE.APELLIDO%TYPE;
    v_telefono CLIENTE.TELEFONO%TYPE;
    v_d_cliente DATOS_CLIENTE;
BEGIN
    SELECT RUT, NOMBRE, EMAIL
    INTO v_rut, v_nombre, v_email
    FROM CLIENTE WHERE CLIENTE_ID = 2;
    SELECT RUT, NOMBRE, EMAIL
    INTO v_d_cliente.rut_cliente,
    v_d_cliente.nombre_cliente,
    v_d_cliente.apellido_cliente
    FROM CLIENTE
    WHERE CLIENTE_ID = 2;
    DBMS_OUTPUT.PUT_LINE('El rut del usuario es '|| v_rut);
    DBMS_OUTPUT.PUT_LINE('Datos del Cliente '||v_d_cliente.nombre_cliente);
END;
/
--El "/"" detiene el boton "Run Script" en el punto donde se coloca 
-- Es util para hacer correr solo el primer bloque PL/SQL