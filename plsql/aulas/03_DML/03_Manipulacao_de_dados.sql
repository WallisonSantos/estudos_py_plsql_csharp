----------------------------------------------------------------------------------------------------------------------------------------------------------- DATA MANIPULATION LANGUAGE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------- INTRODUÇÃO

[00:00] Oi, gente. Tudo bem? Meu nome é Victorino Vila e nós vamos iniciar agora nosso curso de manipulação de dados usando SQL em bancos de dados Oracle. Este curso complementa outros dois ministrados por mim na Alura. Um de introdução ao SQL usando Oracle e um consultas avançadas usando Oracle, aprendendo a linguagem SQL.
[00:30] Manipulação de dados significa poder incluir, alterar ou excluir dados dentro do banco. Iremos começar o curso percorrendo cinco grandes aulas. A primeira irá recuperar ambientes, ou seja, instalando produtos, fazendo a conexão das interfaces e recuperando uma base de dados que vamos usar como exemplo. Se você já fez os outros cursos e tem o ambiente preparado, você não precisa nem recuperar esse ambiente.
[01:23] Nessa aula também vou falar sobre as entidades que formam o banco de dados, tipos de dados e modelagem de sistemas. Como numa empresa real analisando os problemas desenhamos o banco de dados.
[01:48] Vamos começar a aula dois a partir daquele banco de dados que desenhamos na aula um e iremos criar a estrutura dentro do Oracle. Vamos ver como criar uma tabela, uma chave primária, uma chave estrangeira. Como crio a estrutura que vai receber os dados baseado na modelagem que fiz do problema real.
[02:17] Na aula três vamos aprender a incluir dados, de várias maneiras. Através de comandos de SQL simples, de SQL mais robustos, de arquivos externos. Depois, vamos aprender a alterar dados que já existem, bem como excluir. Finalmente, na aula cinco vamos ver coisas especiais do banco Oracle, como as colunas de auto incremento, a definir padrões e triggers, que disparam uma série de comandos quando algo acontece na base.
[03:46] Vou falar um pouco sobre na prática como os analistas de sistema trabalham com manipulação de dados dentro das empresas. Iremos percorrer esses cinco aulas. Espero que vocês gostem do treinamento e que atenda às expectativas.

-------------------------------------------------------------------------------------------------------------------------------------------------------------- MODELAGEM BANCO DE DADOS

Atenção: O objetivo desta aula é mostrar que o banco de dados deve ser montado conforme a modelagem. Se é 1:1 ou 1:N vai depender do tipo de negócio. Apresento aqui um exemplo hipotético que contenha todas as possíveis relações.
O analista de sistemas deve olhar o resultado do diagrama e montar o banco baseado nele. Se alguém escreveu que a regra é 1:1 ele vai criar assim. Se a regra é 1:N ele vai criar diferente. Não cabe o analista questionar o negócio. Ser 1:N não é sempre verdade.
Um outro exemplo: Se o banco de dados de um Airbus? Apesar do avião ter um modelo, cada avião tem um número de série único e seu cadastro está associado a um único item de uma venda e não se repete.
O importante é que independente do resultado do modelo, iremos construir um banco de dados baseado no que o diagrama apresentado nos mostra.

[00:00] Existe toda uma literatura que fala a respeito de como modelar um banco de dados. Normalmente, você precisa cumprir contas passos. Chamamos de análise de sistemas. Ela consiste em entender o negócio, o ambiente em que o banco de dados vai ser usado e projetar as tabelas baseado nos processos existentes na empresa ou no assunto que você está modelando.
[00:41] Você começa a entender isso com as regras de negócio, marcando entrevistas com usuários chaves, em que eles vão explicar como funciona a empresa, o negócio, quais as regras, processos. E aí desenhamos o modelo mais fiel à realidade daquilo que você entendeu quando conversou com os usuários da empresa.
[01:13] Precisamos então construir o modelo conceitual, que consiste na construção de um diagrama de entidades e relacionamentos e de entender a cardinalidade entre as entidades. Esse assunto mereceria inclusive um curso específico, mas é traduzir para um esquema gráfico as regras de negócio que você obteve na entrevista. Dependendo da forma como você desenha o diagrama de entidades e relacionamento você já tem automaticamente o desenho do banco de dados definido.
[02:00] Vamos pegar um exemplo. Vou modelar uma empresa de suco de frutas, e vou modelar a área de vendas dessa empresa. Sentei com o diretor de vendas e quiser entender como funciona. Eles disseram que tem vendedores que trazem clientes, esses clientes efetuam a compra, em que ele pode comprar um ou mais itens ao mesmo tempo.
[02:37] Entendendo essa regra eu construí um diagrama, em que usamos verbos de quem pode fazer o que com o que. O vendedor realiza a venda, porque ele corre atrás do cliente, fecha o contrato, liga até o cliente fazer a compra. A venda precisa conter um cliente. Porém, numa mesma venda ele pode comprar vários produtos. Então o produto está numa entidade chamada itens vendidos.
[03:46] Claro que a venda como um todo é um conjunto entre a venda e os itens que são vendidos. A venda pode possui itens vendidos, e aí temos a cardinalidade. Um vendedor pode ter várias vendas. O cliente também pode ter várias compras. Quando temos essa relação de 1 para várias, chamamos de 1 para N.
[05:02] Já os itens vendidos tem uma relação com a venda. Uma venda pode ter vários itens, porém o item só tem uma venda. E o item é uma linha da nota fiscal, ali só posso ter um único produto.
[05:38] Esse é nosso diagrama de entidades e relacionamentos. Tem toda uma literatura, boas práticas, estudos de caso, de como você baseado em um modelo de negócio constrói essa entidade de relacionamento.
[05:55] Supondo que a entidade está correta, que expressa as regras de negócio da minha empresa, passo a estabelecer características de cada entidade. Por exemplo, tenho o vendedor, que é uma entidade que realiza a venda, que tem várias características. Ele tem a matrícula, o nome, um bairro, uma comissão, algo que diz se ele está de férias. No caso do cliente, tenho CPF, nome, endereço, bairro, cidade, estado, data de nascimento, idade, sexo.
[07:05] No caso da venda, tenho número, CPF do cliente, vendedor que fez, data, imposto, matrícula. E nos itens vendidos tenho número, código do produto, quantidade, preço. Por fim, o produto tem código, descritor, sabor, tamanho, embalagem, preço.
[07:52] Quando determinamos o diagrama de entidade de relacionamentos com suas características já começamos a transformar em tabela. E as relações entre as entidades vão virar os relacionamentos das tabelas dentro do banco.
[08:41] Determinei na tabela de vendedores como chave primária o campo matrícula. Para clientes determinei o CPF. Na tabela de notas fiscais o número de identificação. Nos itens vendidos normalmente temos o número e o código, que é identificado também na tabela de produtos.
[09:14] Tenho minha tabela desenhada, a ideia de como vai ser meu banco de dados. Tudo isso veio do diagrama de entidades e relacionamentos. Isso merece um curso inteiro, tem técnicas para você fazer de forma correta. Mas para o nosso treinamento o importante é que tenho esse banco que vamos usar e é o que vamos fazer no nosso treinamento.
[09:57] Construir esse banco de dados baseado nesse diagrama pode ser feito usando ferramentas CASE. É um termo para ferramentas que desenham banco de dados. Mas nosso objetivo é entender o Oracle. Iremos usar só o SQL Developer para isso, seja através de comandos SQL ou assistentes que o SQL Developer oferece. Na prática, o analista de sistemas geralmente usa ferramentas CASE.
[10:53] Temos nossas tabelas, nossos relacionamentos. Esse vai ser nosso guia para seguir o treinamento daqui para a frente.

Analise abaixo os possíveis requisitos para o início da construção de um banco de dados:
1) Entendimento das regras de negócio
2) Efetuar as atividades de entrevistas e reuniões
3) Desenho de modelo mais fiel a realidade

Dos requisitos listados acima, quais são verdadeiros? Os três requisitos foram mencionados no vídeo anterior.

Marque as alternativas que representam os passos para a construção de um modelo conceitual:
- Estabelecer a cardinalidade entre as entidades. Alternativa correta! Este é um dos requisitos mencionados no vídeo anterior.
- Construir o diagrama de entidades e relacionamentos. Alternativa correta! Este é um dos requisitos mencionados no vídeo anterior.

------------------------------------------------------------------------------------------------------------------------------------------------- CRIANDO UMA TABELA COM CHAVE PRIMARIA

[00:00] Depois do levantamento que fizemos a respeito do banco de dados referente à empresa de suco de frutas, chegamos a essas tabelas que estão sendo exibidas. Temos cinco tabelas para serem criadas no banco antes de começarmos a manipular os dados.
[00:36] Vamos começar com a tabela de produtos. O comando para criar tabela é o create table. Ele cria uma tabela no Oracle. Só que preciso dar muitas outras informações. Vou colocar o nome da tabela produtos, abro parênteses e coloco características de cada campo. Vou colocar o nome do campo, o tipo e se ele vai aceitar valores vazios.
[02:44] É legal evitar acentos, espaços, cê-cedilha, é uma prática que deixa mais fácil de trabalhar com o banco de dados.
[03:14] Quando o campo é chave primária, ele obrigatoriamente não pode aceitar nulos. Faço isso com not null. Quando digo só null é porque o campo aceita nulos. Antes de terminar o comando, preciso especificar qual é a chave primária dela. Escrevo primary key e entre parênteses coloco o campo.
[06:02] Vamos passar para a tabela de vendedores. O campo matrícula é chave primária aqui. Temos nome, bairro, comissão, data de admissão, férias, que é um booleano, e por último a primary key.
[08:24] Na hora em que criei a tabela vi que escrevi errado data de admissão. Não posso deixar assim. Tenho o comando alter table para alterar. Uso alter table, o nome da tabela que quero alterar, rename column, e coloco o antigo, depois to, e o novo.
[09:36] Com esse script já tenho três comandos. Criei a tabela de produtos, vendedores e alterei a tabela de vendedores.

Baseado na definição da tabela CLIENTE, como mostrado abaixo:

Como é a definição da tabela, os nomes dos campos estão em linguagem natural. Por exemplo, o campo Endereço, no banco de dados, deve ser ENDERECO, e o campo Limite Crédito deve ser LIMITE_CREDITO.

Como seria o comando SQL para a criação dessa tabela CLIENTE?

Um exemplo de comando SQL é o seguinte:
CREATE TABLE CLIENTE (
    CPF varchar(11) NOT NULL,
    NOME varchar(100)  NULL,
    ENDERECO varchar(150)  NULL,
    BAIRRO varchar(50)  NULL,
    CIDADE varchar(50)  NULL,
    ESTADO varchar(45)  NULL,
    CEP varchar(8)  NULL,
    DATA_NASCIMENTO date  NULL,
    IDADE integer  NULL,
    SEXO varchar(1)  NULL,
    LIMITE_CREDITO float  NULL,
    VOLUME_COMPRA float  NULL,
    PRIMEIRA_COMPRA number(1)  NULL,
    PRIMARY KEY (CPF)
)

Tabelas criadas abaixo para fazer relacionamentos entre tabelas:

CREATE TABLE produtos (
    codigo       VARCHAR2(10) NOT NULL,
    descritor    VARCHAR2(100) NULL,
    sabor        VARCHAR2(50) NULL,
    tamanho      VARCHAR2(50) NULL,
    embalagem    VARCHAR2(5) NULL,
    preco_lista  FLOAT NULL,
    PRIMARY KEY ( codigo )
);


CREATE TABLE vendedores (
    matricula      VARCHAR2(5) NOT NULL,
    nome           VARCHAR2(100) NULL,
    bairro         VARCHAR2(50) NULL,
    comissao       FLOAT NULL,
    data_admissao  DATE NULL,
    ferias         INTEGER NULL,
    PRIMARY KEY ( matricula )
);

ALTER TABLE vendedores RENAME COLUMN data_adimissao TO data_admissao;
Query para alterar o CAMPO na tabela: Table VENDEDORES alterado.

CREATE TABLE clientes (
    cpf              VARCHAR(11) NOT NULL,
    nome             VARCHAR(100) NULL,
    endereco         VARCHAR(150) NULL,
    bairro           VARCHAR(50) NULL,
    cidade           VARCHAR(50) NULL,
    estado           VARCHAR(45) NULL,
    cep              VARCHAR(8) NULL,
    data_nascimento  DATE NULL,
    idade            INTEGER NULL,
    sexo             VARCHAR(1) NULL,
    limite_credito   FLOAT NULL,
    volume_compra    FLOAT NULL,
    primeira_compra  NUMBER(1) NULL,
    PRIMARY KEY ( cpf )
);

---------------------------------------------------------------------------------------------------------------------------------------------- CRIANDO UMA TABELA COM CHAVE ESTRANGEIRA

[00:00] O Oracle é um banco de dados relacional, o que significa que as tabelas se relacionam entre si. Nós vamos agora criar os relacionamentos entre algumas tabelas. São basicamente, por exemplo, do CPF na tabela de vendas com o CPF na tabela de clientes. A matrícula na tabela de vendas com a matrícula de vendedores.
[01:18] Para fazer isso, precisamos criar a tabela de vendas. Vamos fazer isso. Uso o create table, nome da tabela, coloco o varchar de 5 not null. Teremos o data venda, do tipo date. CPF, varchar de 11, not null. Matrícula, varchar de 5, not null. Imposto, float, aceita nulo. E a primary key, que é número.
[04:11] Vamos fazer agora a ligação entre o CPF da tabela de vendas com o CPF da tabela de clientes. O comando é alter table, tabela de vendas. Atenção, a chave estrangeira sempre é criada da tabela filho. Lembram da nossa análise, em que dissemos que tenho um relacionamento de 1 para N entre cliente e nota. Um cliente pode ter várias notas, mas cada nota só pode ter 1 cliente. Digamos que a tabela clientes é pai, superior, e a de notas é filha. Criamos a chave estrangeira na tabela inferior, a filha.
[05:38] Baseado nisso é que criamos a ligação entre CPF da tabela de notas com o CPF da tabela de clientes a partir da tabela filha, que é a de notas.
[06:08] Vou dar um add constraint, que significa que estou adicionando uma restrição. Toda chave estrangeira é considerada uma restrição, porque ela vai restringir os campos. E aí vou colocar um nome para ela, porque a tabela pode ter várias. Normalmente, colocamos FK na frente, underscore e o nome da tabela. É uma convenção. Você precisa sempre analisar a documentação interna da empresa.
[08:12] Específico qual a minha restrição, que no caso é foreign key com campo CPF, e vou me referenciar esse campo com a tabela de clientes.
[09:55] Vamos fazer a ligação do campo matrícula na tabela de vendas com o campo matrícula na tabela vendedores.
[10:50] Agora tenho já a ligação entre CPF na data de vendas com CPF na data de clientes, e a ligação entre matrícula na tabela de vendas ou tabela de clientes. O relacionamento foi construído.

Através da linha de comando, como seriam os comandos para criar uma chave estrangeira ligando a tabela de PRODUTOS com a tabela de ITENS_NOTA, através do campo CODIGO, e outra ligação entre a tabela NOTAS e ITENS_NOTA, através do campo NUMERO?
Ao criar a tabela de vendas teremos que ajustar para Não aceita nulo os campos NUMERO, CPF E MATRICULA, onde NUMERO é Primary Key desta tabela e CPF e MATRICULA é FOREIGN KEY.
Um exemplo de SQL é o seguinte:

ALTER TABLE ITEMS_NOTAS ADD CONSTRAINT FK_NOTAS FOREIGN KEY ("NUMERO") REFERENCES NOTAS (NUMERO);
ALTER TABLE ITEMS_NOTAS ADD CONSTRAINT FK_PRODUTOS FOREIGN KEY ("CODIGO")  REFERENCES PRODUTOS (CODIGO);

CREATE TABLE tabela_de_vendas (
    numero      VARCHAR2(5) NOT NULL,
    data_venda  DATE NULL,
    cpf         VARCHAR2(11) NOT NULL,
    matricula   VARCHAR(5) NOT NULL,
    imposto     FLOAT NULL,
    PRIMARY KEY ( numero )
);


Alterando a Tabela de Vendas para Conter a Restrição de FOREIGN KEY para o campo CPF com referencia na tabela pai CLIENTES.

ALTER TABLE tabela_de_vendas
    ADD CONSTRAINT fk_clientes FOREIGN KEY ( cpf )
        REFERENCES clientes ( cpf )
;

Alterando a Tabela de Vendas para Conter a Restrição de FOREIGN KEY para o campo MATRICULA com referencia na tabela pai VENDEDORES.

ALTER TABLE tabela_de_vendas
    ADD CONSTRAINT fk_vendedores FOREIGN KEY ( matricula )
        REFERENCES vendedores ( matricula )
;

-------------------------------------------------------------------------------------------------------------------------------------------------------------- MUDANDO O NOME DA TABELA

[00:00] Eu fui mostrar esse banco para o meu usuário que encomendou a construção da base de dados e ele me disse que não gostou muito dos nomes das tabelas. O nome que eu coloquei foi tabela de vendas. Como está associada às tabelas de notas fiscais, ele disse para colocar o nome notas.
[00:47] Se eu clicar sobre a tabela com o botão direito do mouse, tenho a opção renomear. Vou pegar e renomear para notas. Se eu clicar em SQL, note que inclusive tem um comando SQL que faz isso. Dou um aplicar e a tabela tem o nome alterado.

Caso exista a necessidade de ser alterado o nome de uma Tabela, mesmo após ser realizado a inclusão no Banco de Dados, podemos ultilizar o Comando RENAME TO,
Caso exista a necessidade de excluir a Tabela poderá fazer por meio do comando DROP TABLE,

alter table "SYSTEM"."VENDEDORES" rename to VENDAS
drop table "SYSTEM"."VENDAS"  

alter table "SYSTEM"."TABELA_DE_VENDAS" rename to NOTAS;

-------------------------------------------------------------------------------------------------------------------------------------------------------- FINALIZANDO A CRIAÇÃO DO BANCO

[00:00] Vamos terminar a criação da nossa base de dados. Falta criar a tabela de itens vendidos. Falta fazer o relacionamento entre número da nota fiscal na tabela de itens com número de nota fiscal na tabela de vendas, e o código de produtos na tabela de vendidos com o código de produto da tabela de produtos.
[00:50] Vou criar um novo script, com itens notas. Vou começar com número, que é um varchar de 5, código, que é um varchar de 10. Código também é PK e FK, porque posso ter uma nota fiscal com vários itens. O que diferencia cada linha é o produto.
[02:35] Temos agora quantidade, que é a quantidade de litros vendidos de sucos. São dois campos com primary key agora, então separo os dois com vírgula.
[03:41] Agora vamos criar os relacionamentos. Primeiro número de nota fiscal da tabela de itens notas com número de nota fiscal da tabela notas. Também temos que criar o relacionamento entre código de produtos na tabela de itens de notas com código do produto da tabela de produtos.
[06:28] Tenho todas as cinco tabelas criadas e os cinco relacionamentos criados.

CREATE TABLE items_notas (
    numero      VARCHAR2(5) NOT NULL,
    codigo      VARCHAR2(10) NOT NULL,
    quantidade  INTEGER NULL,
    preco       FLOAT NULL,
    PRIMARY KEY ( numero,
                  codigo )
);


ALTER TABLE items_notas
    ADD CONSTRAINT fk_notas FOREIGN KEY ( numero )
        REFERENCES notas ( numero );
        
ALTER TABLE items_notas
    ADD CONSTRAINT fk_produtos FOREIGN KEY ( codigo )
        REFERENCES produtos ( codigo );

------------------------------------------------------------------------------------------------------------------------------------------------------- CONSOLIDANDO O SEU CONHECIMENTO

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.

1) Abra o SQL Developer e crie um novo script de comandos SQL.

2) Crie a tabela PRODUTOS, digitando o comando abaixo:

CREATE TABLE PRODUTOS (
    CODIGO VARCHAR(10) NOT NULL,
    DESCRITOR VARCHAR(100) NULL,
    SABOR VARCHAR(50) NULL,
    TAMANHO VARCHAR(50) NULL,
    EMBALAGEM VARCHAR(5) NULL,
    PRECO_LISTA FLOAT NULL,
    PRIMARY KEY (CODIGO)
);COPIAR CÓDIGO
3) Crie a tabela VENDEDORES, com o comando abaixo. Note que o campo DATA_ADIMISSAO está escrito errado:

CREATE TABLE VENDEDORES (
    MATRICULA VARCHAR(5) NOT NULL,
    NOME VARCHAR(100) NULL,
    BAIRRO VARCHAR(50) NULL,
    COMISSAO FLOAT NULL,
    DATA_ADIMISSAO DATE NULL,
    FERIAS INTEGER NULL,
    PRIMARY KEY (MATRICULA)
);COPIAR CÓDIGO
4) Para alterar o nome do campo DATA_ADIMISSAO, corrigindo-o, faça:

ALTER TABLE VENDEDORES RENAME COLUMN DATA_ADIMISSAO TO DATA_ADMISSAO;COPIAR CÓDIGO
5) É possível criar uma tabela usando o assistente do SQL Developer. Clique com botão da direita do mouse sobre Tabelas e clique em Nova Tabela:

6) Crie a tabela CLIENTES, conforme mostrado abaixo:

7) Clique OK para confirmar a criação da tabela.

8) Crie a tabela TABELA_DE_VENDAS, digitando o comando abaixo:

CREATE TABLE TABELA_DE_VENDAS (
    NUMERO VARCHAR(5) NOT NULL,
    DATA_VENDA DATE NULL,
    CPF VARCHAR(11) NOT NULL,
    MATRICULA VARCHAR(5) NOT NULL,
    IMPOSTO FLOAT NULL,
    PRIMARY KEY(NUMERO)
);COPIAR CÓDIGO

9) Acrescente duas chaves estrangeiras nesta tabela, uma que se associe ao campo CPF, de CLIENTES, e uma que se associe ao campo MATRICULA, de VENDEDORES:

ALTER TABLE TABELA_DE_VENDAS
ADD CONSTRAINT FK_CLIENTES
FOREIGN KEY (CPF) REFERENCES CLIENTES (CPF);

ALTER TABLE TABELA_DE_VENDAS
ADD CONSTRAINT FK_VENDEDORES
FOREIGN KEY (MATRICULA) REFERENCES VENDEDORES (MATRICULA);COPIAR CÓDIGO
10) Altera o nome da tabela TABELA_DE_VENDAS para NOTAS. Para isso, à esquerda, clique com o botão direito do mouse sobre a tabela TABELA_DE_VENDAS e escolha Tabela --> Renomear:

11) Altere o nome da tabela para NOTAS:

12) Clique em Aplicar.

13) Finalize a criação da base de dados, criando a tabela ITENS_NOTAS e suas chaves estrangeiras nesta tabela, uma que se associe ao campo NUMERO, de NOTAS, e uma que se associe ao campo CODIGO, de PRODUTOS:

CREATE TABLE ITENS_NOTAS (
    NUMERO VARCHAR(5) NOT NULL,
    CODIGO VARCHAR(10) NOT NULL,
    QUANTIDADE INTEGER NULL,
    PRECO FLOAT NULL,
    PRIMARY KEY (NUMERO, CODIGO)
);

ALTER TABLE ITENS_NOTAS ADD CONSTRAINT FK_NOTAS
FOREIGN KEY (NUMERO) REFERENCES NOTAS (NUMERO);

ALTER TABLE ITENS_NOTAS ADD CONSTRAINT FK_PRODUTOS
FOREIGN KEY (CODIGO) REFERENCES PRODUTOS (CODIGO);COPIAR CÓDIGO

Nesta aula, aprendemos:

A criar uma tabela
Que o nome dos campos podem ser modificados mesmo depois da tabela ter sido criada
Que podemos criar as tabelas por um assistente
Como criar os relacionamentos entre as tabelas
Que o nome da tabela também pode ser modificado após sua criação
Como visualizar o esquema do banco graficamente

----------------------------------------------------------------------------------------------------------------------------------------------------------------------- INCLUINDO DADOS

[00:00] Agora tenho minhas tabelas criadas, tenho os relacionamentos, vou agora incluir dados, começando com o comando insert into e o nome da tabela onde vou incluir dados. Abro parênteses e coloco os nomes dos campos separados por vírgula. Depois, coloco o comando values e o valor dos campos que eu quero na mesma ordem que coloquei em cima. Não necessariamente precisa respeitar a ordem na tabela, mas é preciso ter a correspondência entre valores e campos.
[03:02] Outra coisa interessante é que quando o campo é varchar ele precisa estar entre aspas simples, e quando é um inteiro, float ou decimal, não preciso colocar aspas.
[03:42] Se eu rodar o comando select asterisco from produtos, faço a consulta da tabela produtos.
[05:10] Posso também rodar o comando sem o nome dos campos, mas fazendo isso preciso garantir que a ordem está respeitando a ordem da tabela.
[06:10] Com o comando insert, também posso inserir várias linhas ao mesmo tempo. Porém, preciso usar o comando insert all, depois into com o nome da tabela, coloco values e os valores. No final, coloco o select asterisco from dual.
[09:30] É isso que eu queria falar para vocês sobre o insert simples.

INSERT ALL
INTO PRODUTOS (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES ('1040110', 'lIGHT - 350 ML - Uva', 'Uva', '350 ML', 'LATA', 6.00)
INTO PRODUTOS (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES ('1040111', 'lIGHT - 350 ML - Limao', 'Limao', '350 ML', 'LATA', 3.50)
INTO PRODUTOS (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES ('1040112', 'lIGHT - 350 ML - Carambola', 'Carambola', '350 ML', 'LATA', 5.60)
INTO PRODUTOS (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES ('1040113', 'lIGHT - 350 ML - Abacaxi', 'Abacaxi', '350 ML', 'LATA', 5.60)
SELECT * FROM DUAL;

INSERT INTO produtos (
    codigo,
    descritor,
    sabor,
    tamanho,
    embalagem,
    preco_lista
) VALUES (
    '1040107',
    'lIGHT - 350 ML - MELANCIA',
    'MELANCIA',
    '350 ML',
    'LATA',
    4.56
);

INSERT INTO produtos (
    codigo,
    descritor,
    sabor,
    tamanho,
    embalagem,
    preco_lista
) VALUES (
    '1040108',
    'lIGHT - 350 ML - Graviola',
    'Graviola',
    '350 ML',
    'LATA',
    4.00
);

INSERT INTO produtos
VALUES 
(
    '1040109',
    'lIGHT - 350 ML - Acai',
    'Acai',
    '350 ML',
    'LATA',
    5.60
);

INSERT INTO CLIENTES (
    CPF, NOME, ENDERECO, 
    BAIRRO, CIDADE, ESTADO, 
    CEP, DATA_NASCIMENTO, IDADE, 
    SEXO, LIMITE_CREDITO, VOLUME_COMPRA, 
    PRIMEIRA_COMPRA) 
VALUES (
    '1478662710', 'Érica Carvalho', 'R. Iriquitia', 
    'Jardins', 'São Paulo', 'SP', 
    '80012212', TO_DATE('1990-09-01', 'YYYY-MM-DD'), 27, 
    'F', 170000, 24500, 
    0);

------------------------------------------------------------------------------------------------------------------------------------------------------------------- MÚLTIPLOS REGISTROS

[00:00] Vamos inserir um grupo grande de registro. Para isso, precisamos de uma fonte de dados, que vão ser outras tabelas Oracle. Se recordam que no início do treinamento pedi que vocês recuperassem dados? Iremos usar essas tabelas.
[00:45] Note que na lista de tabelas tenho uma chamada tabela de produtos. Ela tem código do produto, nome, tamanho, sabor e preço de lista. São muito parecidos com o da nossa tabela de produtos. De maneira proposital, a ordem é diferente.
[02:38] Meu objetivo vai ser pegar os dados e incluir na minha tabela. Para isso, preciso de um select. Mas tem dois detalhes importantes. A ordem deve ser igual a das colunas declaradas na minha tabela.
[04:43] Para fazer essa integração, é legal que os nomes dos campos sejam iguais aos da tabela destino. Com isso, posso fazer um insert into.
[06:38] Eu tive um erro, porque lá quando eu criei a tabela de produtos eu disse uma coisa e fiz outra. Quando criei a tabela, o campo embalagem foi criado com varchar de 5, quando deveria ser 50. Eu quis deixar esse erro para vermos como resolver.
[08:54] Meu objetivo é mudar o tamanho do campo embalagem que eu criei de forma errada. Tenho o comando para isso alter table com o modify. Eu estou alterando a tabela de produtos e modificando a coluna embalagem.
[10:40] Tive outro problema ao tentar inserir os produtos. Na tabela origem, tenho um código de produto, mas na tabela atual tenho um produto com o mesmo código. Código é chave primária, não posso ter dois produtos com o mesmo código. O que acontece é que quando faço uma seleção em lote, se uma linha tiver problema, nenhuma vai ser inserida.
[13:02] Preciso no select fonte excluir o que já existe na tabela destino. Para isso, uso um where código é diferente daquele cujo produto já existe. Esse select vai trazer todo mundo, menos o que já está na destino. E aí não teremos problemas de chave primária violada.
[15:08] Esse vídeo teve várias coisas, tentamos colocar produtos em lote, tive um erro com a informação de varchar, alterei e na hora de incluir tive um problema de chave primária. Precisei excluir o produto repetido e aí sim deu certo. Espero que tenha sido bastante esclarecedor, porque conseguimos simular erros que acontecem quando trabalhamos com banco de dados.

-- ALTERANDO O TIPO DE DADO ...

ALTER TABLE PRODUTOS MODIFY (EMBALAGEM VARCHAR2(50));

INSERT INTO produtos
    SELECT
        codigo_do_produto  AS codigo,
        nome_do_produto    AS descritor,
        sabor,
        tamanho,
        embalagem,
        preco_de_lista     AS preco_lista
    FROM
        tabela_de_produtos
    WHERE
        codigo_do_produto <> 1040107 
;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------- INCLUINDO CLIENTES

[00:00] Vamos ver neste vídeo a exclusão de dados através de select, mas na tabela de clientes. Iremos usar uma solução mais elegante do que a que usamos onde tivemos que excluir o produto que já existia. Eu antes tive que descobrir que o produto estava repetido, mas eu posso rodar um comando para isso.
[01:08] Vou incluir um cliente propositalmente repetido, forçar o erro para achar a solução. Lembrando que não preciso especificar o campo se colocar na ordem em que aparece na tabela.
[05:02] Incluído o registro, vou fazer o select da tabela fonte. Logo de cara aparece o cliente que inserimos. Significa que quando eu fizer a leitura vai dar um erro e a leitura vai ser recusada.
[09:25] Tivemos o erro. Se eu quisesse repetir a solução do outro vídeo, eu colocaria um where. Mas quero uma solução melhor. Se eu ao invés de colocar direto o CPF colocar um not in select CPF from clientes, estou registrando todo mundo menos quem já existe. Não importa quem é.
[14:13] Não preciso mais me preocupar em verificar se existe alguém na tabela destino. A cláusula do where já vai excluir quem existe duas vezes. Ele já prevê o problema de primary key.

INSERT INTO CLIENTES
VALUES ('1471156710', 'Erica Carvalho', 'Rua Iriqutia', 'Jardins', 'Sao Paulo', 'SP', '80012212',
TO_DATE('1990-09-01','yyyy-mm-dd'), 27, 'F', 170000, 24500, 0);

Esta clausula abaixo ira inserir todos os dados contidos na Tabela tabela_de_clientes para a tabela Clientes, fazendo exceção dos CPFs que já existem

INSERT INTO clientes
    SELECT
        cpf,
        nome,
        endereco_1          AS endereco,
        bairro,
        cidade,
        estado,
        cep,
        data_de_nascimento  AS data_nascimento,
        idade,
        sexo,
        limite_de_credito   AS limite_credito,
        volume_de_compra    AS volume_compra,
        primeira_compra
    FROM
        tabela_de_clientes
    WHERE
        cpf NOT IN (
            SELECT
                cpf
            FROM
                clientes
        )
	;

------------------------------------------------------------------------------------------------------------------------------------------------------------------- IMPORTAÇÃO DE DADOS

[00:00] Agora vamos ler dados e gravar nosso banco baseado em arquivos externos, em formato csv. Faça o seguinte. Entre no link associado ao vídeo e baixe o arquivo. Vamos extrair os arquivos.
[01:17] A primeira tabela que vamos usar é a de vendedores. Vou dar um clique com o botão direito do mouse e escolher importar dados. A origem vai ser o arquivo que baixamos. Ele tem um cabeçalho, vou ignorar zero linhas, a codificação dele é UTF-8, o derivador é ponto e vírgula.
[03:11] Tenho alguns métodos de inclusão de dados. Eu vou destacar dois. Basicamente, tenho o inserir e o inserir script. Vou escolher o inserir. Depois, tenho as colunas das tabelas. Ele é inteligente o suficiente para saber que o nome das colunas do arquivo coincide com os da tabela, então já tenho as colunas selecionadas. Se não estivesse selecionado, eu iria selecionando uma a uma do lado esquerdo.
[04:46] Ele analisa o conteúdo do arquivo e determina que tipo estamos usando em cada coluna. Se tiver algo discrepante, ele vai chamar a atenção. Depois temos o resumo do que ele vai fazer e clicamos em finalizar. A inclusão foi bem sucedida.
[06:31] Vamos repetir o processo para a tabela de notas. Seleciono o arquivo, o UTF-8, o separador, uso o método inserir. Mas aqui ele já organizou a ordem das colunas sozinho pelo nome.
[08:54] Fiz duas importações por tabela externa.

------------------------------------------------------------------------------------------------------------------------------------------------------- CONSOLIDANDO O SEU CONHECIMENTO

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.

1) Criar um novo script SQL no SQL Developer.

2) Insira um novo produto. Digite:

INSERT INTO PRODUTOS (
    CODIGO, DESCRITOR, SABOR, 
    TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES (
    '1040107', 'Light - 350 ml - Melancia', 'Melancia', 
    '350 ml', 'Lata', 4.56
);COPIAR CÓDIGO
3) Confira se o produto foi realmente incluído na tabela. Digite e execute:

SELECT * FROM PRODUTOS;COPIAR CÓDIGO

4) No script, você pode incluir mais de um comando. Digite e execute:

INSERT INTO PRODUTOS (
    CODIGO, DESCRITOR, SABOR, 
    TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES (
    '1040108', 'Light - 350 ml - Graviola', 'Graviola', 
    '350 ml', 'Lata', 4.00
);

INSERT INTO PRODUTOS (
    CODIGO, DESCRITOR, SABOR, 
    TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES (
    '1040109', 'Light - 350 ml - Acai', 'Acai', 
    '350 ml', 'Lata', 5.60
);COPIAR CÓDIGO
5) Em um mesmo comando, você pode incluir mais de um registro. Digite e execute:

INSERT ALL
INTO PRODUTOS (
    CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES (
    '1040110', 'Light - 350 ml - Jaca', 'Jaca', '350 ml', 'Lata', 6.00
)
INTO PRODUTOS (
    CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES (
    '1040111', 'Light - 350 ml - Manga', 'Manga', '350 ml', 'Lata', 3.50
)
SELECT * FROM DUAL;COPIAR CÓDIGO
6) Faça a seguinte consulta na tabela:

SELECT 
    CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR, 
    SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA AS PRECO_LISTA
FROM TABELA_DE_PRODUTOS;COPIAR CÓDIGO

7) No comando INSERT, você pode incluir os produtos da tabela TABELA_DE_PRODUTOS na tabela PRODUTOS. Mas antes, foi fixado um valor máximo para o campo EMBALAGEM menor que o necessário. Para alterar esta propriedade, digite:

ALTER TABLE PRODUTOS MODIFY (EMBALAGEM VARCHAR(50));COPIAR CÓDIGO
8) Agora sim, digite e execute o comando de INSERT:

INSERT INTO PRODUTOS
SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR, 
    SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA AS PRECO_LISTA
FROM TABELA_DE_PRODUTOS;COPIAR CÓDIGO
9) Agora, inclua um cliente:

INSERT INTO CLIENTES VALUES (
    '1471156710', 'Erica Carvalho', 'Rua Iriqutia', 
    'Jardins', 'Sao Paulo', 'SP', '80012212', 
    TO_DATE('1990-09-01','yyyy-mm-dd'), 27, 'F', 
    170000, 24500, 0
);COPIAR CÓDIGO
10) Inclua os clientes usando a tabela TABELA_DE_CLIENTE como fonte. Digite e execute:

INSERT INTO CLIENTES
SELECT CPF, NOME, ENDERECO_1 AS ENDERECO, 
    BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO AS DATA_NASCIMENTO,
    IDADE, SEXO, LIMITE_DE_CREDITO AS LIMITE_CREDITO, 
    VOLUME_DE_COMPRA AS VOLUME_COMPRA, PRIMEIRA_COMPRA
FROM TABELA_DE_CLIENTES WHERE CPF NOT IN (SELECT CPF FROM CLIENTES);COPIAR CÓDIGO

11) Teste o conteúdo da tabela de clientes:

SELECT * FROM CLIENTES;COPIAR CÓDIGO

Nesta aula, aprendemos:

A incluir dados em uma tabela, através de vários ou de um único comando
Como incluir dados na tabela através de um assistente
Como incluir dados na tabela usando um arquivo externo como fonte

------------------------------------------------------------------------------------------------------------------------------------------------------------- ALTERANDO DADOS DA TABELA

[00:00] Já aprendemos a inserir dados dentro de tabelas, seja através do insert simples, insert composto, insert com select, com um arquivo externo. Vamos agora aprender a alterar um registro.
[01:00] Temos a tabela de produtos. Vamos alterar o preço de um deles. Vou rodar o comando update, com nome da tabela, set, nome do campo que quero alterar, o novo valor, e o where para filtrar a seleção com o código do produto. E foi alterado.
[03:25] Mas depois do where posso colocar qualquer tipo de filtro para selecionar em quem quero fazer a alteração. Por exemplo, posso colocar um valor igual a 6 para todo mundo que é maracujá. Ao invés do código do produto, coloco o sabor igual a maracujá. Rodando o comando, ele atualizou duas linhas.
[05:06] Claro que esse tipo de alteração não é muito legal aqui porque os dois produtos são muito diferentes em tamanho e tem o mesmo preço, mas vamos supor que quero fazer uma promoção ou algo do tipo.
[05:35] O comando update me permite fazer alterações em diversos campos ao mesmo tempo no mesmo comando. Digamos que eu queira pegar o produto com um código específico e quero alterar vários campos nele, como tamanho, embalagem, descritor, separando os campos por vírgula. Quando termino, coloco o where.
[08:35] Posso também fazer uma alteração usando campos matemáticos. Por exemplo, digamos que o usuário diga que quer um reajuste em todos os produtos com sabor maracujá no preço. Posso fazer preço de lista vezes 0.1, que é 10%. Ele vai multiplicar e gravar.
[10:56] É o que eu queria mostrar a vocês sobre alteração de dados.

UPDATE PRODUTOS SET PRECO_LISTA = 5 WHERE CODIGO = '1040107';

UPDATE PRODUTOS SET PRECO_LISTA = 5 WHERE CODIGO = '1040107';

UPDATE PRODUTOS SET PRECO_LISTA = 5 WHERE SABOR LIKE '%Maracuja%';

UPDATE PRODUTOS SET DESCRITOR = 'Sabor da Montanha - 1 Litro - Uva', EMBALAGEM = 'PET', SABOR = 'Uva' WHERE CODIGO LIKE '%1000889%' 

UPDATE PRODUTOS SET PRECO_LISTA = PRECO_LISTA * 1.1 WHERE SABOR LIKE '%Maracuja%'

SELECT
    *
FROM
    produtos
WHERE
    sabor LIKE 'Maracuja';
	
	
Um cliente da nossa base de dados, com CPF 19290992743, se mudou para a Rua Jorge Emilio, 23, no bairro de Santo Amaro, cidade São Paulo, estado SP e CEP 8833223.
Como seria o comando SQL para alterar esse registro na tabela CLIENTES?
Um exemplo de comando é:

UPDATE clientes
SET
    endereco = 'Rua Jorge Emilio, 23',
    bairro = 'Santo Amaro',
    cidade = 'São Paulo',
    estado = 'SP',
    cep = '8833223'
WHERE
    cpf = '19290992743';
	
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------- USANDO UPDATE COM FROM

[00:00] Nós vamos continuar vendo o update, mas agora veremos um baseado no conteúdo de outra tabela. Para entendermos, vamos explicar o problema e ver a melhor solução.
[00:22] Vou criar um script novo e fazer um select na tabela de vendedores. É uma tabela que eu carreguei no início do treinamento e que estamos usando como fonte. Vamos supor que seja de um outro sistema, outro ambiente, que eu não tenho acesso para modificar, mas que o que acontece nela tem que refletir na tabela de vendedores do meu banco.
[01:12] Note que tenho os campos dos vendedores. Na matrícula, sempre tenho antes do número dois zeros. Iremos levar em consideração aqui o campo de férias. Ele é zero se o vendedor não está de férias e um se o vendedor está de férias.
[01:55] Agora vou rodar a minha tabela de vendedores. Tenho duas diferenças em que o campo matrícula não tem o 00, e o campo de férias tem uma diferença no nome. A tabela vendedores do banco fonte e do meu banco estão sincronizadas. Mas vamos supor que alguém troque quem está de férias com quem não está.
[06:02] Vamos comparar as duas tabelas, mas antes precisamos igualar o número da matrícula, considerando só os três últimos dígitos. Para isso, uso a função substr para a matrícula.
[07:30] Na minha tabela temos dois funcionários de férias e dois não. Já na tabela fonte temos o contrário.
[07:52] Eu quero fazer um update que substitua na minha tabela vendedores um conteúdo do campo férias que está na tabela origem, de tal maneira que eu faça um sincronismo. O que acontece lá o meu comando update vai refletir aqui.
[09:13] Eu poderia fazer um update, um inner join, pego o campo que está na outra tabela e coloco na minha. Só que se eu rodar esse comando vai dar erro, porque o Oracle não suporta inner joins nos updates.
[09:50] Temos um comando que podemos substituir para fazer a sincronização entre as tabelas. Vou usar uma cláusula de filtro chamada exists. Eu repito esse join, mas trocando para where exists e select from. Faço dentro do exists um join com a tabela que está fora.
[12:10] Se eu for na tabela de vendedores e usar insert into com os campos da minha tabela de vendedores, ele vai me trazer só linhas da outra tabela que existem na minha.
[14:32] Com o exist, eu consigo usar dentro do update dessa maneira. Uso um símbolo de igual e coloco uma consulta sendo feita na tabela fonte. Dentro, coloco o where e faço essa igualdade dos dois caras das duas tabelas. Mas isso não basta. Preciso colocar um where associado ao filtro do update e repito o exist.
[16:30] Fica mais complicado, mas esse comando substitui o inner join. Note que agora os dois campos são equivalentes e estão sincronizados. Esse comando faz com que eu sincronize dados da tabela destino baseada na tabela fonte. Posso atualizar os valores. É isso que eu queria falar sobre o update.


SELECT * FROM TABELA_DE_VENDEDORES;

SELECT * FROM VENDEDORES;

UPDATE TABELA_DE_VENDEDORES SET DE_FERIAS = 0 WHERE MATRICULA IN ('00236','00237');

UPDATE TABELA_DE_VENDEDORES SET DE_FERIAS = 1 WHERE MATRICULA IN ('00235','00238');

SELECT
    a.matricula,
    b.matricula,
    a.nome,
    a.ferias,
    b.de_ferias
FROM
    vendedores a
INNER JOIN
    tabela_de_vendedores b
ON
    a.matricula = substr(b.matricula, 3, 3);
	
-- Comando abaixo não é possível no Orakle
	
UPDATE VENDEDORES A INNER JOIN TABELA_DE_VENDEDORES B 
ON A.MATRICULA = SUBSTR(B.MATRICULA,3,3) SET A.FERIAS = B.DE_FERIAS;

-- Ao invés disso utilizamos EXISTS

SELECT
    a.matricula,
    b.matricula,
    a.nome,
    a.ferias,
    b.de_ferias
FROM
    vendedores a
INNER JOIN
	tabela_de_vendedores b
ON
	a.matricula = substr(b.matricula, 3, 3);	


UPDATE vendedores a
SET
    a.ferias = (
        SELECT
            b.de_ferias
        FROM
            tabela_de_vendedores b
        WHERE
            a.matricula = substr(b.matricula, 3, 3)
    )
WHERE
    EXISTS (
        SELECT
            1
        FROM
            tabela_de_vendedores b
        WHERE
            a.matricula = substr(b.matricula, 3, 3)
    );	
	
	
------------------------------------------------------------------------------------------------------------------------------------------------------------- EXCLUINDO DADOS DA TABELA
	
[00:00] Já fizemos inclusão e alteração. Agora falta excluir dados da tabela. É o comando delete. Vamos abrir o arquivo inclusão de registros. Selecione todos os comandos e copie no Oracle. Só vou selecionar os inserts. Tenho 11 produtos.
[01:30] Para excluir um desses registros, basta usar o delete from produtos where código igual ao código do produto. Se eu rodar de novo a seleção, só tenho 10 produtos na lista.
[02:44] Agora, vou ler da tabela de produtos. No descritor nome do produto, não aparece ninguém, porque não existe ninguém da família sabor dos Alpes. Agora, se eu fizer o select da tabela de origem, tenho um.
[05:07] Infelizmente essa situação não pode acontecer, porque a tabela oficial é a tabela de produtos. A tabela produtos sempre tem que estar sincronizada com a original. Para fazer isso, depois do delete sempre coloco o where. Vou selecionar todo mundo que não existe em uma, mas existe na outra.
[07:00] Eu gostaria de excluir esses registros, porque preciso das duas tabelas com o mesmo conteúdo. Para isso, sem ter que olhar código por código, vou usar o where no delete.
[08:44] Eu sempre mostro nos meus treinamentos, vocês podem dizer se não acharem bacana, os erros que eu cometo enquanto desenvolvo, para mostrar que é normal errar. Mesmo sabendo. É claro que às vezes cometo erros muito grosseiros que podem atrapalhar e aí não coloco na versão final.
[10:25] Ao fazer esse delete, sincronizei as duas tabelas.


INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001001','Sabor dos Alpes 700 ml - Manga','Manga','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001000','Sabor dos Alpes 700 ml - Melão','Melão','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001002','Sabor dos Alpes 700 ml - Graviola','Graviola','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001003','Sabor dos Alpes 700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001004','Sabor dos Alpes 700 ml - Abacate','Abacate','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001005','Sabor dos Alpes 700 ml - Açai','Açai','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001006','Sabor dos Alpes 1 Litro - Manga','Manga','1 Litro','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001007','Sabor dos Alpes 1 Litro - Melão','Melão','1 Litro','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001008','Sabor dos Alpes 1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001009','Sabor dos Alpes 1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001010','Sabor dos Alpes 1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50);



SELECT
    *
FROM
    produtos
WHERE
    codigo NOT IN (
        SELECT
            codigo_do_produto
        FROM
            tabela_de_produtos
    );


DELETE FROM produtos
    WHERE
        codigo NOT IN (
            SELECT
                tabela_decodigo_do_produto
            FROM
                tabela_de_produtos
    );


------------------------------------------------------------------------------------------------------------------------------------------------------ CUIDADO AO ALTERAR EXCLUIR DADOS

[00:00] Vamos ver mais um pouco sobre update e delete, mas dando ênfase em quando não usamos a cláusula where. Para isso, vou criar um novo script e uma nova tabela chamada produtos 2. Ela vai ter o mesmo conteúdo e o mesmo formato da original.
[01:00] Depois do create table, coloco as e entre parênteses select from produtos. Vou criar uma tabela que é um espelho e esse comando vai fazer com que a tabela seja igual à original.
[01:55] Note que o preço de lista tem vários valores. Vou colocar um update produtos 2 set preço lista igual a 8. Não coloquei o where, logo ele não vai filtrar ninguém. Vai fazer o update em toda a tabela. Isso pode me dar problemas se eu tiver esquecido o where sem querer. A mesma coisa com o delete.
[03:24] Tome muito cuidado ao usar o update e o delete sem where.


CREATE TABLE PRODUTOS2 AS (SELECT * FROM PRODUTOS);

SELECT * FROM PRODUTOS;

UPDATE PRODUTOS2 SET PRECO_LISTA = 8;

DELETE FROM PRODUTOS2;

Por que devemos ter cuidado ao usar comandos UPDATE ou DELETE sem condições de WHERE?
Porque não conseguiremos recuperar os dados, caso eu execute um comando sem a cláusula WHERE sobre toda a tabela
Alternativa correta! É esse o cuidado que é mencionado no último vídeo.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------- COMMIT e ROLLBACK

[00:00] Vamos falar sobre um mecanismo que temos no Oracle para nos ajudar a prever besteiras que façamos no banco de dados no momento em que incluímos, deletamos ou alteramos coisas.
[00:25] Note que se eu fecho o programa vejo uma mensagem dizendo que tenho operações não confirmadas e me dá algumas opções. O COMMIT é como se fosse uma confirmação, enquanto ROLLBACK significa voltar atrás.
[01:10] Durante a gravação do curso estou executando vários comandos diferentes. Enquanto isso, meu banco de dados não está sofrendo atualizações. Se eu faço um update e alguém entra em outra máquina e faz uma consulta, ele não vai ver as alterações que eu fiz a não ser que eu dê um COMMIT.
[02:26] O Oracle por padrão quando está dentro de uma sessão não comita as coisas. Só acontece isso quando fecho a sessão, e aí ele me lembra que preciso fazer o COMMIT.
[03:35] Se eu escrever COMMIT e selecionar a lista, ele nem vai me mostrar aquela caixa de diálogo. Tudo que eu fiz é gravado no banco. E aí sim se outro usuário entrar ele vai ver as modificações feitas.
[04:50] Vou criar um script novo e vou novamente fazer um select. Agora, vou inserir um produto. Abrindo outra janela do SQL developer, minha alteração não aparece. Se eu der o COMMIT, aí sim consigo ver na outra janela a alteração.
[08:08] Pode acontecer também de eu fazer algo errado. Por exemplo, aumentei a comissão dos vendedores em 15% e me arrependi. Temos o comando ROLLBACK, que vai fazer com que as coisas que eu fiz sejam revertidas.
[10:27] Claro que eles vão sensibilizar a conexão em que eu estou somente. Minha alteração só é salva com o COMMIT, e não posso dar o ROLLBACK depois do COMMIT, porque eu limpei meu histórico de alterações depois de salvar. Ele não vai ter para onde voltar.
[14:45] Essa política é uma parametrização do Oracle. O DBA pode mudar isso. Mas esse é o padrão.

Quando usamos o ROLLBACK duas vezes, temos erro?
Não, porque podemos usar ROLLBACK simultâneos na mesma tela de script
Alternativa correta! Podemos sim usar ROLLBACK seguidos em um mesmo script, mesmo que não seja iniciada uma nova transação. Mas o comando acaba sendo inútil, porque não há mais comandos salvos para serem desfeitos, pois o primeiro ROLLBACK já limpou o trace.

------------------------------------------------------------------------------------------------------------------------------------------------------- CONSOLIDANDO O SEU CONHECIMENTO

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.

1) Verifique a lista de produtos:

SELECT * FROM produtos;COPIAR CÓDIGO


2) Altere o preço de lista do produto com código 1040107. Para isso, digite e execute:

UPDATE PRODUTOS SET PRECO_LISTA = 5 WHERE CODIGO = '1040107';COPIAR CÓDIGO
3) Altere os dados da tabela em forma de lote, por exemplo, todos os produtos que tenham sabor maracujá. Digite e execute:

UPDATE PRODUTOS SET PRECO_LISTA = 6 WHERE SABOR = 'Maracuja';COPIAR CÓDIGO
4) Altere o preço de lista baseado no mesmo campo que será alterado. Por exemplo, digite e execute:

UPDATE PRODUTOS SET PRECO_LISTA = PRECO_LISTA * 1.1 WHERE SABOR = 'Maracuja'COPIAR CÓDIGO
5) Da mesma maneira que foram incluídos dados na tabela, baseado nos dados de uma outra tabela, você também pode alterar dados desta mesma maneira. Digite e execute:

UPDATE VENDEDORES A SET A.FERIAS = (
    SELECT B.DE_FERIAS FROM TABELA_DE_VENDEDORES B 
    WHERE A.MATRICULA = SUBSTR(B.MATRICULA,3,3)
) WHERE EXISTS (
    SELECT 1 FROM TABELA_DE_VENDEDORES B 
    WHERE A.MATRICULA = SUBSTR(B.MATRICULA,3,3)
);COPIAR CÓDIGO
6) É possível apagar dados da tabela. Antes disto, inclua novos registros, que depois serão excluídos. Digite e execute:

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001001', 'Sabor dos Alpes 700 ml - Manga', 'Manga', '700 ml', 'Garrafa', 7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001000', 'Sabor dos Alpes 700 ml - Melão', 'Melão', '700 ml', 'Garrafa', 7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001002', 'Sabor dos Alpes 700 ml - Graviola', 'Graviola', '700 ml', 'Garrafa', 7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001003', 'Sabor dos Alpes 700 ml - Tangerina', 'Tangerina', '700 ml', 'Garrafa', 7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001004', 'Sabor dos Alpes 700 ml - Abacate', 'Abacate', '700 ml', 'Garrafa', 7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001005', 'Sabor dos Alpes 700 ml - Açai', 'Açai', '700 ml', 'Garrafa', 7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001006', 'Sabor dos Alpes 1 Litro - Manga', 'Manga', '1 Litro', 'Garrafa', 7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001007', 'Sabor dos Alpes 1 Litro - Melão', 'Melão', '1 Litro', 'Garrafa', 7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001008', 'Sabor dos Alpes 1 Litro - Graviola', 'Graviola', '1 Litro', 'Garrafa', 7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001009', 'Sabor dos Alpes 1 Litro - Tangerina', 'Tangerina', '1 Litro', 'Garrafa', 7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001010', 'Sabor dos Alpes 1 Litro - Abacate', 'Abacate', '1 Litro', 'Garrafa', 7.50);COPIAR CÓDIGO
7) Agora, apague apenas o registro com código 1001000. Digite e execute:

DELETE FROM PRODUTOS WHERE CODIGO = '1001000';COPIAR CÓDIGO
8) Você pode aplicar um filtro para selecionar dados a serem excluídos. Por exemplo, digite e execute:

DELETE FROM PRODUTOS WHERE TAMANHO = '1 Litro' AND SUBSTR(DESCRITOR,1,15) = 'Sabor dos Alpes';COPIAR CÓDIGO
9) Outra forma é apagar usando a seleção de dados de outra tabela. Digite e execute:

DELETE FROM PRODUTOS WHERE CODIGO NOT IN (
    SELECT CODIGO_DO_PRODUTO FROM TABELA_DE_PRODUTOS
);COPIAR CÓDIGO
10) O comando UPDATE e DELETE pode ser executado sobre a tabela inteira. Então, crie uma tabela de forma temporária, para depois alterá-la e apagá-la. Digite e execute:

CREATE TABLE PRODUTOS2 AS (SELECT * FROM PRODUTOS);COPIAR CÓDIGO
11) Altere os dados para toda a tabela:

UPDATE PRODUTOS2 SET PRECO_LISTA = 8;COPIAR CÓDIGO
12) O comando abaixo apaga todos os registros da tabela PRODUTOS2. Digite e execute-o:

DELETE FROM PRODUTOS2;COPIAR CÓDIGO
13) Para confirmar a inclusão de dados, execute o comando COMMIT:

COMMIT;COPIAR CÓDIGO
14) Caso deseje voltar ao status inicial da modificação, basta executar:

ROLLBACK;COPIAR CÓDIGO


Nesta aula, aprendemos:

A alterar e excluir dados de uma tabela
Que podemos alterar ou excluir todos os dados de uma tabela
Os comandos COMMIT e ROLLBACK, para manipular transações no Oracle

------------------------------------------------------------------------------------------------------------------------------------------------------------- CAMPO COM AUTO INCREMENTO

[00:00] Vou falar agora sobre colunas do tipo auto incremento. É uma coluna numérica, sempre números inteiros, e é um sequencial. Ou seja, à medida em que incluo novas linhas, esse cara vai aumentando em um o último valor incluído. Se eu tiver uma tabela vazia, onde a coluna id é do tipo auto incremento, se eu executo a coluna insert, automaticamente o valor que ele coloca vai ser um.
[01:00] Note que no slide o comando insert não se refere à coluna id. Só incluí dados na coluna descritor. Ele automaticamente coloca o valor um. Se eu faço um segundo insert, ele muda para dois. Posso usar o excluir numa tabela de auto incremento também, aí sim posso referenciar a coluna diretamente. Somente no insert não é necessário fazer isso. Se eu faço outro insert, ele continua o sequencial, colocando mais um em cima do último auto incremento incluído.
[02:17] Algumas características da coluna do tipo auto incremento. Usamos o tipo identity. Quando executamos o comando insert, não é necessário fazer referência. Só podemos ter uma coluna desse tipo por tabela. E podemos até forçar um valor dentro da coluna auto incremento, mas isso pode causar problemas.
[03:03] No SQL developer, vou criar um novo script, uma nova tabela com o campo auto incremento. O tipo vai ser number. Para dizer que vai ser auto incremento, escrevo generated by default on null as identity. Basicamente, ele diz para criar por padrão quando achar nulo a coluna, substitua por identity.
[04:25] Embaixo vou criar o descritor, que vai ser do tipo varchar de 20. A primary key dessa tabela vai ser o id. Seleciono o comando e crio a tabela. Ela ainda está vazia. Vou colocar insert into tab identity, a referência ao descritor, values cliente 1. Estou me referindo à coluna id.
[06:15] Agora vou pegar o insert, inserir o cliente 2 e o cliente 3. Rodo o comando, tenho a sequência. Posso também usar o delete para excluir, por exemplo, o 2. Depois, faço a inclusão do cliente 4. O 2 foi excluído.
[07:47] O 4 é o maior de todos. Se eu deletar, o último valor vai ser 3. Agora, se eu inserir um novo valor, ele vai continuar a sequência interna e ir para o 5 ou continuar no 4?
[08:25] Note que foi para o 5, apesar de eu ter excluído o número 4. Ele tem uma sequência interna. Sempre vai usar isso independente do último valor que tenho no id. Essa sequência é criada no momento em que crio a tabela e faz um gerenciamento em paralelo.
[09:20] Eu disse que eu posso forçar o identity, mas isso pode causar problemas. Vamos ver. Vou falar para ele criar o 7. Rodando isso, lembram que eu disse que o controle da sequência está fora da tabela? Internamente, essa sequência está no 5. O próximo insert que eu fizer ele via colocar o número 6. E se eu usar o auto incremento de novo, teremos o 7 repetido e vai dar um erro. Por isso forçar valor é um problema.
[12:00] Para resolver, eu teria que dar um delete from tab where id é igual a 7. Agora, posso rodar o auto incremento e a sequência volta ao normal. Ele até pulou para o 8, porque quando eu tento colocar o 7, dá erro, mas internamente a sequência foi. Se eu tento usar de novo, ele pula para o número 8.
[13:00] Vou forçar de novo um valor 9. Sabemos que o último valor inserido pelo identity foi o 8. Quando eu inserir o comando, vai passar para 9 e dar problema de chave primária. Mas a sequência foi para o 9. Se eu tento de novo, ele consegue colocar, porque no controle de sequência o 9 ficou registrado.
[14:33] Também podemos forçar o id, mas no lugar do valor coloco valor nulo. Esse comando ele vai entender nula boa. Às vezes em algum tipo de situação você tem a obrigatoriedade de colocar todos os campos da tabela, então basta referenciar como nulo.

CREATE TABLE tab_identity (
    id         NUMBER
        GENERATED BY DEFAULT ON NULL AS IDENTITY,
    descritor  VARCHAR2(20),
    PRIMARY KEY ( id )
);

SELECT * FROM tab_identity;

INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 1');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 2');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 3');
DELETE FROM TAB_IDENTITY WHERE ID = 2;
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 4');
DELETE FROM TAB_IDENTITY WHERE ID = 4;
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 5');

INSERT INTO TAB_IDENTITY (ID, DESCRITOR) VALUES (7, 'CLIENTE 7');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 6');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 7A');
DELETE FROM TAB_IDENTITY WHERE ID = 7;
INSERT INTO TAB_IDENTITY (ID, DESCRITOR) VALUES (9, 'CLIENTE 9');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE X');

INSERT INTO TAB_IDENTITY (ID, DESCRITOR) VALUES (NULL, 'CLIENTE Y');


Temos a seguinte tabela, com uma sequência:

CREATE TABLE TAB_IDENTITY2 (
    ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY, 
    DESCRITOR VARCHAR(20), 
    PRIMARY KEY (ID)
);
Agora, alguns registros são inseridos e/ou removidos, como abaixo:

INSERT INTO TAB_IDENTITY2 (DESCRITOR) VALUES ('CLIENTE1');
INSERT INTO TAB_IDENTITY2 (DESCRITOR) VALUES ('CLIENTE2');
INSERT INTO TAB_IDENTITY2 (DESCRITOR) VALUES ('CLIENTE3');
INSERT INTO TAB_IDENTITY2 (DESCRITOR) VALUES ('CLIENTE4');
DELETE FROM TAB_IDENTITY2 WHERE ID = 4;
INSERT INTO TAB_IDENTITY2 (DESCRITOR) VALUES ('CLIENTE5');
INSERT INTO TAB_IDENTITY2 (DESCRITOR) VALUES ('CLIENTE6');
DELETE FROM TAB_IDENTITY2 WHERE ID = 6;COPIAR CÓDIGO
Qual será o valor final da sequência após a execução dos comandos acima?

Alternativa correta
O valor da sequência será 6
Alternativa correta! A cada inserção, a sequência aumenta. Mesmo havendo remoção de registros, o valor da sequência permanece intacto. Logo, como houve seis inserções, o valor final da sequência será 6.

---------------------------------------------------------------------------------------------------------------------------------------------- DEFININDO VALORES PADRÕES PARA OS CAMPOS

[00:00] Quando criamos o tipo number generated by default on null as identity, estamos dizendo que quando encontrar nulo, deve substituir por identity. Podemos uma hora definir outros padrões para uma coluna caso ele ache nulo. É como se eu forçasse a coluna a ter um valor caso eu omita esse valor durante o comando de insert.
[00:41] Vamos fazer alguns exemplos. Vou criar uma tabela chamada tab padrão. Vou começar pelo id, como fizemos no vídeo anterior. Vou criar uma coluna descritor varchar de 10 not null. Significa que não pode ser nula. Endereço, vai ser varchar de 100 null. Quando faço isso é o inverso, quer dizer que pode ser nulo. Vou colocar cidade com default no nulo sendo Rio de Janeiro. Significa que quando for nulo automaticamente vai ser Rio de Janeiro.
[03:30] Também posso colocar a data criação quando nulo sendo sysdate. Quem fez o curso de consultas avançadas sabe que sysdate é uma versão que retorna a data do computador. Se eu não falar nada, vou gravar a data do computador. Isso é muito usado em programas. Fazemos isso para ter mais controle. É legal para exportação e importação, porque vou alterar registros e não me referencio à coluna de criação, mas ele sempre vai atualizar.
[05:45] Por último, vou dizer que a primary key é o id. Vou executar, criar a tabela. Posso inserir os dados normalmente. Faço o insert e tenho uma linha. Posso dar o insert só na coluna descritor, que é a única que não pode ser nula.
[08:43] Ele inseriu o 2, o endereço como nulo, a cidade como Rio de Janeiro, e a data do computador. Usou os padrões.

CREATE TABLE TAB_PADRAO
(ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
DESCRITOR VARCHAR(10) NOT NULL,
ENDERECO VARCHAR(100) NULL,
CIDADE VARCHAR(50) DEFAULT ON NULL 'Rio de Janeiro',
DATA_CRIACAO DATE DEFAULT ON NULL SYSDATE,
PRIMARY KEY (ID));

INSERT INTO TAB_PADRAO (DESCRITOR, ENDERECO, CIDADE, DATA_CRIACAO)
VALUES ('CLIENTE X','RUA PROJETADA A','SAO PAULO',TO_DATE('2019-01-01','YYYY-MM-DD'));

SELECT * FROM TAB_PADRAO;

INSERT INTO TAB_PADRAO(DESCRITOR) VALUES ('CLIENTE Y');

No momento da criação da tabela, foi definido um padrão para um campo. Que comportamento este campo tem durante um INSERT?
Se o campo não estiver no comando INSERT, o valor que será incluído será o padrão definido na criação da tabela
Alternativa correta! O campo estará preenchido com o seu padrão, caso ele não seja declarado no INSERT.

---------------------------------------------------------------------------------------------------------------------------------------------------------------- CONHECENDO AS TRIGGERS

[00:00] Vamos falar sobre uma estrutura que temos no Oracle chamada trigger. Traduzindo, seria um gatilho, algo especial que vai ser executado quando um evento acontecer. Pode ser uma inclusão, alteração ou exclusão. Posso executar esses processos antes ou depois do evento.
[00:52] Vamos fazer o seguinte exemplo. Tenho duas tabelas, uma com descritor e outro com log, em que tenho um id e um texto. Digamos que eu faça um insert de dados na tabela da esquerda. Quero que automaticamente eu escreva na tabela da direita.
[01:45] Se eu criar uma trigger associada à tabela que toda vez que eu der o insert escreve o dado do lado, basta dar um insert que o log vai ser preenchido. Quando eu excluir, posso escrever no log que foi excluído.
[02:30] Vamos criar na prática. No Oracle, vou criar um script novo. Tenho minha tabela de notas. Quero criar uma tabela que seja um relatório, fazendo a soma do faturamento que a empresa está tendo. E sempre quando eu incluir novas notas fiscais, ele vai automaticamente calcular o faturamento.
[03:27] Vamos primeiro criar a tabela onde vou armazenar os dados do faturamento por dia. Essa informação é importante. Vou criar uma tabela com faturamento. Ela vai ter os campos de data da venda e total de venda, que vai ser float.
[04:05] Essa vai ser nossa tabela relatório, onde vou ter o total do faturamento por dia calculado lá dentro. Vamos limpar a tabela de itens notas e depois a tabela de notas. Vou incluir uma nota fiscal. Para isso, temos que incluir na tabela de notas e depois na tabela de itens. Tenho como valores número, data da venda, CPF, matrícula e imposto.
[07:41] Vou agora inserir na tabela produtos alguns itens de nota fiscal. Tenho como campos número, código, quantidade e preço. Só que uma nota fiscal não necessariamente possui só um item. Pode ter mais de um. Vou escolher outro produto.
[09:57] Vamos inserir uma segunda venda, mantendo o mesmo dia, vendedor, produto, mas mudando o cliente. Agora, quero calcular o faturamento total da empresa. Lembrando que temos o select para ver o valor das notas.
[11:28] Para fazer o valor do faturamento no dia, temos que pegar a data que usamos, fazer um join pelo número da nota fiscal e um group by. Como é um group by, vou fazer um sum dos itens. O faturamento é a quantidade vezes preço. Vou chamar esse campo como total venda.
[13:40] Temos no dia 05/06 o total de vendas 40 mil. Já temos o cálculo do nosso relatório. É a primeira parte.

CREATE TABLE TAB_FATURAMENTO
(DATA_VENDA DATE NULL, TOTAL_VENDA FLOAT);

SELECT * FROM CLIENTES;
SELECT * FROM VENDEDORES;
SELECT * FROM PRODUTOS;

DELETE FROM ITEMS_NOTAS;
DELETE FROM NOTAS;

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES
('0100', TO_DATE('2019-06-05','YYYY-MM-DD'), '1471156710', '235', 0.10);
INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
('0100', '1040107', 1000, 10);
INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
('0100', '1000889', 1000, 10);

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES
('0101', TO_DATE('2019-06-05','YYYY-MM-DD'), '3623344710', '235', 0.10);
INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
('0101', '1040107', 1000, 10);
INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
('0101', '1000889', 1000, 10);

SELECT * FROM NOTAS;
SELECT * FROM ITEMS_NOTAS;

SELECT NOTAS.DATA_VENDA, SUM(ITEMS_NOTAS.QUANTIDADE * ITEMS_NOTAS.PRECO) AS TOTAL_VENDA
FROM NOTAS INNER JOIN ITEMS_NOTAS
ON NOTAS.NUMERO = ITEMS_NOTAS.NUMERO
GROUP BY NOTAS.DATA_VENDA;

INSERT INTO TAB_FATURAMENTO
SELECT NOTAS.DATA_VENDA, SUM(ITEMS_NOTAS.QUANTIDADE * ITEMS_NOTAS.PRECO) AS TOTAL_VENDA
FROM NOTAS INNER JOIN ITEMS_NOTAS
ON NOTAS.NUMERO = ITEMS_NOTAS.NUMERO
GROUP BY NOTAS.DATA_VENDA;

SELECT * FROM TAB_FATURAMENTO;

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES
('0102', TO_DATE('2019-06-05','YYYY-MM-DD'), '3623344710', '235', 0.10);
INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
('0102', '1040107', 1000, 10);
INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
('0102', '1000889', 1000, 10);

DELETE FROM TAB_FATURAMENTO;

INSERT INTO TAB_FATURAMENTO
SELECT NOTAS.DATA_VENDA, SUM(ITEMS_NOTAS.QUANTIDADE * ITEMS_NOTAS.PRECO) AS TOTAL_VENDA
FROM NOTAS INNER JOIN ITEMS_NOTAS
ON NOTAS.NUMERO = ITEMS_NOTAS.NUMERO
GROUP BY NOTAS.DATA_VENDA;




CREATE TRIGGER tg_calculo_faturamento AFTER
    INSERT ON items_notas
BEGIN
    DELETE FROM tab_faturamento;

    INSERT INTO tab_faturamento
        SELECT
            notas.data_venda,
            SUM(items_notas.quantidade * items_notas.preco) AS total_venda
        FROM
                 notas
            INNER JOIN items_notas ON notas.numero = items_notas.numero
        GROUP BY
            notas.data_venda;

END;




INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES
('0103', TO_DATE('2019-06-05','YYYY-MM-DD'), '3623344710', '235', 0.10);
INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
('0103', '1040107', 1000, 10);
INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
('0103', '1000889', 1000, 10);

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES
('0104', TO_DATE('2019-06-06','YYYY-MM-DD'), '3623344710', '235', 0.10);
INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
('0104', '1040107', 1000, 10);
INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES
('0104', '1000889', 1000, 10);


---------------------------------------------------------------------------------------------------------------------------------------------------------------- CONHECENDO AS TRIGGERS

[00:00] Temos um problema que precisamos resolver na trigger para deixar 100% funcionando. Vou criar um novo script. Vou pegar um item da nota 0104, porque houve um erro de digitação e a quantidade ficou menor. Vamos dar um update.
[02:35] Se eu rodar o relatório de faturamento, continuo com o valor antigo. A trigger tem que ser executada não somente durante o insert, mas também durante o update e o delete.
[04:06] Vou pegar o comando de criar a trigger e usar o create or replace trigger. Essa técnica vai criar uma trigger, se ela não existir, ou alterar a que eu tenho. Ao invés de só insert, vou adicionar um or update or delete. Ao fazer isso, aumento a execução da trigger.
[05:38] Se eu altero o item agora, no faturamento também é alterado. E se eu deletar ele é deletado. Agora sim resolvi meu problema de forma correta. Toda vez que eu incluir, alterar ou excluir dados da tabela de nota fiscal o relatório é calculado de forma correta.
[06:45] Antes de terminar, eu poderia ter executado ao invés de after before, mas não funcionaria, porque significa antes. Eu calcularia o faturamento antes de inserir, alterar ou excluir. Não faz sentido. O cálculo do faturamento tem que vir depois. Mas eu poderia ter uma situação em que uso o disparo da trigger antes da atualização da tabela. Também tenho o instead of, que significa ao invés de. Eu substituo a execução.

SELECT * FROM TAB_FATURAMENTO;

SELECT * FROM NOTAS;
SELECT * FROM ITEMS_NOTAS;

UPDATE ITEMS_NOTAS SET QUANTIDADE = 3000
WHERE NUMERO = '0104' AND CODIGO = '1000889';

DELETE FROM ITEMS_NOTAS
WHERE NUMERO = '0104' AND CODIGO = '1000889';

-- DROP TRIGGER TG_CALCULO_FATURAMENTO;

CREATE OR REPLACE TRIGGER tg_calculo_faturamento AFTER
    INSERT OR UPDATE OR DELETE ON items_notas
BEGIN
    DELETE FROM tab_faturamento;

    INSERT INTO tab_faturamento
        SELECT
            notas.data_venda,
            SUM(items_notas.quantidade * items_notas.preco) AS total_venda
        FROM
                 notas
            INNER JOIN items_notas ON notas.numero = items_notas.numero
        GROUP BY
            notas.data_venda;

END;


------------------------------------------------------------------------------------------------------------------------------------------------ OUTRAS FORMAS DE MANIPULAÇÃO DE DADOS

[00:00] Vimos neste treinamento como fazer inclusão, alteração ou exclusão de dados no nosso banco Oracle. Na prática, não vamos ficar fazendo modificações massivas de dados usando o Oracle SQL Developer. Iremos usar alguma ferramenta, alguma linguagem de programação.
[00:42] A Oracle contém uma linguagem de programação que costumamos chamar de criação de stored procedures. Não é um termo muito utilizado no Oracle, mas eu quis usar porque são programas desenvolvidos numa linguagem PL/SQL. Pode ser que haja treinamentos futuros sobre essa linguagem na plataforma da Alura.
[01:25] Outra coisa que vamos utilizar muito são as ferramentas de interação, algumas são gratuitas, outras pagas. Vou dar ênfase na Pentaho e na SQL Server Information Services. São duas ferramentas que possuem licenças livres. E temos na própria Alura dois cursos específicos delas, ETL com Integration Services e Modelos de ETL.
[02:47] Esses dois cursos não englobam Oracle. Usam outros bancos relacionais. No ETL com Integration Services usamos o SQL Server, enquanto no Modelos de ETL usamos o MYSQL. Porém, a forma como você vai usar nesses dois cursos é a mesma que no Oracle. Se vocês quiserem se aprofundar mais, sugiram que façam esses cursos, que fazem parte de uma carreira maior, chamada business intelligence.
[04:10] Outra forma de manipular os dados é através de programação. Você pode dentro do seu programa fazer uma conexão com Oracle e chamar os comandos insert, update ou delete. E aí cada linguagem de programação tem uma parte que mostra como falar no banco de dados.
[05:07] Eu sugiro como treinamento o VB.NET com Windows Forms parte 11, e nele temos um capítulo dando ênfase no Oracle. Apesar de ser um curso de VB.NET, a forma é muito semelhante como eu faria se estivesse usando C#, Java, e assim por diante.
[06:27] Queríamos dar esse ponto final no treinamento para mostrar a vocês que o SQL para manipular dados é importante porque vai ser instrumento para aplicações e ferramentas externas para fazer na prática a manipulação dos dados.


-------------------------------------------------------------------------------------------------------------------------------------------------------- CONSOLIDANDO SEU CONHECIMENTO

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.

1) O tipo auto-incremento cria uma sequência numérica de números inteiros em um campo. Para definir este campo, é preciso configurá-lo na criação da tabela. Logo, digite o comando abaixo e execute-o:

CREATE TABLE TAB_IDENTITY (
    ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    DESCRITOR VARCHAR(20),
    PRIMARY KEY (ID)
);COPIAR CÓDIGO
2) Para inserir um registro, não é necessário referenciar o campo auto-incremento no comando INSERT. Digite e execute:

INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 1');COPIAR CÓDIGO
3) Verifique o conteúdo da tabela. Digite e execute:

SELECT * FROM TAB_IDENTITY;COPIAR CÓDIGO


4) Agora, inclua mais dois registros:

INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 2');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 3');COPIAR CÓDIGO
5) Verifique o conteúdo da tabela. Digite e execute:

SELECT * FROM TAB_IDENTITY;COPIAR CÓDIGO


6) Ao apagar um registro, a sequência do contador não é interrompida. Digite e execute:

DELETE FROM TAB_IDENTITY WHERE ID = 2;
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 4');
SELECT * FROM TAB_IDENTITY;COPIAR CÓDIGO


7) Você pode definir padrões para os campos. Com isto, um campo pode ter um valor default caso não seja referenciado no comando INSERT. Digite e execute o comando abaixo. Assim, padrões serão criados para os campos CIDADE e DATA_CRIACAO:

CREATE TABLE TAB_PADRAO (
    ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    DESCRITOR VARCHAR(10) NOT NULL,
    ENDERECO VARCHAR(100) NULL,
    CIDADE VARCHAR(50) DEFAULT ON NULL 'Rio de Janeiro',
    DATA_CRIACAO DATE DEFAULT ON NULL SYSDATE,
    PRIMARY KEY (ID)
);COPIAR CÓDIGO
8) Agora, insira um registro e selecione todos:

INSERT INTO TAB_PADRAO (DESCRITOR, ENDERECO, CIDADE, DATA_CRIACAO) 
VALUES ('CLIENTE X','RUA PROJETADA A','SAO PAULO',TO_DATE('2019-01-01','YYYY-MM-DD'));

SELECT * FROM TAB_PADRAO;COPIAR CÓDIGO


Aqui, o comando INSERT funciona normalmente, porque todos os campos foram referenciados.

9) Repita o comando INSERT, mas agora usando somente os campos que não possuem padrões. Digite e execute:

INSERT INTO TAB_PADRAO(DESCRITOR) VALUES ('CLIENTE Y');

SELECT * FROM TAB_PADRAO;COPIAR CÓDIGO


Note que, para os campos que não foram referenciados no comando INSERT, os seus valores padrões foram incluídos na tabela.

10) Crie uma tabela auxiliar, que irá sempre ter o faturamento consolidado por data da venda. Execute o comando:

CREATE TABLE TAB_FATURAMENTO (
    DATA_VENDA DATE NULL, 
    TOTAL_VENDA FLOAT
);COPIAR CÓDIGO
11) Apague o conteúdo das tabelas ITEMS_NOTAS e NOTAS:

DELETE FROM ITEMS_NOTAS;
DELETE FROM NOTAS;COPIAR CÓDIGO
12) O objetivo é que, a cada inclusão de dados nas tabela NOTAS e ITENS_NOTAS, o valor de TAB_FATURAMENTO seja atualizado. Para isso, digite e execute:

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO) 
VALUES ('0100', TO_DATE('2019-06-05','YYYY-MM-DD'), '1471156710', '235', 0.10);

INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO) 
VALUES ('0100', '1040107', 1000, 10);

INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO) 
VALUES ('0100', '1000889', 1000, 10);

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO) 
VALUES ('0101', TO_DATE('2019-06-05','YYYY-MM-DD'), '3623344710', '235', 0.10);

INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO) 
VALUES ('0101', '1040107', 1000, 10);

INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO) 
VALUES ('0101', '1000889', 1000, 10);COPIAR CÓDIGO
13) Para atualizar a tabela TAB_FATURAMENTO, você tem que executar o comando abaixo:

INSERT INTO TAB_FATURAMENTO
SELECT NOTAS.DATA_VENDA, SUM(ITEMS_NOTAS.QUANTIDADE * ITEMS_NOTAS.PRECO) AS TOTAL_VENDA
FROM NOTAS INNER JOIN ITEMS_NOTAS
ON NOTAS.NUMERO = ITEMS_NOTAS.NUMERO
GROUP BY NOTAS.DATA_VENDA;

SELECT * FROM TAB_FATURAMENTO;COPIAR CÓDIGO


14) Para manter a tabela TAB_FATURAMENTO atualizada, você tem que repetir o cálculo atual do valor total das vendas sempre que novos registros forem incluídos. Para isso, digite e execute:

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO) 
VALUES ('0102', TO_DATE('2019-06-05','YYYY-MM-DD'), '3623344710', '235', 0.10);

INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO) 
VALUES ('0102', '1040107', 1000, 10);

INSERT INTO ITEMS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO) 
VALUES ('0102', '1000889', 1000, 10);

DELETE FROM TAB_FATURAMENTO;

INSERT INTO TAB_FATURAMENTO
SELECT NOTAS.DATA_VENDA, SUM(ITEMS_NOTAS.QUANTIDADE * ITEMS_NOTAS.PRECO) AS TOTAL_VENDA
FROM NOTAS INNER JOIN ITEMS_NOTAS
ON NOTAS.NUMERO = ITEMS_NOTAS.NUMERO
GROUP BY NOTAS.DATA_VENDA;

SELECT * FROM TAB_FATURAMENTO;COPIAR CÓDIGO


15) Você pode criar uma TRIGGER, para que a tabela TAB_FATURAMENTO seja recalculada sempre que um novo registro for incluído na tabela de ITENS_NOTAS. Para isso, digite e execute:

CREATE TRIGGER TG_CALCULO_FATURAMENTO
AFTER INSERT ON ITEMS_NOTAS
BEGIN
    DELETE FROM TAB_FATURAMENTO;
    INSERT INTO TAB_FATURAMENTO
        SELECT NOTAS.DATA_VENDA, SUM(ITEMS_NOTAS.QUANTIDADE * ITEMS_NOTAS.PRECO) AS TOTAL_VENDA
        FROM NOTAS INNER JOIN ITEMS_NOTAS
        ON NOTAS.NUMERO = ITEMS_NOTAS.NUMERO
        GROUP BY NOTAS.DATA_VENDA;
END;COPIAR CÓDIGO
16) Ao inserir novos registros, não é mais preciso executar o cálculo da tabela consolidada. Para isso, digite e execute:

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
VALUES ('0106', '2019-05-08', '1471156710' , '235', 0.10);

INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES ('0106', '1000889', 100, 10);

INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
VALUES ('0106', '1002334', 100, 10);

SELECT * FROM TAB_FATURAMENTO;COPIAR CÓDIGO


17) Você criou uma TRIGGER somente para a inclusão de registros na tabela. Agora, crie uma TRIGGER para a atualização e uma para a exclusão. Para isso, digite e execute:

CREATE OR REPLACE TRIGGER TG_CALCULO_FATURAMENTO
AFTER INSERT OR UPDATE OR DELETE ON ITEMS_NOTAS
BEGIN
    DELETE FROM TAB_FATURAMENTO;
    INSERT INTO TAB_FATURAMENTO
        SELECT NOTAS.DATA_VENDA, SUM(ITEMS_NOTAS.QUANTIDADE * ITEMS_NOTAS.PRECO) AS TOTAL_VENDA
        FROM NOTAS INNER JOIN ITEMS_NOTAS
        ON NOTAS.NUMERO = ITEMS_NOTAS.NUMERO
        GROUP BY NOTAS.DATA_VENDA;
END;

Nesta aula, aprendemos:

Como funciona campos de auto-incremento
A determinar valores padrões para os campos
Como trabalhar com TRIGGER para executar comandos no momento da inclusão, alteração e exclusão de registros


[00:00] Parabéns. Terminamos mais um treinamento dentro da carreira Oracle. Vamos fazer uma revisão do que vimos neste treinamento. Iniciamos fazendo instalação de produtos, porque nem sempre o aluno tem o Oracle na máquina. Recuperamos o ambiente, carregamos dados usados durante o treinamento. Fizemos três vídeos teóricos revisando as entidades que compõem o banco Oracle. Falamos sobre tipos de dados, modelagem.
[01:26] Passamos para a ênfase em criar o banco de dados baseado na modelagem que vimos na aula 1, com chaves primárias, chaves estrangeiras. Criamos tabelas com SQL ou assistentes do SQL Developer. Vimos como deletar tabelas, como ver visualmente o diagrama.
[02:21] Depois passamos a falar sobre incluir dados no banco. E quem inclui deve saber alterar e excluir também. Foi o tema da aula 4. Aprendemos a fazer isso usando filtros, vimos o que significa COMMIT e ROLLBACK, para confirmar ou desfazer modificações.
[03:50] Na aula 5 demos ênfase a assuntos diversos. Falamos sobre campos de auto incremento, que cria um sequencial, vimos como definir padrões dentro dos campos, criamos triggers, que são estruturas que disparam comandos quando algo é feito. Falamos sobre a prática.
[05:00] Espero que vocês tenham gostado, que tenha atendido as expectativas, e nos vemos em outros cursos.