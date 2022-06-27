'------------------------------------------------------------------------------------------------------------------------------------------------------------- ciação de SEQUENCE'
SEQUENCE: CREATE SEQUENCE ID_SEGMERCADO_SEQ INCREMENT BY 1 MAXVALUE 999999999999999 MINVALUE 1 NOCACHE;
SEQUENCE: CREATE SEQUENCE LOCATIONS_SEQ INCREMENT BY 100 MAXVALUE 9900 MINVALUE 1 NOCACHE;
SEQUENCE: CREATE SEQUENCE EMPLOYEES_SEQ INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 NOCACHE;
SEQUENCE: CREATE SEQUENCE DEPARTMENTS_SEQ INCREMENT BY 10 MAXVALUE 9990 MINVALUE 1 NOCACHE;

Useful for any subsequent addition of rows to LOCATIONS table
CREATE SEQUENCE locations_seq  
 START WITH     3300  
 INCREMENT BY   100  
 MAXVALUE       9900  
 NOCACHE  
 NOCYCLE
 
Useful for any subsequent addition of rows to DEPARTMENTS table
CREATE SEQUENCE departments_seq  
 START WITH     280  
 INCREMENT BY   10  
 MAXVALUE       9990  
 NOCACHE  
 NOCYCLE

'------------------------------------------------------------------------------------------------------------------------------------------------------------- 12. Bloco Anônimo'

set serveroutput on;

declare
    vResultadoMedia NUMBER(10,2);
    vNumeroUm NUMBER(10,2) := 10;
    vNumeroDois NUMBER(10,2) := 2;

begin
    
    vResultadoMedia := (vNumeroUm + vNumeroDois) / 2;
        dbms_output.put_line('O valor médio entre ' || vNumeroUM || ' e ' ||  vNumeroDois || ' eh ' || vResultadoMedia);
    
end;

'------------------------------------------------------------------------------------------------------------------------------------------------ Definindo Identificadores - variáveis '

set serveroutput on;

declare
    vNumber1 NUMBER(10, 2) := 1200;
    vNumber2 NUMBER(10, 2) := 600;
    vMediaNu NUMBER(10, 2);
begin
    vMediaNu := (vNumber1 / vNumber2);
    dbms_output.put_line('Média ' || vMediaNu);
end;



declare
    vCharacterTamanhoFixo CHAR(2) := 'RS';
    vCharacterTamanhoVariavel VARCHAR2(100) := 'Porto Alegre - Rio Grande do Sul'; 
begin
    dbms_output.put_line('Character de tamanho Fixo ' || vCharacterTamanhoFixo );
    dbms_output.put_line('Character de tamanho Fixo ' || vCharacterTamanhoVariavel );
end;



declare
    vData1 date := '31/01/22';
    vData2 date := '31/01/22';
begin
    dbms_output.put_line('Data 1 : ' ||to_char( vData1, 'dd/mm/yyyy'));
    dbms_output.put_line('Data 1 : ' || vData2);
end;

'----------------------------------------------------------------------------------------------------------------------------------------------- Definindo Identificadores - Constantes'

-- Ocorre erro na linha 59 por tentar alterar o valor da CONSTANT.

declare
    vPI CONSTANT NUMBER(38, 15) := 3.14159265333589792;

begin
    dbms_output.put_line('vPI = ' || vPI);
    vPI := 3.141592;
    dbms_output.put_line('vPI = ' || vPI);

end;


'---------------------------------------------------------------------------------------------------------------------------------------------------------------- Descrição da tabela '

desc employees

Nome           Nulo?    Tipo         
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4)   


'------------------------------------------------------------------------------------------------------------------------------------------------------------------ 16. Variável Bind '
'
É UMA VARIAVEL QUE SE DECLARA EXTERNAMENTE AO BLOCO PL/SQL, OU SEJA NÃO SE DECLARA DENTRO DA SEÇÃO DECLARE, SÃO VARIAVEIS UTILIZADAS GERALMENTE EM OUTRAS LINGUAGENS DE PROGRAMAÇÃO,
COMO COBOL OU C, ONDE TERÁ UM COMPILADOR EXPPECIFICO PARA ISSO, DENTRO DO PROGRAMA COBOL OU C, ONDE PODERÁ DECLARAR VARIAVEIS NO COBOL OU C, E REFERENCIAR ESSAS VARIAVEIS NO
BLOCO PL/SQL, LOGO ELAS NÃO FORA DECLARADAS NO BLOCO NA SEÇÃO DECLARE E SIM EXTERNAMENTEAO BLOCO. QUEM VAI RESOLVER ISSO É O COMPILADOR.

UTILIZANDO, O CAMANDO NO SQL PLUS OU SQL DEVELOPER

Para referenciar variaveis BIND fora da seção DECLARE você prefixa a referencia com o caracere (:) para distinguir de variaveis declaradas no bloco PL SQL
VARIABLE g_number NUMBER
'


SET SERVEROUTPUT ON

variable g_media NUMBER;
DECLARE
    vNumber1 NUMBER(10, 2) := 200;
    vNumber2 NUMBER(10, 2) := 400;

BEGIN
    :g_media := (vNumber1 + vNumber2) / 2;
    dbms_output.put_line('A média  é ' || to_char(:g_media));
    
EXCEPTION
    
    WHEN OTHERS
    THEN
        dbms_output.put_line('Erro Oracle ' || SQLCODE || SQLERRM);

END;


'--------------------------------------------------------------------------------------------------------------------------------------------------- Utilizando Funções no Bloco PLSQL'
'
Podemos utiliza funçoes de PL SQL dentro do bloco PL SQL, podemos usar funções de ROUND, TRUNC, MOD, SUBSTR, UPPER, LOWER, TO_CHAR, TO_NUMBER, TO_DATE, SYSDATE, LAST_DAY
Podemos usar função de conversão diretamente no bloco PL SQL, e também no comando SELECT numa expressão PL SQL (TO_CHAR, TO_DATE, TO_NUMBER)
Não podemos usar essas funções diretamente no comando PL SQL, essas funções só podemos usar dentro de um comando SQL (DECODE, AVG, MIN, MAX, COUNT, SUM, STDDEV e VARIANCE)
'

declare
    vNumber1 NUMBER(10, 2);
    vNumber2 NUMBER(10, 2);
    vMedia__ NUMBER(10, 2);
begin
    
    vNumber1 := 250.22;
    vNumber2 := 333.22;
    
    vMedia__ := ROUND((vNumber1 + vNumber2) / 4, 4);
        
        dbms_output.put_line('A media entre ' ||  vNumber2 || ' e ' || vNumber1 || ' é ' || vMedia__);
end;

'
>>> Statement processed.
>>> A media entre 333.22 e 250.22 é 145.86
'

declare
    vNumber1 NUMBER(33, 2);
    vNumber2 NUMBER(33, 2);
    vMedia__ NUMBER(33, 2);
begin
    
    vNumber1 := 999999;
    vNumber2 := 999999;
    
    vMedia__ := ROUND((vNumber1 + vNumber2) / 2, 2);
        
        dbms_output.put_line('Média ' || to_char(vMedia__,'99G999G999D99'));
        dbms_output.put_line('Média ' || vMedia__);        
end;


'------------------------------------------------------------------------------------------------------------ 19. Blocos Aninhados e Escopo de Identificadores (variáveis e constantes'

-- Delimitações dos blocos se dá ao comando END, onde encerra a execução geral (variaveis, cursores, querys.. ) deste bloco. abaixo estudo do LABEL (Rotulação)
<<label>> Nós podemos identificar os blocos através de LABEL, colocando antes de começar o Bloco PS SQL


declare
    vBloco1 VARCHAR2(100) := 'Bloco 1';
begin
    dbms_output.put_line('1 é o Bloco Atual: ' || vBloco1);

    declare
        vBloco2 VARCHAR2(100) := 'Bloco 2';
    begin
        dbms_output.put_line('2 é o Bloco Atual: ' || vBloco1);
        dbms_output.put_line('2 e o Bloco Atual: ' || vBloco2);      
    end;
    
    dbms_output.put_line('1 é o Bloco Atual: ' || vBloco1);
end;


'--------------------------------------------------------------------------------------------------------------------------------------------------- Utilizando comandos SQL no PL/SQL'
'   
	Comandos SQL no PL SQL: você pode utilizar o comando SELECT para popular variáveis com valores recuperados a partir de uma linha de uma tabela.
	O PL SQL suporta completamente os comandos DML - Data Manipulation Language (INSERT, UPDATE, DELETE) e os comandos de controle de transações do SQL.
	
'
' --------------------------------------------------------------------------------------------------------------------------------------------- Utilizando o comando SELECT no PL/SQL '
declare
    cursor cursor_cli is select id from cliente;
    v_razao_social cliente.razao_social%type;
    v_cnpj cliente.cnpj%type;
    v_total cliente.faturamento_previsto%type;

begin

    for record_cli in cursor_cli loop
        select razao_social, cnpj, sum(faturamento_previsto) as TOTAL
        into v_razao_social, v_cnpj, v_total
        from cliente
        where id = record_cli.id
        group by razao_social, cnpj
        ;
        dbms_output.put_line('Razão Social: '   || v_razao_social   || '     CNPJ: '    ||   v_cnpj   ||   '       Soma de Faturamento :  '         || v_total);
    end loop;
end;


declare

    v_first_name employees.first_name%type;
    v_last_name employees.last_name%type;
    v_salary employees.salary%type;
    v_employee_id employees.employee_id%type := 121;
    
begin

    select first_name, last_name, salary
    into v_first_name, v_last_name, v_salary
    from employees
    where employee_id = v_employee_id;

    dbms_output.put_line('First Name: ' || v_first_name);
    dbms_output.put_line('Last Name: '  || v_last_name);
    dbms_output.put_line('Salary : '    || v_salary);

end;

>> First Name: Adam
>> Last Name: Fripp
>> Salary : 8200



declare

    v_first_name employees.first_name%type;
    v_last_name employees.last_name%type;
    v_salary employees.salary%type;
    v_employee_id employees.employee_id%type := 50;
    
    e_no_data_found exception;
    pragma EXCEPTION_INIT (e_no_data_found, -1403);
    
begin

    select first_name, last_name, salary
    into v_first_name, v_last_name, v_salary
    from employees
    where employee_id = v_employee_id;

    dbms_output.put_line('First Name: ' || v_first_name);
    dbms_output.put_line('Last Name: '  || v_last_name);
    dbms_output.put_line('Salary : '    || v_salary);

exception
    when e_no_data_found then
        raise_application_error(-20014, 'Erro Sem Dados Encontrados na Query ' || sqlerrm);
end;



declare
	v_job_id             employees.job_id%TYPE := 'IT_PROG';
    v_avg_salary     employees.salary%TYPE;
	v_sum_salary   employees.salary%TYPE;
	
begin
    select    round(avg(salary), 2),   round(sum(salary), 2)
    into       v_avg_salary                ,     v_sum_salary
    from     employees
    where job_id = v_job_id;
    
    dbms_output.put_line('Média ' || v_avg_salary);
    dbms_output.put_line('Soma ' || v_sum_salary);
    dbms_output.put_line('O cargo é '  || v_job_id);
end;



declare
    v_job_id employees.job_id%type := 'IT_PROG';
    v_avg_salary employees.salary%type;
    v_sum_salary employees.salary%type;

begin
    select   round(avg(salary), 2),    round(sum(salary), 2)
    into      v_avg_salary,                v_sum_salary
    from    employees
    where  job_id = v_job_id;
    
    dbms_output.put_line('Cargo ' || v_job_id);
    dbms_output.put_line('Média ' || v_avg_salary);
    dbms_output.put_line('Soma ' || v_sum_salary);

end;



declare
    v_job_id employees.job_id%type := 'IT_PROG';
    v_avg_salary employees.salary%type;
    v_sum_salary employees.salary%type;

begin
    select   job_id, round(avg(salary), 2),    round(sum(salary), 2)
    into      v_job_id,                v_avg_salary,                v_sum_salary
    from    employees
   /* where job_id = v_job_id */
    group by job_id;
    
    dbms_output.put_line('Cargo ' || v_job_id);
    dbms_output.put_line('Média ' || v_avg_salary);
    dbms_output.put_line('Soma ' || v_sum_salary);

/*
Relatório de erros -
ORA-01422: a extração exata retorna mais do que o número solicitado de linhas
ORA-06512: em line 7
01422. 00000 -  "exact fetch returns more than requested number of rows"
*Cause:    The number specified in exact fetch is less than the rows returned.
*Action:   Rewrite the query or change number of rows requested
*/
end;




declare
    v_job_id employees.job_id%type := 'IT_PROG';
    v_avg_salary employees.salary%type;
    v_sum_salary employees.salary%type;
    
    e_to_many_rows exception;
    pragma EXCEPTION_INIT (e_to_many_rows, -1422);
    
begin

    select   job_id, round(avg(salary), 2),    round(sum(salary), 2)
    into      v_job_id,                v_avg_salary,                v_sum_salary
    from    employees
    /* where job_id = v_job_id */
    group by job_id;

    dbms_output.put_line('Cargo ' || v_job_id);
    dbms_output.put_line('Média ' || v_avg_salary);
    dbms_output.put_line('Soma '  || v_sum_salary);

exception
    when e_to_many_rows then
        raise_application_error(-20015, 'Erro ao retornar mais de uma linha');
end;

/*
Relatório de erros -

ORA-01422: a extração exata retorna mais do que o número solicitado de linhas
ORA-06512: em line 7
01422. 00000 -  "exact fetch returns more than requested number of rows"
*Cause:    The number specified in exact fetch is less than the rows returned.
*Action:   Rewrite the query or change number of rows requested
*/
' --------------------------------------------------------------------------------------------------------------------------------------------- Utilizando o comando INSERT no PL/SQL '

DECLARE
    v_first_name employees.first_name%type := 'Wallison Tiago' ;
    v_last_name employees.last_name%type := 'Assis' ;
    v_email employees.email%type := 'Wallison Assis' ;
    v_phone_number employees.phone_number%type := '512.123.45568' ;
    v_job_id employees.job_id%type := 'IT_PROG' ;
    v_salary employees.salary%type := 1500 ;
    v_commission_pct employees.commission_pct%type := 0.4 ;
    v_manager_id employees.manager_id%type := 104 ;
    v_department_id employees.department_id%type := 60 ;
    
    e_dup_val_on_index exception;
    pragma exception_init(e_dup_val_on_index, -1);
BEGIN
    insert into employees

        (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
    values

        (employees_seq.nextval, v_first_name, v_last_name, v_email, v_phone_number, sysdate, v_job_id, v_salary, v_commission_pct, v_manager_id, v_department_id);
    commit;

exception
    when e_dup_val_on_index then
        raise_application_error(-20000, 'Erro por duplicidade de Chave Primaria no Campo Manager ID     ' || sqlerrm);
END;


' --------------------------------------------------------------------------------------------------------------------------------------------- Utilizando o comando UPDATE no PL/SQL '

select * from employees where employee_id = 104;
set serveroutput on;

declare
    v_employee_id  employees.employee_id%type := 207;
    v_percentual      NUMBER(10, 2) := 10;
    v_divisor            NUMBER(10, 2) := 100;

    error_update exception;
begin
    
    update
        employees 
    set
        salary = salary * (1 + v_percentual / v_divisor)
    where 
        employee_id = v_employee_id;
    
    IF SQL%NOTFOUND THEN
        raise error_update;
    END IF;
    
    commit;

EXCEPTION
    WHEN error_update THEN
        RAISE_APPLICATION_ERROR(-20000, '0 Linhas Atualizadas - Por favor inserir dados corretos dentro do parâmetro.       ' || sqlerrm);
end;

' ---------------------------------------------------------------------------------------------------------------------------------------------- Utilizando o comando DELETE no PL/SQL '

declare
    error_sql_not_found exception;

begin
    delete from employees where employee_id = 207;

        IF SQL%notfound THEN
            raise error_sql_not_found;
        END IF;

exception

    when error_sql_not_found then

        RAISE_APPLICATION_ERROR(-20000, '   Erro ao tentar inserir dados na Tabela, onde foram passados parâmetros indetermináveis         '  || sqlerrm);
end;

' --------------------------------------------------------------------------------------------------------------------------------  Controlando Transações de Banco de Dados no PL SQL'
'
	Uma transação consiste de um conjunto de COMANDOS DML (INSERT, UPDATE e DELETE) que formam uma unidade lógica de trabalho. 
	Uma transação então é uma unidade lógica do trabalho que você deseja faze-la completamente ou deseja desfaze-la completamente.
	Uma transação de Banco de Dados consiste em, Um conjunto de COMANDOS DML, ou um conjunto de Comandos DDL, create, alter, drop, truncate,
	ou um conjunto de DCL, grant, revoke, ambos tem o COMMIT automatico somente o DML é a cargo do desenvolvedor.
	porém o DDL e DCL não é possível realizar os comando direto no PL SQL, precisa usar SQL DINAMICO.
'
'
	Uma transação começa em um dos seguintes eventos:
	Voce se conecta e um comando SQL DML é executado.
	Após um comando COMMIT, um comando SQL DML é executado.
	Após um comando ROLLBACK, um comando SQL DML é executado.
'
'
	Uma transação termina com um dos seguintes eventos:
	Um comando COMMIT
	Um comando ROLLBACK
	Um comando DDL ou DCL (executa um COMMIT automático)
	O usuário encerra sessão (disconecta) no SQL Developer, SQL*Plus, etc
	Crash do sistema (sistema operacional, rede, banco de dados, etc)
'
'
	O comando COMMIT encerra a transação corrente tornando todas as mudanças da transação pendentes no banco de dados, permanente.
	O comando ROLLBACK encerra a transação corrente, desfazendo as mudanças da transação.
'
'------------------------------------------------------------------------------------------------------------------------------------------------------------------- CURSOR IMPLICITO '
'	Sempre que é executado um comando SQL o Oracle abre uma area de memória na qual o comando é analisado e executado. Esta área é chamado de Cursor.
	Não temos controle nunhum sobre o cursor implicito no programa, pois quem controle é o proprio oracle, ele abre o cursor executa e fecha.
	A unica coisa que pode ser feito com relação ao cursor implicito, é após, comando SELECT, INSERT, UPDATE, ou DELETE,  pode ser utilizado o atributo de cursor:
	- SQL%ROWCOUNT  :  Numero de linhas afetadas pelo cursor, ou seja, pelo ultimo comando SQL.
	- SQL%FOUND     :  Retorna TRUE se o cursor afetou uma ou mais linhas.
	- SQL%NOTFOUND  :  Retorna TRUE se o curosor não afetou nenhuma linha.
	- SQL%ISOPEN    :  Retorna FALSE, porque o Oracle controla o cursor implicito automaticamente, fechando o cursor.
'
	DECLARE
    vDepartment_id employees.department_id%type := 60;
    vPercentual NUMBER (10, 2) := 10;

BEGIN
    update
        employees
    set
        salary = salary * (1 +  vPercentual / 100)
    where department_id = vDepartment_id;
    dbms_output.put_line('Numero de empreagados atualizados:  ' || SQL%ROWCOUNT);
    
END;

'------------------------------------------------------------------------------------------------------------------------------------------------------------------- Operadores PL SQL '
'
	Os principais Operadores:
	+                                                              : Soma
	-                                                              : Subtração
	*                                                              : Multiplicação
	/                                                              : Divisão
	**                                                             : Exponenciação
	NOT                                                            : Negação Lógica
	=, <, >, <=, >=, IS NULL, LIKE, BETWEEN, IN, !=, <>, ^=, ~=    : Operadores de Comparação
	AND                                                            : Operador Lógico AND
	OR                                                             : Operador Lógico OR

	Ordem de Precedência:
	1   :   **
	2   :   +  e  -  (sinais)
	3   :   *  e  /
	4   :   +  e  -  e  ||
	5   :   =, <, >, <=, >=, IS NULL, LIKE, BETWEEN, IN, !=, <>, ^=, ~=
	6   :   AND
	7   :   NOT
	8   :   OR
'

declare
    vNota1      NUMBER(11, 2) := 7.00;
    vNota2      NUMBER(11, 2) := 6.00;
    vNota3      NUMBER(11, 2) := 9.00;
    vNota4      NUMBER(11, 2) := 6.00;
    vMedia      NUMBER(11, 2);
begin
    vMedia := (vNota1 + vNota2 + vNota3 + vNota4) / 4;
    dbms_output.put_line('MEDIA ' || vMedia);
end;

'--------------------------------------------------------------------------------------------------------------------------------------------------------------------- Utilizando IF '
'	Comando IF, Sintaxe ( usando ACCEPT para entrada de dados )    podemos realizar varias combinações com o uso do AND e OR
	Cuidado ao utilizar nulos em expressões de comparação, qualquer comparação com o valor nulo, retorna o booleano NULL que é como se fosse FALSE,
	isso pode quebrar a Logica do código. Para comparar com o valor NULL deve ser utilizado o operador IS NULL ou IS NOT NULL, ou tratar o valor
	NULL utilizando as funções NVL ou NVL2.
'
	IF [NOT] {expressão | booleano}
			 [[AND | OR]
			 {expressão | booleano} ...
	THEN
		-- bloco de comandos
	[ELSE
		-- bloco de comandos
	]
	END IF;


SET SERVEROUTPUT ON;
ACCEPT prompt_v_employee_id PROMPT  'DIGITE O ID DO DEPARTAMENTO: ';

declare
    v_percentual NUMBER(10, 2);
    v_employee_id employees.employee_id%type := &prompt_v_employee_id;

begin

    IF v_employee_id = 80 THEN
        v_percentual := 10;
    ELSIF v_employee_id = 20 THEN
        v_percentual := 15;
    ELSIF v_employee_id = 90 THEN
        v_percentual := 20;
    ELSE
        v_percentual := 5;
    END IF;

    dbms_output.put_line('ID do departamento  :' || v_employee_id);
    dbms_output.put_line('Percentual:  ' || v_percentual);
    
    update
        employees
    set
        salary = salary * (1 + v_percentual / 100)
    where
        department_id = v_employee_id
    ;
end;





declare
    cursor cursor_cli is select id from segmercado;
    
  vDescricaoUm segmercado.descricao%type := 'Atacadistas';
  vDescricaoDois segmercado.descricao%type := 'Varejistas';
  vDescricaoTres segmercado.descricao%type := 'Industrial'; 
  vDescricaoQuatro segmercado.descricao%type := 'Farmaceuticos';
    
begin
    
    FOR cli_record IN cursor_cli LOOP
    
        IF cli_record.id <= 1 THEN
            UPDATE segmercado SET descricao = vDescricaoUm WHERE id =  cli_record.id;
        ELSIF cli_record.id <= 4  THEN
            UPDATE segmercado SET descricao = vDescricaoDois WHERE id =  cli_record.id;
        ELSIF cli_record.id <= 8  THEN
            UPDATE segmercado SET descricao = vDescricaoTres WHERE id =  cli_record.id;
        ELSE
            UPDATE segmercado SET descricao = vDescricaoQuatro WHERE id =  cli_record.id;
        END IF;
        
    END LOOP;
    COMMIT;
    
end;





set serveroutput on;
ACCEPT department_id PROMPT 'Digite o ID do departamento: '

DECLARE
    vDptoID employees.employee_id%type := &department_id;
    vPercentual  NUMBER(10, 2);
BEGIN

    IF vDptoID = 80 THEN
        vPercentual := 10;
    
    ELSIF vDptoID = 20 THEN
        vPercentual := 15;
    
    ELSIF vDptoID = 60 THEN
        vPercentual := 20;
    
    ELSE
        vPercentual := 5;
        
    END IF;


    DBMS_OUTPUT.PUT('ID : ' || vDptoID || 'PERCENTUAL: ' || vPercentual);
    
    update employees
    set salary = salary * (1 +vPercentual / 100)
    where department_id = vDptoID;

END;




' --------------------------------------------------------------------------------------------------------------------------------------------------------- Utilizando o Comando CASE '
'  Comando CASE '

CASE [TRUE | [variavel]]
WHEN [criterio1 | expressão1 THEN
		criterio1_comandos;
		
WHEN [criterio2 | expressão2 THEN
		criterio2_comandos;
		
WHEN [criterio3 | expressão3 THEN
		criterio3_comandos;
		
WHEN [criterio4 | expressão4 THEN
		criterio4_comandos;
ELSE
		else_comandos;
END CASE;




declare
    vn_department_id employees.department_id%type;
    vv_first_name employees.first_name%type := 'Steven';
    vv_last_name employees.last_name%type := 'King';
    vn_percentual NUMBER(5,2);
begin

    select department_id
    into vn_department_id
    from employees
    where first_name = vv_first_name 
    and last_name = vv_last_name;
    
 
    CASE
    WHEN vn_department_id = 90 THEN
        vn_percentual := 30.00;
    WHEN vn_department_id = 10 THEN
        vn_percentual := 20.00;
    WHEN vn_department_id = 15 THEN
        vn_percentual := 10.00;
    ELSE
        vn_percentual := 0.00;
    END CASE;
    
                dbms_output.put_line('Id de departamento   ' || vn_department_id);
                dbms_output.put_line('Percentual aplicado  '  || ltrim(to_char(vn_percentual, '99G999D99')));    
exception
    when no_data_found then
        dbms_output.put_line('ERRO  ' || sqlerrm);
end;




ACCEPT prompt_department_id PROMPT  'DIGITE UM ID DO DEPARTAMENTO, 20, 80 ou 90:  '
declare
    v_department_id employees.department_id%type := &prompt_department_id;
    v_percentual FLOAT;
    v_salary employees.salary%type;
begin
    
    CASE
    WHEN v_department_id = 80 THEN
        v_percentual := 10;
    WHEN v_department_id = 20 THEN
        v_percentual := 15;
    WHEN v_department_id = 90 THEN
        v_percentual := 20;
    ELSE
        v_percentual := 5;
    END CASE;

    update employees
    set salary = salary *  (1 + v_percentual / 100)
    where   department_id  = v_department_id
    ;
    
    select emp.salary
    into v_salary
    from employees emp
    where emp.department_id = &prompt_department_id;
	
    dbms_output.put_line('ID de departamento ' || v_department_id || ' Percentual aplicado ' || v_percentual);
    dbms_output.put_line('Salario Ajustado ' || v_salary);
end;

/*
select salary from employees where department_id like '%90%' ; 
34560
24480
24480
*/





' ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- LOOP básico '


accept prompt_limite PROMPT 'DIGITE ... :' 
declare
    
    v_number_counter NUMBER(10, 2) := 1;
    v_limite_definido_usu NUMBER(10, 2) := &prompt_limite;
begin
    
    LOOP
        dbms_output.put_line('Numero = ' || v_number_counter || '  ' || v_limite_definido_usu);
    
    EXIT WHEN
        v_number_counter = v_limite_definido_usu;
        v_number_counter := v_number_counter + 1;
    
    END LOOP;
end;


' ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- FOR com LOOP '
' O For Loop é bem mais organizado e mais seguro de se usar do que somente Loop Basico '
' A estrutra é a seguinte '
	
	FOR indice IN [REVERSE]
		limite_inicial .. limite_final LOOP
	   Bloco de comandos
	   ...
	END LOOP;
	
	' Variavel será o indice, podendo ser qualquer identificador, '
	' a faixa inicial e final fica antes da iniciação do LOOP. '
	' Após o Loop será executado os comando contidos nele, que finaliza no END LOOP, esse processo segue até que limite_final seja TRUE. '
	' REVERSE: Caso seja necessário retroceder a sequencia, indo do maior para o menor, DECRESCENTE '
	' Não ha necessidade de ser declarado a variavel INDICE: Referencie o indice somente dentro do LOOP, ele é indefinido fora do loop. '
	' ! Não referencie o indice como destino de uma atribuição: O indice é modificado somente pelo próprio INCREMENTO do FOR LOOP. '
	
ACCEPT p_var_fim PROMPT 'DIGITE   '; 

declare
    var_inicio NUMBER(3) := 1;
    var_fim     NUMBER(3) := &p_var_fim;
    v_count number(4);
    
begin
        
    FOR v_counter IN var_inicio .. var_fim LOOP
       
        select count(*)
        into v_count
        from cliente;
        
         dbms_output.put_line('Iniciar com  ' || to_char(v_counter) || ' Quantidade de dados clientes' || v_count);
    END LOOP;
end;


begin
    for vCounter IN 1..9 LOOP
        dbms_output.put_line('Val ' || vCounter);
    end loop;
end;

' ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- WHILE LOOP '

	inicializa a condição
	WHILE condição LOOP
	-	bloco de comandos
	...
	...
	...
	END LOOP;

accept p_limite1 prompt 'DIGITE  ';
declare
    v_numero NUMBER(10) := 1;
    v_limite    NUMBER(10) := &p_limite1;

begin

    WHILE v_numero <= v_limite LOOP
    
        dbms_output.put_line('Numero  ' || to_char(v_numero));
        
        v_numero := v_numero + 1;
    END LOOP;
end;


accept p_limite2 prompt 'DIGITE  ';
declare
    v_inicial   NUMBER(10) := 1;
    v_final    NUMBER(10) := &p_limite2;

begin

   FOR v_counter IN v_inicial .. v_final LOOP
    
        dbms_output.put_line('Numero  ' || to_char(v_counter));
        
    END LOOP;
end;




ACCEPT p_var_final PROMPT  'DIGITE   ';
declare
    var_inicial NUMBER(10) := 0;
    var_final    NUMBER(10) := &p_var_final;
    
begin
    
    
    select count(*)
    into v_cli_segmercado_id
    from cliente
    ;
    
    var_inicial := v_cli_segmercado_id + 1;
    
    WHILE var_inicial <=  var_final LOOP
        
        atualizar_dados_tabela_cliente(p_id=>  var_inicial  ,  p_segmercado_id=>   10       );
        
    END LOOP;

end;

' ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- LOOP BÀSICO '

SET SERVEROUTPUT ON;

ACCEPT p_var_limite prompt ' Digite algo ...  ';

declare
    v_limite  NUMBER(10) := &p_var_limite;
    v_inicial NUMBER(10) := 1;

begin

    LOOP
        dbms_output.put_line(' Atualmente em ... ' || v_inicial || ' Terminará em ... ' || to_char(v_limite, '99G999G999G999G999D99'));
        
    EXIT WHEN
        v_inicial = v_limite;
        v_inicial := v_inicial + 1;
        
    END LOOP;
    
end;

' -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- FOR LOOP '

ACCEPT p_var_limite prompt ' Digite algo ...  ';

declare
    v_final NUMBER(10) := &p_var_limite;
    v_inicial NUMBER(10) := 1;
begin
    
    FOR indice IN v_inicial .. v_final LOOP
        
        IF indice = 20 THEN
            dbms_output.put_line('Encerrou ! '  ||  v_final);
        ELSE
            dbms_output.put_line('Atualmente ... '  ||  (indice)  ||  ' Final em '  ||  v_final);
        END IF;
   
    END LOOP; 
end;



set SERVEROUTPUT ON;
set VERIFY OFF;
accept p_segmercado prompt '  DITITE ALGO  ';

declare
    record_segmercado segmercado%rowtype;
    v_id segmercado.id%type := &p_segmercado;
begin

    declare
        v_descricao segmercado.descricao%type := 'Alura';
        var_inicial NUMBER(2) := 1;
        var_final    NUMBER(2) := 2;
    begin
        FOR i IN var_inicial .. var_final LOOP
            update segmercado set descricao = v_descricao where id = i;
        END LOOP;
    end;

    select *
    into record_segmercado
    from segmercado
    where id = v_id;

    dbms_output.put_line(record_segmercado.id || '  -  ' || record_segmercado.descricao);
end;

' ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ WHILE LOOP '

accept p_final prompt 'DIGITE  ';

declare
    v_final NUMBER(10) := &p_final;
    v_inicial    NUMBER(10) := 1;
    
begin

    WHILE v_inicial <= v_final LOOP
    
        IF v_inicial = 20 THEN
            dbms_output.put_line(' Encerrou  em ' || v_final);
        ELSE
            dbms_output.put_line(' Atualmente em ... ' || v_inicial || ' Termina em ... ' || v_final);
        END IF;
        
        v_inicial := v_inicial + 1;
        
    END LOOP;
end;

' ------------------------------------------------------------------------------------------------------------------------------------------------------------------- LOOPS ANINHADOS '
' Voce pode aninhar LOOPS em varios níveis, normalmente o término de um LOOP aninhado não encerra o LOOP  externo, a menos que uma exceção seja disparada '
' Voce pode colocar label em um LOOP externo desta forma e sair do LOOP interno e do externo utilizando o comando EXIT nome do label '

accept prompt_insert prompt '  Digite  ...' ;
set SERVEROUTPUT ON;

declare
    v_final NUMBER(10) := &prompt_insert;
    v_inicial NUMBER(10) := 1;
    v_total    NUMBER(10) := 1;

begin
    
    <<LOOP1>>
    FOR i IN v_inicial .. v_final LOOP
        dbms_output.put_line('  Taboada do  =  ' || to_char(i));
        
        <<LOOP2>>
        FOR j IN v_inicial .. v_final LOOP
            dbms_output.put_line(to_char(j) || '  X  ' || to_char(v_final)   || ' = ' || v_total);

            v_total := j * to_char(v_final) ;            
            exit LOOP1 when v_total >200;

        END LOOP;
            
    END LOOP;
end;

' -------------------------------------------------------------------------------------------------------------------------------------------------------- Variavel Tipo PLSQL Record '

' PL SQL RECORD é um grupo de itens de dados relacionados armazenados em campos, cada um com seu próprio nome e tipo de dados. '
' Um PLSQL RECORD que contém campos com o nome, cidade, e data de admissao de um cliente permite tratar os dados como uma unidade lógica. '
' Quando voce declara um tipo RECORD para estes campos, eles podem ser manipulados como uma unidade. '
' Cada registro definido pode possuir tantos campos quanto necessário. Campos podem ser atribuidos valores iniciais e podem ser definidos como NOT NULL. '
' Campos sem valores iniciais são inicializados com NULL. A palavra chave DEFAULT também pode ser utilizada quando definido campos. '

DECLARE
TYPE nome_tipo_record IS RECORD
	(campo1 [, campo2] ...);
	
nome_variavel_record nome_tipo_record;

Ex.:

TYPE employee_record_type IS RECORD
	(employee_id employees.employee_id%type,
    first_name employees.first_name%type,
    last_name employees.last_name%type,
    email employees.email%type,
    phone_number employees.phone_number%type);
employees_record employee_record_type;

' Referenciando campos de uma PL SQL RECORD '
BEGIN
employee_record.first_name := 'Robert';


Ex.:

SET SERVEROUTPUT ON;
SET VERIFY OFF;
accept p_employee_id prompt  '  Digite um valor ';

declare
    TYPE employees_record_type IS RECORD
        (employee_id employees.employee_id%TYPE,
        first_name employees.first_name%TYPE,
        last_name employees.last_name%TYPE,
       email employees.email%TYPE,
       phone_number employees.phone_number%TYPE);
       
employees_record employees_record_type;

begin
    
    select employee_id, first_name, last_name, email, phone_number
    into employees_record
    from employees
    where employee_id = &p_employee_id;
    
    dbms_output.put_line(employees_record.employee_id || '  - ' || employees_record.first_name || '  - ' || employees_record.last_name || '  - ' || employees_record.email || '  - ' || employees_record.phone_number);
end;

' ------------------------------------------------------------------------------------------------------------------------------------------------------ Utilizando Atributo %ROWTYPE '
' Criando um PLSQL RECORD utilizando o atributo  %ROWTYPE: abaixo, a estrutura lógica da variavél employee_record será igual ao da tabela employees '
' Vantagens da utilização do atributo %ROWTYPE: o nome, tipo de dado e tamanho máximo das colunas referenciadas do banco de dados, não precisam ser conhecidos '
' Bastante útil quando recupera-se todas as colunas de uma linha com o comando SELECT *  '

	DECLARE
	employee_record employees%ROWTYPE;

EX.:

SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT p_employee_id PROMPT '  DIGITE O ID    ';

declare
    employee_record employees%ROWTYPE;
    v_employee_id employees.employee_id%type := &p_employee_id;
begin
    
    select *
    into employee_record
    from employees    
    where employee_id = v_employee_id;
    
    dbms_output.put_line(employee_record.employee_id || ' - ' || employee_record.first_name || ' - ' || employee_record.last_name || ' - ' || employee_record.phone_number);
end;



set SERVEROUTPUT ON;
set VERIFY OFF;
accept p_segmercado prompt '  DITITE ALGO  ';

declare
    record_cliente cliente%rowtype;
    v_id cliente.id%type := &p_segmercado;
begin

    select * 
    into record_cliente 
    from cliente 
    where id = v_id;
    
   dbms_output.put_line 
   (                   record_cliente.id
                       || '  -  '
                       || record_cliente.razao_social
                       || '  -  '
                       || record_cliente.cnpj
                       || '  -  '
                       || record_cliente.segmercado_id
                       || '  -  '
                       || record_cliente.data_inclusao
                       || '  -  '
                       || record_cliente.faturamento_previsto
                       || '  -  '
                       || record_cliente.categoria
    );
end;




set SERVEROUTPUT ON;
set VERIFY OFF;
ACCEPT prompt_employee_id prompt '  DIGITE ... ';

declare
    employees_record employees%ROWTYPE;
    v_employee_id employees.employee_id%TYPE := &prompt_employee_id;

begin
    SELECT *
    INTO employees_record
    FROM employees
    WHERE employee_id = v_employee_id;
   
dbms_output.put_line
                     ('Employee ID: '
                     || employees_record.employee_id
                     || '  -  First Name:  '
                     || employees_record.first_name
                     || '  -  Last Name:  '
                     || employees_record.last_name
                     || '  -  Emai:  '
                     || employees_record.email
                     || '  -  Phone Number:  '
                     || employees_record.phone_number
                     || '  -  Hire Date:  '
                     || employees_record.hire_date)
					 ;

end;


' --------------------------------------------------------------------------------------------------------------------------------------------------- Collections - Associative Array'
' Podemos ter 3 tipos de Collections: o Associative Arrays, Nested Table e Varray. '
' Associative Array: são estruturas unidimensionais de tipos de dados Oracle, registros ou tipos definidos pelo usuário. '
' Conhecido como index-by-tables no Oracle 8 e 9i e como PLSQL tables no Oracle 7. Pode ser indexida por valores numéricos ou caracere, permitindo buracos na numeração do indice. '
' É semelhante a um vetor, não podendo ser armazenados no banco de dados, ele fica na memória do PL SQL. '
' Basta atribuir um valor para a ocorrencia do Associative Array. Pode ser indexado com qualquer valor numérico, o que significa valores negativos, positivos ou zero. '
' Pode ser indexado também por strings de caracteres. Obrigatória a cláusula INDEX BY na definição do tipo. '

'	exemplo de uso'

	DECLARE
		TYPE nome_tipo_table
		IS TABLE OF nome_tabela.nome_coluna%type
		INDEX BY BINARY_INTEGER
	;
	nome_variavel_table nome_tipo_table;


	DECLARE
		TYPE Numero_Table_Type IS TABLE OF NUMBER(2)
		INDEX BY BINARY_INTEGER
	;
	Numero_Table Numero_Table_Type;
	
'	Referenciando uma Associative Array: '
	
	BEGIN
		Nome_Variavel_table(indice) := valor | expressão
	;
	

	set serveroutput on;
	declare
    
    TYPE        Number_Table_Type
    IS TABLE OF NUMBER(2)
    INDEX BY    BINARY_INTEGER;
    
    Number_Table  Number_Table_Type;
    
	begin
		FOR indice_um IN 1 .. 11 LOOP
			Number_Table(indice_um) := indice_um;
		END LOOP;

		FOR indice_um IN 1 .. 9 LOOP
			dbms_output.put_line('Associative Array: '   ||   to_char(indice_um)    ||   ', Valor indice: '   ||   to_char(Number_Table(indice_um)));
		END LOOP;

		commit;
	end;


' ---------------------------------------------------------------------------------------------------------------------------------------------- Bulk Collections - Associative Array'

set serveroutput on;
set verify off;

declare
    TYPE t_tab_rec_employees IS TABLE OF employees%rowtype
    INDEX BY BINARY_INTEGER;

    employees_table t_tab_rec_employees;
    
begin

    select * 
    BULK COLLECT 
    into employees_table 
    FROM employees ;
    -- Bulk Collect de todos (order_id) para a Collection (v_order_id)
    
    FOR indice IN employees_table.first .. employees_table.last LOOP
        
        dbms_output.put_line(employees_table(indice).employee_id     ||   '  -  '   ||
                                                 employees_table(indice).first_name          ||   '  -  '   ||
                                                 employees_table(indice).last_name           ||   '  -  '   ||
                                                 employees_table(indice).phone_number  ||   '  -  '   ||
                                                 employees_table(indice).job_id                  ||   '  -  '   ||       
                                                 to_char(employees_table(indice).salary, '99G999G999D99')
                                                 );      
    END LOOP;

end;




SET SERVEROUTPUT ON;
SET VERIFY OFF;

declare
    TYPE bulk_collect_cliente IS TABLE OF cliente%rowtype
    INDEX BY BINARY_INTEGER;
    
    cliente_table bulk_collect_cliente;
begin
    
    select *    
    BULK COLLECT into cliente_table
    from cliente;
    
    FOR indice IN cliente_table.first .. cliente_table.last LOOP
    
    dbms_output.put_line
                    (cliente_table(indice).id
                     || '  -  '
                     || cliente_table(indice).razao_social
                     || '  -  '
                     || cliente_table(indice).cnpj
                     || '  -  '
                     || cliente_table(indice).segmercado_id
                     || '  -  '
                     || cliente_table(indice).data_inclusao
                     || '  -  ' 
                     || cliente_table(indice).faturamento_previsto
                     || '  -  '
                     || cliente_table(indice).categoria
                     );
                    
    END LOOP;    
end;




SET SERVEROUTPUT ON;
SET VERIFY OFF;

declare
    TYPE bulk_collection_segmercado IS TABLE OF segmercado%rowtype
    INDEX BY BINARY_INTEGER;
    
    segmercado_table bulk_collection_segmercado;
begin
    
    select *
    BULK COLLECT into segmercado_table
    from segmercado;
    
    FOR indice IN segmercado_table.first .. segmercado_table.last LOOP
    dbms_output.put_line
                    (segmercado_table(indice).id
                     || '  -  '
                     || segmercado_table(indice).descricao
                     );
    END LOOP;
end;

' ------------------------------------------------------------------------------------------------------------------------------------------------------------------ Cursores com FOR'

declare
    CURSOR cur_emp_job IS
    select
        sum(job.max_salary) SUM_MAX, 
        sum(job.min_salary) SUM_MIN,
        emp.first_name FIRST_N,
        emp.job_id JOB_I
    from
        jobs job
    inner join
        employees emp
    on
        job.job_id = emp.job_id
    where
        emp.job_id = 'IT_PROG'
    group by
        emp.first_name,
        emp.job_id;

begin

    FOR record_emp_job IN cur_emp_job LOOP
        dbms_output.put_line(
							record_emp_job.SUM_MAX   ||  '   -   '  ||
							record_emp_job.SUM_MIN   ||  '   -   '  ||
							record_emp_job.FIRST_N   ||  '   -   '  ||                                                
							record_emp_job.JOB_I 
							);
    END LOOP;
end;




set serveroutput on;
declare
    cursor cursor_jobs is 
            select 
                sum(max_salary) MAX_SA,
                max(max_salary) MAX_GERAL,
                avg(max_salary)   MAX_AVG,
                min(min_salary)   MIN_MIN,
                min(max_salary)   MIN_MAX
            from jobs;
            
    record_cursor_jobs cursor_jobs%rowtype;

begin
    
    FOR record_cursor_jobs IN cursor_jobs LOOP
    
        dbms_output.put_line
                        (
                         record_cursor_jobs.MAX_SA
                         ||   '    -    '   ||
                         record_cursor_jobs.MAX_GERAL
                         ||   '   -    '   ||
                          to_char(record_cursor_jobs.MAX_AVG, 'l99g999g999g999d99')
                         ||   '    -    '   ||
                         record_cursor_jobs.MIN_MIN
                         ||   '    -    '   ||
                         record_cursor_jobs.MIN_MAX
                         );
        
    END LOOP;

end;

' ---------------------------------------------------------------------------------------------------------------------------------------------- ASSOCIATIVE ARRAY WITH RECORD - LOOP '

DECLARE

    TYPE table_record_jobs IS RECORD (
        job_id jobs.job_id%type,
        job_title jobs.job_title%type,
        min_salary jobs.min_salary%type,
        max_salary jobs.max_salary%type
    );

    TYPE t_tab_rec_jobs IS TABLE OF table_record_jobs
    INDEX BY BINARY_INTEGER;
    
    t_rec_jobs t_tab_rec_jobs;

BEGIN

    select *
    BULK COLLECT into t_rec_jobs
    from jobs;
    
    FOR indice IN t_rec_jobs.first .. t_rec_jobs.last LOOP
    
        dbms_output.put_line
                         (  t_rec_jobs(indice).job_id
                         || ' - '
                         || t_rec_jobs(indice).job_title
                         || ' - '
                         || t_rec_jobs(indice).min_salary
                         || ' - '
                         || t_rec_jobs(indice).max_salary
                         );

    END LOOP;
END LOOP;


' -------------------------------------------------------------------------------------------------------------------- ASSOCIATIVE ARRAY WITH RECORD - LOOP, USANDO FUNÇÕES NO SELECT '


set serveroutput on;
declare

    type record_employees IS RECORD (
        job_id employees.job_id%type,
        salary employees.salary%type
    );
    
    type t_tab_rec_employees IS TABLE OF record_employees
    INDEX BY BINARY_INTEGER;
    
    record_tab t_tab_rec_employees;
begin

    select distinct job_id, avg(salary) as salary
    BULK COLLECT into record_tab
    from employees group by job_id;
   
   FOR indice IN record_tab.first .. record_tab.last LOOP
        dbms_output.put_line(record_tab(indice).job_id     ||   '   -   '   ||     record_tab(indice).salary);
    
   END LOOP;
end;

