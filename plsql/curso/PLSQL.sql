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


---------------------


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

---------------------

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
