declare
	cursor cur_employees is
		select 
		    emp.salary, 
		    job.job_title
		from 
		    hr.employees emp
		inner join 
		    hr.jobs job
		on 
		    job.job_id = emp.job_id;
		    
	vn_comissao number(10,1);
	
	vn_percent number(10,1);
	
begin
	FOR rec_employees IN cur_employees
	LOOP
	
		IF rec_employees.job_title LIKE '%Manager%' THEN
		    vn_percent := 1.00;
			vn_comissao := vn_percent * rec_employees.salary;
			
		ELSIF  rec_employees.job_title LIKE '%President%' THEN
		    vn_percent := 0.50;
			vn_comissao := vn_percent * rec_employees.salary;
			
		ELSE
		    vn_percent := 0.30;
			vn_comissao := vn_percent * rec_employees.salary;
			
		END IF;
		
		sys.dbms_output.put_line(
		                'Percentual:   ' || vn_percent || 
		                '  -  Salario  ' || rec_employees.salary || 
		                '  -  Comissao ' || vn_comissao || 
		                '  -  Cargo ' || rec_employees.job_title);
	
	END LOOP;
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

set serveroutput on;
set verify off;
declare
    cursor cursor_employees_jobs is
        select 
            jobs.job_title "CARGO",
            employees.job_id "ID CARGO",
            sum(employees.salary) "SOMA DE SALARIO"
        from employees
        inner join jobs
        on jobs.job_id = employees.job_id
        group by jobs.job_title, employees.job_id
        ;
begin
        
    FOR record_employees IN cursor_employees_jobs
    LOOP
dbms_output.put_line
                     (
                     'SALARIO:  '
                     || record_employees."SOMA DE SALARIO"
                     || '  -  CARGO: '
                     || record_employees."CARGO"
                     || '  -  ID CARGO: '
                     || record_employees."ID CARGO"
                     );
    END LOOP;

end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

set serveroutput on;
create or replace function retorna_string_convertida (
    p_string IN varchar2 
) return number
is
    vn_tamanho number(10);

begin
    select length(p_string) 
    into vn_tamanho
    from dual;
    
    return vn_tamanho;
end retorna_string_convertida;
/

declare
    vv_string varchar2(100);
    vn_limite number(10);
    vn_counter number(10) := 1 ; 
begin
    vv_string := 'CooperativaCentralAuroraAlimentos';
    vn_limite := retorna_string_convertida(vv_string);
    
   while
        vn_counter <= vn_limite
    loop
        
        if mod(vn_counter, 2) = 0 then
            dbms_output.put_line( upper ( substr ( vv_string, vn_counter, 1) ) );
        
        else
             dbms_output.put_line( lower ( substr ( vv_string, vn_counter, 1) ) ) ;       
        end if;
        vn_counter := vn_counter + 1;
   end loop;
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

accept vn_employee_id prompt ' ... ';
declare
    type rec_emp_type is record (
        employee_id employees.employee_id%type,
        first_name employees.first_name%type,
        last_name employees.last_name%type,
        email employees.email%type,
        phone_number employees.phone_number%type,
        job_title jobs.job_title%type
        );
    
    rec_emp rec_emp_type;
    vn_employee_id employees.employee_id%type := &vn_employee_id;
begin
    
    select e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, j.job_title
    into rec_emp
    from employees e
    inner join jobs j
    on j.job_id  = e.job_id
    where e.employee_id  = vn_employee_id
    ;
    
    dbms_output.put_line(rec_emp.job_title);
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

variable gcargo varchar2;
execute :gcargo := 'Programmer';

variable gemployee_id number;
execute :gemployee_id := 104;

declare
    vv_job_title jobs.job_title%type;
    vn_min_salary jobs.min_salary%type;
    vn_max_salary jobs.max_salary%type;
    vn_salary employees.salary%type;
begin

    select j.job_title, j.min_salary, j.max_salary, e.salary
    into vv_job_title, vn_min_salary, vn_max_salary, vn_salary
    from employees e 
    inner join jobs j
    on j.job_id = e.job_id
    where j.job_title = :gcargo and e.employee_id = :gemployee_id;
    
dbms_output.put_line
                    ('Job Titulo: '
                     || vv_job_title
                     || ' - Salario minimo: '
                     || vn_min_salary
                     || ' - Salario maximo: '
                     || vn_max_salary
                     || ' - Salario maximo: '
                     || vn_salary
                     );
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

variable gvn_number_one number;
variable gvn_number_two number;

execute :gvn_number_one := 100;
execute :gvn_number_two := 200;

declare
    vn_number_one number(10);
    vn_number_two number(10);
    vn_total number(10);
    vn_media number(10);
begin
    vn_number_one := :gvn_number_one;
    vn_number_two := :gvn_number_two;
    
    select sum(vn_number_one + vn_number_two)
    into vn_total
    from dual;
    
    vn_media := vn_total / 2;
    
    dbms_output.put_line('M??dia ' || vn_media);
    
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

declare
    vn_number_one number(13, 2) := 250.353 ;
    vn_number_two number(13, 2) := 250.565 ;
    vn_media number(13, 2);
    vn_total number(13, 2);
begin

    select sum(vn_number_one + vn_number_two) 
    into vn_total
    from dual
    ;
    
    vn_media := ROUND(vn_total / 2, 2);
    
    dbms_output.put_line('M??dia ' || vn_media);
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

accept p_job_title prompt ' ... ';
set serveroutput on;
set verify off;
declare
    vv_first_name employees.first_name%type;
    vv_last_name employees.last_name%type;
    vn_salary employees.salary%type;
    vn_employee_id employees.employee_id%type;
    vv_job_title jobs.job_title%type := &p_job_title;
    
begin

    select employees.first_name, employees.last_name, employees.salary, employees.employee_id, jobs.job_title
    into vv_first_name, vv_last_name, vn_salary, vn_employee_id, vv_job_title
    from employees
    inner join jobs
    on jobs.job_id = employees.job_id
    /* where employee_id = vv_job_title*/;
    
    dbms_output.put_line(
                        'Primeiro Nome: '
                     || vv_first_name
                     || ' -  Segundo Nome: '
                     || vv_last_name
                     || ' -  Salario: '
                     || ltrim(to_char(vn_salary, 'L99g999g999d99'))
                     || ' -  Emp Id: '
                     || vn_employee_id
                     || ' -  Cargo: '
                     || vv_job_title
                     );
                     
exception
    when no_data_found then
        raise_application_error(-20000, 'Erro par??metro n??o encontrado para a consulta de dados ' || SQLCODE || ' - ' || SQLERRM);
    when others then
        raise_application_error(-20001, 'Erro Oracle - Consulte o suporte e informe as seguintes descri????es '|| SQLCODE || ' - ' || SQLERRM);
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

set serveroutput on;
set verify off;
variable gdepartment_id number
execute :gdepartment_id := 60;

declare

    cursor       cur_emp_job is
        select     distinct e.job_id, e.salary, j.job_title
        from      employees e
        inner join   jobs j
        on          e.job_id = j.job_id
        where   e.department_id = :gdepartment_id
        order by    j.job_title
        ;
            
    vn_med_sal employees.salary%type;
    vn_sum_sal employees.salary%type;
    vv_job_title jobs.job_title%type;
    vn_department_id employees.department_id%type;
    
begin

    select avg(e.salary), sum(e.salary), j.job_title, e.department_id
    into vn_med_sal, vn_sum_sal, vv_job_title, vn_department_id
    from employees e
    inner join jobs j
    on j.job_id = e.job_id
    where e.department_id = :gdepartment_id
    group by j.job_title, e.department_id
    ;
    
    dbms_output.put_line(
                                            ' Cargo: ' || vv_job_title ||
                                            ' -  Id Dpto.: ' || vn_department_id ||
                                            ' -  M??dia Salario: ' || ltrim(to_char(vn_med_sal, 'L999g999d99' ) ) ||
                                            ' -  Soma Salario: ' || ltrim(to_char(vn_sum_sal, 'L999g999d99') )
                                        );

    FOR rec_emp_job in cur_emp_job LOOP
        dbms_output.put_line(
                                                ' Id Job: ' || rec_emp_job.job_id ||
                                                ' Salario: ' || rec_emp_job.salary ||
                                                ' Cargo: ' || rec_emp_job.job_title
                                            );
    END LOOP;
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

set serveroutput on;

variable gdepartment_id number;
variable gpercentual number;

execute :gdepartment_id := 60;
execute :gpercentual := 20;

print gdepartment_id;
print gpercentual;

declare
    vdepartment_id employees.department_id%type := :gdepartment_id ;
    vpercentual employees.salary%type := :gpercentual ;
begin
    update employees
    set salary  = salary * (1 + vpercentual / 100)
    where department_id = vdepartment_id ;
    dbms_output.put_line('Numero de funcion??rios atualizados: ' || SQL%ROWCOUNT);
end;
rollback;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select 
    count(*),
    emp.salary   sal,
    emp.job_id job,
    jobs.job_title cargo
from
    jobs,
    employees emp
where
    jobs.job_id = emp.job_id(+) 
group by
    emp.salary,
    emp.job_id,
    jobs.job_title
;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- PL SQL, variavel Bind e comando update dentro do bloco anonimo

set serveroutput on
variable commission number

declare
    vn_employee_id number(10, 2) := 120 ;
begin
    :commission := 0.20 ;
    dbms_output.put_line('Comiss??o ' || :commission) ;
    
    update employees
    set salary = salary * :commission
    where employee_id = vn_employee_id
    ;

end;

-- PL SQL, variavel BIND e comando UPDATE dentro do bloco ANONIMO, uso de ANINHAMENTO de Bloco PL SQL ...

set serveroutput on
variable commission number

declare
    vv_first_name employees.first_name%type ;
    vv_last_name employees.last_name%type ;
    vn_employee_id number(10, 2) := 120 ;
begin
    :commission := 0.20 ;
    
    declare
        
    begin
        update employees
        set salary = salary * :commission
        where employee_id = vn_employee_id ;
    end ;
        
    select first_name, last_name
    into vv_first_name, vv_last_name
    from employees
    where employee_id = vn_employee_id;
    
    dbms_output.put_line(' Nome  ' || vv_first_name || ' ' || vv_last_name);
    dbms_output.put_line(' emp id  ' || vn_employee_id) ;
end;

-- PL SQL, variavel BIND e comando SELECT dentro do bloco ANONIMO 

set verify off
declare
    vv_first_name employees.first_name%type;
    vv_last_name employees.last_name%type;
    vn_salary employees.salary%type;
begin
    select first_name, last_name, salary
    into vv_first_name, vv_last_name, vn_salary
    from employees
    where employee_id = &emp_id;
    
    dbms_output.put_line('Nome ' || vv_first_name || ' ' || vv_last_name || ' ' || vn_salary) ;
end;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Introdu????o ao tipo de dado Record e Collection ...

DECLARE
	TYPE [tabela_record_type] IS RECORD (
		campo_um [tipo_de_dado{%type} ];
		campo_dois [tipo_de_dado{%type} ];
		campo_n [tipo_de_dado{%type} ];
	
	variavel_record tabela_record_type;
	
	
-- O Comando EXECUTE IMMEDIATE  ...

EXECUTE IMMEDIATE 'SQL string'
[ INTO { vari??vel [, vari??vel ] ... | record } ]
[ USING [ IN | OUT | IN OUT ] bind_argument ];

-- SQL String: ?? uma string que cont??m aquilo que se deseja executar
-- Clausula INTO: a especifica????o de variaveis ?? opcional e indica uma ou mais variaveis para as quais valores selecionados ser??o atribu??dos
-- Clausula USING: a se????o bind_argument (par??metros) ?? opcional e designa um valor repassado para bind variables na SQL string
-- EXECUTE IMMEDIATE n??o realizara automaticamente o COMMIT de uma transa????o DML anterior
-- Consultas que retornem mais de uma linha n??o s??o suportados como valor de retorno
-- Para executar comandos DDL atrav??s de SQL din??mico,o usu??rio deve er recebido os privil??gios de sistema de forma explicita, n??o pode ser atrav??s de ROLES


-- Function PIPELINED ...
-- Cria????o do ARRAY

CREATE OR REPLACE TYPE REG_FUNCIONARIO AS OBJECT (
	FIRST_NAME VARCHAR2(20),
	LAST_NAME VARCHAR2(25) ,
	JOB_ID NUMBER(6,0)
);

	
-- Cria????o da MATRIZ

CREATE OR REPLACE TYPE TABLE_REG_FUNCIONARIO AS TABLE OF REG_FUNCIONARIO ;


-- Conectado como Sys, GRANT ANY TYPE TO xe;
-- Registro Array, DROP TYPE TABLE_REG_FUNCIONARIO;
-- Array: [0] [1] [2] [3] [4]
-- Matriz: 
          [0] [1] [2] [3] [4]
          [0] [1] [2] [3] [4]
          [0] [1] [2] [3] [4]
	;	;
	
-- Function que retorna registros
CREATE OR REPLACE FUNCTION GET_EMPLOYEE( 
	p_emp_id hr.employees.JOB_ID%type 

) RETURN TABLE_REG_FUNCIONARIO PIPELINED

IS
	list_array REG_FUNCIONARIO;
	
	CURSOR cur_emp_func IS
		SELECT EMP.FIRST_NAME, EMP.LAST_NAME, EMP.JOB_ID
		FROM HR.EMPLOYEES EMP
		WHERE EMP.JOB_ID = p_emp_id 
	;
	
	REG cur_emp_func%ROWTYPE ;
	
BEGIN

	OPEN 
		cur_emp_func
	;
	
	FETCH 
		cur_emp_func INTO REG
	;
	
	list_array := REG_FUNCIONARIO(
		REG.FIRST_NAME, REG.LAST_NAME, REG.JOB_ID
	);
	
	PIPE ROW(
		list_array
	);
	
	CLOSE 
		cur_emp_func 
	;
	
	RETURN ;

END ;


-- Executando
SELECT * FROM TABLE(GET_EMPLOYEE(120));

SELECT EMPL.*, JOB.JOB_TITLE
FROM   TABLE(GET_EMPLOYEE(1)) EMPL, JOBS JOB
WHERE JOB.JOB_ID
	


-- USO DE COUNT DENTRO DE CASE ...

SELECT
    COUNT(CASE WHEN EMP.SALARY <= 8999 THEN 1 ELSE NULL END) BAIXO,
    COUNT(CASE WHEN EMP.SALARY BETWEEN 9000 AND 20000 THEN 1 ELSE NULL END) MEDIO,
    COUNT(CASE WHEN EMP.SALARY > 20000 THEN 1 ELSE NULL END) ALTO
FROM
    HR.EMPLOYEES EMP
;
	
---



CREATE OR REPLACE PROCEDURE PKG_RETORNA_REGS_CTRS (
    p_region_id IN REGIONS.REGION_ID%TYPE DEFAULT IS NULL
) IS
 
    TYPE t_rec_regs_ctrs IS RECORD (
        REGION_ID      REGIONS.REGION_ID%TYPE
        , REGION_NAME  REGIONS.REGION_NAME%TYPE
        , COUNTRY_ID   COUNTRIES.COUNTRY_ID%TYPE
        , COUNTRY_NAME COUNTRIES.COUNTRY_NAME%TYPE
        )
    ;
    TYPE t_tab_rec_regs_ctrs IS TABLE OF t_rec_regs_ctrs
        INDEX BY BINARY_INTEGER
    ;
	vector_regs_ctrs t_tab_rec_regs_ctrs ;

    vv_string VARCHAR2(3000) ;
    
BEGIN

    vv_string := '
        select 
            regs.REGION_ID
            , regs.REGION_NAME
            , ctrs.COUNTRY_ID
            , ctrs.COUNTRY_NAME
        from
            COUNTRIES ctrs
            , REGIONS regs
        WHERE
            ctrs.REGION_ID = regs.REGION_ID
        ;
    '

    IF p_region_id IS NOT NULL THEN

        vv_string := vv_string || ' AND ctrs.REGION_ID = :'

    END IF ;

END ;
	

	
	
	
	
	
	
	
	
	
	