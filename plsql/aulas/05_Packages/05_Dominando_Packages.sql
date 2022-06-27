DECLARE
    CURSOR cursor_employees_jobs IS
    SELECT
        (
            CASE
                WHEN employees.salary <= 2000  THEN
                    'Faixa Baixa'
                WHEN employees.salary <= 8000  THEN
                    'Faixa Média'
                WHEN employees.salary <= 10000 THEN
                    'Faixa Alta'
                WHEN employees.salary <= 15000 THEN
                    'Maior Faixa'
                WHEN employees.salary <= 25000 THEN
                    'Maior Faixa de todas'
                WHEN employees.salary <= 35000 THEN
                    'Maior Faixa de todas'
                WHEN employees.salary <= 35000 THEN
                    'Maior Faixa de todas'
                ELSE
                    'Aplicar % da Maior Faixa'
            END
        )                                                      AS faixa,
        jobs.job_title,
        employees.last_name,
        employees.first_name,
        ltrim(to_char(employees.salary, 'L99g999g999g999d99')) salario
    FROM
             jobs
        INNER JOIN employees ON jobs.job_id = employees.job_id
    WHERE
        jobs.job_id LIKE '%IT_PROG%'
        OR jobs.job_id LIKE '%AD%'
    ORDER BY
        employees.salary;

BEGIN
    FOR record_cursor_employees_jobs IN cursor_employees_jobs LOOP
        dbms_output.put_line(record_cursor_employees_jobs.faixa);
    END LOOP;
END;


create or replace function obter_descricao (p_num IN NUMBER) RETURN NUMBER
IS
    v_retorna NUMBER(10);
BEGIN
    v_retorna := p_num * 0.20 + p_num; 
    RETURN v_retorna;
END obter_descricao;



declare
    v_res NUMBER(10);
begin
    v_res := obter_descricao(p_num => 10);
    dbms_output.put_line('Valor é : ' || v_res);
end;