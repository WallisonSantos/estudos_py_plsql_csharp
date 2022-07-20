------------------ Criação da Tabela de Itens: Criado a tabela e feito a alteração adcionando uma chave primaria com referencia no campo codigo item.

CREATE TABLE cadastro_item (
    codigo_item         NUMBER(10, 0),
    descricao_item      VARCHAR2(100),
    codigo_marca        NUMBER(10, 0),
    marca               VARCHAR2(50),
    negocio             VARCHAR2(50),
    categoria           VARCHAR2(50),
    grupo_comercial     VARCHAR2(50),
    subgrupo_comercial  VARCHAR2(50)
);
ALTER TABLE cadastro_item ADD CONSTRAINT pk_cadastro_item PRIMARY KEY ( codigo_item );




------------------ Criação da Tabela de Acordo Notas: Criado a tabela e feito a alteração adcionando uma chave primaria com referencia no campo codigo item.

CREATE OR REPLACE PROCEDURE p_milhas_para_km 
(p_milhas IN NUMBER)
IS
	/* -----------------------------------------------------------
	PROCEDURE : p_milhas_para_km
	DESCRIÇÃO : converte valor de distância em milhas para quilômetros
	PARÂMETROS: p_milhas -> ENTRADA. Valor da distância em milhas
	----------------------------------------------------------- */
	v_Km NUMBER; -- receberá valor convertido para km
BEGIN
	v_Km := p_milhas * 1.61;
	DBMS_OUTPUT.PUT_LINE('Distancia em milhas: ' || TO_CHAR(p_milhas));
	DBMS_OUTPUT.PUT_LINE('O valor equivalente em km eh: ' || TO_CHAR(v_Km));
END p_milhas_para_km;

SQL> EXEC p_milhas_para_km(10);
Distância em milhas: 10
O valor equivalente em km é: 16,1
Procedimento PL/SQL concluído com sucesso.
SQL>




------------------ Procedure, incluir seguimento de mercado:

CREATE OR REPLACE PROCEDURE incluir_segmercado
(p_id IN NUMBER, p_descricao IN VARCHAR2)
IS

/* -----------------------------------------------------------
PROCEDURE : incluir_segmercado
DESCRIÇÃO : faz a inclusão do segmercado de mercado dentro da table segmercado
PARÂMETROS: p_id, p_descricao -> ENTRADA. icódigo identificado e descrição do segmento.
VARIÁVEIS : v_, v_ -> 
----------------------------------------------------------- */

BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        p_id,
        upper(p_descricao)
    );
    COMMIT;
END;

EXECUTE incluir_segmercado(p_id=>12,p_descricao=>'Chocolateria');
select * from segmercado;


	
select distinct categoria from cadastro_item; 
-- HAMBURGER, MORTADELAS, LINGUICAS, CORTES
select distinct negocio from cadastro_item; 
-- SUINO, FRANGO, INDUSTRIALIZADOS.
ALTER TABLE cadastro_item ADD percentual FLOAT;
SELECT * FROM CADASTRO_ITEM;

-- caso suino  = 5%
-- caso frango = 10%
-- caso inds   = 15%

select * from cadastro_item;

CREATE OR REPLACE PROCEDURE percentual_cliente
(p_negocio IN cadastro_item.negocio%type)
IS
    v_percentual float;
BEGIN
    
    IF p_negocio = SUINO THEN
        v_percentual := 0.5;
    ELSIF p_negocio = FRANGO THEN
        v_percentual := 0.10
    ELSIF p_negocio = INDUSTRIALIZADOS
    
    END IF;
    COMMIT;
END;

INSERT ALL INTO cadastro_item (
    codigo_item,
    descricao_item,
    codigo_marca,
    marca,
    negocio,
    categoria,
    grupo_comercial,
    subgrupo_comercial,
    percentual
) VALUES (
    101,
    'SUI CNG TEMP ERVAS',
    102,
    'AURORA PREMIUM',
    'SUINO',
    'CORTES CONGELADOS',
    'TEMPERADOS',
    'SUINO',
    10
) SELECT
      *
  FROM
      dual;
      
      SELECT * FROM CADASTRO_ITEM ORDER BY codigo_item;



CREATE OR REPLACE PROCEDURE retorna_negocio
(p_codigo_item IN cadastro_item.codigo_item%type)
IS

    /* -----------------------------------------------------------
    PROCEDURE : retorna_negocio
    DESCRIÇÃO : retorna negocio conforme codigo do item
    PARÂMETROS: p_codigo_item -> ENTRADA. código do item.
    VARIÁVEIS : v_negocio -> variavel que guarda o valor de retorno da procedure
    ----------------------------------------------------------- */
    
    v_negocio cadastro_item.negocio%type;
BEGIN    
    SELECT
        negocio
    INTO v_negocio        
    FROM
        cadastro_item
    WHERE
        codigo_item = p_codigo_item;
    
    dbms_output.put_line('NEGOCIO ' || v_negocio);
    COMMIT;
END;


----------------------------------------------- revisando a nossa Function ... e Injeção da Function 

CREATE OR REPLACE FUNCTION categoria_cliente
(p_faturamento_cliente IN cliente.faturamento_previsto%type)
RETURN cliente.categoria%type
IS
    v_categoria cliente.categoria%type;
    
BEGIN
    IF p_faturamento_cliente < 10000 THEN
        v_categoria := '<10K';
    
    ELSIF p_faturamento_cliente < 50000 THEN
        v_categoria := '<50K';
        
    ELSIF p_faturamento_cliente < 65000 THEN
        v_categoria := '65K';
        
    ELSE v_categoria := '<100K';
    
    END IF;
    
    RETURN v_categoria;
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE incluir_cliente
(   p_id cliente.id%type,
    p_razao cliente.razao_social%type,
    p_cnpj cliente.cnpj%type,
    p_segmercado cliente.segmercado_id%type,
    p_fat_previsto cliente.faturamento_previsto%type
)
IS
    v_categoria cliente.categoria%type := categoria_cliente(p_faturamento_previsto=>p_fat_previsto);
BEGIN
    
    INSERT INTO CLIENTE (ID, RAZAO_SOCIAL, CNPJ, SEGMERCADO_ID, DATA_INCLUSAO, FATURAMENTO_PREVISTO, CATEGORIA)
    VALUES (p_id, p_razao, p_cnpj, p_segmercado, SYSDATE, p_fat_previsto, v_categoria);
    
    COMMIT;
END;

Criando Tabelas
As tabelas são a unidade básica de armazenamento de dados em um banco de dados Oracle. Os dados são armazenados em linhas e colunas. Você define uma tabela com um nome de tabela, como funcionários, e um conjunto de colunas. Você dá a cada coluna um nome de coluna, como employee_id, last_name e job_id; um tipo de dados, como VARCHAR2, DATE ou NUMBER; e uma largura. A largura pode ser predeterminada pelo tipo de dados, como em DATE. Se as colunas forem do tipo de dados NUMBER, defina precisão e escala em vez de largura. Uma linha é uma coleção de informações de coluna correspondentes a um único registro.

Você pode especificar regras para cada coluna de uma tabela. Essas regras são chamadas de restrições de integridade. Um exemplo é uma restrição de integridade NOT NULL. Essa restrição força a coluna a conter um valor em cada linha.

Por exemplo:


create table DEPARTMENTS (  
  deptno        number,  
  name          varchar2(50) not null,  
  location      varchar2(50),  
  constraint pk_departments primary key (deptno)  
);
As tabelas podem especificar relações declarativas entre tabelas, normalmente chamadas de integridade referencial. Para ver como isso funciona, podemos criar uma tabela "filho" da tabela DEPARTMENTS incluindo uma chave estrangeira na tabela EMPLOYEES que faz referência à tabela DEPARTMENTS. Por exemplo:


create table EMPLOYEES (  
  empno             number,  
  name              varchar2(50) not null,  
  job               varchar2(50),  
  manager           number,  
  hiredate          date,  
  salary            number(7,2),  
  commission        number(7,2),  
  deptno           number,  
  constraint pk_employees primary key (empno),  
  constraint fk_employees_deptno foreign key (deptno) 
      references DEPARTMENTS (deptno)  
);
As chaves estrangeiras devem fazer referência a chaves primárias, portanto, para criar uma tabela "filho", a tabela "pai" deve ter uma chave primária para a chave estrangeira referenciar.

Módulo 2
Criando acionadores
Triggers são procedimentos que são armazenados no banco de dados e são executados ou acionados implicitamente quando algo acontece. Tradicionalmente, triggers suportavam a execução de um código procedural, no Oracle SQL procedural é chamado de bloco PL/SQL. PL significa linguagem procedural. Quando um INSERT, UPDATE ou DELETE ocorreu em uma tabela ou exibição. Triggers suportam o sistema e outros eventos de dados em DATABASE e SCHEMA.

Os gatilhos são frequentemente usados ​​para preencher automaticamente as chaves primárias da tabela, os exemplos de gatilho abaixo mostram um gatilho de exemplo para fazer exatamente isso. Usaremos uma função interna para obter um identificador ou GUID globalmente exclusivo.


create or replace trigger  DEPARTMENTS_BIU
    before insert or update on DEPARTMENTS
    for each row
begin
    if inserting and :new.deptno is null then
        :new.deptno := to_number(sys_guid(), 
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/

create or replace trigger EMPLOYEES_BIU
    before insert or update on EMPLOYEES
    for each row
begin
    if inserting and :new.empno is null then
        :new.empno := to_number(sys_guid(), 
            'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
end;
/
Módulo 3
Inserindo dados
Agora que criamos as tabelas e temos gatilhos para preencher automaticamente nossas chaves primárias, podemos adicionar dados às nossas tabelas. Como temos um relacionamento pai-filho, com a tabela DEPARTMENTS como tabela pai e a tabela EMPLOYEES como filha, primeiro INSERT uma linha na tabela DEPARTMENTS.


insert into departments (name, location) values
   ('Finance','New York');

insert into departments (name, location) values
   ('Development','San Jose');
Vamos verificar se a inserção foi bem-sucedida executando uma instrução SQL SELECT para consultar todas as colunas e todas as linhas da nossa tabela.


select * from departments;
Você pode ver que um ID terá sido gerado automaticamente. Agora você pode inserir na tabela EMPLOYEES uma nova linha, mas precisará colocar o valor DEPTID gerado em sua instrução SQL INSERT. Os exemplos abaixo mostram como podemos fazer isso usando uma consulta SQL, mas você pode simplesmente inserir o número do departamento diretamente.


insert into EMPLOYEES 
   (name, job, salary, deptno) 
   values
   ('Sam Smith','Programmer', 
    5000, 
  (select deptno 
  from departments 
  where name = 'Development'));

insert into EMPLOYEES 
   (name, job, salary, deptno) 
   values
   ('Mara Martin','Analyst', 
   6000, 
   (select deptno 
   from departments 
   where name = 'Finance'));

insert into EMPLOYEES 
   (name, job, salary, deptno) 
   values
   ('Yun Yates','Analyst', 
   5500, 
   (select deptno 
   from departments 
   where name = 'Development'));
Módulo 4
Colunas de indexação
Normalmente, os desenvolvedores indexam colunas por três motivos principais:

Para impor valores exclusivos em uma coluna
Para melhorar o desempenho do acesso a dados
Para evitar o escalonamento de bloqueio ao atualizar linhas de tabelas que usam integridade referencial declarativa
Quando uma tabela é criada e uma PRIMARY KEY é especificada, um índice é criado automaticamente para impor a restrição de chave primária. Se você especificar UNIQUE para uma coluna ao criar uma coluna, um índice exclusivo também será criado. Para ver os índices que já existem para uma determinada tabela, você pode executar a seguinte consulta de dicionário.


select table_name "Table", 
       index_name "Index", 
       column_name "Column", 
       column_position "Position"
from  user_ind_columns 
where table_name = 'EMPLOYEES' or 
      table_name = 'DEPARTMENTS'
order by table_name, column_name, column_position
Normalmente, é uma boa forma de indexar chaves estrangeiras, chaves estrangeiras são colunas em uma tabela que fazem referência a outra tabela. Em nosso exemplo de tabela EMPLOYEES e DEPARTMENTS, a coluna DEPTNO na tabela EMPLOYEE faz referência à chave primária da tabela DEPARTMENTS.


create index employee_dept_no_fk_idx 
on employees (deptno)
Também podemos determinar que a tabela EMPLOYEE será pesquisada com frequência pela coluna NAME. Para melhorar as pesquisas de desempenho e garantir a exclusividade, podemos criar um índice exclusivo na coluna NOME da tabela EMPLOYEE.


create unique index employee_ename_idx
on employees (name)
A Oracle fornece muitas outras tecnologias de indexação, incluindo índices baseados em função que podem indexar expressões, como uma função superior, índices de texto que podem indexar texto de forma livre, índices de bitmap úteis em data warehousing. Você também pode criar tabelas organizadas indexadas, usar índices de partição e muito mais. Às vezes, é melhor ter menos índices e aproveitar os recursos de memória. Todos esses tópicos estão além do escopo desta introdução básica.

Módulo 5
Consultando dados
Para selecionar dados de uma única tabela é razoavelmente fácil, basta usar a sintaxe SELECT ... FROM ... WHERE ... ORDER BY ....


select * from employees;
Para consultar dados de duas tabelas relacionadas, você pode juntar os dados


select e.name employee,
           d.name department,
           e.job,
           d.location
from departments d, employees e
where d.deptno = e.deptno(+)
order by e.name;
Como alternativa a uma junção, você pode usar uma seleção embutida para consultar dados.


select e.name employee,
          (select name 
           from departments d 
           where d.deptno = e.deptno) department,
           e.job
from employees e
order by e.name;
Módulo 6
Adicionando Colunas
Você pode adicionar colunas adicionais depois de criar sua tabela usando a sintaxe ALTER TABLE ... ADD .... Por exemplo:


alter table EMPLOYEES 
add country_code varchar2(2);
Módulo 7
Consultando o Oracle Data Dictionary
Os metadados da tabela podem ser acessados ​​no dicionário de dados Oracle. As consultas a seguir mostram como você pode consultar as tabelas do dicionário de dados.


select table_name, tablespace_name, status
from user_tables
where table_Name = 'EMPLOYEES';

select column_id, column_name , data_type
from user_tab_columns
where table_Name = 'EMPLOYEES'
order by column_id;
Módulo 8
Atualizando dados
Você pode usar SQL para atualizar valores em sua tabela, para isso usaremos a cláusula de atualização


update employees
set country_code = 'US';
A consulta acima atualizará todas as linhas da tabela de funcionários e definirá o valor do código do país como US. Você também pode atualizar seletivamente apenas uma linha específica.


update employees
set commission = 2000
where  name = 'Sam Smith';
Vamos executar uma consulta para ver como são nossos dados


select name, country_code, salary, commission
from employees
order by name;
Módulo 9
Consultas agregadas
Você pode somar dados em tabelas usando funções agregadas. Usaremos aliases de coluna para renomear as colunas para facilitar a leitura, também usaremos a função de valor nulo (NVL) para nos permitir somar corretamente as colunas com valores nulos.


select 
      count(*) employee_count,
      sum(salary) total_salary,
      sum(commission) total_commission,
      min(salary + nvl(commission,0)) min_compensation,
      max(salary + nvl(commission,0)) max_compensation
from employees;
Módulo 10
Compressão de dados
À medida que seu banco de dados cresce em tamanho para gigabytes ou terabytes e além, considere usar a compactação de tabela. A compactação de tabela economiza espaço em disco e reduz o uso de memória no cache de buffer. A compactação de tabelas também pode acelerar a execução de consultas durante as leituras. Há, no entanto, um custo na sobrecarga da CPU para carregamento de dados e DML. A compactação da tabela é completamente transparente para os aplicativos. É especialmente útil em sistemas de processamento analítico online (OLAP), onde há longas operações somente leitura, mas também pode ser usado em sistemas de processamento de transações online (OLTP).

Você especifica a compactação de tabela com a cláusula COMPRESS da instrução CREATE TABLE. Você pode habilitar a compactação para uma tabela existente usando esta cláusula em uma instrução ALTER TABLE. Nesse caso, os únicos dados compactados são os dados inseridos ou atualizados após a ativação da compactação. Da mesma forma, você pode desabilitar a compactação de tabela para uma tabela compactada existente com a instrução ALTER TABLE...NOCOMPRESS. Neste caso, todos os dados que já foram compactados permanecem compactados, e novos dados são inseridos descompactados.

Para habilitar a compactação para dados futuros, use a seguinte sintaxe.


alter table EMPLOYEES compress for oltp; 
alter table DEPARTMENTS compress for oltp; 
Módulo 11
Excluindo dados
Você pode excluir uma ou mais linhas de uma tabela usando a sintaxe DELETE. Por exemplo, para excluir uma linha específica:


delete from employees 
where name = 'Sam Smith';
Módulo 12
Descartando tabelas
Você pode descartar tabelas usando o comando SQL DROP. A eliminação de uma tabela removerá todas as linhas e eliminará subobjetos, incluindo índices e gatilhos. As instruções DROP a seguir eliminarão as tabelas de departamentos e funcionários. A cláusula opcional de restrições em cascata eliminará as restrições de remoção, permitindo que você elimine as tabelas de banco de dados em qualquer ordem.


drop table departments cascade constraints;
drop table employees cascade constraints;
Módulo 13
Tabelas soltas
Se o parâmetro de inicialização RECYCLEBIN estiver definido como ON (o padrão em 10g), a eliminação desta tabela a colocará na lixeira. Para ver se você pode desfazer uma tabela, execute a seguinte consulta de dicionário de dados:


select object_name, 
       original_name, 
       type, 
       can_undrop, 
       can_purge
from recyclebin;
Para desfazer as tabelas, usamos o comando flashback, por exemplo:


flashback table DEPARTMENTS to before drop;
flashback table EMPLOYEES to before drop;
select count(*) departments 
from departments;
select count(*) employees
from employees;


-------------------------------------------------------------------------------------------------------------  PROCEDURES NA TABELA SEGMERCADO E CLIENTE ... drop function "SYSTEM"."EXCLUIR"

create or replace procedure atualizar_cli_segmercado (
    p_id IN cliente.id%type,
    p_segmercado_id IN cliente.segmercado_id%type
) IS
    v_descricao cliente.segmercado_id%type := p_segmercado_id;
BEGIN
    UPDATE cliente SET segmercado_id = v_descricao WHERE id = p_id;
    COMMIT;
END


create or replace procedure atualizar_tb_segmercado (
    p_id IN segmercado.id%type,
    p_descricao IN segmercado.descricao%type
) IS
    v_descricao segmercado.descricao%type := UPPER(p_descricao);
BEGIN
    UPDATE segmercado SET descricao = v_descricao WHERE id = p_id;
    COMMIT;
END;


create or replace procedure EXCLUIR_SEGMERCADO (
    p_id IN segmercado.id%type,
    p_descricao IN segmercado.descricao%type
) IS
    v_descricao segmercado.descricao%type := UPPER(p_descricao);
BEGIN
    DELETE FROM segmercado WHERE id = p_id;
    DELETE FROM segmercado WHERE descricao = v_descricao;
    COMMIT;
END;


------------------------------------------------------------------------------------------------------------------------------   tabela inclusao de percentual confore negocio do item:


create or replace NONEDITIONABLE PROCEDURE incluir_percentual
(p_codigo_item IN cadastro_item.codigo_item%type) ------------------ 471
IS
    v_cadastro_item_negocio cadastro_item.percentual%type; 
    v_funcao_return_negocio cadastro_item.negocio%type; --------- função
BEGIN
    v_funcao_return_negocio := percentual_cadastro(p_codigo_item); ----- função recebe 471

    IF v_funcao_return_negocio = 'INDUSTRIALIZADOS' THEN
        v_cadastro_item_negocio := 5.90;
    ELSIF v_funcao_return_negocio = 'SUINO' THEN
        v_cadastro_item_negocio := 6.00;
    ELSIF v_funcao_return_negocio = 'FRANGO' THEN
        v_cadastro_item_negocio := 4.80;
    ELSE v_cadastro_item_negocio := 2.20;
    END IF;
	
	dbms_output.put_line(' Percentual :' || v_cadastro_item_negocio);
    commit;
END;


create or replace FUNCTION percentual_cadastro
(p_codigo_item IN cadastro_item.codigo_item%type)
RETURN cadastro_item.negocio%TYPE
IS
    /* -----------------------------------------------------------
    PROCEDURE : percentual_cadastro
    DESCRIÇÃO : retorna o valor do percentual conforme negocio
    PARÂMETROS: p_codigo_item -> ENTRADA. código do item.
    VARIÁVEIS : v_negocio -> variavel que guarda o valor de retorno da procedure
    ----------------------------------------------------------- */
    v_negocio cadastro_item.negocio%type;
BEGIN    
    SELECT
        negocio
    INTO v_negocio        
    FROM
        cadastro_item
    WHERE
        codigo_item = p_codigo_item;

    RETURN v_negocio;
    COMMIT;
END;




DECLARE 
    v_campo_id segmercado.id%type := 6;
    v_campo_descricao segmercado.descricao%type;
BEGIN
    select
        descricao into 
            v_campo_descricao
    from
        segmercado
    where
        id = v_campo_id ;
    
    dbms_output.put_line(v_campo_descricao);
    commit;
END;











create or replace PROCEDURE inserir_dados_tabela_cliente (
    p_id                   IN cliente.id%TYPE,
    p_razao_social         IN cliente.razao_social%TYPE,
    p_cnpj                 IN cliente.cnpj%TYPE,
    p_segmercado_id        IN cliente.segmercado_id%TYPE,
    -- p_data_inclusao        IN cliente.data_inclusao%TYPE,
    p_faturamento_previsto IN cliente.faturamento_previsto%TYPE
    -- p_categoria            IN cliente.categoria%TYPE
) IS
BEGIN
    INSERT INTO cliente (
        id,
        razao_social,
        cnpj,
        segmercado_id,
        data_inclusao,
        faturamento_previsto,
        categoria
    ) VALUES (
        p_id,
        upper(p_razao_social),
        p_cnpj,
        p_segmercado_id,
        sysdate,
        p_faturamento_previsto,
        '00000'
    );
    COMMIT;
END;

insert, delete, update, select ...      ...      ...      ...      ...         

declare
    v_id segmercado.id%type := 4;
    v_descricao segmercado.descricao%type := 'Esportistas';
begin
    insert into segmercado (id, descricao) values (v_id, upper(v_descricao));
end;

declare
    v_id segmercado.id%type := 3;
    v_descricao segmercado.descricao%type := 'Industrial';
begin
    update segmercado set descricao = upper(v_descricao) where id = v_id;
end;

declare
    v_id segmercado.id%type := 4;
begin
    delete from segmercado where id = v_id;
end;

set serveroutput on;
declare
    v_id segmercado.id%type := 3;
    v_descricao segmercado.descricao%type;
begin
    select descricao into v_descricao from segmercado where id = v_id;
    dbms_output.put_line('A descrição é: ' || v_descricao);
end;

set serveroutput on;
declare
    v_id number(5)  := 1;
    v_descricao VARCHAR2(100);
begin
    select descricao into v_descricao from segmercado where id = v_id;
        dbms_output.put_line('A descricao do segmento de mercado é: ' || v_descricao);
        
            select razao_social into v_descricao from cliente where id = v_id;
            select 
                dbms_output.put_line('o Segmento de Mercado é: ' || v_descricao);
end;

CREATE OR REPLACE FUNCTION retorna_categoria_conforme_fatur
(p_fatur_previsto IN cliente.faturamento_previsto%type)

RETURN 
    cliente.categoria%type

IS
    v_categoria cliente.categoria%type;

BEGIN

    IF p_fatur_previsto <= 10000 THEN
        v_categoria := 'PEQUENO';
        
    ELSIF p_fatur_previsto <= 50000 THEN
        v_categoria := 'MÉDIO';
        
    ELSIF p_fatur_previsto <= 100000 THEN
        v_categoria := 'MÉDIO / GRANDE';
        
    ELSE
        v_categoria := 'GRANDE';
    
    END IF;
    
    RETURN v_categoria;
    
    COMMIT;
END;

VARIABLE g_categoria varchar2(100);
execute :g_categoria := retorna_categoria_conforme_fatur(100001);
print g_categoria;

EXECUTE inserir_dados_tabela_cliente(1, 'Super Max', '41221', 1, 8700);
EXECUTE inserir_dados_tabela_cliente(2, 'Atacado Dia', '31209', 1, 310222);
EXECUTE inserir_dados_tabela_cliente(3, 'Max', '55891', 1, 20000);
EXECUTE inserir_dados_tabela_cliente(4, 'Super Lojao', '22098', 1, 50000);
EXECUTE inserir_dados_tabela_cliente(5, 'Frigo Max', '99871', 1, 65000);


DECLARE
    v_segmercado_id cliente.id%type := 2;
    v_counter NUMBER(5) := 1;
    
BEGIN
    
    LOOP
    
        atualizar_dados_tabela_cliente(p_id=> v_counter,    p_segmercado_id=>  v_segmercado_id);
        v_counter := v_counter + 1;
        
    EXIT WHEN
        v_counter > 6;
    
    END LOOP;

END;

select * from cliente;



'-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'

DECLARE
    CURSOR cursor_segmercado IS select id from segmercado;
    vDescricaoUm segmercado.descricao%type := 'Supermercado';
    vDescricaoDois segmercado.descricao%type := 'Atacadista';
    vDescricaoTres segmercado.descricao%type := 'Varejista';
    
BEGIN
    
        FOR record_segmercado IN cursor_segmercado LOOP
            IF record_segmercado.id <= 2 THEN
                UPDATE segmercado SET descricao = vDescricaoUm WHERE id = record_segmercado.id;
        
        ELSIF record_segmercado.id <= 5 THEN
            UPDATE segmercado SET descricao = vDescricaoDois WHERE id = record_segmercado.id;
                
        ELSIF record_segmercado.id <= 8 THEN
            UPDATE segmercado SET descricao = vDescricaoTres WHERE id = record_segmercado.id;
            
        ELSE
            INSERT INTO segmercado(id, descricao) VALUES (record_segmercado.id, 'Industrial'); 
            
        END IF;
        
    END LOOP;

EXCEPTION
    WHEN dup_val_on_index THEN
        dbms_output.put_line('Cliente ja cadastrado !!!!');

END;

set serveroutput on;

select * from segmercado;


'---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ERROS'


create or replace PROCEDURE inserir_dados_tabela_cliente (
    p_id IN cliente.id%TYPE,    p_razao_social IN cliente.razao_social%TYPE,    p_cnpj IN cliente.cnpj%TYPE,    p_segmercado_id IN cliente.segmercado_id%TYPE,    p_faturamento_previsto IN cliente.faturamento_previsto%TYPE  )
IS
    v_categoria cliente.categoria%type;        v_cnpj cliente.cnpj%type := p_cnpj; 
    e_null exception;              pragma exception_init(e_null, -1400);
    e_foreign exception;        pragma exception_init(e_foreign, -02291);
    
BEGIN
    v_categoria := retorna_categoria_conforme_fatur(p_faturamento_previsto);    formata_cnpj_cliente(v_cnpj);

    INSERT INTO cliente (        id,        razao_social,        cnpj,        segmercado_id,        data_inclusao,        faturamento_previsto,        categoria
    ) VALUES (        p_id,        upper(p_razao_social),        v_cnpj,        p_segmercado_id,        sysdate,        p_faturamento_previsto,        v_categoria    );

    commit;


EXCEPTION
    WHEN dup_val_on_index THEN
        raise_application_error(-20000, 'Erro de Chave Primaria duplicada, inserir um cliente com código difrente');
    WHEN e_null THEN
        raise_application_error(-20010, 'Erro de inserção nulo em campos obrigatórios');
    WHEN e_foreign THEN
        raise_application_error(-20015, 'Erro de Chave Estrangeira violada, inserir Segmento de Mercado, cadastrado na tabela Segmercado');
    WHEN others THEN
        raise_application_error(-20020, 'Erro Comando PL SQL ' || sqlerrm);
    
END;

execute inserir_dados_tabela_cliente(100, 'Jose de Assis', 09812, 10, 102000);

-- 01400. 00000 -  "cannot insert NULL into (%s)"  ----   integrity constraint (%s.%s) violated - parent key not found"

declare
    cursor cur_segmercado is select id from segmercado;
        v_descricao segmercado.descricao%type := null;
        e_null exception;
        e_foreign exception;
        pragma exception_init(e_null, -1400);
        pragma exception_init(e_foreign, -2291);
begin   
    FOR record_segmercado IN cur_segmercado LOOP
    
            record_segmercado.id := 10;
            
        insert into segmercado (id, descricao) values (record_segmercado.id, UPPER(v_descricao));
        
        dbms_output.put_line('ID ' || record_segmercado.id || ', ' || v_descricao);
  
    END LOOP;
EXCEPTION
    WHEN dup_val_on_index THEN
        RAISE_APPLICATION_ERROR(-20010, 'Erro de chave primaria exclusiva');
    WHEN e_null THEN
        RAISE_APPLICATION_ERROR(-20015, 'Erro de retorno nulo, ou vazio não permitido inserção');
    WHEN e_foreign THEN
        RAISE_APPLICATION_ERROR(-20020, 'Erro de chave Estrangeira violada, inserir chave exclusica');
    WHEN others THEN
        RAISE_APPLICATION_ERROR(-20040, ' ------ ' || sqlerrm);
end;



declare
    cursor cur_cliente is select id from segmercado;
    v_descricao cliente.segmercado_id%type;
    error_not_found_segmercado exception;
    
begin

    for rec_cli in cur_cliente loop
        
        update cliente set  segmercado_id = v_descricao where id = rec_cli.id;
        
        IF SQL%notfound THEN
            raise error_not_found_segmercado;
        END IF;
    
    end loop;
    
exception
    WHEN error_not_found_segmercado THEN
        raise_application_error(-20000, 'Erro ao inserir segmento de mercado, código id não cadastrado     ' || sqlerrm);
    
end;


' --------------------------------------------------------------------------------------------------------------------------------------------- Utilizando o comando SELECT no PL/SQL '

set serveroutput on;
set verify off;
accept p_employees_id prompt '  digite  ';

declare
    t_employees_rec employees%rowtype; -- tablea record type da tabela employee
    vn_employee_id employees.employee_id%type := &p_employees_id;
    
    e_no_data_found exception;
    pragma exception_init(e_no_data_found, +100);
    
begin
    select *
    into t_employees_rec
    from employees
    where employee_id = vn_employee_id;


    dbms_output.put_line(t_employees_rec.employee_id);

EXCEPTION
    when e_no_data_found then
        RAISE_APPLICATION_ERROR(-20000, '  Erro ao tentar recuperar dados da tabela record type employees, parâmetro de busca não localizado ! ' || sqlerrm);
end;



' ------------------------------------------------ TABUADA ------------------------------------------------------- '
-- collections são estrutura para gerenciamente de multiplas linhas de dados
-- collections são listas (são vetores).

accept params_of_value prompt ' ... ';
set serveroutput on;
set verify off;

declare
   TYPE Numero_Table_Type IS TABLE OF NUMBER(2)
   INDEX BY BINARY_INTEGER;
   
   Numer_Table Numero_Table_Type;
   
begin
    
    FOR indice IN 1 .. 10 LOOP

        Numer_Table(indice) := indice * &params_of_value;
    END LOOP;
   
    FOR indice IN 1 .. 10 LOOP
        dbms_output.put_line('Array Associative : ' || to_char(indice) || '   X   '  ||   to_char(&params_of_value)   || '   =   '  ||  to_char(Numer_Table(indice)));
    END LOOP;
    
end;



