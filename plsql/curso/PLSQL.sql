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
    
    dbms_output.put_line('Média ' || vn_media);
    
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
    
    dbms_output.put_line('Média ' || vn_media);
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
        raise_application_error(-20000, 'Erro parâmetro não encontrado para a consulta de dados ' || SQLCODE || ' - ' || SQLERRM);
    when others then
        raise_application_error(-20001, 'Erro Oracle - Consulte o suporte e informe as seguintes descrições '|| SQLCODE || ' - ' || SQLERRM);
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
                                            ' -  Média Salario: ' || ltrim(to_char(vn_med_sal, 'L999g999d99' ) ) ||
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
    dbms_output.put_line('Numero de funcionários atualizados: ' || SQL%ROWCOUNT);
end;
rollback;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

