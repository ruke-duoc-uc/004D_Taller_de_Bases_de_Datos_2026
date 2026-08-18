-- VARRAY se crea con un numero fijo de lista
DECLARE
    TYPE numero_asiento IS VARRAY(6) OF
    VARCHAR2(3);
    -- el ":=" permite que modifiquemos la variable
    v_asientos numero_asiento := numero_asiento(
        'A01','A02','A03','A04','A05','A06');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Se le asigno el asiento: '||v_asientos(3));
END;
/