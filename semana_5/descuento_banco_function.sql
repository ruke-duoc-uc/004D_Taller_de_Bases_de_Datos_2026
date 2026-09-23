-- Descuento por convenio bancario
CREATE OR REPLACE FUNCTION descuento_banco_f
(p_id_banco NUMBER, p_pago_bruto NUMBER)
    RETURN NUMBER
    IS
    v_descuento_banco NUMBER;
    v_descuento_aplicado NUMBER;
BEGIN
    SELECT DESCUENTO_PORCENTAJE
    INTO v_descuento_banco
    FROM CONVENIO_BANCO
    where p_id_banco = CONVENIO_BANCO_ID;
    v_descuento_aplicado := p_pago_bruto-(p_pago_bruto * v_descuento_banco)/100;
    RETURN v_descuento_aplicado;
END;
/
declare
    v_id_banco NUMBER := 1;
    v_precio_bruto NUMBER := 10000000;
    v_precio_descuento NUMBER;
    v_char1 VARCHAR2(100);
    v_char2 VARCHAR2(100);
begin
    v_precio_descuento:= descuento_banco_f(v_id_banco,v_precio_bruto);
    SELECT
    TO_CHAR(v_precio_bruto,'FM$999G999G999G999') AS VALOR_BRUTO,
    TO_CHAR(v_precio_descuento,'FM$999G999G999G999') AS DESCUENTO
    INTO v_char1,v_char2
    FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Valor inicial: '||v_char1);
    DBMS_OUTPUT.PUT_LINE('Valor con descuento: '||v_char2);
end;