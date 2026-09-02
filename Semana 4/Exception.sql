SET SERVEROUTPUT ON
--No data Found
DECLARE
    v_email CLIENTE.EMAIL%TYPE;
BEGIN
    SELECT EMAIL INTO  v_email FROM CLIENTE WHERE RUT = '11.111';
    DBMS_OUTPUT.PUT_LINE('El email es: '||v_email);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Rut inexistente '||CHR(64));
END;
/
--Demasiadas filas
DECLARE
    v_email CLIENTE.EMAIL%TYPE;
BEGIN
    SELECT EMAIL INTO  v_email FROM CLIENTE;
    DBMS_OUTPUT.PUT_LINE('El email es: '||v_email);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Demasiadas filas, avispese y use un cursor o limite a una fila con where');
END;
/
--Division por cero
DECLARE
    v_resultado NUMBER;
    v_desc NUMBER;
BEGIN    
    v_resultado := 100/v_desc;
    DBMS_OUTPUT.PUT_LINE('El email es: '||v_resultado);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('No se puede dividir por 0, tonto');
END;
/
--Error de valor
DECLARE
    v_texto VARCHAR2(5);
BEGIN
    v_texto := 'Saracatunga';
    DBMS_OUTPUT.PUT_LINE(v_texto);
EXCEPTION
    WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('La variable no puede manejar tantos caracteres');
END;
/
--VALUE_ERROR maneja errores de tipo de datos o tamaño de atributo
DECLARE
    v_numero NUMBER;
BEGIN
    v_numero := TO_NUMBER('abc');
    DBMS_OUTPUT.PUT_LINE(v_numero);
EXCEPTION
    WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('Las letras no tienen equivalencia a numeros');
END;
/
