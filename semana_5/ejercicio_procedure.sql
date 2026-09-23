DECLARE

BEGIN
    INSERTAR_NOMBRE_P('13.131.331-5','Cristobal','Huilicho',
    'email@gmail.com');
END;
/
--Crear un procedimiento que retorne los datos de un cliente
--segun su id
CREATE OR REPLACE PROCEDURE BUSCAR_NOMBRE_P(
-- Los atributos de procedure son IN y OUT

    p_id_entrada IN NUMBER,
    
    p_rut OUT CLIENTE.RUT%TYPE,
    p_nombre OUT CLIENTE.NOMBRE%TYPE,
    p_apellido OUT CLIENTE.APELLIDO%TYPE,
    p_email OUT CLIENTE.EMAIL%TYPE
)
IS

BEGIN
    SELECT
        rut,nombre,apellido,email
    INTO
        p_rut,p_nombre,p_apellido,p_email
    FROM CLIENTE
    WHERE CLIENTE_ID = p_id_entrada;
    DBMS_OUTPUT.PUT_LINE('Rut: '||p_rut);
    DBMS_OUTPUT.PUT_LINE('Nombre: '||p_nombre);
    DBMS_OUTPUT.PUT_LINE('Apellido: '||p_apellido);
    DBMS_OUTPUT.PUT_LINE('Email: '||p_email);
END;
/
DECLARE
   v_rut CLIENTE.RUT%TYPE;
   v_nombre CLIENTE.NOMBRE%TYPE;
   v_apellido CLIENTE.APELLIDO%TYPE;
   v_email CLIENTE.EMAIL%TYPE;
BEGIN
-- En resumidas cuentas debes dar las variables que necesite
-- el procedure en el orden adecuado, en este caso el numero,
-- de ID que buscamos, y despues las variables donde se almacenara
-- la informacion obtenida en el procedure
    BUSCAR_NOMBRE_P(1,v_rut,v_nombre,v_apellido,v_email);
END;
/
