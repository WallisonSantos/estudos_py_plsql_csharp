------------------------------------------------------------------------------------------------------------------------------------------------------------------------ TIPOS DE DADOS

[00:00] Uma coluna ou campo de uma tabela só pode ter o mesmo tipo de dado. Quando projetamos, temos que saber de antemão que tipos de dados temos para serem usados. O Oracle oferece uma gama. Vou falar de dois tipos.
[00:43] Vamos começar com texto. Um número pode ser texto, mas então não tem conceito de quantidade. O primeiro tipo é o char. É um caractere de tamanho fixo. Se eu defino que ele vai ter dez posições, todos os caracteres que entrarem naquela coluna vão ter obrigatoriamente dez posições. Se eu colocar a letra a ali, vou escrever a e nove espaços em branco.
[01:42] O tamanho máximo do char são dois mil caracteres. Se eu tentar colocar um texto com mais caracteres que a coluna permite vai dar erro.
[02:12] O varchar2 e o varchar já são caracteres de tamanho variável, que podem ter de uma a quatro mil posições. O tamanho variável só vou preencher campos com aquilo que eu estiver colocando dentro do dado. Se crio um varchar de 10 e coloco uma letra a, ele só vai preencher o a.
[03:10] Existe uma diferença entre eles. No fundo, são a mesma coisa. Para garantir compatibilidade, vamos sempre usar o varchar de dois.
[03:35] Temos o nchar e o nvarchar2. O n significa que aquele caractere vai usar o padrão que chamamos de caracteres Unicode, globais, que envolvem todos que existem no mundo. Eles pegam coisas baseadas na língua inglesa, normalmente.
[04:30] Se eu declarar tudo como nvarchar2, por exemplo, eu sei que eu vou comportar naquele texto, qualquer caractere. E sei que vou usar o espaço útil do campo.
[04:43] O clob e o nlob são campos que correspondem ao varchar2 ou nvarchar2, mas que suportam cada um até 8 terabytes de dados. São caracteres muito grandes que eu posso armazenar dentro de um campo clob ou nlob.
[05:30] Existe um tipo chamado long, mas que não deve ser usado mais.
[06:12] O number pode armazenar ou tamanho fixo ou ponto flutuante, que é quando não específico o tamanho. Vai ter números bem grandes. Ele também aceita o zero.
[07:45] Temos aí alguns exemplos. Se eu tenho um número e específico que ele tem uma casa decimal, tenho um número guardado. Se eu não especificar, vou ter um número inteiro. São exemplos do que podemos fazer.
[09:16] Temos o campo date, que armazena as datas julianas, do nosso calendário ocidental. Internamente, quando exibimos uma data, o Oracle sempre vai mostrar a data no formato dia, mês e ano com dois dígitos. Vamos ver mais à frente que se eu não falar nada ele fornece a data assim, mas posso ter funções que fazem com que eu veja a data de forma diferente.
[11:00] Uma curiosidade histórica. Quando o calendário juliano foi criado, por algum motivo ele pula seis dias, entre 4 de outubro de 1582 a 10 de outubro de 1582. Esses dias não existem. O Oracle também consegue fazer esse salto. Se eu quiser calcular número de dias entre 1300 e hoje, esses seis dias vão ser pulados, porque eles não existiram.
[12:20] Temos alguns outros campos, que são campos de data, timestamp. Ele leva em consideração fuso-horário. Se eu tenho um campo date, não tenho fuso-horário, e termino em segundos. O timestamp aceita milissegundos, mas não fuso-horário. O timestamp com time zone precisa ter explicitado o fuso-horário. O time stamp com local time zone usa o fuso-horário relativo, particularidades de cada país.
[13:34] Por que é importante saber isso? Se eu tiver um banco de dados que coordena atividades exercidas em países diferentes, posso ter problemas. Por exemplo, um sistema de agendamento de reunião. Se eu não usar o time zone, vai dar confusão.
[14:55] Campos Blob e Bfile são campos especiais para guardar binários. Eu guardo bits, não caracteres. Consigo armazenar até 128 terabytes, e posso pegar um arquivo zip e gravar o binário desse arquivo dentro do banco de dados. Claro que tem chances de dar problema, por isso também tenho o Bfile, para armazenar link lógico que está armazenado no sistema operacional. Tenho lá uma referência a localização externa ao HD onde o arquivo está salvo.
[16:15] Esses são os tipos de campos. Quando crio uma tabela, a primeira coisa é saber os tipos de campo à disposição e identificar o tipo correto.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------- PRIMEIRA TABELA

[00:00] Vamos continuar estudando. Eu já conheço os tipos de dados que o Oracle oferece. Como analista de sistemas, preciso conhecer o negócio do cliente para de certa maneira projetar quais são as tabelas que meu cliente tem que ter para armazenar as informações que ele deseja. Vamos começar simples, criando um cadastro de clientes. A primeira coisa que eu fiz foi conversar com o usuário de negócios quais informações são importantes para guardar no banco de dados em relação aos clientes. Ele me relatou uma série de coisas.
[00:52] Olhando nesse slide, posso mostrar para vocês a informação que o cliente me passou a respeito do que ele quer que seja armazenado no banco de dados. Basicamente, CPF do cliente, nome completo, endereço completo, data de nascimento, idade, sexo, o limite de crédito em dinheiro de quanto aquele cliente pode comprar em produtos. Além disso, ele também quer que eu guarde o volume mínimo de sucos que ele pode comprar. E também se o cliente já realizou a primeira compra.
[03:26] A primeira coisa que vou fazer é analisar cada informação e identificar o melhor tipo que identifique o dado que vai ficar em cada campo. Talvez vocês encontrem situações em que o mesmo campo pode ser representado por vários tipos diferentes. Vai depender de cada caso.
[04:55] No meu Oracle, vou digitar o comando para criar uma tabela. Para isso, uso o comando create table. À medida em que digito, o próprio SQL vai me dando algumas dicas de comandos parecidos para completar automaticamente. Depois, vou colocar o nome da tabela, que pode ser qualquer coisa. É importante para que você possa identificar facilmente o que é cada coisa. Não é uma regra, mas é comum. Dependendo da empresa em que você trabalha, pode existir um tipo de padronização no nome da tabela, para facilitar.
[08:34] A minha vai ser TB_CLIENTES. Mas a tabela assim ainda não está pronta. Preciso dar mais informação ao Oracle. A tabela é como se fosse uma planilha do Excel com colunas. Cada coluna tem uma restrição que todas tem que ser do mesmo tipo, e claro, possuem nomes. Eu vou abrir parênteses e vou dar nome para cada coluna, além de dizer qual o tipo dessa coluna.
[09:41] A primeiro informação que preciso é CPF. Vou dizer o tipo do campo. Pode ser números, mas não é certo, porque tem muito CPF que começa com zero. Tem o varchar, um caractere de tamanho variável. Vou especificar quantos dígitos no máximo o CPF deve ter. Coloco a vírgula, dou enter, e continuo.
[10:54] O próximo campo da minha tabela é nome. Vai ser varchar. Posso colocar um nome grande. Se eu colocar um de cem, acho que já cobre. Também preciso do endereço completo. Normalmente, é legal separar o endereço em campos diferentes, para conseguir fazer estatísticas depois, como quantos clientes tenho no Rio de Janeiro, por exemplo. Vou colocar então endereço 1, com varchar de 150, e um endereço 2 com varchar de 150.
[12:11] Criei dois campos de endereço porque às vezes 150 não é suficiente. Nesse caso, endereço é rua e número, porque vou criar um campo separado para bairro, cidade, estado, CEP. Agora, a idade pode ser um inteiro, um number. Vou dizer que ele é um int. No caso do sexo, vou colocar um varchar de um, se é M de masculino ou F de feminino. O limite de crédito vai ser float, porque pode ter casas decimais. Também preciso do volume mínimo, que vai ser float. E por fim se ele efetuou ou não a primeira compra, number de um. Ela é um verdadeiro ou falso. Posso representar isso com zero e um. Zero para falso e um para verdadeiro. Coloquei como number de um justamente para mostrar que posso ter ambos no valor desse campo.
[16:38] Fecho os parênteses porque terminei de listar os campos da tabela. Posso executar o comando. A tabela foi criada. Sem erro.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------- TABELA VENDEDORES

O nosso sistema de vendas tem mais uma tabela a ser criada, a de vendedores. Algumas informações:
O nome da tabela deve ser TABELA_DE_VENDEDORES
O vendedor tem como chave primário o número interno da matrícula (nome do campo: MATRICULA), que deve ser uma string de 5 posições
O nome do vendedor (nome do campo: NOME) deve ser uma string de 100 posições
O percentual de comissão (nome do campo: PERCENTUAL_COMISSAO), representa o percentual de comissão que o vendedor ganha sobre cada venda.
Crie esta tabela no seu banco de dados.

CREATE TABLE TABELA_DE_VENDEDORES (
     MATRICULA           varchar(5),
     NOME                varchar(100),
     PERCENTUAL_COMISSAO float
);
ALTER TABLE TABELA_DE_VENDEDORES ADD CONSTRAINT PK_TABELA_DE_VENDEDORES PRIMARY KEY (MATRICULA);

------------------------------------------------------------------------------------------------------------------------------------------------------ TABELA TB_PRODUTOS e TB_CLIENTES

CREATE TABLE TB_PRODUTOS (
    PRODUTO     number(20,0),
    NOME        varchar2(150),
    EMBALAGEM   varchar2(50),
    TAMANHO     varchar2(50),
    SABOR       varchar2(50),
    PRECO_LISTA float
);

CREATE TABLE TB_CLIENTES (
    CPF        varchar2(11),
    NOME       varchar2(100),
    ENDERECO1  varchar2(150),
    ENDERECO2  varchar2(150),
    BAIRRO     varchar2(50),
    CIDADE     varchar2(50),
    ESTADO     varchar2(2),
    CEP        varchar2(11),
    NASC.      date,
    SEXO       varchar2(1)
    LIMITE     float,
    VOL_COMPRA float,
    PRI_COMPRA number
);

------------------------------------------------------------------------------------------------------------------------------------------------------------- DROP TABLE, APAGAR TABELA

[00:00] Se aprendemos a criar a tabela, também podemos aprender a apagar. É um processo que tem que ser feito com muito cuidado, porque ao apagar você perde tudo. No nosso caso aqui, a tabela de produtos e de clientes não tem relacionamento, mas quando tenho um banco de dados com várias tabelas e relacionamentos, apagar uma tabela só vai ser possível com algumas condições.
[01:28] Vamos apagar uma tabela. Para simular essa situação, vou criar uma cópia da tabela. Para não perdermos. Agora vamos apagar. A primeira maneira vai ser com comando SQL. Clico lá em cima, coloco o comando drop table e o nome da tabela. Executei e pronto. Continuo vendo a tabela porque por comando SQL não atualiza automaticamente a árvore do lado. Preciso atualizar. E pronto.
[04:28] A outra forma é clicar sobre a tabela, clico com o botão direito, eliminar. Ele vai me perguntar se quero mesmo deletar a tabela. E pronto. É isso.

CREATE TABLE TABELA_DE_VENDEDORES2 (
     MATRICULA           varchar(5),
     NOME                varchar(100),
     PERCENTUAL_COMISSAO float
);

Após criar a tabela, conforme enunciado, para apagá-la o comando será:
DROP TABLE TABELA_DE_VENDEDORES2;

---------------------------------------------------------------------------------------------------------------------------------------------------------- INSERINDO REGISTRO NA TABELA

[00:00] Temos a tabela de clientes e de produtos. Precisamos incluir dados nelas. Baixem o arquivo associado a este vídeo. Vocês vão ver uma lista de produtos, com o código deles, a embalagem e o preço. No nome, já tenho também tamanho e sabor. Vamos usar planilha para inserir dados na tabela de produtos.
[02:25] O comando para incluir uma linha é o insert into, coloco o nome da tabela. Abro parênteses e especifico a lista de campos que vou usar. Ao fazer isso, o próprio SQL developer me mostra uma lista. Depois, vou colocar os valores de cada campo na mesma ordem em que declarei os campos. É pela ordem que o Oracle vai saber onde ele deve inserir a informação.
[04:57] Se o tipo de campo é um var char, preciso colocar entre aspas simples. Quando representamos com números dentro do Oracle, precisamos usar o ponto, não a vírgula, porque é o separador usado no inglês.
[08:26] Se eu quiser ver o conteúdo da tabela, uso select * from nome da tabela. Ele me traz as informações que eu coloquei. Conseguimos fazer nossa primeira inclusão de registros.

INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES ('00233', 'João Geraldo da Fonseca', 0.10);
INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES ('00235', 'Márcio Almeida Silva', 0.08);
INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO) VALUES ('00236', 'Cláudia Morais', 0.08);

INSERT INTO TB_PRODUTOS (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES (544931, 'Frescor do Verão - 350 ml - Limão', 'PET', '350 ml', 'Limão', 3.20);
INSERT INTO TB_PRODUTOS (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES (1078680, 'Frescor do Verão - 470 ml - Manga', 'Lata', '470 ml', 'Manga', 5.18);
INSERT INTO TB_PRODUTOS (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES (1040107, 'Light - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.56);
INSERT INTO TB_PRODUTOS (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES (1037797, 'Clean - 2 Litros - Laranja', 'PET', '2 litros', 'Laranja', 16.01);
INSERT INTO TB_PRODUTOS (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) VALUES (1000889, 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.31);

------------------------------------------------------------------------------------------------------------------------------------------------------------------- ALTERANDO REGISTROS

[00:00] Vamos aprender a alterar uma informação que está no banco de dados. A ação de alterar dados é muito importante, porque o cadastro está sempre mudando. Para fazer isso, vou baixar o link associado a este vídeo. Ele tem dois comandos insert, que são comandos que aprendemos no vídeo anterior. Vou copiar e colar.
[01:50] Note que esse insert que coloquei vai ter um embalagem PET, mas na planilha padrão ele é lata. Preciso alterar. Também o preço de lista está diferente. Tem duas informações que vão precisar mudar.
[04:07] O comando de alteração é o update, nome da tabela, set e os novos valores para os campos que quero alterar. Preciso dizer, por exemplo, que a embalagem é igual a lata, que é o novo valor. Também vamos mexer no preço.
[05:50] Se eu rodar o comando como está, vai funcionar. Mas como ele vai saber que tenho que alterar somente nessa linha? O que identifica o produto é o código. Preciso fazer essa alteração no produto. Coloco para isso o where produto igual ao código dele. Quando coloco o where é como se eu estivesse filtrando todas as linhas da tabela e dizendo que é só naquela que vou fazer a alteração.
[08:35] Tenho os dois comandos para fazer alterações. Vou selecionar e executar, e os dados foram alterados. O objetivo deste vídeo foi incluir registros na tabela, colocar dados errados, e depois alterar.

UPDATE
    TB_PRODUTOS
SET
    EMBALAGEM     = 'PET'
    , NOME        = 'Light - 350 ml - Uva'
    , SABOR       = 'Uva'
    , PRECO_LISTA = 2.46
WHERE
    PRODUTO       = 1040107
;

UPDATE TB_PRODUTOS          SET EMBALAGEM = 'Lata', PRECO_LISTA = 2.46  WHERE PRODUTO = 544931;
UPDATE TB_PRODUTOS          SET EMBALAGEM = 'Garrafa'                   WHERE PRODUTO = 1078680;
UPDATE TABELA_DE_VENDEDORES SET PERCENTUAL_COMISSAO = 0.11              WHERE MATRICULA = '00236';
UPDATE TABELA_DE_VENDEDORES SET NOME = 'José Geraldo da Fonseca Junior' WHERE MATRICULA = '00233';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- EXCLUINDO REGISTROS




[00:00] Já aprendemos a incluir, alterar, precisamos aprender a apagar. O cliente às vezes vai precisar fazer isso. Quero apagar o produto 1078680. Vamos fazer isso. O comando é delete from nome da tabela. Se eu rodar assim, não vai dar erro, mas ele vai apagar absolutamente tudo. Não posso fazer isso. Só quero apagar um produto.
[01:50] Precisamos adicionar o where, que vai especificar o que eu quero. Igual como fizemos no update. Sendo assim, posso até copiar a linha de lá.
[03:35] Aprendemos a incluir dados, alterar e a deletar.

DELETE FROM TB_PRODUTOS, apagaria todos os dados da tabela,

DELETE FROM TB_PRODUTOS WHERE PRODUTO = 1078680;

José Geraldo da Fonseca (00233) foi demitido. Então, retire-o da tabela de vendedores. Um exemplo de SQL que atende o que foi proposto no enunciado é:

DELETE FROM TABELA_DE_VENDEDORES WHERE MATRICULA = '00233';

-------------------------------------------------------------------------------------------------------------------------------------------------------------- INCLUINDO CHAVE PRIMARIA

[00:00] Quando eu defini para vocês os componentes do banco de dados, eu falei de uma entidade chamada chave primária. São campos que não podem se repetir. Se notarem, temos na nossa tabela um código de identificação do produto. Esse código não pode se repetir. Mas como eu criei a tabela sem especificar quem é chave primária, o Oracle vai deixar criar números repetidos. Vamos fazer um teste.
[02:24] Só que eu não posso ter duas linhas com o mesmo código. Vamos resolver isso com a chave primária. Para isso, preciso alterar as propriedades da tabela. O comando chama-se alter table, depois o nome da tabela. Essas chaves em inglês se chamam constraints. Depois, vou colocar o nome dessa constraint. Normalmente colocamos pk e o nome da tabela. Mas ainda preciso dizer o tipo da constraint, que vai ser uma primary key.
[05:20] Depois disso, preciso colocar um parâmetro. O parâmetro do primary key é a coluna que será chave primária. No caso, não quero que a coluna produto se repita.
[06:07] Foi alterado. Vamos incluir o produto novamente. Se eu tentar adicionar outro produto com o mesmo código, ele me dá erro. Ele não me deixa incluir uma nova linha, porque o código do produto já existe na tabela.
[07:24] Todo erro Oracle começa com ORA e um número. Você pode pesquisar no Google para ver muitas informações sobre o erro e até soluções. Só uma observação sobre isso.

Começa com o Alter Table *nome da tabela, seguido do *apelido, por padrão se usa o PK mais o nome da tabela, depois precisa colocar o parametro, a(s) coluna(s)
que não queremos que tenham repetições.

ALTER TABLE
    TB_PRODUTOS
ADD CONSTRAINT
    PK_TB_PRODUTOS
PRIMARY KEY
    (PRODUTO)
;

ALTER TABLE
    TABELA_DE_VENDEDORES
ADD CONSTRAINT
    PK_TABELA_DE_VENDEDORES
PRIMARY KEY
    (MATRICULA)
;
    
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- MANIPULANDO DATAS E CAMPOS LÓGICOS

[00:00] Vamos manipular dois tipos de campos que não usamos ainda, o do tipo data e do tipo lógico. Do tipo lógico, criamos o primeira compra. Ele vai ter zero para verdadeiro e um para falso. Notem que não tenho nenhum campo do tipo data, apesar de na especificação o usuário ter pedido data de nascimento. De maneira proposital eu não tinha colocado, porque vou mostrar como criar uma nova coluna numa tabela que já existe.
[01:08] Primeiro, vamos adicionar uma chave primária, porque não posso ter dois CPFs iguais, vamos adicionar uma coluna do tipo data, e vamos inserir o formato data e o campo lógico.
[01:57] Vamos começar criando a chave primária, usando alter table, o nome da tabela, add constraint, o nome da constraint, o tipo, e entre parênteses a coluna CPF. Temos o comando da chave primária. Agora vamos incluir uma coluna nova. O comando também é o alter table, porque eu vou alterar a tabela. Mas ao adicionar uma coluna preciso especificar o que quero criar. Assim coloco o add mais o nome da coluna e o tipo.
[03:57] Agora tenho a data de nascimento e a primeira compra. Temos uma propriedade chamada nullable, que significa se aquele campo aceita ou não nulos. Isso vou comentar com mais detalhes em cursos mais especializados. Só o CPF não aceita nulo, porque ele é chave primária. Tenho outra aba chamada constraints. Ele me diz que tenho uma constraint do tipo primary key.
[05:22] Agora vou incluir um cliente. Uso o comando insert, a tabela e os campos. Então, colocamos o conteúdo de cada campo. Quando quero deixar um campo em branco, escrevo null. Assim digo que o conteúdo é nulo. Nulo e preenchido com vazio são coisas diferentes. Nulo é a ausência de dados. Quando chego no campo primeira compra, preenchido com zero ou um.
[11:00] Não sei se vocês sabem, mas no Brasil representamos a data por dia, mês e ano. Só que na língua inglesa é mês, dia, ano. A data que eu coloquei é uma data dia mês ou mês dia? Vou usar um comando para mostrar o mês da data. Ele me mostra 10, então está representado como dia, mês e ano.
[13:22] Funcionou porque meu Windows está em português. É tudo compatível com a linguagem. Mas acontece muito de estarmos trabalhando com um servidor de outro país. Para garantir que estamos colocando a data correta, podemos escrever to date, a data que eu queria, depois DD/MM/YYYY. Isso significa dizer ao Oracle a ordem da data. Eu garanto independente da linguagem que a data que eu coloquei é dia, mês e ano.
[17:04] Se eu escrever MM/DD/YYYY, ele inverte. O mês vai vir primeiro. É uma data americana. Com a declaração explícita de quem é quem consigo trabalhar com datas sem me preocupar com o que o sistema operacional vai retornar.

CREATE TABLE tb_vendas (
    cpf_cnpj    NUMBER(20, 0),
    nome        VARCHAR2(100),
    comissao    FLOAT,
    vlr_vendas  FLOAT,
    dt_venda date,
    nf_venda number (10, 0)
);
ALTER TABLE tb_vendas ADD CONSTRAINT pk_tb_vendas PRIMARY KEY ( cpf_cnpj );
ALTER TABLE tb_vendas ADD dt_venda DATE;

INSERT INTO 
    tb_vendas (cpf_cnpj, nome, comissao, vlr_vendas, dt_venda, nf_venda) 
VALUES (28682903821, 'MARIA ASSIS', 10.80, 10000.80, TO_DATE('12-03-2021', 'DD/MM/YYYY'), 323332);

SELECT
    to_char(dt_venda, 'MM') AS mês
FROM
    tb_vendas;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- INCLUINDO DADOS NA TABELA

[00:00] Aprendemos até agora a manipular dados na tabela. Vamos aprender a consultar. Fizemos algumas consultas durante os últimos vídeos, principalmente com o select from. Os comandos de consulta são bem complexos, e não vai ser o objetivo deste curso ver isso à fundo. Vamos aprender a como ler coisas das tabelas.
[00:44] Vou rodar um script salvo no link associado a este vídeo onde vou incluir uma série de registros na tabela de produtos e de clientes para podermos fazer algumas consultas. Baixando o link que está associado a esse vídeo, você vai ter o arquivo SQL 10. Vou abrir com o editor de texto. Todos os comandos que estão aqui a gente já conhece.
[02:17] Vou selecionar e copiar todo o script desse arquivo. No SQL developer, vou colar. Tenho todos os comandos. Executo. Tenho agora as tabelas de clientes e de produtos com todos os dados para podermos aprender a fazer consultas.
[03:03] Vou criar um outro script e vamos começar com o select * from clientes. O asterisco significa que estou escolhendo todos os campos. Com o select digo os campos que quero olhar. O from e depois o nome da tabela.
[04:00] Eu poderia especificar os campos que quero ver. Ao invés de colocar asterisco, vou usar o select CPF, nome, endereço1, endereço2, bairro, cidade, Estado, CEP, idade, sexo, limite crédito, volume compra, primeira compra, data nascimento, from clientes. Ao invés de usar o asterisco, especifiquei o que quero ver. O resultado é o mesmo.
[05:10] Eu poderia ter colocado para ver só o nome, a idade e a data de nascimento. A ordem em que vejo esses campos também pode ser mudada. Para buscar, coloco as e o nome do cliente, ou CPF do cliente. Quando eu rodar, o que vou ver no nome da coluna é o que coloquei no as. Por padrão, vou ver o nome do campo, mas nesse caso vejo o as. É como se fosse um label, um novo nome.
[07:07] O select permite que possamos fazer seleções só dos campos que eu quero. Posso dar nomes diferentes para os campos. Sempre é select, o campo que eu quero ver, from, o nome da tabela. No lugar dos campos, se eu colocar o asterisco, vou ver todos na ordem em que eles foram criados.

INSERT INTO tb_vendas (cpf_cnpj, nome, comissao, vlr_vendas, dt_venda, nf_venda) VALUES (28682903821, 'MARIA ASSIS', 10.80, 10900, TO_DATE('01-02-2021', 'DD/MM/YYYY'), 24233);
INSERT INTO tb_vendas (cpf_cnpj, nome, comissao, vlr_vendas, dt_venda, nf_venda) VALUES (14144536677, 'JOAO SANTOS', 4.90, 11800, TO_DATE('15-08-2021', 'DD/MM/YYYY'), 323244);
INSERT INTO tb_vendas (cpf_cnpj, nome, comissao, vlr_vendas, dt_venda, nf_venda) VALUES (09000288844, 'LUCAS SOUZA', 11.20, 22000, TO_DATE('13-04-2021', 'DD/MM/YYYY'), 65755);
INSERT INTO tb_vendas (cpf_cnpj, nome, comissao, vlr_vendas, dt_venda, nf_venda) VALUES (00098221331, 'MANUELA SA', 09.90, 9000, TO_DATE('09-02-2021', 'DD/MM/YYYY'), 888908);
INSERT INTO tb_vendas (cpf_cnpj, nome, comissao, vlr_vendas, dt_venda, nf_venda) VALUES (28389001292, 'VANESSA SILVA', 5.30, 30000, TO_DATE('01-03-2021', 'DD/MM/YYYY'), 98112);
INSERT INTO tb_vendas (cpf_cnpj, nome, comissao, vlr_vendas, dt_venda, nf_venda) VALUES (09009839119, 'LUAN BATISTA', 2.90, 2000, TO_DATE('01-06-2021', 'DD/MM/YYYY'), 535366);

SELECT
    comissao,
    vlr_vendas
FROM
    tb_vendas;

SELECT
    cpf_cnpj  AS cpf_do_cliente,
    nome      AS nome_do_cliente,
    dt_venda  AS vendido
FROM
    tb_vendas;

Monte uma consulta SQL que somente seleciona o nome e a matrícula dos vendedores. Um exemplo de SQL que atende o que foi proposto no enunciado é:
SELECT
    nome,
    matricula
FROM
    tabela_de_vendedores;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- FILTRANDO REGISTROS

[00:00] Vocês se recordam que quando fizemos o update e o delete eu tive que colocar no where uma condição para poder somente fazer alterações em um determinado produto ou cliente? O where seria o que chamamos de filtro. Também posso aplicar esse filtro no select, para poder segregar o que quero ver da seleção.
[00:58] Vou usar o select from produtos. Eu vejo todos os produtos. Se eu adicionar um where produto igual a 1037797, por exemplo, ele só vai mostrar o cara que eu selecionei. Ele vai segregar a informação. Porque nem sempre quero ver toda a tabela.
[02:00] Só que eu usei o produto, que é chave primária, para fazer a seleção. Eu não precisava. Eu poderia ter escrito uma cidade, como Rio de Janeiro. Estaria selecionando todos os clientes que estão na cidade do Rio de Janeiro. Posso selecionar o sabor laranja.
[04:05] Vou colocar agora a condição cítricos. Seleciono todo mundo do sabor limão, mas quero alterar para cítricos. Poderíamos usar o update produtos set sabor igual a cítricos where produto igual a 108826. E assim por diante, produto a produto. Mas não preciso. Eu posso fazer seleções. Por exemplo, where sabor igual a limão. Tudo que for limão mudo para cítricos. Com um comando ele altera quatro produtos.
[06:45] Esse filtro where aplicado ao update, select, delete, também funcionaria. Não tem sentido usar com o insert, mas no resto é fundamental.

SELECT * FROM TB_CLIENTES WHERE CIDADE  = 'Rio de Janeiro';
SELECT * FROM TB_PRODUTOS WHERE PRODUTO = '1037797';
SELECT * FROM TB_PRODUTOS WHERE SABOR   = 'Laranja';
SELECT * FROM TB_PRODUTOS WHERE SABOR   = 'Limao';

UPDATE TB_PRODUTOS SET SABOR = 'Citricos' WHERE PRODUTO = '1088126'; -- MODO MAIS DEMORADO
UPDATE TB_PRODUTOS SET SABOR = 'Citricos' WHERE SABOR   = 'Limao'; ---- MODO MAIS EFICIENTE

Monte uma consulta SQL para verificar os dados cadastrais da vendedora Cláudia Morais. Um exemplo de SQL que atende o que foi proposto no enunciado é:
SELECT * FROM TABELA_DE_VENDEDORES WHERE NOME = 'Cláudia Morais';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- FILTROS CONDICIONAIS

[00:00] Os comandos de filtro do SQL, que são aplicados tanto no select quanto no update e delete, são muito mais complexos. Podemos trabalhar e criar filtros extremante complexos para buscar dados do banco de dados conforme a condição que eu queira.
[00:30] Vou criar um novo script e fazer alguns exemplos. Vou selecionar os clientes. Posso selecionar clientes cuja idade seja 22 anos. Digamos que eu queira ver clientes que tenham mais de 22 anos. Ao invés do igual, uso o comando de maior. Também posso ver quem é menor do que 22 anos. Eu poderia incluir na minha condição um menor e igual. Vou ver os que tem 22 e os que tem menos de 22 anos.
[02:45] Eu também poderia fazer isso para pegar os diferentes de 22 anos, porque usei o símbolo de diferente. O maior ou menor pode ser aplicado sobre strings. Se eu colocar, por exemplo, maior ou igual que Fernando Cavalcante, ele me traz os nomes que começam com uma letra depois do F.
[04:50] Veio uma Érica. Temos que lembrar que o “É” é diferente. Internamente existe uma tabela chamada ask, em que cada letra tem um número associado. Ele vai pegar todo mundo que tem esse número asc maior do que 46, no caso do F. Uma tabela com acentos tem o É como 201, que é maior do que o F. Por isso para o Oracle É é maior do que F.
[08:50] Isso também se aplica a maior e menor. Também pode ser aplicado a números decimais.
[10:03] É isso que eu queria mostrar sobre condições de maior ou menor aplicadas a filtros do select.

SELECT * FROM TB_CLIENTES WHERE IDADE =  22;
SELECT * FROM TB_CLIENTES WHERE IDADE >  22;
SELECT * FROM TB_CLIENTES WHERE IDADE <  22;
SELECT * FROM TB_CLIENTES WHERE IDADE <= 22;
SELECT * FROM TB_CLIENTES WHERE IDADE <> 22;
SELECT * FROM tb_clientes WHERE NOME  >= 'Fernando Cavalcante';
SELECT * FROM tb_clientes WHERE NOME  <> 'Fernando Cavalcante';
SELECT * FROM tb_produtos WHERE preco_lista >= 16.008;
SELECT * FROM tb_produtos WHERE preco_lista =  16.008;
SELECT * FROM tb_produtos WHERE preco_lista <> 16.008;

Monte uma consulta SQL para ver quais são os vendedores que possuem comissão maior que 10%. Um exemplo de SQL que atende o que foi proposto no enunciado é:
SELECT * FROM TABELA_DE_VENDEDORES WHERE PERCENTUAL_COMISSAO > 0.10;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- FILTRAR DATAS

[00:00] Uma outra coisa que se faz muito é filtrar por datas. Posso pegar uma data específica do ano e saber quem nasceu naquele dia, para fazer campanhas de marketing.
[00:20] Vou novamente fazer um select na tabela de clientes. Vou pegar uma data de nascimento, só que posso aplicar da mesma maneira um to date, a data que eu quero, e depois DD/MM/YYYY, para não dar problema. Deixo explícito o formato em que estou colocando. Apesar de precisar escrever mais, gosto de usar esse tipo de notação para não ter erro.
[02:43] Posso também usar o símbolo de maior para pegar quem nasceu depois dessa data. O Oracle sabe o calendário do tempo. Ou posso aplicar o menor. Posso ainda adicionar um estou char data de nascimento ‘MM’ igual a 10. Com isso digo que quero todo mundo que nasceu em outubro, para fazer algum processo de venda focalizado para quem nasceu naquele mês.

SELECT * FROM tb_clientes WHERE data_nascimento = TO_DATE('07/10/1995', 'DD/MM/YYYY');
SELECT * FROM tb_clientes WHERE data_nascimento > TO_DATE('07/10/1995', 'DD/MM/YYYY');
SELECT * FROM tb_clientes WHERE TO_CHAR(data_nascimento, 'MM') = 10;

Monte uma consulta SQL para ver quais são os vendedores que foram admitidos da empresa depois de 2016 (inclusive).
Um exemplo de SQL que atende o que foi proposto no enunciado é:

SELECT * FROM TABELA_DE_VENDEDORES WHERE TO_CHAR(DATA_ADMISSAO, 'YYYY') >= '2016';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- FILTROS COMPOSTOS

[00:00] Um filtro do SQL não é apenas um campo igual, maior, menor, diferente a uma condição. Posso juntar dois critérios ao mesmo tempo usando o and e o or. O and, ou e, é quando uma coisa ou outra coisa acontecem ao mesmo tempo. O or, ou ou, é uma coisa ou outra. Se por acaso no ou apenas uma condição for verdadeira, toda a expressão será verdadeira. No e, para uma expressar ser verdadeira as duas condições devem ser verdadeiras.
[01:04] Vou usar a tabela de produtos e selecionar maior ou igual a 16.007. Agora, digamos que eu queira ver somente um valor entre dois valores. Posso fazer preço de lista maior ou igual a 16 and preço lista menor ou igual a 18. Eu tenho duas condições. Ele tem que ser maior que 16 e menor que 18. Como tem o and, só vou ver uma linha se as duas condições forem verdade. Logo, só vou ver preços entre 16 e 18.
[03:25] Podemos também aplicar na idade maior que 22 e é do sexo feminino, com o and. Só vou ver mulheres com mais de 22 anos. Ou seja, não preciso que o campo seja o mesmo para usar o and.
[04:50] Por exemplo, posso colocar um select dos clientes, em que cidade é igual a Rio de Janeiro e bairro Jardins. O bairro Jardins é de São Paulo, então estou pegando todo mundo que é da cidade do Rio de Janeiro e do bairro Jardins. Só que não existe, porque ninguém vai ser do Rio de Janeiro e do bairro Jardins. Agora, se eu colocar o or, ele vai mostrar qualquer coisa que satisfaça uma das condições.
[06:40] Posso juntar condições. Por exemplo, quero ver todo mundo que tenha mais de 22 anos e seja do sexo feminino, e também que more ou na cidade do Rio de Janeiro ou de Jardins. Ele faz a primeira condição, me dá um resultado, aplica o and e me dá outro resultado, e por fim o or. Isso me dá o resultado da expressão toda.
[08:18] Cada vez vamos juntando dentro do filtro expressões mais complexas e fazemos buscas mais inteligentes no banco de dados, transformando essas consultas em processos para fornecer ao nosso usuário informações sobre o que está acontecendo.

SELECT * FROM tb_produtos WHERE preco_lista >= 16.007;
SELECT * FROM tb_produtos WHERE preco_lista >= 16 AND preco_lista <= 18;
SELECT * FROM tb_clientes WHERE idade > 22 AND SEXO = 'F';
SELECT * FROM tb_clientes WHERE cidade = 'Rio de Janeiro' AND bairro = 'Tijuca';
SELECT * FROM tb_clientes WHERE cidade = 'Rio de Janeiro' OR bairro = 'Jardins';

SELECT * FROM tb_clientes WHERE (idade > 22 AND sexo = 'F') AND (cidade = 'São Paulo' OR bairro = 'Tijuca');
SELECT * FROM tb_clientes WHERE (idade < 22 AND sexo = 'M') AND (cidade = 'São Paulo' OR bairro = 'Tijuca');

Monte uma consulta SQL para ver quais são os vendedores que estão de férias e que foram admitidos antes de 2016.
Um exemplo de SQL que atende o que foi proposto no enunciado é:

SELECT * FROM TABELA_DE_VENDEDORES WHERE TO_CHAR(DATA_ADMISSAO, 'YYYY') < '2016' AND DE_FERIAS = 1;




--------------------------------------------------------------------------------------------------------------------------------------------------------- COMMIT E ROLLBACK  +  REVISÃO

[00:00] Um ponto de atenção em relação ao SQL developer. Quando eu fecho, ele me mostra uma mensagem com algumas opções. Enquanto eu estava trabalhando, existe uma coisa chamada transação. É como se tudo que eu fizesse no fim eu precisasse confirmar. Essa confirmação faz parte do commit ou do rollback. Com o commit confirmo o que fiz, e com o rollback volto ao estado em que estava anteriormente.
[01:23] Se eu usar o rollback, tudo que fiz não vai valer, foi tudo jogado no lixo. Se eu der o commit, confirmo tudo que eu fiz. Quando eu abrir novamente, vou ver minhas modificações. São seguranças para evitar que você faça alguma besteira no banco.
[02:15] Vou clicar no commit e vou dar ok. Todas as minhas alterações foram confirmadas. Então tome muito cuidado quando fechar o SQL developer. Nos nossos treinamentos mais à frente vamos falar mais sobre transação e entender melhor como isso funciona.
[00:00] Um ponto de atenção em relação ao SQL developer. Quando eu fecho, ele me mostra uma mensagem com algumas opções. Enquanto eu estava trabalhando, existe uma coisa chamada transação. É como se tudo que eu fizesse no fim eu precisasse confirmar. Essa confirmação faz parte do commit ou do rollback. Com o commit confirmo o que fiz, e com o rollback volto ao estado em que estava anteriormente.
[01:23] Se eu usar o rollback, tudo que fiz não vai valer, foi tudo jogado no lixo. Se eu der o commit, confirmo tudo que eu fiz. Quando eu abrir novamente, vou ver minhas modificações. São seguranças para evitar que você faça alguma besteira no banco.
[02:15] Vou clicar no commit e vou dar ok. Todas as minhas alterações foram confirmadas. Então tome muito cuidado quando fechar o SQL developer. Nos nossos treinamentos mais à frente vamos falar mais sobre transação e entender melhor como isso funciona.

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.

1) Abra o arquivo SQL_10.sql, que você baixou no início desta aula, e copie o seu conteúdo.

2) Acesse o SQL Developer, crie uma nova consulta, cole o conteúdo do arquivo SQL_10.sql e execute-o. As tabelas serão apagadas, recriadas e novos registros incluídos.

3) Verifique o conteúdo das tabelas de produtos e clientes, digitando:

SELECT * FROM TB_CLIENTES;
SELECT * FROM TB_PRODUTOS;COPIAR CÓDIGO
4) Crie uma nova consulta no SQL Developer. Digite:

SELECT 
    CPF, NOME, ENDERECO1, ENDERECO2, 
    BAIRRO, CIDADE, ESTADO, CEP, IDADE, 
    SEXO, LIMITE_CREDITO, VOLUME_COMPRA, 
    PRIMEIRA_COMPRA, DATA_NASCIMENTO
FROM TB_CLIENTES;COPIAR CÓDIGO
Ou seja, você pode usar o * para selecionar todos os campos ou discriminar um por um.

5) Você pode selecionar alguns campos apenas:

SELECT CPF, NOME, IDADE, DATA_NASCIMENTO
FROM TB_CLIENTES;COPIAR CÓDIGO
6) Ou também criar um alias para cada campo, por exemplo:

SELECT 
    CPF AS CPF_DO_CLIENTE, 
    NOME AS NOME_DO_CLIENTE, 
    IDADE, 
    DATA_NASCIMENTO
FROM TB_CLIENTES;COPIAR CÓDIGO
7) Os registros podem ser filtrados usando o mesmo tipo de cláusula WHERE utilizada no UPDATE e DELETE:

SELECT * FROM TB_PRODUTOS WHERE PRODUTO = '1037797';COPIAR CÓDIGO
8) Mas não é somente pela chave primária que você pode filtrar as consultas:

SELECT * FROM TB_CLIENTES WHERE CIDADE = 'Rio de Janeiro';
SELECT * FROM TB_PRODUTOS WHERE SABOR = 'Laranja';COPIAR CÓDIGO
9) Digite o comando abaixo de UPDATE, para fazer uma alteração em diversos registros ao mesmo tempo:

UPDATE TB_PRODUTOS SET SABOR = 'Cítricos' WHERE SABOR = 'Limão';COPIAR CÓDIGO
10) Você pode fazer consultas utilizando condições baseadas em números (decimais ou inteiros). Abaixo, é uma condição de igualdade:

SELECT * FROM TB_CLIENTES WHERE IDADE = 22;COPIAR CÓDIGO
11) Mas você usar sinal de maior, menor, maior ou igual, menor ou igual. Olhe alguns exemplos:

SELECT * FROM TB_CLIENTES WHERE IDADE > 22;
SELECT * FROM TB_CLIENTES WHERE IDADE < 22;
SELECT * FROM TB_CLIENTES WHERE IDADE <= 22;COPIAR CÓDIGO
12) Há também o sinal de diferente, que é expresso como <>. Veja abaixo:

SELECT * FROM TB_CLIENTES WHERE IDADE <> 22;COPIAR CÓDIGO
13) As condições de maior, menor, maior ou igual, menor ou igual, e diferente podem ser aplicadas a textos. O critério será a ordem alfabética:

SELECT * FROM TB_CLIENTES WHERE NOME >= 'Fernando Cavalcante';
SELECT * FROM TB_CLIENTES WHERE NOME <> 'Fernando Cavalcante';COPIAR CÓDIGO
14) As condições de maior, menor, maior ou igual, menor ou igual, igual e diferente podem ser aplicadas a campos FLOAT:

SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA >= 16.008
SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA = 16.008
SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA <> 16.008COPIAR CÓDIGO
15) Você pode usar datas como filtro. Veja alguns exemplos:

SELECT * FROM TB_CLIENTES WHERE DATA_NASCIMENTO = TO_DATE('07/10/1995','DD/MM/YYYY');
SELECT * FROM TB_CLIENTES WHERE DATA_NASCIMENTO > TO_DATE('07/10/1995','DD/MM/YYYY');
SELECT * FROM TB_CLIENTES WHERE DATA_NASCIMENTO < TO_DATE('07/10/1995','DD/MM/YYYY');COPIAR CÓDIGO
16) Existem algumas funções de data que podem ser usadas como filtros:

SELECT * FROM TB_CLIENTES WHERE TO_CHAR(DATA_NASCIMENTO,'MM') = 9COPIAR CÓDIGO
17) Por fim, você pode usar filtros compostos, usando, entre cada teste, os comandos AND ou OR. Veja abaixo alguns exemplos que podem ser testados no SQL Developer:

SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA >= 16.007;
SELECT * FROM TB_PRODUTOS WHERE PRECO_LISTA >= 16 AND PRECO_LISTA <= 21
SELECT * FROM TB_CLIENTES WHERE IDADE > 22 AND SEXO = 'F'
SELECT * FROM TB_CLIENTES WHERE CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins';
SELECT * FROM TB_CLIENTES WHERE (IDADE > 22 AND SEXO = 'F') AND (CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins');COPIAR CÓDIGO
 
Nesta aula, aprendemos:

Como visualizar os dados de uma tabela
Como segregar a seleção de dados
A usar as condições de maior e menor na seleção de dados da tabela
Como filtrar dados através de datas
Como implementar filtros compostos







