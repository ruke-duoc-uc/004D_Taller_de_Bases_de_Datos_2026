-- Positivo o negativo
-- Activacion de conocimientos
CREATE OR REPLACE FUNCTION devolver_numero_f(numero_ingresado NUMBER)
    RETURN NUMBER
    IS
    numero NUMBER;
BEGIN
    IF numero_ingresado > 0 then
        numero := 1;
    ELSE
        numero := 0;
    END IF;
    RETURN numero;
END;
/
DECLARE
v_numero_comparado NUMBER;
v_numero_devuelto NUMBER;
BEGIN
    v_numero_comparado := 0;
    v_numero_devuelto := devolver_numero_f(v_numero_comparado);
    DBMS_OUTPUT.PUT_LINE('Número ingresado: '|| v_numero_comparado );
    DBMS_OUTPUT.PUT_LINE('Resultado: '||v_numero_devuelto);
    DBMS_OUTPUT.PUT_LINE('Si es cero, el número es negativo');
    DBMS_OUTPUT.PUT_LINE('Si es uno el número es 0 o positivo');
END;
/

-- Cuadrado de numero
CREATE OR REPLACE FUNCTION devolver_cuadrado_f(p_numero NUMBER)
    RETURN NUMBER
    IS
    numero NUMBER;
BEGIN
    numero := p_numero ** 2;
    RETURN numero;
END;
/

DECLARE
v_numero_ingresado NUMBER := 9;
v_numero_devuelto NUMBER;
BEGIN
    v_numero_devuelto := devolver_cuadrado_f(v_numero_ingresado);
    DBMS_OUTPUT.PUT_LINE('Número ingresado: '|| v_numero_ingresado);
    DBMS_OUTPUT.PUT_LINE('Cuadrado del numero: '||v_numero_devuelto);
END;
/
-- DUAL tiene una tabla, con un atributo y un objeto
-- es una tabla de testeo con propositos de testing
-- Dependiendo la version Dummy es x o 1

SELECT * FROM DUAL;

