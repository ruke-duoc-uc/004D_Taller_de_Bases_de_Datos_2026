DECLARE
    TYPE rut_usuario IS VARRAY(3) OF VARCHAR2(12);
    v_lista_rut rut_usuario := rut_usuario(
    '12.568.621-8','21.217.956-K','42.952.896-3');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Rut del primer usuario: '|| v_lista_rut(1));
END;
/
DECLARE
    TYPE rut_usuario IS VARRAY(3) OF VARCHAR2(12);
    v_lista_rut rut_usuario := rut_usuario();
BEGIN
    v_lista_rut.EXTEND;
    v_lista_rut (1) := '11.111.111-2';
    v_lista_rut.EXTEND;
    v_lista_rut (1) := '33.333.333-5';
    DBMS_OUTPUT.PUT_LINE('Rut del primer usuario: '|| v_lista_rut(1));
    DBMS_OUTPUT.PUT_LINE('Rut del primer usuario: '|| v_lista_rut(2));
END;
/
