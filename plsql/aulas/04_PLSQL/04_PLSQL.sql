----------------------------------------------------------------------------------------------------------------------------------------------------------------- Preparando o ambiente

[00:00] Vamos configurar o nosso ambiente do treinamento. Nós vamos usar outro modelo diferente do que viemos usando nos cursos anteriores de Oracle. Para isso nós vamos primeiro criar um novo usuário.
[00:14] Para criar um usuário no Oracle, eu vou digitar o seguinte comando, CREATE USER cursoplsql, então eu estou usando o comando create user para criar um usuário cuja identificação é cursoplsql. IDENTIFIED BY, eu vou colocando como ele terá o seu login. Vou usar o mesmo nome, cursoplsql.
[00:50] E eu preciso colocar parâmetros de espaço em disco para ele trabalhar com os dados. DEFAULT tablespaceusers;. Vou então rodar esse comando, seleciono-o e clico em executar instrução.
[01:11] Eu tive esse erro, nome de atribuição ou de usuário comum inválido. Pode ser que na máquina de vocês o erro não tenha acontecido. Nesse caso eu preciso rodar antes um comando que é o seguinte, alter session set “_ORACLE_SCRIPT”=true;. Desta maneira.
[01:43] Eu estou mudando uma configuração interna do Oracle e essa variável interna “ORACLESCRIPT” vai ter valor igual a verdadeiro, true. Rodei esse comando. Após executar esse comando eu vou tentar de novo criar o comando de criar usuário. Agora sim o meu usuário cursoplsql foi criado com sucesso.
[02:15] Mas eu preciso dar alguns privilégios de acesso ao que ele pode fazer nesse ambiente. E, no caso, vou dar um acesso total para que o usuário cursoplsql possa criar tabelas, criar scripts e assim por diante.
[02:36] Para isso eu dou o comando GRANT connect, resource TO, o nome do usuário, cursoplsql;. Seleciono essa linha, dou ok, vamos executar. Pronto.
[03:04] Nesse ponto eu criei o usuário cursoplsql e dei privilégios para que esse usuário possa, após fazer a conexão, ter acesso a todos os recursos desse ambiente, de tal maneira que ele possa criar tabelas, incluir dados, criar procedures e assim por diante.
[03:30] Agora eu vou criar uma conexão e me conectar no meu ambiente agora com o usuário cursoplsql. Vou vir em “Oracle Conexões”, botão direito do mouse, “Nova Conexão”.
[03:48] Eu vou chamar essa conexão também de “CURSO PL SQL”, o nome do usuário vai ser o usuário que eu criei, cursoplsql, a senha eu vou especificar também como cursoplsql. E os parâmetros de conectividade serão os mesmos que foram configurados quando instalamos o Oracle.
[04:20] Eu posso fazer um teste, note que ele fez o status conexão com sucesso, e vou dar um “Conectar”. Vou colocar a senha, cursoplsql, ok. E eu tenho agora, nesse script, acesso ao ambiente do curso PL SQL.
[04:48] Note que eu não tenho nenhuma tabela ainda criada embaixo da conexão “CURSO PL SQL”. Diferente da conexão anterior, eu já tenho uma série de tabelas de ambientes e de tabelas, no meu caso, referentes a cursos anteriores de Oracle. É nesse outro ambiente, CURSO PL SQL, que nós vamos trabalhar esse treinamento.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------- Criando o esquema

[00:00] Vamos colocar os nossos conhecimentos de Oracle em prática? Conhecimentos esses adquiridos nos outros cursos, para poder criar no nosso ambiente, onde vamos desenvolver os exemplos práticos de PL/SQL, esse esquema aqui de cima.
[00:18] Vamos criar duas tabelas, uma tabela “segmercado”, que vai ter um cadastro de segmentos de mercado, ou seja, indústria, comércio, varejo, atacado, são segmentos de mercado. São grupos onde as empresas se adéquam, grupos econômicos. E teremos a tabela de clientes.
[00:44] Na tabela de segmentos de mercado, a “segmercado”, teremos ID, que vai ser um código identificação daquele mercado e a descrição. E na tabela de clientes teremos também um ID, a razão social e uma série de campos parâmetros do cliente, sendo que na tabela de clientes também temos o campo “SegMercado_id”, que é o segmento de mercado daquele cliente.
[01:16] E teremos essa chave estrangeira ligando as duas tabelas, ligando a tabela segmercado com a tabela cliente. Lembrando que na tabela segmercado a chave primária é o ID e na tabela cliente a chave primária é também ID.
[01:41] Vamos agora, lá associado ao nosso usuário PL SQL criar esse esquema de cima. Eu estou no meu SQL Developer, num script novo, associado ao usuário CURSO PL SQL. Vamos criar a primeira tabela, que é a tabela de segmento de mercado, a segmercado.
[02:10] Vamos escrever em maiúsculo, CREATE TABLE SegMercado, o primeiro campo é o (ID, que vai ser NUMBER(5), e a descrição, que vai ser VARCHAR2(100));.
[02:43] Depois vamos criar a tabela de clientes. CREATE TABLE Cliente, vai ter o ID NUMBER(5),, nós vamos ter a Razao_Social, que vai ser um VARCHAR2(100),, vamos continuar embaixo. Temos depois CNPJ, é o próximo campo, vai ser um VARCHAR2(20),. Teremos o SegMercado_id NUMBER(5),, vamos seguindo.
[03:39] Depois tem a Data_Inclusao, que vai ser do tipo DATE,, uma data. O Faturamento_Previsto que vai ser um NUMBER(10,2),. E o último campo é a categoria. Categoria vai ser um VARCHAR2(20));.
[04:13] Vamos olhar, ID, descrição, ID, razão social, ok. Vou selecionar o primeiro comando, vou executar. A tabela foi criada com sucesso. Vou selecionar o segundo comando de criação, a tabela cliente criada com sucesso. Deixa-me ver se eu não errei nenhum nome. Ok, vamos lá.
[04:41] Agora vamos criar as chaves primárias, tanto para a tabela segmercado quanto para a tabela cliente. ALTER TABLE SegMercado ADD CONSTRAINT SegMercado_id_pk, esse é o nome da restrição, pode ser qualquer nome, mas nós geralmente utilizamos o nome da tabela e o nome do campo depois do sufixo pk. PRIMARY KEY pelo campo (ID);.
[05:29] Depois a segunda tabela, a chave primeira da segunda tabela. ALTER TABLE da tabela Cliente ADD CONSTRAINT, o nome da constraint, Cliente_id_pk PRIMARY KEY (ID);. Vou selecionar a primeira, vou executar. Foi. O segundo comando, foi também.
[06:21] Agora vamos fazer a ligação entre as duas tabelas, que é a chave estrangeira. ALTER TABLE Cliente ADD CONSTRAINT Cliente_SegMercado_fk, normalmente o nome da fk nós colocamos o nome das duas tabelas que fazem parte da ligação com o sufixo fk.
[06:55] O tipo de restrição, FOREIGN KEY (SegMercado_id REFERENCES, ou seja, a referência do campo está vindo SegMercado_id da tabela de cliente com o campo ID da tabela segmercado. Aqui SegMercado (ID);.
[07:34] Vamos rodar esse último comando. Pronto. Agora temos já o nosso esquema criado conforme foi especificado por esse desenho. Já estamos com as tabelas prontas para começar os exercícios práticos do curso de PL/SQL.

CREATE TABLE segmercado (
    id        NUMBER(5),
    descricao VARCHAR2(100)
);

CREATE TABLE cliente (
    id                   NUMBER(5),
    razao_social         VARCHAR2(100),
    cnpj                 VARCHAR2(20),
    segmercado_id        NUMBER(5),
    data_inclusao        DATE,
    faturamento_previsto NUMBER(10, 2),
    categoria            VARCHAR2(20)
);

ALTER TABLE segmercado ADD CONSTRAINT segmercado_id_pk PRIMARY KEY ( id );

ALTER TABLE cliente ADD CONSTRAINT cliente_id_pk PRIMARY KEY ( id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_segmercado_fk FOREIGN KEY ( segmercado_id )
        REFERENCES segmercado ( id );

------------------------------------------------------------------------------------------------------------------------------------------------------------------- Entendendo o PL/SQL

[00:00] Vimos em cursos anteriores que a linguagem SQL é uma linguagem padrão, que é utilizada pela maioria dos bancos de dados relacionais que temos hoje no mercado. Mas tem uma desvantagem, o SQL não é uma linguagem estruturada, vimos nos cursos anteriores, é uma lista de comandos sequenciais.
[00:28] Logo, para aumentar o poder do SQL, cada banco de dados tem uma versão variante do SQL, onde mais comandos são acrescentados e certa estruturação para esse ambiente é criada. Estruturação essa que o SQL não oferece.
[00:51] No caso do Oracle, essa linguagem mais estruturada chama-se 'PL/SQL', que significa, da sigla inglesa, Procedural Language Structured Query Language. É como se fosse uma linguagem procedural do SQL.
[01:13] E foi lançada pela Oracle pela primeira vez na versão 6.0, em 1991, e no decorrer de novas versões Oracle, foi recebendo melhorias e cada vez mais incorporada ao próprio banco de dados Oracle. Mas o PL/SQL é um padrão não somente usado pelo banco de dados Oracle, mas pela maioria das ferramentas Oracle que ela oferece para o mercado.
[01:49] Se a empresa trabalha com banco de dados Oracle, a principal vantagem de se criar programas em PL/SQL é, sem dúvida nenhuma, o fato de a linguagem tornar possível a construção de aplicações eficientes, principalmente se há necessidade da manipulação de grandes volumes de dados de forma estruturada. Exemplo, manipular tabelas com milhões ou até mesmo bilhões de registros.
[02:27] Como o programa PL/SQL é executado dentro do próprio Oracle, ou seja, não há uma comunicação para que saia o dado do Oracle, manipular grandes volumes de dados usando o PL/SQL sem a necessidade de entrar e sair ao banco de dados, ou seja, trafegar pela rede, cria uma maior eficiência.
[02:53] E também essa eficiência do PL/SQL é garantida através da sua forte integração com a linguagem SQL do próprio Oracle. Podemos executar comandos de SQL diretamente dentro de um programa PL/SQL, sem a necessidade de usar API ou conexões externas, como conexões ODBC, ou, por exemplo, conexões JDBC, outra linguagem de programação externa. Então essa é uma característica muito positiva.
[03:31] Uma segunda característica positiva do uso do PL/SQL é que essa linguagem acaba sendo muito mais confiável do que outras linguagens de programação, caso você queira manipular dados de dentro do Oracle, ou seja, como o PL/SQL é estruturado, você programa as coisas em PL/SQL em vez de programar isso através de uma linguagem de programação externa.
[04:06] O PL/SQL, como ele está sendo escrito dentro do próprio Oracle, ele vai ter um comportamento extremamente previsível durante a execução dos programas.
[04:18] E ele vai rodar sempre com um desempenho melhor do que se eu estivesse manipulando essas informações numa linguagem de programação ou ferramenta externa, fazendo com que não haja ocorrência, por exemplo, de bugs inexplicáveis, tão comuns às vezes nas linguagens de programação que trabalhamos.
[04:41] Podemos dizer que um terceiro aspecto positivo do uso do PL/SQL é o seu tempo de vida. Um código escrito em PL/SQL costuma ser bem mais durável, no sentido, por exemplo, que não precisa estar sofrendo manutenção, mesmo quando a versão do banco de dados Oracle é atualizada. Exemplo, eu tenho um Oracle 10g no Windows e eu quero mudar, por exemplo, para um Oracle 11g no Linux. O programa PL/SQL vai continuar funcionando igual.
[05:20] É comum você encontrar em alguns bancos de dados Oracle programas PL/SQL que foram escritos, por exemplo, há mais de 10 anos e ainda continuam em produção nas empresas, mesmo utilizando o Oracle mais atual, mesmo utilizando versões diferentes daquela versão que foi utilizada para a construção desse programa antigo.
[05:49] Uma dúvida frequente, eu já falei no início da minha explanação, mas essa dúvida sempre continua existindo, qual é afinal a diferença entre SQL e PL/SQL? Quando eu uso uma, quando eu uso outra? A resposta não é muito difícil de dar.
[06:10] Novamente, o PL/SQL é uma linguagem procedural, e consiste numa extensão natural do SQL que está dentro do Oracle. As duas linguagens possuem algumas características chaves que eu vou mencionar agora para vocês. Vamos começar pelo SQL.
[06:41] O SQL é a linguagem padrão utilizada pela maioria dos bancos de dados relacional, utilizam aquele padrão ANSI, que eu mencionei para vocês nos cursos introdutórios de SQL.
[06:57] E como ele é um padrão, ele é aceito pela indústria de bancos de dados e normalmente é suportado por todos os bancos de dados relacionais. Nessa lista nós incluímos não somente o Oracle, mas também Microsoft SQL Server, MySQL, PostgreSQL, SQLite, IBM Db2 e assim por diante. Devo ter esquecido alguns porque tem uma lista extensa de bancos de dados relacionais que suportam o SQL.
[07:32] Mas claro, apesar de ser poderosa, a linguagem SQL tem um escopo claro e direto. Ela possui instruções para simplesmente recuperação e manipulação de dados e tabelas, controlar transações, definir objetos de controle de acesso de dados.
[07:58] Podemos ver nessa tabela exemplos de comandos SQL, que são comandos que aprendemos em cursos anteriores ao curso de Oracle e talvez tenha algum tipo de comando que ainda veremos na parte de administração do Oracle.
[08:19] Mas é claro, o SQL possui a limitação de ser uma linguagem de programação declarativa. Isso significa que eu não posso criar um programa inteiro somente em SQL, pois a linguagem SQL não tem comandos de decisão, como, por exemplo, comandos if ou else, e nem execuções de laços ou de loopings, como, por exemplo, comandos while ou comandos for.
[08:52] Já o PL/SQL pode ser entendido como uma extensão natural da linguagem SQL dentro do Oracle, que adiciona ao SQL original funcionalidades que a tornam uma linguagem de programação completa, pois ela tem dentro dela controle de fluxo, tratamento de exceções, orientação a objeto, entre várias outras coisas.
[09:25] Com o PL/SQL aí sim nós podemos escrever programas inteiros, desde mais simples até programas extremamente sofisticados, que manipulam dados do Oracle.
[09:42] A linguagem PL/SQL foi criada com o propósito de oferecer uma solução de programação para os usuários que precisavam escrever aplicações dedimensões críticas, executando bancos de dados Oracle. Ela se tornou muito mais vantajosa do que você fazer isso através de uma linguagem de programação externa.
[10:11] Para deixarmos bem claro, o PL/SQL não foi criado para ser uma linguagem padrão e nem uma linguagem independente, ao contrário disso, ela é uma tecnologia exclusiva da Oracle, uma linguagem proprietária da Oracle, que pode ser utilizada apenas nos produtos dessa empresa.
[10:54] Como ela é uma linguagem somente do banco de dados Oracle e não tem como objetivo ser uma linguagem de propósito geral, como Java ou C, o PL/SQL mesmo assim acabou se tornando muito difundido ao longo dos anos, e possui uma enorme comunidade de usuários.
[11:17] E a cada nova versão do Oracle o banco de dados traz embutida a sua versão correspondente ao PL/SQL, incrementando uma série de novos comandos e novas funcionalidades
[11:34] Podemos resumir então a diferença básica entre o SQL e o PL/SQL nesse quadrado embaixo. O SQL é uma linguagem declarativa, não é possível criar programas inteiros em SQL e é uma linguagem padrão ANSI, que pode ser usada em qualquer outro banco de dados relacional, ou seja, coisas que fazemos em SQL Oracle podemos transportar para Microsoft, para DB2 e assim por diante.
[12:04] Já o PL/SQL é uma linguagem que chamaríamos de imperativa, possibilita a construção de programas complexos e é uma linguagem proprietária, ou seja, utilizada somente no ambiente Oracle. Era isso que eu queria falar um pouco para ilustrarmos e entendermos a importância do PL/SQL.

----------------------------------------------------------------------------------------------------------------------------------------------------------------- Primeiro bloco PL/SQL

[00:00] O que eu estou mostrando para vocês é a estrutura básica de um programa PL/SQL. Ele se limita em três grandes comandos, o comando declare, o comando begin e o comando end. Entre o declare e o begin faremos a declaração e definição de todos os componentes de trabalho do programa.
[00:23] O que são componentes de trabalho do programa? São variáveis, constantes e qualquer outro componente que vai ser utilizado e manipulado entre o begin e end, onde ali eu vou colocar os meus comandos de execução.
[00:37] Os comandos de execução podem ser comandos SQL ou então comandos de lógica, que vão criar a estrutura do nosso programa entre o begin e o end.
[00:52] Já que entendemos basicamente a estrutura de um programa PL/SQL, vamos lá no nosso SQL Developer e vamos já fazer o nosso primeiro programa em PL/SQL.
[01:06] Eu estou no meu SQL Developer, eu vou selecionar “SQL”, para criar um novo script. Lembrando que eu vou usar a conexão “CURSO PL SQL” para criar esse novo script. Eu tenho a minha área vazia e como eu disse para vocês, eu tenho um DECLARE, um BEGIN e um END. Entre o declare e o begin eu declaro os componentes que serão usados no meu programa.
[01:42] Eu posso, por exemplo, declarar uma variável, eu vou botar assim: v_ID NUMBER(5);. Aqui eu tenho o nome da variável, “v_ID”, o tipo da variável com seu tamanho, “NUMBER(5)”, e todo comando termina com ponto e vírgula.
[02:10] O nome da variável eu posso colocar qualquer nome, claro que existem boas práticas, existe um determinado padrão. Eu gosto de colocar o v minúsculo underscore sempre na frente do nome de uma variável.
[02:22] Isso é legal quando eu tiver um programa PL/SQL muito grande, eu vou saber que quando eu encontrar alguém que comece com v minúsculo underscore é uma variável que foi declarada lá no declare.
[02:35] Padrões, claro, podem existir vários, e como eu sempre falo, quando comentamos sobre padrões, você tem que consultar a empresa que você trabalha para saber se ela oferece um padrão específico interno de desenvolvimento.
[02:53] Eu tenho a minha declaração e, embaixo, vou rodar um comando para poder exibir o valor da variável v_ID.
[03:09] Veremos que nem tudo existe no PL/SQL, e esse comando de exibir valores externos não é uma coisa nativa do PL/SQL. Porém, a Oracle fornece uma série de bibliotecas internas, são programas internos Oracle que já estão embutidos no banco de dados, que podem ser chamados e usados pelo PL/SQL.
[03:39] O primeiro programa externo da Oracle que pode ser usado no PL/SQL que vamos aprender é o de exibir na saída do comando o valor de uma variável. E esse comando é dbms_output.
[04:01] Só que não basta apenas o comando dbms_output, eu vou colocar um ponto, note que ele tem uma série de métodos ou funções que estão associados ao componente dbms_output. Eu vou usar o comando put_line. E dentro do comando put_line eu vou colocar a minha variável, (v_ID), e termino com ponto e vírgula.
[04:37] Note que ele vai mudando as cores na medida em que vamos construindo o nosso programa em PL/SQL. Vamos executar?
[04:48] Para executar esse bloco, igual a como eu executo qualquer comando dentro do SQL Developer. Eu posso, ao apertar direto, eu vou executar tudo que está no meu script, ou então eu posso selecionar a região e executar. Vamos executar.
[05:08] Note que ao executar eu não consegui ver nada, não apareceu nada. É que para podermos executar realmente o comando dbms_output, precisamos fazer uma declaração de uma variável interna do Oracle, antes do declare.
[05:31] Então eu vou colocar SET SERVEROUTPUT ON. O padrão desse comando é off, ao colocar on eu estou dizendo que o dbms_output pode escrever nessa área da saída do script o que eu estou evocando. Vou colocar o ponto e vírgula e eu vou rodar primeiro o SERVER OUTPUT ON; e agora eu rodo o DECLARE.
[06:13] Ele ainda não escreveu nada, mas teve uma mudança, note que embaixo ele escreveu uma área um pouco maior. O que está acontecendo é o seguinte, a variável está sendo escrita, só que não está aparecendo nada, por quê? Porque declaramos a variável, mas não atribuímos nenhum valor a ela.
[06:39] Quando declaramos uma variável no PL/SQL, mas não atribuímos valor nenhum, o valor padrão dele é nulo. O que está acontecendo ali? Ele está escrevendo na área de saída do script, nulo.
[06:56] Podemos atribuir um valor à variável v_ID. E para fazer isso eu posso fazer de duas maneiras. Primeira, eu posso atribuir um valor inicial no momento do declare, e para fazer isso eu coloco dois pontos iguais, por exemplo, eu vou botar o valor 1. Com esse := 1 eu estou atribuindo o valor 1 à variável ´v_ID`.
[07:29] E eu espero que quando eu rodar o comando de escrita, eu consiga ver o valor da variável lá na saída do script. Vamos ver se funciona? Eu vou executar o script todo, note que agora ele escreveu o valor 1.
[07:49] Mas eu posso mudar esse valor durante a execução, ele pode começar com 1, mas durante a execução do programa, ou seja, entre o begin e o end, eu posso mudar esse valor.
[08:02] E para fazer isso basta eu, embaixo, escrever v_ID :=, vou botar aqui o valor 2. E sempre terminamos o comando PL/SQL com ponto e vírgula. Então ele vale 1 na declaração inicial e durante a execução passa a valer 2. Vamos ver o resultado? Note que agora ele escreveu o número 2. Esse é o nosso primeiro programa em PL/SQL que construímos no nosso curso.


set SERVEROUTPUT ON;

DECLARE
    v_id NUMBER(5) :=1 ;
BEGIN
    v_id := 2;
    dbms_output.put_line(v_id);
END;

-- A estrutura básica de um bloco PL/SQL
DECLARE

BEGIN

END

Alternativa correta! A estrutura básica de um programa PL/SQL é formada pelos comandos descritos nesta alternativa.


-- Padrão de variável
Qual é a vantagem de usar padrões em um programa PL/SQL?
Entendimento
Alternativa correta! Foi isso que vimos no vídeo, ao colocar um prefixo na frente da variável.


-- SERVEROUTPUT ON
Por que precisamos executar o comando SET SERVEROUTPUT ON na frente de alguns comandos PL/SQL?
Para poder executar bibliotecas dbms_output
Alternativa correta! Temos que executar o comando do enunciado sempre que formos usar, no bloco de programa PL/SQL, comandos desta biblioteca.

------------------------------------------------------------------------------------------------------------------------------------------------------------------- Erros de compilação

[00:00] Quando estamos fazendo um programa, em qualquer linguagem que seja, sempre cometemos erros. Esquecemos um parêntese, esquecemos de colocar um ponto e vírgula.
[00:10] Eu vou simular alguns erros para vermos como o PL/SQL te mostra e trata esses erros. Por exemplo, vamos supor que nessa linha, v_ID := 2; eu esqueça de colocar o ponto e vírgula. Vou tirar o ponto e vírgula.
[00:30] Note que o editor já vai me dar uma pista de que alguma coisa está errada, mostrando esse sublinhado numa linha roxa, que há algum problema. Inclusive, se eu colocar o cursor em cima do dbms_output, ele já está me dizendo que tem uma regra de sintaxe.
[00:49] A primeira coisa que já vamos sacar quando cometemos um erro é que ele já vai te dar um alerta, mas mesmo assim, se não notarmos isso ou quisermos ignorar isso, ao executar vamos encontrar um erro. E basicamente a mensagem mais importante é essa aqui, “ORA-06550: linha 5, coluna 4:”.
[01:18] Se formos na linha 5, note que eu, ao andar com o cursor, embaixo, bem no canto, ele vai me mostrando a linha e coluna que eu estou. Se formos na linha 5, é esse BEGIN, e isso acontece porque ao tirar o ponto e vírgula, ele já se perdeu um pouco em saber onde começa e onde termina o comando.
[01:44] E esse erro embaixo, “PLS-00103: Encontrado o símbolo ‘DBMS_OUTPUT’”, está relacionado com esse comando, porque como não há o ponto e vírgula em cima, ele acha que o comando é isso tudo.
[01:56] Então ok, eu já descobri mais ou menos o que é, eu esqueci o ponto e vírgula. Se eu colocar o ponto e vírgula, você vê que aquela linha mostrando o erro sumiu, se eu rodar eu vejo de novo lá o meu resultado.
[02:13] Às vezes essa área de baixo fica muito confusa, nós começamos a executar várias vezes e começa a ter muito texto. Se clicarmos nesse ícone que parece uma borracha no final de um lápis, eu apago a área de saída. E quando executar de novo o meu programa, seja ele certo ou errado, eu consigo ver somente a saída dele, uma saída mais limpa, sem aquelas outras mensagens que vão aparecer, porque elas vão se acumulando.
[02:47] Se eu rodar de novo, ele vai acumulando o resultado. Se eu rodar agora com erro, então eu tenho embaixo uma barra mostrando as últimas execuções. E essa saída vai ficando muito poluída, e nós vamos ao lápis, apagamos, executamos de novo e já temos a saída mais limpa.

Nesta aula, aprendemos:

A instalar e configurar o Oracle
Como criar um novo usuário e dar privilégios de acessos
Como criar uma nova conexão usando este novo usuário
A criar as tabelas a serem usadas neste curso
Como criar um bloco simples de PL/SQL

------------------------------------------------------------------------------------------------------------------------------------------------------------------ Primeiro comando SQL

[00:00] Nos vídeos da aula passada nós criamos duas tabelas associadas ao usuário CURSO PL SQL, que serão tabelas que vamos usar durante o nosso treinamento. Vamos olhar essas tabelas?
[00:14] Eu vou selecionar, à esquerda, “Tabelas”, com o botão direito do mouse, “Atualizar”, e abrindo, eu tenho a minha tabela “cliente” e a tabela “segmercado”. Abrindo a segmercado, nós vamos começar por ela, temos dois campos, o campo ID e o campo descrição.
[00:35] Relembrando, ID é um número de cinco posições e descrição é um varchar2 de 100 posições. Vamos inserir dados dentro dessa tabela. E relembrando cursos passados, vamos usar o comando insert para isso.
[00:51] Eu vou então criar um novo script, associado à conexão CURSO PL SQL, e eu vou dar o comando insert. Relembrando, INSERT INTO, o nome da tabela, SEGMERCADO, abre parênteses, os campos (ID, DESCRICAO) VALUES, os valores. O ID vai ser (1, e como é um número, não está entre aspas simples, vírgula, e a descrição, abro aspas simples, ’Varejo’, fecho aspas simples, fecho ponto e vírgula. Vamos rodar esse comando insert.
[01:36] Eu vou ter esse erro: “não há privilégios no tablespace USERS’”. É que nós precisamos dar mais privilégios de acesso a esse usuário CURSO PL SQL, que está associado ao tablespace USERS. Daremos então uma cota ilimitada para poder armazenar dados dentro desse tablespace.
[02:03] Novamente eu vou dar um comando mais ligado à área de administração de banco, então vamos rodar o comando ALTER USER, o nosso usuário cursoplsql QUOTA UNLIMITED ON TABLESPACE USERS;. Na verdade, eu não preciso colocar o comando TABLESPLACE, só coloco o nome do tablespace. Vamos rodar esse comando.
[02:47] Na verdade, eu não tenho o privilégio de fazer isso, porque eu tenho que usar aquele usuário DBA. Usuário DBA foi a conexão que criamos quando instalamos o Oracle.
[03:05] Eu vou fazer o seguinte, esse comando ALTER USER, eu vou recortá-lo e vou criar outro script, só que usando aquela outra conexão padrão, que foi a conexão que nós criamos quando instalamos o Oracle na nossa máquina.
[03:25] Agora sim, eu vou colar. Esse script, eu vou usar a conexão de DBA, que é a conexão padrão. Vou rodar. Pronto, alterei o usuário CURSO PL SQL, agora eu vou voltar para o script original, onde tem o insert, eu vou rodar agora o insert, vamos ver? Agora sim, note, uma linha inserida.
[04:01] Voltando para a nossa linha natural do curso, se eu der um SELECT * FROM SEGMERCADO;, eu tenho lá, esse comando select nós vimos no comando de consultas avançadas em Oracle. Nós temos já o elemento varejo incluído.
[04:29] Eu poderia usar o PL/SQL para inserir dados dentro da tabela? A resposta é sim. Lembre-se, o PL/SQL é uma linguagem estruturada, mas que eu posso executar comandos de SQL Oracle dentro do próprio PL/SQL.
[04:47] Vamos fazer o seguinte, vamos limpar a tabela para podermos inserir de novo o segmento 1 varejo, mas usando PL/SQL. Excluí, agora se eu rodar de novo o SELECT * FROM SEGMERCADO;, notem, está vazio. Eu vou criar embaixo.
[05:19] Lembrando, no PL/SQL eu vou ter um DECLARE, um BEGIN e um END. Vou aumentar um pouco a nossa área. O que eu vou fazer? Eu vou declarar duas variáveis, uma variável que vai ser o ID e outra variável que vai ser a descrição, e o valor dessas variáveis eu vou colocar dentro do comando insert.
[05:46] Vamos começar no declare. Eu vou chamar uma variável v_ID, que vai ser NUMBER(5) e o valor dela vai ser := 1;. Depois eu vou criar outra variável, v_DESCRICAO, que vai ser um VARCHAR2(100) e o valor dela vai ser := ‘Varejo’;. Ou seja, eu estou meio que colocando nessas variáveis o valor que eu colocaria lá do insert.
[06:35] Dentro do begin end eu posso inserir o comando insert, INSERT INTO, a tabela SEGMERCADO (ID, DESCRICAO) VALUES. Dentro, em vez de eu colocar um valor constante, como é colocado aqui, eu vou colocar as variáveis, (v_ID, v_DESCRICAO);.
[07:15] Lembrando, isso nós vimos também no curso de manipulação de dados, o Oracle implicitamente não faz o commit, o commit tem que ser feito externamente. Então vou dar um COMMIT;. Está aí o nosso script.
[07:38] Antes de executar vamos conferir. Se eu só marcar lá o select, executar, a tabela está vazia, eu agora vou executar o script PL/SQL. Procedimento executado com sucesso, se eu agora executar de novo o meu select, terei os dados incluídos dentro da tabela.
[08:08] É claro que esse comando insert é muito mais simples do que o declare. Eu estou “matando uma formiguinha com canhão”, eu fiz uma declaração e fiz um PL/SQL para rodar um único insert. Mas eu quis mostrar esse exemplo para começarmos a entender como o PL/SQL funciona. Basicamente você declarou as variáveis aqui e você pode usá-las em qualquer comando SQL dentro do begin end.
[08:47] Claro que no comando PL/SQL vamos executar não só um único comando SQL, mas podemos executar vários comandos SQL utilizando uma determinada lógica de programação. Mas esse foi um exemplo simples para já começarmos a entender como funciona o PL/SQL.

delete FROM segmercado;

INSERT INTO segmercado (ID, DESCRICAO) VALUES (1, 'Varejo');


DECLARE
    v_id NUMBER(5) := 1;
    v_descricao VARCHAR2(100) :='Varejo';
BEGIN
    INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_id, v_descricao);
    COMMIT;
END;

--Execução de comandos SQL em bloco PL/SQL
Toda a comunicação entre o PL/SQL e o banco de dados Oracle é realizada através de comandos SQL. Sobre a execução de comandos SQLs em um bloco PL/SQL, indique a alternativa verdadeira:

Alternativa correta
Os comandos SQLs INSERT, UPDATE e DELETE são executados nativamente, ou seja, não há um preparo no código para processá-los
Alternativa correta! Essa é uma das vantagens do PL/SQL. Por ser uma linguagem de programação da Oracle, podemos executar diretamente os comandos de INSERT, UPDATE e DELETE, não havendo necessidade de mudança de sintaxe ou de colocar um comando anterior para executá-los.

DECLARE
    v_negocio cadastro_item.negocio%TYPE := 'INDUSTRIALIZADOS / MASSAS';
BEGIN
    UPDATE cadastro_item
    SET
        negocio = v_negocio
    WHERE
        negocio LIKE '%INDUSTRIALIZADOS%';
    COMMIT;
END;

SELECT
    *
FROM
    cadastro_item
WHERE
    grupo_comercial LIKE 'FRESCAIS'
    AND codigo_item <> 471;
	
DECLARE
    v_id         segmercado.id%TYPE := 1;
    v_descricao  segmercado.descricao%TYPE := 'Atacadista';
BEGIN
    INSERT INTO segmercado (
        id,
        descricao
    ) VALUES (
        v_id,
        upper(v_descricao)
    );

END;

------------------------------------------------------------------------------------------------------------------------------------------------------------------- Revisão: Transações

[00:00] Vamos relembrar um negócio que existe no Oracle chamado transação. Subtransação eu já mostrei a vocês e expliquei lá no curso de manipulação de dados com Oracle. Eu quero fazer essa revisão para explicar melhor o motivo de termos colocado esse comando commit no nosso bloco.
[00:31] Eu vou mostrar uns slides em PowerPoint. Vamos supor que eu me conectei no SQL Developer, então esse quadrado vazio que está em cima representa uma instância de conexão do SQL Developer. E essa instância está olhando o banco de dados, representado por essa tabela aqui de baixo.
[01:02] Se na instância que eu estou conectado, lá na minha sessão do SQL Developer, eu dou um comando insert, coloquei o valor 1, esse valor 1 vai para a tabela e se eu, por acaso, der um select nessa primeira instância, eu vou ver como resultado o valor 1.
[01:27] Vamos supor então que nesse meio tempo outro usuário se conectou no Oracle em uma segunda instância, então temos duas instâncias em paralelo. Esse segundo usuário dá o mesmo comando SELECT * FROM TABELA;.
[01:48] Quando ele faz isso, ele não vai ver nada no resultado, porque enquanto o primeiro usuário que deu o comando insert não confirmar a inclusão desse valor, só ele vai conseguir ver o valor 1.
[02:13] Então o que nós temos são duas transações, uma transação olha o valor 1 da tabela, enquanto que a outra transação não está olhando. O primeiro usuário dá o comando commit. Ao dar esse comando commit, para a transação 1 é feito uma confirmação daquele insert e o valor vai para a base de dados e ela fica disponível para todas as outras transações.
[02:51] Logo, depois que eu dei o commit, se o segundo usuário dá de novo um SELECT * FROM TABELA;, ele consegue ver o número 1.
[03:04] O commit é necessário para que eu confirme tudo que eu fiz na minha transação, para que ela seja espelhada para os outros usuários que estão se conectando no banco em outras transações. Esse é o objetivo do comando commit.
[03:28] Quando usamos um bloco em PL/SQL, se eu executo esse bloco assim, entre o begin e end eu dou somente um comando insert, esse valor é inserido dentro da transação que executou o programa PL/SQL, porém o outro usuário, se ele dá um select, ele não vê nada.
[04:00] Por isso que é necessário, no nosso comando PL/SQL, darmos um commit, depois que fizemos o comando insert, porque depois, se eu executo este programa PL/SQL, o segundo usuário, quando der um SELECT * FROM TABELA;, ele consegue ver o número 1.
[04:26] E o que acontece? Dentro do comando PL/SQL, quando eu tenho o primeiro insert, o primeiro update ou o primeiro delete, ou seja, o primeiro comando SQL que existe, o PL/SQL abre uma transação e tudo que é feito ali vai sendo armazenado meio que em memória, para depois, quando eu der o commit, eu fechar a transação.
[04:58] Esse exemplo que eu estou mostrando em cima é um caso em que esse insert abriu uma transação, e eu coloquei o número 1 na tabela, eu dei um commit e depois do commit eu executei outro comando insert.
[05:18] Para o usuário que executou o PL/SQL, ou seja, que ele está na instância onde o PL/SQL foi executado, eu consigo enxergar o número 1 e o número 2.
[05:31] Porém, o outro usuário, se ele der um select, ele só enxerga o número 1, por quê? Porque o commit, quando foi executado, só fechou a primeira transação que foi aberta com inserts. A segunda transação que foi aberta com o segundo insert, como não aconteceu de novo um commit, ela só fica valendo para a instância que está executando o PL/SQL.
[06:07] Por isso que tivemos que colocar esse comando commit, para poder a alteração ou a inclusão – no caso, é uma inclusão – do dado que está sendo passado pela variável, possa ser gravada no banco e visualizada pelos outros usuários que estão conectados naquele momento ou que se conectarão depois, em outras instâncias.
[06:41] Eu queria relembrar um pouco esse assunto, do commit, de transação, para explicar a vocês o motivo de eu ter colocado esse comando commit após o insert.

É muito importante termos o conceito do controle de transação no PL/SQL, pois uma transação mal definida pode gerar dados inconsistentes. Sobre isso, quais das alternativas abaixo são verdadeiras?

A transação é aberta no primeiro comando SQL executado

A transação é aberta no primeiro SQL que é executado, depois pode-se seguir vários comandos SQL, e é encerrada quando executar os comandos COMMIT (confirma toda a atualização) ou ROLLBACK (desfaz toda atualização).
Se dentro do bloco não contiver comandos de fim de transação, a transação permanece aberta depois de passar pelo END do bloco
Alternativa correta! Se uma transação for aberta em um bloco e nele não contiver os comandos de fim de transação, COMMIT ou ROLLBACK, a transação continua aberta, ou seja, as atualizações ficam pendentes. Para encerrar a transação, temos que executar os comandos COMMIT (confirma toda a atualização) ou ROLLBACK (desfaz toda atualização).


------------------------------------------------------------------------------------------------------------------------------------------------------------------- Uso do Percent Type

[00:00] Vamos continuar estudando? Eu vou criar um novo script associado à minha conexão CURSO PL SQL. E eu vou pegar daquele meu script anterior somente o programa PL/SQL que nós fizemos, eu vou copiar e vou colar no nosso novo script.
[00:27] Vamos falar uma coisa que é muito importante, que são os tipos dos campos. Note que quando declaramos a variável v_ID, nós a colocamos como NUMBER(5) e a variável v_DESCRICAO nós a colocamos como VARCHAR2(100).
[00:50] Fizemos essa definição porque se formos à tabela segmentos de mercado – eu vou dar um clique na tabela – note que ID está number de 5 e descrição está varchar de 100, por isso que eu declarei essas variáveis desta maneira.
[01:23] Agora vamos supor a seguinte hipótese, meu programa PL/SQL está pronto, está funcionando e por algum motivo o administrador do banco vai nessa tabela segmento de mercado, e digamos que ele altere o tipo, ele diga que ID agora não é number de 5, é number de 3, ou ele diga que descrição não é mais varchar de 100, é varchar de 50.
[01:54] Quando ele fizer esta alteração, o meu programa PL/SQL pode dar problemas, porque imagine o seguinte, eu tenho varchar de 100, digamos que eu coloque uma variável, eu coloquei números aleatórios, mas vamos supor que o número de caracteres que eu tenho dentro do quadradinho vermelho seja 100 caracteres. Enquanto a tabela tiver esse campo como VARCHAR2(100), vai funcionar direito.
[02:34] Mas se o DBA vai lá e diz que agora a tabela é varchar de 50, quando eu rodar esse PL/SQL passando uma palavra com 100 caracteres para a variável, vamos ter problemas. Na hora de gravar na tabela o Oracle vai dizer: “Eu não posso gravar, porque o tamanho dessa variável passou em 50”, porque o DBA modificou o tamanho original dentro da tabela.
[03:08] Significa que nós ficamos meio que reféns, se fixamos a declaração da variável no PL/SQL para um tamanho já previamente determinado. Se houver uma alteração na tabela, o meu PL/SQL pode dar problema.
[03:31] Felizmente existe uma maneira de nos precavermos perante este problema, basta na declaração da variável usarmos um comando que se chama percent type, onde eu vou dizer: esta variável vai ter o mesmo tipo que existe numa determinada tabela.
[03:58] E como eu uso o percent type? Da seguinte maneira, como esta variável v_ID vai receber valor para ser colocada nesse campo ID da tabela SEGMERCADO, basta eu colocar isso daqui, em vez de usar NUMBER(5) eu digito o nome da tabela, SEGMERCADO., o nome do campo, ID%type.
[04:38] Ou seja, ao fazer isso eu estou dizendo, o tipo da variável v_ID é o mesmo tipo que está definido no campo ID da tabela SEGMERCADO. Se o DBA modificar esse tipo, o meu PL/SQL vai, digamos, entender essa modificação e vai usar a nova definição quando executar o programa.
[05:10] E a mesma coisa vai valer para baixo, eu vou dizer que v_DESCRICAO é a tabela SEGMERCADO., o nome do campo, que é DESCRICAO%type.
[05:30] Dessa maneira eu consigo prever possíveis modificações no meu banco de dados, se o DBA fizer uma modificação, ele não precisa nem conversar comigo, o meu programa PL/SQL já vai estar adaptado a essa modificação.
[05:52] Eu vou agora modificar, eu vou colocar aqui v_ID SEGMERCADO.ID%type := 2; e vou colocar dentro, onde está ’Varejo’, ’Atacado’. Fiz uma segunda modificação. Eu seleciono o meu bloco e vou executar.
[06:11] Foi executado com sucesso, se eu agora der um SELECT * FROM SEGMERCADO;, rodar agora só esse segundo comando, tenho lá agora dentro da tabela o 1 varejo e o 2 atacado.


DECLARE
    v_id NUMBER(5) := 1;
    v_descricao VARCHAR2(100) :='Varejo';
BEGIN
    INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_id, v_descricao);
    COMMIT;
END;



DECLARE
    v_id segmercado.id%TYPE := 1;
    v_descricao segmercado.descricao%TYPE :='Varejo';
BEGIN
    INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_id, v_descricao);
    COMMIT;
END;



DECLARE
    v_categoria cadastro_item.categoria%TYPE := 'LINGUIÇAS';
BEGIN
    UPDATE cadastro_item
    SET
        categoria = v_categoria
    WHERE
        categoria LIKE upper('%linguicas%');
    COMMIT;
END;


-- Vantagens do Percent Type
Qual é a vantagem do PERCENT TYPE?

Se houver mudanças na estrutura do banco de dados, o nosso programa não apresentará problemas
Alternativa correta! O PERCENT TYPE usará sempre o tipo definido na tabela. Assim, se o DBA mudar a estrutura da tabela (mudança de propriedades do campo), a nossa variável no PL/SQL irá também mudar.

--------------------------------------------------------------------------------------------------------------------------------------------------- Uso de letras maiúsculas nos textos

[00:00] Vamos continuar? Vamos pegar o nosso SQL Developer, eu vou vir na parte de cima e vou criar um novo script, sempre associando à conexão CURSO PL SQL. E vou vir no script anterior, eu vou copiar e vou colar esse novo script.
[00:27] Eu vou mostrar para vocês outro problema que acontece muito quando estamos trabalhando com o Oracle e com o PL/SQL. Eu vou embaixo rodar um SELECT * FROM SEGMERCADO;, vamos ver o conteúdo da tabela segmercado. Eu errei aqui, eu botei “mercaco”. Vamos lá de novo.
[00:59] Nós temos, por enquanto, dois segmentos de mercado, 1 é varejo, o 2 é atacado. No programa PL/SQL, o último que nós executamos, eu inicializei o meu segmento de mercado com a palavra atacado com o A maiúsculo. E claro, conforme eu defini, ele foi gravado na tabela com o A maiúsculo.
[01:30] Só que quando fazemos comparações usando texto, o Oracle é case-sensitive, ou seja, ele se importa se as letras estão maiúsculas ou minúsculas.
[01:46] Por exemplo, digamos que eu faça a seguinte coisa, se eu chegar e falar, me liste todo mundo da tabela segmento de mercado, WHERE, por exemplo, DESCRICAO = ‘Atacado’, ou seja, eu escrevi o segmento de mercado com o A maiúsculo, igual como ele foi definido lá no programa PL/SQL. Se eu rodar esse comando, ele me retornou o segmento de mercado 2.
[02:25] Agora, se eu fizer isso, vou copiar SELECT * FROM SEGMERCADO WHERE DESCRICAO = ‘Atacado’, me selecione todo mundo cujo segmento de mercado é “atacado”, e eu escrevi o A minúsculo, em vez do A maiúsculo. Quando eu vou executar, ele não vai achar ninguém. Ou seja, eu fico à mercê da forma com que a pessoa que executou o comando PL/SQL escreveu a palavra atacado.
[03:05] O usuário pode escrever com uma letra maiúscula inicialmente, ora tudo maiúsculo, ora tudo minúsculo e depois, na hora de fazer seleções, eu posso ter que ficar adivinhando como a pessoa que rodou o programa PL/SQL escreveu o texto que representa a descrição do mercado.
[03:29] Uma boa prática é sempre fixarmos uma forma com que o dado será gravado dentro da tabela segmercado. E nós vamos adotar o seguinte padrão, tudo o que for gravado na tabela, que diz respeito a texto, será gravado sempre em maiúsculas, porque na hora de fazer um teste e colocar no meu where uma condição, eu sei que o texto sempre será escrito em maiúsculo, para eu poder fazer a recuperação deste dado.
[04:13] Só que eu não vou ter que dizer isso para as pessoas que vão inserir o nome do segmento que vai ser incluído, elas vão continuar colocando o nome que elas quiserem. Na hora de gravar é que eu vou forçar e dizer que tudo será gravado como maiúsculo. Então sempre quando envolver campos texto, nós vamos gravar nas tabelas sempre em maiúsculo, para evitar esse problema.
[04:47] E para forçar isso nós vamos usar uma função que nós chegamos a ver no curso de consultas avançadas de SQL para Oracle, que é a função upper.
[05:04] Se eu escrever upper e colocar dentro o nome do campo, (v_DESCRICAO), eu vou garantir que o texto que descreve o segmento vai estar sempre gravado em maiúsculo, independente do que o usuário digitar.
[05:31] Para fazer isso vamos fazer a seguinte coisa, eu vou apagar o campo 2, que nós incluímos no vídeo passado, DELETE FROM SEGMERCADO WHERE ID = 2;, então vou apagar, foi excluído. Se eu der agora um SELECT * FROM SEGMERCADO, selecionei o comando select sem o where, eu só tenho agora o segmento 1. Eu agora vou selecionar o PL/SQL. Vou rodar, rodou.
[06:16] Eu agora, se selecionar de novo a tabela segmercado, vou executar, agora sim. Notem, apesar de eu ter escrito dentro do PL/SQL, “Atacado”, só com o A maiúsculo, foi gravado na tabela “ATACADO”, sempre maiúsculo.
[06:38] Então eu sei que quando eu fizer um select como esse, fazendo uma igualdade que inclua um campo texto, eu sempre vou colocar essa igualdade em maiúsculo, não preciso me importar e nem saber de antemão como a pessoa que rodou o PL/SQL colocou a palavra atacado. Ao rodar esse comando select, eu sempre vou achar o meu resultado.

SELECT * FROM SEGMERCADO WHERE DESCRICAO LIKE '%Atacado%';

SELECT * FROM SEGMERCADO WHERE DESCRICAO LIKE '%ATACADO%'; -- ERRO

DECLARE
    v_id segmercado.id%TYPE := 2;
    v_descricao segmercado.descricao%TYPE :='Atacado';
BEGIN
    INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_id, upper(v_descricao));
    COMMIT;
END;

DELETE FROM SEGMERCADO WHERE ID LIKE '2';

SELECT * FROM SEGMERCADO;



-- Uso de padrões para gravar dados de texto
Por que é importante usarmos um padrão para salvar os dados textos em uma tabela?
Para não haver problemas na busca de um conteúdo de um campo texto
Alternativa correta! Como o Oracle distingue minúsculas de maiúsculas, se não usarmos um padrão específico (gravar tudo em minúsculos ou em maiúsculos), teremos problemas ao recuperar o dado, já que nunca saberemos como devemos fazer a busca. Assim, ficaremos dependendo da forma com que o campo texto foi digitado e gravado.

------------------------------------------------------------------------------------------------------------------------------------------------------------- Vários comandos em bloco

[00:00] Antes de começar esse vídeo, iremos novamente criar mais um script dentro da conexão CURSO PL SQL e eu vou copiar o nosso PL/SQL do vídeo anterior, vou dar um “Ctrl + C” e vou colar.
[00:23] Vamos a um próximo problema. Quando eu dou o meu SELECT * FROM SEGMERCADO;, e eu mostrei isso para o meu usuário, eu criei os segmentos, varejo e atacado, e o usuário disse: “Não gostei desses nomes”.
[00:51] Na verdade, nós chamamos não varejo, mas sim varejista, e não atacado, nós chamamos de atacadista. Logo, temos que fazer uma alteração. Vamos executar agora o comando update, comando esse que nós aprendemos no curso de manipulação de dados de Oracle, e vamos executar o comando update dentro do nosso PL/SQL.
[01:25] Eu vou abrir um espaço, lembrando que o comando update é UPDATE SEGMERCADO SET, vamos modificar a descrição, então o campo DESCRICAO = e, claro, eu vou colocar ali o valor da nova variável, vou colocar a minha variável v_DESCRICAO.
[02:00] Mas lembrando que sempre quando vamos editar campos texto, vamos sempre usar o upper. Então eu venho antes, usar o meu upper e dentro o valor da variável, (v_DESCRICAO).
[02:17] Mas eu vou fazer isso para quem? Para WHEREI ID =, quem eu vou colocar? O valor da variável ID que está em cima, v_ID;. Eu já vou até tirar o comando insert, ficou assim. Claro que não vai ser atacado, vai ser ’Atacadista’;.
[02:52] Ao fazer isso, ele vai modificar na tabela segmento de mercado o campo descrição, vai modificar para o valor que foi definido em cima, ou seja, atacadista, sempre colocando em maiúsculas, para quem? Somente para o ID que foi definido, ou seja, para o ID 2.
[03:17] Só que também podemos colocar entre o begin e end mais de um comando, de update, de insert, ou seja, podemos colocar vários comandos. Nós vamos aproveitar e fazer a modificação também para o segmento de mercado 1, que está como varejo e, na verdade, tem que ser varejista.
[03:42] Mas eu tenho que antes modificar o valor da variável, porque a variável é inicializada o ID como 2 e o texto como atacadista, nesse ponto que eu marquei está valendo isso, 2 é atacadista, porém antes de rodar o novo update, eu tenho que trocar o valor dessas variáveis.
[04:06] Para trocar eu vou vir aqui, v_ID := 1;. Lembra? O código 1 é o que está na base de dados como varejo e vai virar varejista. E eu vou modificar também a descrição, que vai ser, coloco entre aspas simples, varejista. Ponto e vírgula sempre, todas as linhas de um programa PL/SQL terminam com ponto e vírgula.
[04:46] E depois eu vou executar novamente o mesmo update. Só que ao executar o segundo update, o valor de v_DESCRICAO e de v_ID não será mais esse que está definido em cima, mas, sim, o que está definido dentro das linhas do programa PL/SQL. E depois, esse commit vai confirmar as alterações nas duas linhas da tabela, no ID 1 e no ID 2. Vamos ver se vai funcionar?
[05:29] Seleciono o bloco, vou executar. A princípio não deu nenhum problema. Se eu agora rodo o meu SELECT* FROM SEGMERCADO;, tenho agora a minha tabela com os campos que os meus usuários pediram, 1 varejistas, 2 atacadista.
[05:56] Ficou até meio errado, nós colocamos varejistas e atacadista, ficou faltando um S. Isso não é problema, basta eu vir aqui, vou escrever, colocar o meu S para ficar atacadistas e varejistas, e eu rodo de novo meu comando PL/SQL. Como é um update, ele vai modificar novamente. Rodei, se eu executar o select, agora sim, eu já tenho os meus valores dos campos modificados.


DECLARE
    v_id segmercado.id%TYPE := 2;
    v_descricao segmercado.descricao%TYPE :='Atacadista';
BEGIN
    UPDATE segmercado SET DESCRICAO = upper(v_descricao) WHERE ID = v_id;
    v_id := 1;
    v_descricao := 'Varejista';
    UPDATE segmercado SET DESCRICAO = UPPER(v_descricao) WHERE ID = v_id;
    COMMIT;
END;



DELETE FROM SEGMERCADO WHERE ID LIKE '2';
SELECT * FROM SEGMERCADO;


DECLARE
    v_negocio cadastro_item.negocio%type :='INDUSTRIALIZADOS';
BEGIN
    UPDATE
        cadastro_item
    SET
        negocio = v_negocio
    WHERE
        negocio LIKE '%INDUSTRIALIZADOS / MASSAS%';
    DECLARE
        v_categoria cadastro_item.categoria%type :='LINGUICAS';
    BEGIN
        UPDATE
            cadastro_item                    
        SET
            categoria = v_categoria
        WHERE
            categoria LIKE '%LINGUIÇAS%';
    END;
END;

select distinct negocio from cadastro_item where negocio LIKE '%INDUSTRIALIZADOS%';
select distinct categoria from cadastro_item where categoria LIKE '%LINGUI%';

------------------------------------------------------------------------------------------------------------------------------------------------------------------- Removendo registros

[00:00] Temos então dois segmentos de mercado incluídos na nossa tabela, os varejistas e os atacadistas. A empresa na qual eu estou prestando serviço me pediu para incluir um novo segmento de mercado, os esportistas.
[00:19] Veio essa ordem, então ok, para fazer isso é muito fácil, já temos um script para isso pronto, que construímos nos vídeos anteriores. Então eu vou criar uma nova instância de edição do curso PL/SQL, e eu vou fazer o script de inclusão de mais um novo segmento.
[00:51] Para aproveitarmos, eu vou pegar esse bloco, que foi o bloco que fizemos a dois vídeos atrás, onde entramos com o segmento de mercado atacado, eu vou copiá-lo e nesse meu novo script eu vou colar. E claro, esse segmento de mercado vai ser o segmento 3, vai ser o ’Esportistas;’ e pronto, o comando continua o mesmo.
[01:26] Vamos dar um zoom no código, está lá, eu coloquei 3, coloquei a palavra esportistas e temos o comando insert seguido do commit. Vou selecionar, vou executar.
[01:46] Se eu for em, SELECT * FROM SEGMERCADO;, vamos olhar o conteúdo da tabela, tenho os três segmentos de mercado gravados sempre em maiúsculas.
[02:10] Só que me pediram para fazer a inclusão desse novo segmento de mercado, o pessoal meio indeciso falou: “Não, tira, eu não quero mais o segmento de mercado esportistas”. Então vamos trabalhar agora com o PL/SQL no qual vamos tirar o segmento 3.
[02:35] Vou criar mais um script associado ao CURSO PL SQL e vamos lá. Para fazermos um novo PL/SQL, DECLARE, depois sempre vai ter um BEGIN e depois um END;.
[02:53] Para eu apagar alguém do banco de dados, basta eu saber o código, porque é pelo código que eu vou excluir aquela linha. Eu vou declarar o meu v_ID, vai ser do tipo SEGMERCADO.ID%type e eu vou inicializá-lo, qual é o segmento que queremos excluir? É o segmento 3, então := 3;.
[03:31] Dentro do begin eu vou rodar o comando delete. Novamente, é um comando que foi mostrado para vocês no treinamento de manipulação de dados. DELETE FROM SEGMERCADO, mas eu preciso passar uma condição, porque se eu rodar o comando assim, eu vou limpar a tabela toda. WHERE ID = v_ID;. E claro, vamos dar o nosso COMMIT;. Está aí o programa PL/SQL para excluir o segmento de mercado 3.
[04:18] Vamos selecionar o bloco, vou executar. Executou com sucesso, se eu der um SELECT * FROM SEGMERCADO;, vamos ver agora o conteúdo da tabela, pronto, voltamos a ter somente dois segmentos de mercado, o varejistas e o atacadistas, e o esportistas foi excluído através desse novo programa de PL/SQL.
[04:51] Então vimos nos vídeos dessa aula como eu executo o comando insert, update e delete usando PL/SQL. E chegamos a ver também que podemos colocar vários comandos entre o begin e o end. É isso, até o próximo vídeo.

DELETE FROM SEGMERCADO WHERE ID LIKE '2';
SELECT * FROM SEGMERCADO;

DECLARE
    v_id segmercado.id%TYPE := 3;
    v_descricao segmercado.descricao%TYPE :='Esportistas';
BEGIN
    INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (v_id, upper(v_descricao));
    COMMIT;
END;

DECLARE
    v_id segmercado.id%type :=3;
BEGIN
    DELETE FROM SEGMERCADO WHERE id = v_id;
    COMMIT;
END;


DECLARE
    v_id segmercado.id%type := 5;
    v_descricao segmercado.descricao%type := 'lojista';
BEGIN
    INSERT INTO segmercado (ID, DESCRICAO) VALUES (v_id, UPPER(v_descricao));
    COMMIT;
END;

DECLARE
    v_descricao segmercado.descricao%TYPE := 'lojista';
BEGIN
    DELETE FROM segmercado
    WHERE
        descricao = upper(v_descricao);
    COMMIT;
END;


Nesta aula, aprendemos:
A construir blocos de programas PL/SQL, para a inclusão de registros
A importância de encerrar a transação dentro do PL/SQL quando o mesmo manipular dados em tabela
A criar vários exemplos de PL/SQL, para alterar e excluir dados da tabela
A incluir funções dentro dos comandos PL/SQL
No caso, foi criada uma função para forçar o nome do segmento de mercado a ser todo em letras maiúsculas


------------------------------------------------------------------------------------------------------------------------------------------------------------------ Criação de procedure

[00:00] Na aula passada nós aprendemos a usar o PL/SQL para inserir, alterar e excluir dados da nossa tabela de segmento de mercado.
[00:15] Imagina, toda vez que eu tiver que incluir, por exemplo, novos segmentos de mercado, através dos comandos de PL/SQL, eu vou ter que toda hora ficar copiando esse declare, begin, end e executá-lo? Não fica muito prático.
[00:34] Vamos ver outra forma em que eu posso, de certa maneira, gravar o programa PL/SQL no banco de dados e só chamar esse programa passando parâmetros. Nesse caso, esse programa PL/SQL que vamos salvar no banco de dados, nós vamos chamá-lo de procedures.
[00:58] Vamos fazer um exemplo. Eu vou criar mais uma área de edição, no CURSO PL SQL, e eu vou procurar, lá do vídeo onde incluímos o segmento 3, esportistas, eu vou copiar o bloco PL/SQL de lá e vou colar nessa área vazia. E vou deixá-lo embaixo, porque eu vou agora construir para vocês o programa que vai criar uma procedure com esses comandos que estão embaixo do PL/SQL.
[01:52] O comando para criar procedure tem uma estrutura um pouco diferente do PL/SQL tradicional. O PL/SQL tradicional é declare, begin, end. No caso de procedure, os blocos são CREATE PROCEDURE, IS, BEGIN e END;. Essa é a estrutura básica da criação de uma procedure.
[02:28] Depois do CREATE PROCEDURE, vamos colocar um nome da nossa procedure, esse nome vai ser um nome único que vai ser depois chamado quando quisermos executar essa procedure. E no caso, eu vou chamá-la de incluir_segmercado.
[02:50] Depois que eu coloco o nome, eu tenho que passar parâmetros para a minha procedure. Olhando o programa PL/SQL que está lá embaixo, que é baseado nele que nós vamos construir a procedure, quais são as variáveis que eu inicializo para inserir dados lá na tabela segmercado? É a variável v_ID e a variável v_DESCRICAO. Essas duas variáveis serão parâmetros da nossa procedure.
[03:29] Só que eu não vou chamá-las de “v_ID” nem de “v_DESCRICAO”, temos aí outro padrão. Quando nos referenciamos à variável que é parâmetro de uma procedure, em vez de usar o “v_”, vamos usar o “p_”.
[03:51] Então vou abrir parênteses e eu escrevo o meu primeiro parâmetro, (p_ID, só que em vez de colocar a declaração, eu coloco a palavra IN e o tipo, NUMBER. Coloco uma vírgula e eu entro com p_DESCRICAO IN, o tipo, VARCHAR2).
[04:31] Significa que quando eu for executar esta procedure, eu preciso passar como parâmetros o código do segmento de mercado e o descritor do segmento de mercado que eu quero incluir.
[04:50] A primeira parte da procedure já está pronta. A segunda parte é essa área entre o is e o begin. Essa área é equivalente a esta área do PL/SQL, o declare. Ou seja, eu declaro, depois do is e antes do begin, todas as variáveis que eu vou usar dentro do código PL/SQL da minha procedure.
[05:19] No caso, eu não preciso colocar os “v” como eu coloquei no declare, porque eles já estão representados pelas variáveis “p_”. Como eu só vou manipular essas duas variáveis e as duas variáveis já foram declaradas na chamada da procedure, essa área vai ficar vazia. Mas mesmo que não haja nenhuma variável de trabalho a ser declarada, é necessário você colocar o is e o begin.
[05:57] Eu vou até colar, não tem o is. No begin eu vou rodar o mesmo comando que eu rodo, só que em vez de usar as variáveis “v_”, eu vou usar as variáveis “p_”, então INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (p_ID, upper (p_DESCRICAO));, COMMIT;.
[06:54] Vou apagar o PL/SQL que está embaixo, que eu usei só como esboço. Tenho a minha procedure. Note que na criação da procedure eu não entro com o número do ID nem com a descrição, essa procedure vai ser gravada dentro do meu banco de dados.
[07:17] Então se eu selecionar esta área e rodar, procedure incluída com sucesso. Eu tenho essa mensagem, “Procedure INCLUIR_SEGMERCADO compilado”.
[07:37] Note que do meu lado esquerdo eu tenho uma aba chamada “Procedures”. Se eu vier com o botão direito do mouse sobre ela, der um “Atualizar” e abrir, note que eu tenho agora uma procedure chamada “INCLUIR_SEGMERCADO” dentro do banco de dados.
[08:00] Eu agora posso chamar esta procedure e executá-la passando parâmetros e o que vai acontecer? Os meus comandos PL/SQL serão executados. Como eu executo essa procedure? Assim: EXECUTE INCLUIR_SEGMERCADO (.
[08:30] Note que ao abrir parênteses ele já me escreve, me mostrando os parâmetros que eu tenho que incluir com os seus respectivos tipos.
[08:43] Eu vou incluir o segmento “3,” e o texto desse segmento 3 vai ser, por exemplo, ’Farmaceuticos’);. Eu vou então executar só este comando. Rodei, procedimento concluído com sucesso. Se eu vier e der um SELECT * FROM SEGMERCADO;, vamos ver agora o conteúdo da tabela? Eu já tenho um novo segmento.
[09:29] Eu também posso executar esta procedure sem o EXECUTE, basta eu colocar assim: BEGIN, END, terminando com ponto e vírgula, e dentro do begin e end eu não preciso colocar o comando EXECUTE, basta eu colocar INCLUIR_SEGMENTO, vou adicionar (4, e vamos colocar o segmento, por exemplo, ’Industrial’);. Ficou assim. Também é outra forma de eu chamar a minha procedure. Seleciono esse bloco de comando, executo.
[10:31] Na verdade, eu errei, é INCLUIR_SEGMERCADO, eu botei segmento. Eu vou copiar, vou colar . Isso é que dá querermos fazer os exercícios de cabeça. Vamos lá. Seleciono, vamos ver se agora eu executo com sucesso. Pronto, está embaixo, foi executado com sucesso.
[10:58] Se agora selecionamos o SELECT * FROM SEGMERCADO;, pronto, eu já tenho agora outro segmento industrial. Criamos a nossa primeira procedure usando o código PL/SQL.

CREATE PROCEDURE incluir_segmercado
(p_ID IN NUMBER, p_DESCRICAO IN VARCHAR2)
IS
BEGIN
 INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (p_ID, upper(p_DESCRICAO));
 COMMIT;
END;

EXECUTE INCLUIR_SEGMERCADO(3, 'Farmaceuticos');

SELECT * FROM SEGMERCADO;

BEGIN
   INCLUIR_SEGMERCADO(4, 'Industrial');
END;


 -----------------------------------------------------------  IS e BEGIN
O que deve ser incluído no espaço entre o IS e o BEGIN, na criação de uma procedure?
A declaração de todas as variáveis que serão executadas no programa
Alternativa correta! É para isto que o espaço determinado é usado.


 ----------------------------------------------------------- Procedure, incluir seguimento de mercado 
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


--------------------------------------------------------------------------------------------------------------------------------------------------------------- Manutenção da procedure

[00:00] Vamos falar agora de manutenção das nossas procedures. Para isso eu vou criar um novo script vazio, associado ao CURSO PL SQL, e vou pegar o script anterior, o nosso create procedure, vou copiar e colar nesse novo script.
[00:22] A nossa procedure INCLUIR_SEGMERCADO está funcionando, mas tem um pequeno problema, que foi um problema que nós solucionamos quando fizemos os nossos primeiros programas de PL/SQL, qual é? Na passagem de parâmetro eu estou meio que fixando que ID vai ser number e que descrição vai ser varchar2.
[00:53] Temos aquele velho problema que eu mencionei já, se o DBA altera o tipo de campo lá da tabela, isso pode deixar de funcionar. Então podemos substituir a declaração pelo percent type, da mesma maneira que fizemos quando construímos os nossos primeiros comandos em PL/SQL.
[01:21] Então, em vez de NUMBER, eu vou escrever a tabela SEGMERCADO.ID%type. E , em vez de VARCHAR2, SEGMERCADO.DESCRICAO%type. Está a nova forma de se referenciar na declaração dos parâmetros da minha procedure.
[02:06] Fiz essa alteração, vou executar o meu create. Note que ao executar o create eu tive um erro, óbvio, eu dei um create procedure num nome que já existe, eu não posso criar uma procedure com um mesmo nome que já existe.
[02:33] Como eu resolvo esse problema? Simplesmente em vez de antes do comando create, nós colocamos CREATE OR REPLACE. Ao dar o create or replace, o que o Oracle vai fazer? Se a procedure não existir, ele vai criar. Porém, se a procedure já existir, ele vai alterar.
[03:04] Então d para frente, toda vez que criarmos uma procedure, já vamos usar sempre o CREATE OR REPLACE, porque aí podemos rodar o comando de create de novo, que ele vai estar sempre criando, se não existir, ou substituindo, se já existir.
[03:22] Ao fazer isso ele vai substituir, porque a procedure já existe, só que nessa nova procedure as declarações dos parâmetros estarão usando o percent type. Eu vou selecionar novamente, vou executar, agora sim, a minha procedure foi compilada e modificada com sucesso.
[03:51] Se viermos na procedure que está gravada, INCLUIR_SEGMERCADO, note que ao clicar sobre ela, ele me escreve uma nova aba com o código da procedure. E note que ao olhar o código da procedure, o que ele já me retorna é a procedure modificada com o percent type.
[04:22] Dica: sempre create or replace e o nome da procedure, não vamos usar só o comando create, porque depois, na hora de fazer manutenção, não vamos conseguir recriar a procedure com o novo código.

CREATE OR REPLACE PROCEDURE incluir_segmercado (
    p_id         IN  segmercado.id%TYPE,
    p_descricao  IN  segmercado.descricao%TYPE
) IS
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

-------------------------------------------------- Procedure

Sobre procedures, qual das alternativas abaixo está correta?
Podemos criar procedure que não contenha parâmetros
Alternativa correta! A passagem de parâmetros é opcional, ou seja, podemos ter uma procedure sem parâmetros.


create or replace procedure update_marca
(p_codigo_item IN cadastro_item.codigo_item%type, p_marca IN cadastro_item.marca%type)
IS 
BEGIN
    UPDATE cadastro_item SET marca = upper(p_marca) WHERE codigo_item = p_codigo_item;
    dbms_output.put_line('A Marca foi alterada para :' || p_marca);
    COMMIT;
END;

set serveroutput on;
EXECUTE update_marca(p_codigo_item=>471,p_marca=>'Aurora Premium');

select * from cadastro_item;
>>> A Marca foi alterada para :Aurora Premium
>>> Procedimento PL/SQL concluído com sucesso.

------------------------------------------------------------------------------------------------------------------------------------------------------ Retorno do descritor do segmento

[00:00] Vamos a outro exemplo prático. Nosso usuário da empresa que estamos trabalhando pediu que tivéssemos algo, que eu passasse para o Oracle um parâmetro, e ele me retornasse uma resposta.
[00:20] Exemplo, eu passaria o código do segmento de mercado e esse processo do Oracle me retornaria o nome do segmento. Isso que nós chamamos de eu pedir para o banco fazer algo e me retornar um valor de volta, nós chamamos de função.
[00:43] Olha esse exemplo de cima. Digamos que no canto esquerdo eu tenho o meu programa principal, que possui linhas de código, que estão fazendo alguma coisa, e num determinado momento eu chamo uma procedure, que foi o que nós fizemos no vídeo passado, através do comando execute ou chamando o próprio nome da procedure entre o begin e end.
[01:10] Ao chamar a procedure, a procedure é desviada para outro código que está salvo lá no Oracle e ele executa coisas. Mas eu não sei nada sobre lo que eu executei, é uma caixa preta. Eu chamei a procedure, ele fez coisas ali e depois ele simplesmente volta o retorno do controle do programa para o meu programa principal e eu continuo seguindo a minha vida, independente do que aconteceu lá na procedure.
[01:49] Quando chamamos uma função, o princípio é diferente. Eu desvio o meu programa para um código que já está armazenado, porém, esse código vai fazer coisas e num determinado momento ele vai ter um resultado que vai voltar para o meu programa principal, ou seja, eu vou ter uma resposta àquele programa que eu chamei.
[02:25] Nesse exemplo que o nosso usuário nos requisitou, ou seja, eu quero passar o código e retornar o nome do segmento, é uma função. Como nós criamos funções no Oracle? Vamos por partes.
[02:45] Primeiro vamos fazer o programa PL/SQL, que faz com que eu mande para o código PL/SQL um código e ele me retorne o descritor do segmento de mercado. Eu vou no nosso SQL Developer e eu vou criar um script novo vazio, associado à conexão CURSO PL SQL.
[03:20] Eu vou fazer um programa PL/SQL que simplesmente vai pegar o ID do segmento e vai escrever na minha saída o descritor. Como eu vou então ter que usar aquela função dbms output, eu preciso colocar antes SET SERVEROUTPUT ON, para habilitar para esta sessão o uso da função dbms output.
[03:53] Então eu vou fazer um programa PL/SQL, DECLARE, BEGIN, END;. Vou declarar a minha variável v_ID, que vai ser SEGMERCADO.ID%type e ela vai ser o código que eu vou passar para o meu PL/SQL, para ele me retornar o descritor, vou passar o número 1, ponto e vírgula.
[04:34] Eu tenho a outra variável, que é a variável que vai receber o valor da descrição, então v_DESCRICAO SEGMERCADO.DESCRICAO@type. Preciso inicializar essa variável? Ela não precisa ser inicializada, porque ela que vai receber o valor do descritor. Então não vou inicializá-la, fecho com ponto e vírgula.
[05:09] Antes de fazermos o código interno, vamos relembrar o seguinte, se eu quero verificar o campo descrição da tabela segmercado, o meu select é isso, SELECT DESCRICAO FROM SEGMERCADO WHERE ID = 1;. Se eu rodar esse select, ele me retorna o descritor. Então eu preciso no meu PL/SQL executar esse select e o resultado dele, que é isso, 1 varejistas, jogar nesta variável.
[05:56] Para fazer isso eu vou copiar o comando select que eu fiz, vou até dar um “Ctrl + X” e vou colar. Claro que esse ID não será ID, será a variável que eu passei, v_ID;. Como eu atribuo o resultado deste campo a esta variável? Faço assim, depois do descritor eu uso a cláusula INTO e depois eu coloco a minha variável.
[06:36] Ao fazer isso eu estou jogando o conteúdo deste campo, DESCRICAO, para esta variável, v_DESCRICAO. E claro, eu quero exibir o resultado, dbms_output.put_line(v_DESCRICAO);. Vamos ver se funciona? Vou selecionar esse programa PL/SQL.
[07:14] Desculpe, antes eu vou executar o SET SERVEROUTPUT ON, executei. Eu agora vou rodar o programa PL/SQL. Está lá, ele me escreveu varejistas. Se eu coloco, v_ID SEGMERCADO.ID%type:= o número 2, e executo o meu programa PL/SQL, agora ele escreveu atacadistas.
[07:50] Então eu já tenho o meu programa PL/SQL para poder retornar e escrever o descritor de um segmento de mercado. No caso, o valor desse segmento vai estar atribuído à variável v_DESCRICAO.
[08:17] Só que isso não é uma função, eu ainda tenho que transformar esse programa PL/SQL em uma função. Para isso vocês esperem alguns segundos, que a solução eu vou mostrar não agora, mas sim no próximo vídeo.

DECLARE
    v_id segmercado.id%type := 1;
    v_descricao segmercado.descricao%type;
BEGIN
    SELECT
    ---------- Selecionar
        descricao
    ---------- O CAMPO(S)
    INTO
    ---------- Jogar dentro de:
        v_descricao
    ---------- Variável que irá receber o conteúdo do CAMPO     
    FROM
    ---------- Da Tabela Origem
        segmercado
    ---------- Nome Tabela Origem
    WHERE
    ---------- Onde (filtrar)        
        ID = v_id;
    ---------- Identificador é igual a variável declarada v_id
    dbms_output.put_line( '  ' ||  v_descricao);
END;



DECLARE
    v_id segmercado.id%type := 1;
    v_descricao segmercado.descricao%type;
BEGIN
    SELECT
        descricao
    INTO
        v_descricao
    FROM
        segmercado
    WHERE
        ID = v_id;
    dbms_output.put_line( '  ' ||  v_descricao);
END;



DECLARE
    v_codigo    cadastro_item.codigo_item%type := 471;
    v_descricao cadastro_item.descricao_item%type;
BEGIN
    SELECT
        descricao_item
    INTO
        v_descricao
    FROM
        cadastro_item
    WHERE
        codigo_item = v_codigo;
    dbms_output.put_line(v_codigo || '      ' ||  v_descricao || ' ');
END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------- Criando a função

[00:00] Vamos transformar esse programa PL/SQL em uma função, e aproveitar o código que fizemos. Para isso, nós vamos, em cima, criar outra área de edição associada à conexão CURSO PL SQL, e eu vou pegar o código do PL/SQL que construímos, eu vou copiar e vou colar embaixo como um guia.
[00:34] Para criar a função, estrutura parecida com procedure, CREATE, IS, BEGIN, END;. Parecida não, até aí igual. O comando é CREATE OR REPLACE, lembra? Sempre vamos usar o create or replace, porque podemos estar criando pela primeira vez ou substituindo uma função que já exista.
[01:07] Só que, em vez de ser CREATE OR REPLACE procedure, é CREATE OR REPLACE FUNCTION. O nome da função, obter_descricao_segmercado.
[01:31] Abre parênteses, tem os meus parâmetros. Um único parâmetro que essa função vai receber é o ID, então eu vou colocar (p_ID IN e vamos usar a declaração genérica, SEGMERCADO.ID@type).
[01:58] Note que ao fechar os parênteses, o PL/SQL até já me deu uma dica do que vem a seguir, return. Se eu estivesse criando uma procedure, eu fecharia o parêntese e já iria para a área do is.
[02:16] Mas como é uma função, eu preciso dizer para o Oracle qual vai ser o retorno dessa função, lembra? Função retorna um valor, procedure, não. Procedure eu a chamo, ela vai executar o que está programado na procedure e acabou. Foi o que nós fizemos alguns vídeos atrás, eu chamei a procedure inclui segmento e ele incluiu.
[02:49] Vou pedir para a função, eu quero obter o descritor, ela vai me retornar o quê? O descritor do segmento de mercado. Então no return eu vou dizer não uma variável, mas o tipo de retorno. Eu posso retornar um texto, eu posso retornar um número, eu posso retornar um verdadeiro ou falso, eu posso retornar uma data.
[03:19] Agora vou colocar RETURN e o que eu vou retornar? O descritor. Qual é o tipo do descritor? É o tipo que está na tabela segmercado no campo descrição, então vou colocar SEGMERCADO.DESCRICAO@type.`IS´.
[03:56] Vai ter alguma variável que eu vou manipular? Vamos olhar o nosso código PL/SQL. O v_ID SEGMERCADO.ID%type:=2;, está fazendo papel de parâmetro, então no PL/SQL ele era o v_ID, na função ele é o p_ID.
[04:14] Mas, eu preciso desta variável v_DESCRICAO, que vai receber o descritor do segmento de mercado. Ela foi declarada e não tem inicialização, mas será manipulada pela minha função. Logo, dentro do IS eu vou ter o meu v_DESCRICAO SEGMERCADO.DESCRICAO@type. Preciso então declarar essa variável dentro da área entre is e o begin.
[05:00] Dentro da função eu vou ter que rodar o select e jogar para a variável v_DESCRICAO o valor da descrição. Já fizemos embaixo, então eu só vou copiar essa linha, SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = v_ID;, e colocar aqui. A única diferença é que, na igualdade, não é o “v”, porque o que eu vou usar é o parâmetro da função, então, eu só vou trocar pelo “p”.
[05:37] Só que está faltando uma coisa, eu preciso dizer para a função que você deve cuspir para fora, ou seja, quem me chamou precisa receber o quê? Ele não precisa receber alguém desse tipo, SEGMERCADO.DESCRICAO@type? E esse valor desse tipo está em que variável? Está na variável v_DESCRICAO. Então eu preciso colocar embaixo o comando RETURN v_DESCRICAO.
[06:16] Então, pronto, eu vou apagar esse código que está aqui, vamos recapitular o que fizemos.
[06:26] CREATE OR REPLACE FUNCTION, o nome da função. Passo como parâmetro, declaro como é o retorno dessa função, declaro a variável de trabalho que eu vou manipular dentro do meu código PL/SQL, faço o select usando o INTO, jogando o resultado do select para a variável v_DESCRICAO e passando como parâmetro de filtro o p_ID, que foi declarado na entrada da função. E depois eu dou o meu return, onde eu vou voltar para quem chamou a função o valor de v_DESCRICAO.
[07:18] Então digamos assim, a princípio parece que a minha função está legal. Vamos selecionar e executar. Funcionou com sucesso. Se olharmos na árvore da esquerda, eu tenho também a minha aba “Funções”. Botão direito do mouse, “Atualizar”. Se eu abrir, já tenho também a minha função criada.
[07:56] E como eu, por exemplo, executo uma função? No caso da procedure, eu tenho o execute. No caso da minha função, eu tenho que chamar de uma maneira um pouco diferente, mas a forma com que vamos usar a função eu vou mostrar para vocês no próximo vídeo.

---------------------------- Características das funções:
As rotinas que recebem parâmetros de entrada, mas têm que devolver um só valor, devem ser implementadas através de funções.
Sobre as funções, quais das alternativas abaixo são verdadeiras?
A função só deve ter parâmetros de entrada

Uma das principais características das funções é receber valores através de parâmetros e devolver um só valor, assim os parâmetros só podem ser de entrada.
A cláusula RETURN do cabeçalho determina qual é o tipo de dado retornado da função
Alternativa correta! A cláusula RETURN do cabeçalho irá indicar qual é o tipo de dado de retorno da função, ou seja, a variável do ambiente externo que receberá o valor da função também terá que ser do mesmo tipo de dado.



CREATE OR REPLACE FUNCTION obter_descricao_segmercado (
    p_codigo IN cadastro_item.descricao_item%TYPE
) RETURN cadastro_item.descricao_item%TYPE
IS
    v_descricao cadastro_item.descricao_item%TYPE;
BEGIN
    SELECT
        descricao_item
    INTO v_descricao
    FROM
        cadastro_item
    WHERE
        codigo_item = p_codigo;

    RETURN v_descricao;
END;



CREATE OR REPLACE FUNCTION obter_descricao_segmercado (
    p_id IN segmercado.id%TYPE
)
RETURN
    segmercado.descricao%TYPE
IS

    /*   -----------------------------------------------------------
    PROCEDURE   : Obter_descricao_segmercado
    DESCRIÇÃO   : Seleciona a descrição da tabela de Cadastro de Item
    PARÂMETROS  : p_id -> ENTRADA. Código utilizado como parâmetro na busca da descrição  
    VARIÁVEIS   : v_descricao -> Variável utilizada para armazenar o valor de retorno da Query.
    DATA CRIAÇÃO: 30/04/2022 as 20:55 Hrs.
    ------------------------------------------------------------- */

    v_descricao segmercado.descricao%TYPE;
BEGIN
    SELECT
        descricao
    INTO 
        v_descricao
    FROM
        segmercado
    WHERE
        id = p_id;
    RETURN v_descricao;
    COMMIT;
END;


CREATE OR REPLACE FUNCTION selecionar_item (
    p_codigo_item IN cadastro_item.codigo_item%TYPE
) RETURN
    cadastro_item.descricao_item%TYPE
IS
    v_descricao cadastro_item.descricao_item%TYPE;
BEGIN
    SELECT
        descricao_item
    INTO v_descricao
    FROM
        cadastro_item
    WHERE
        codigo_item = p_codigo;
    RETURN v_descricao;
END;


------------------------------------------------------------------------------------------------------------------------------------------------------------------- Executando a função

[00:00] Vamos executar a nossa função e testar se está funcionando direito, se realmente, ao chamar a função obter_descricao_segmercado, eu recebo como resposta o descritor do mercado que eu vou passar como parâmetro.
[00:20] Para isso, claro, vamos criar um novo script associado à nossa conexão CURSO PL SQL, e eu vou fazer a chamada dessa função de duas madeiras. Primeiro, eu vou utilizar comandos de SQL Developer, isso mesmo.
[00:42] O Oracle SQL Developer possui dentro dessa área uma sintaxe de comandos que é dele mesmo, então o que eu vou rodar não são comandos de PL/SQL, eu estou rodando comandos do Oracle SQL Developer, e um desses comandos vai ser a chamada da função.
[01:06] O primeiro comando de Oracle SQL Developer é o comando VARIABLE. Vou criar uma variável e vou dar um nome para ela, vou colocar g_DESCRICAO. Por que “g_”? Novamente, é um padrão. Quando utilizarmos variáveis de Oracle SQL Developer, vamos usar “g_”. E eu vou dar o tipo dessa variável, por exemplo, VARCHAR2(100).
[01:45] Ao executar esse comando, essa variável vai ficar na memória e atenção, não é na memória do Oracle, é na memória do SQL Developer.
[02:00] Depois eu vou usar o outro comando, que se chama EXECUTE, e quando eu uso o comando execute, isso realmente é sintaxe do Oracle SQL Developer, eu coloco : g_DESCRICAO:=, então vai receber nessa variável o quê? Agora sim, vou chamar a minha função, obter_descricao_segmercado(.
[02:41] Note que ao abrir parênteses ele já me dá uma dica, qual é o tipo de parâmetro que eu tenho que colocar. Vou colocar o 1, fecho parênteses. E o terceiro comando de Oracle SQL Developer é o PRINT g_DESCRICAO.
[03:09] Vou declarar a variável. Seleciono a primeira linha, executo. Vou agora atribuir a essa variável o resultado da função. Agora vou ver o conteúdo da variável g_DESCRICAO. Está lá, varejistas, ou seja, passei o número 1, retornou varejistas.
[03:37] Se eu colocar o número 3, vou executar essa segunda linha de novo, vou dar um print agora, retornou farmacêuticos, que é o número 3. Essa foi a primeira maneira.
[03:56] A segunda maneira é utilizando PL/SQL. E também eu vou usar novamente a dbms_output para mostrar o valor de uma variável. Como eu vou usar o dbms_output, eu começo com SET SERVEROUTPUT ON. Agora estou construindo um código PL/SQL. DECLARE, BEGIN, END;.
[04:33] No declare eu vou declarar uma variável que vai receber o retorno da função, então vou chamar de v_DESCRICAO, ela vai ser do tipo SEGMERCADO.DESCRICAO@type;, dentro do código PL/SQL.
[05:00] Eu vou atribuir um valor a essa variável, só que em vez de colocar o valor dela, eu chamo a função, obter_descricao_segmercado(2);. E agora vou imprimir, vou exibir o conteúdo da variável v_DESCRICAO, dbms_output.put_line(.
[05:44] E em vez de exibir pura e simplesmente o conteúdo da variável, eu posso escrever um texto mais amigável, ‘A Descrição do Segmento de Mercado é’, fecho esse texto e concateno com o conteúdo da variável v_DESCRICAO.
[06:13] Lembrando, vimos isso no curso, se eu não me engano, consultas avançadas, que ||, dois pipes juntos, é o comando de concatenação do Oracle. Então vou concatenar esse texto com o conteúdo da variável v_DESCRICAO);.
[06:47] Primeiro eu vou executar o SERVEROUTPUT ON, executei. Eu agora vou executar o programa PL/SQL. Está aqui, olha o que ele escreveu, “A Descrição do Segmento de Mercado é ATACADISTAS”.
[07:09] Foram duas formas de chamarmos e testarmos a função, uma usando comandos do próprio Oracle SQL Developer, são comandos que não são do Oracle nem do PL/SQL. E depois fizemos um bloco em PL/SQL, chamando a função, jogando para uma variável e depois exibimos o conteúdo dessa variável para fora, dentro do meu ambiente do SQL Developer. Então é isso, até o próximo vídeo.

CREATE OR REPLACE FUNCTION obter_descricao_segmercado (
    p_id IN segmercado.id%TYPE
) RETURN segmercado.descricao%TYPE IS
    v_descricao segmercado.descricao%TYPE;
BEGIN
    SELECT
        descricao
    INTO v_descricao
    FROM
        segmercado
    WHERE
        id = p_id;

    RETURN v_descricao;
    COMMIT;
END;


VARIABLE g_descricao VARCHAR2(100);

EXECUTE :g_descricao:=obter_descricao_segmercado(1);

PRINT g_descricao;

select * from segmercado;

----------------------------------------------------

SET SERVEROUTPUT ON;

DECLARE
    v_descricao segmercado.descricao%TYPE;
BEGIN
    v_descricao := obter_descricao_segmercado(3);
    dbms_output.put_line('O Segmento de Mercado para o Código procurado é: ' || v_descricao);
END;

>>> O Segmento de Mercado para o Código procurado é: ESPORTIVO
>>> Procedimento PL/SQL concluído com sucesso.

Temos a seguinte função, que retorna um número:
RETORNA_NUMERO()
Como é a forma correta de usá-la em um programa PL/SQL?

DECLARE
    v_Valor Number;
BEGIN
    v_Valor := RETORNA_NUMERO();
END

------------------------------------------------------------------------------------------------------------------------------------------------------- Consolidando o seu conhecimento

2) Digite e execute o seguinte texto para criar uma procedure:

CREATE PROCEDURE incluir_segmercado (
    p_ID IN NUMBER, 
    p_DESCRICAO IN VARCHAR2
)
IS
BEGIN
    INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (p_ID, upper(p_DESCRICAO));
    COMMIT;
END;COPIAR CÓDIGO
3) Para executar a procedure, digite o seguinte comando:

EXECUTE INCLUIR_SEGMERCADO(3, 'Farmaceuticos');COPIAR CÓDIGO
4) Execute.

5) Verifique o conteúdo da tabela novamente. Para isso, digite e execute:

SELECT * FROM SEGMERCADO;COPIAR CÓDIGO


6) Digite o seguinte código:

BEGIN
    INCLUIR_SEGMERCADO(4, 'Industrial');
END;COPIAR CÓDIGO
7) Verifique o conteúdo da tabela novamente. Para isso, digite e execute:

SELECT * FROM SEGMERCADO;COPIAR CÓDIGO

9) Digite e execute o seguinte código, para fazer uma manutenção da procedure:

CREATE OR REPLACE PROCEDURE incluir_segmercado (
    p_ID IN SEGMERCADO.ID%type, 
    p_DESCRICAO IN SEGMERCADO.DESCRICAO%type
)
IS
BEGIN
    INSERT INTO SEGMERCADO (ID, DESCRICAO) VALUES (p_ID, upper(p_DESCRICAO));
    COMMIT;
END;

11) Para habilitar a escrita na área de saída do SQL Developer, por parte de uma função ou procedure, digite e execute:

SET SERVEROUTPUT ONCOPIAR CÓDIGO
12) Digite e execute o código abaixo:

DECLARE
    v_ID SEGMERCADO.ID%type:=2;
    v_DESCRICAO SEGMERCADO.DESCRICAO%type;
BEGIN
    SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = v_ID;
    dbms_output.put_line(v_DESCRICAO);
END;

15) Digite e execute o seguinte código para criar a função:

CREATE OR REPLACE FUNCTION obter_descricao_segmercado (
    p_ID IN SEGMERCADO.ID%type
)
RETURN SEGMERCADO.DESCRICAO%type
IS
    v_DESCRICAO SEGMERCADO.DESCRICAO%type;
BEGIN
    SELECT DESCRICAO INTO v_DESCRICAO FROM SEGMERCADO WHERE ID = p_ID;
    RETURN v_DESCRICAO;
END;COPIAR CÓDIGO

16) Crie um novo script para editar comandos Oracle, associados à conexão criada na aula anterior, em:
Observação: Você somente irá selecionar esta conexão se, no passo 25, do Consolidando o seu conhecimento da aula 1, você escolheu permanecer na conexão criada para este treinamento. Se você decidiu usar a conexão padrão criada durante a instalação, escolha uma nova área de edição nesta nova conexão.
No caso do vídeo, a conexão é:

17) Digite e execute o seguinte comando, para criar uma variável:

VARIABLE g_DESCRICAO VARCHAR2(100)COPIAR CÓDIGO
18) Para chamar a função criada e atribuir seu valor à variável, digite e execute:

EXECUTE :g_DESCRICAO:=obter_descricao_segmercado(3)COPIAR CÓDIGO
19) Verifique o conteúdo da variável. Para isso, digite e execute:

PRINT g_DESCRICAOCOPIAR CÓDIGO
20) Verifique se você chegou em um resultado similar a:



21) Para habilitar a escrita na área de saída do SQL Developer, por parte de uma função ou procedure, digite e execute:

SET SERVEROUTPUT ONCOPIAR CÓDIGO
22) Digite e execute o seguinte código:

DECLARE
    v_DESCRICAO SEGMERCADO.DESCRICAO%type;
BEGIN
    v_DESCRICAO := obter_descricao_segmercado(2);
    dbms_output.put_line('A Descrição do Segmento de Mercado é ' || v_DESCRICAO);
END;

A Descrição do Segmento de Mercado é VAREJISTA
Procedimento PL/SQL concluído com sucesso.


DECLARE
    v_descricao cadastro_item.descricao_item%type;
BEGIN
    v_descricao := selecionar_item(p_codigo_item=>472);
    dbms_output.put_line('A Descrição do Item é ' || v_DESCRICAO);
    commit;
END;

>>> A Descrição do Segmento de Mercado é SUI IND LING FININHA APIMENTADA AURORA
>>> Procedimento PL/SQL concluído com sucesso.

Nesta aula, aprendemos:
A criar procedures
A modificar uma procedure, usando o comando CREATE OR REPLACE PROCEDURE
O conceito de funções, sua criação e execução

----------------------------------------------------------------------------------------------------------------------------------------------------------- Manipulando tabela clientes

[00:00] Nós, até agora, trabalhamos com a tabela “segmercado”, onde incluímos vários segmentos de mercado. Vamos agora manipular a tabela de clientes.
[00:11] Mas, antes disso, vamos entender quais são os campos da tabela de clientes e saber como vamos incluir dados nela. E claro, o objetivo é fazer uma procedure que inclua dados na tabela de clientes.
[00:26] Em “Tabelas”, vamos abrir a nossa tabela de clientes. Temos sete campos, o campo ID é o código do cliente, é um código interno da empresa. A razão social é o nome do cliente. O CNPJ é o número fiscal do cliente, é o número do CNPJ da empresa. Segmercado ID é o segmento de mercado.
[01:01] E lembre-se, existe uma chave estrangeira entre segmercado ID na tabela de clientes e o ID da tabela segmercado. Então o código do segmercado ID que eu colocar na tabela de clientes tem que ser um código que já exista na tabela segmercado.
[01:25] Eu tenho a data da inclusão, que é a data onde o cliente vai ser incluído. O faturamento previsto, que é quanto eu acho que eu vou faturar com esse cliente. E a categoria é uma propriedade que vai estar diretamente ligada ao faturamento previsto. Se o faturamento previsto estiver entre uma determinada faixa de valores, eu tenho uma categoria, se estiver entre outra faixa de valores, eu tenho outra categoria.
[02:00] Por enquanto nós vamos fazer a nossa procedure de inclusão de clientes e vamos ignorar categoria por enquanto, depois mais a frente vamos tratá-la. No caso, todo mundo vai entrar com uma categoria constante. Então vamos construir a nossa procedure para incluir dados na tabela de clientes.
[02:25] Vou criar uma nova área de edição associada à conexão CURSO PL SQL. Nosso objetivo é construir uma procedure, então nós temos o CREATE, o IS, o BEGIN e o END;.
[02:52] Create, já aprendemos isso, sempre CREATE OR REPLACE PROCEDURE, o nome da procedure, incluir_cliente. Vou agora passar parâmetros. Os parâmetros que eu vou passar são os dados que eu vou incluir na tabela de clientes.
[03:15] E eu vou incluir como parâmetros todos, exceto data da inclusão, porque a data da inclusão vai ser sempre a data do computador e exceto categoria, que por enquanto eu não vou tratá-la, vai ser um valor constante.
[03:37] Vamos escrever os parâmetros. Nós temos o parâmetro: (p_ID IN CLIENTE.ID@type, p_RAZAO_SOCIAL IN CLIENTE.RAZAO_SOCIAL@type, p_CNPJ IN CLIENTE.CNPJ@type, p_SEGMERCADO_ID IN CLIENTE.SEGMERCADO_ID%type,
[04:47] Próximo campo, data da inclusão, eu não vou usar como parâmetro, é o faturamento previsto: p_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%type)
[05:15] Então vamos lá, cliente ID, cliente razão social, cliente CNPJ, cliente segmercado_id, cliente faturamento previsto. Ok. Quando escrevemos a coisa muito assim, sempre temos que prestar atenção para não cometer erros.
[05:39] Entre o is e o begin eu não vou colocar nada, porque eu não tenho nenhuma variável de trabalho por enquanto. Dentro eu vou dar o meu insert: INSERT INTO CLIENTE (ID, RAZAO_SOCIAL, CNPJ, SEGMERCADO_ID, DATA_INCLUSAO, FATURAMENTO_PREVISTO, CATEGORIA)
[06:27] Comando insert, vem o VALUES e agora os valores na mesma ordem da declaração dos campos da tabela. Vamos colocar as variáveis, (p_ID, p_RAZAO_SOCIAL, p_CNPJ, p_SEGMERCADO_ID,. Data inclusão não é parâmetro, mas é a data do computador, então eu vou entrar com o campo SYSDATE,.
[07:10] Faturamento previsto, p_FATURAMENTO_PREVISTO, e a categoria, como eu falei, vou usar um valor constante por enquanto. Eu vou colocar então ’00000’);. E depois, claro, COMMIT;.
[07:40] Será que está legal? Vamos ver. Vou selecionar esse bloco e vou rodar. Não deu nenhum erro, milagre. “Procedure INCLUIR_CLIENTE compilado”. Vamos ver. Em “Procedures”, se eu der um “Atualizar”, eu abro, já tenho a minha “INCLUIR_CLIENTE” dentro.
[08:08] Vamos executar, EXECUTE incluir_cliente e eu vou colocar como parâmetro somente os dados pertinentes ao insert. Vou colocar (2, que é o ID do cliente, entre aspas simples vou botar o nome do cliente, ’SUPERMERCADO IJK’,. Qual é o próximo parâmetro? O terceiro parâmetro é o CNPJ, vou colocar ’67890’,.
[08:58] O próximo campo é o segmercado, e lembrando que segmercado tem que ser um segmercado que foi incluído na tabela de segmentos, vou colocar 1,. Depois eu vou entrar com o faturamento previsto, 90000);.
[09:32] Vou executar, executado com sucesso. Vamos dar um SELECT * FROM CLIENTE;. Se executarmos, funcionou. Temos o ID 2, temos o supermercado IJK, temos o CNPJ, temos o ID do mercado, temos a data, que é a data de hoje, onde eu estou gravando o curso, o faturamento previsto e a categoria, um valor constante.
[10:23] Já temos a nossa rotina para incluir clientes. No próximo vídeo vamos tratar do problema da categoria. Vamos fazer um procedimento que vai determinar a categoria baseada no faturamento previsto.



CREATE OR REPLACE PROCEDURE incluir_cliente (
    p_id cliente.id%type,
    p_razao cliente.razao_social%type,
    p_cnpj cliente.cnpj%type,
    p_segmercado cliente.segmercado_id%type,
    p_fat_previsto cliente.faturamento_previsto%type
)
IS
BEGIN
    INSERT INTO CLIENTE (ID, RAZAO_SOCIAL, CNPJ, SEGMERCADO_ID, DATA_INCLUSAO, FATURAMENTO_PREVISTO, CATEGORIA)
    VALUES (p_id, p_razao, p_cnpj, p_segmercado, SYSDATE, p_fat_previsto, '000000');
    COMMIT;
END;

SQL >>> EXECUTE incluir_cliente(2, 'Sup', '777222989100', 1, 90000);

EXECUTE incluir_cliente(p_id=>3,p_razao=>'Fernandes S.A.',p_cnpj=>'12345678910',p_segmercado=>3,p_fat_previsto=>8000);

---------------- Vantagens das procedures
Dentre as possíveis vantagens abaixo, sobre o armazenamento de procedures no banco de dados, quais são verdadeiras?
Manutenção: Se modificamos uma regra de negócio, automaticamente, todos os programas PL/SQL que usam estas procedures também irão herdar esta modificação.
Segurança: Código interno da procedure é protegido. O analista que a desenvolveu vai colocar as regras de negócio lá dentro e o usuário que executá-la não poderá modificá-la.


------------------------------------------------------------------------------------------------------------------------------------------------------------------ Obtendo a categoria

[00:00] Meu usuário me definiu que se o faturamento previsto do cliente estiver entre 0 e 10 mil, ele é um cliente pequeno. Se ele estiver entre 10 mil e 50 mil, é um cliente médio. Entre 50 e 100 mil, um cliente médio grande e maior que 100 mil, um cliente grande. Foi essa a definição que o meu usuário me passou.
[00:32] Eu vou fazer uma função em que eu entro com faturamento e ela me retorna a classificação do cliente. E depois eu vou usar essa função na nossa procedure, para quando incluirmos um cliente que a categoria seja inclusa de maneira correta.
[00:57] Vamos ao SQL Developer, eu vou criar um novo editor associado à conexão CURSO PL SQL. Vamos fazer originalmente um código PL/SQL para saber como eu vou achar a categoria do cliente, e depois o transformamos em função. DECLARE, BEGIN, END;.
[01:39] Eu vou entrar com uma variável que eu vou chamar de v_FATURAMENTO_PREVISTO, que o tipo dessa variável vai ser CLIENTE.FATURAMENTO_PREVISTO%type. E eu vou entrar, por exemplo, com o valor :=12000;. Vou ter outra variável que eu vou chamar de v_CATEGORIA, que vai ser do tipo CLIENTE.CATEGORIA%type;.
[02:42] Como eu vou fazer isso? Eu vou usar um if, PL/SQL tem if. E lembra? Lá no começo desse treinamento, o objetivo da Oracle em criar o PL/SQL é criar uma linguagem estruturada, coisa que o SQL nativo não possui, e ifs, ou seja, testes para saber o que fazer é uma estruturação de programação.
[03:10] Eu vou começar o quê? Vai começar como IF o meu teste, então eu vou ver se v_FATURAMENTO_PREVISTO, se ele for menor que 10 mil, < 10000 THEN, e dentro eu vou dizer que v_CATEGORIA := ‘PEQUENO’;.
[04:08] E o que eu faço? Eu tenho o else if. ELSEIF v_FATURAMENTO_PREVISTO, se ele for menor que 50 mil, < 50000 THEN. Eu vou copiar, porque na digitação nós sempre acabamos errando o nome, v_CATEGORIA := ‘MÉDIO’;.
[05:04] Na verdade, não é ELSEIF, é ELSIF, isso é muito importante. Eu mesmo confundo, porque normalmente nas linguagens de programação é ELSIF, tudo junto, você não toca a letra E. Nuanças de quando aprendemos várias linguagens de programação diferentes, as coisas nem sempre são iguais, são parecidas. No caso, é ELSIF.
[05:37] Como eu percebi que estava errando? Porque ele estava assim, ELSEIF, e ele estava me escrevendo uma linha vermelha dizendo: “Tem algum erro aí”, eu bati o olho e lembrei, é ELSIF.
[05:57] Vou copiar esse trecho, colar embaixo. Quando ele for menor ou igual a 100 mil é o ’MÉDIO GRANDE’;. E eu tenho depois o else (sim eu uso else). Com o ELSE, eu vou dizer que a categoria vai ser ‘GRANDE’;. E eu termino o if com END IF;. Só que é um end if separado, tem um espaço entre o end e o if.
[06:53] Para vermos se isso realmente vai funcionar, vamos fazer aquela técnica que estamos fazendo, vou colocar o SET SERVEROUTPUT ON, vamos rodar e no final eu vou dar um dbms_output.put_line, eu vou escrever (‘A Categoria é ‘ || v_CATEGORIA);.
[07:45] Será que está certo? Vou rodar o SET SERVEROUTPUT, rodei, agora vou rodar o bloco de PL/SQL. Está lá, “A Categoria é MÉDIO”, por quê? Porque o faturamento foi 12 mil, ele está maior que 10 mil e menor que 50 mil. Se eu colocar 65000;, vou rodar, deu médio grande.
[08:36] Fizemos o PL/SQL mostrando como funciona o if, onde escolhemos qual é a categoria específica que nós vamos trabalhar. No próximo vídeo vamos transformar em função.


DECLARE
	v_faturamento_previsto cliente.faturamento_previsto%type := 9000;
    v_categoria cliente.categoria%type;
BEGIN
    IF v_faturamento_previsto < 10000 THEN
        v_categoria := 'PEQUENO';
    ELSIF v_faturamento_previsto < 50000 THEN
        v_categoria := 'MÉDIO';
    ELSIF v_faturamento_previsto < 100000 THEN
        v_categoria := 'MÉDIO GRANDE';
    ELSE
        v_categoria := 'GRANDE';
    END IF;
    
    dbms_output.put_line('A categoria é :' || v_categoria);
END;

>>> A categoria é :PEQUENO
>>> Procedimento PL/SQL concluído com sucesso.



IF-THEN-ELSE
Temos uma variável chamada v_Idade, que representa a idade de uma pessoa. Estamos fazendo um sistema de controle de acesso a uma casa noturna, onde as regras são as seguintes:

Pessoas menores de 16 anos não entram na casa noturna
Pessoas menores de 18 anos entrão somente com a presença dos pais
Pessoas com 18 anos ou mais estão liberados a frequentar a casa noturna
Como deve ser o código de PL/SQL, que escreve em outra variável chamada v_Saida, um texto que diga o deve ser feito, para cada caso, conforme a idade da pessoa.

IF v_Idade < 16 THEN
    v_Saida := 'Não pode entrar.';
ELSIF v_Idade < 18 THEN
    v_Saida := 'Pode entrar, mas somente com a presença dos pais.';
ELSE 
    v_Saida := 'Entrada liberada.';
END IF;



-------------------------------------------------------------------------------------------------------------------------------------------------------- Função para obter a categoria

[00:00] Vamos transformar esse nosso PL/SQL, que consegue retornar a categoria em função. Vou criar uma nova área de edição usando a conexão CURSO PL SQL e eu vou voltar no script anterior e vou copiar o nosso código PL/SQL, vou colar para tê-lo como guia.
[00:32] CREATE, IS, BEGIN e END;. CREATE OR REPLACE FUNCTION e vamos criar a função categoria_cliente. E vamos passar como parâmetro o faturamento previsto, (p_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%type, é o único parâmetro que a função tem. E ele vai retornar a categoria, RETURN CLIENTE.CATEGORIA%type.
[01:40] Não tenho nenhuma variável de trabalho, então no begin eu vou pegar esse bloco que nós temos, vou copiar e vou colar dentro. Só que em vez de usar v_FATURAMENTO_PREVISTO, eu vou usar o p.
[02:09] Eu tenho essa variável v_CATEGORIA . Dentro do is e do begin vou botar v_CATEGORIA e preciso declará-la, ela vai ser o quê? O tipo, CLIENTE.CATEGORIA%type;. Então ele vai receber a categoria e no final, como é uma função, eu tenho que rodar o RETURN v_CATEGORIA;.
[02:57] Vou apagar o PL/SQL que usamos como guia. A princípio eu acho que está legal, vamos selecionar e executar.
[03:13] Criou a função, se eu vier em “Funções” e der um “Atualizar”, temos a função categoria cliente funcionando, podemos fazer um teste, usando alguns comandos do Oracle SQL Developer.
[03:34] Eu vou voltar para o meu script e eu vou rodar. VARIABLE g_CATEGORIA VARCHAR2(100);. Depois eu vou colocar o EXECUTE :g_CATEGORIA := a função, que é a categoria_cliente, abre parênteses, passo o valor do faturamento, (110000);. Depois eu dou o comando PRINT g_CATEGORIA;.
[04:32] Vou rodar a criação da variável no ambiente Oracle SQL Developer, vou atribuir a variável à função e vou dar um print. Está lá, grande.
[04:58] Já tem então a minha função substituindo o código PL/SQL, o que vamos fazer no próximo vídeo é usar agora a função na procedure para incluir clientes.


CREATE OR REPLACE FUNCTION categoria_cliente
(p_faturamento_previsto IN cliente.faturamento_previsto%type)
RETURN cliente.categoria%type
IS
    /*   -----------------------------------------------------------
    FUNCTION    : categoria_cliente
    DESCRIÇÃO   : devolver a categoria que o cliente ocupa conforme o faturamento previsto
    PARÂMETROS  : p_faturamento_previsto -> ENTRADA. valor que será utilizado como argumento da função  
    VARIÁVEIS   : v_categoria -> Variável utilizada para armazenar e retornar a categoria.
    DATA CRIAÇÃO: 30/04/2022 as 20:55 Hrs.
    ------------------------------------------------------------- */
    
    v_categoria cliente.categoria%type;
BEGIN
    IF p_faturamento_previsto < 10000 THEN
        v_categoria := 'PEQUENO';
    ELSIF p_faturamento_previsto < 50000 THEN
        v_categoria := 'MÉDIO';
    ELSIF p_faturamento_previsto < 100000 THEN
        v_categoria := 'MÉDIO / GRANDE';
    ELSE
        v_categoria := 'GRANDE';
    END IF;
    RETURN v_categoria;
    COMMIT;    
END;



VARIABLE g_CATEGORIA VARCHAR2(100);

EXECUTE :g_CATEGORIA := categoria_cliente(100000);

PRINT g_CATEGORIA;

G_CATEGORIA
--------------------------------------------------------------------------------
GRANDE



-------------------------------------------------------------------------------------------------------------------------------------------------------------- Completando a procedure

[00:00] Vamos agora completar nossa procedure. Para podermos modificar a procedure faremos o seguinte, vamos em “Procedures”, à esquerda, e eu vou clicar sobre “INCLUIR_CLIENTE”.
[00:19] Ao clicar sobre “INCLUIR_CLIENTE” eu tenho o código original da minha procedure. Eu vou copiar esse código e nós vamos criar um novo script usando a conexão CURSO PL SQL e vou colar esse código. Esse é o código original que nós fizemos no primeiro vídeo dessa aula, incluindo dados de cliente.
[00:46] Só que nós colocamos categoria como sendo uma constante, o que precisamos fazer agora é fazer com que essa categoria seja o resultado da função. Primeira coisa, eu vou criar aqui dentro, depois do is, uma variável de trabalho que vai ser a v_CATEGORIA. E ela vai ser do tipo CLIENTE.CATEGORIA%type;.
[01:29] Antes do insert eu vou colocar v_CATEGORIA :=, ela vai receber o quê? O valor da função, a função é a categoria_cliente, abre parênteses e eu passo qual parâmetro? O faturamento previsto. E onde está o faturamento previsto? Está nesta variável, p_FATURAMENTO_PREVISTO, que é parâmetro da procedure. Eu vou copiá-la, vou colocar ponto e vírgula.
[02:08] E agora no meu insert, em vez de eu usar uma constante, eu vou usar o valor da variável v_CATEGORIA. Vou modificar essa procedure, procedure modificada, vamos dar um SELECT * FROM CLIENTE, nós temos aquele cliente que incluímos, eu vou limpar a tabela. DELETE FROM CLIENTE. Pronto, a tabela está limpa.
[02:59] Agora eu vou inserir de novo um cliente, porém agora a categoria será inclusa da maneira correta, conforme o resultado da minha função. Se eu der um EXECUTE incluir_cliente, eu vou colocar o ID, (2,, a razão social, ’SUPERMERCADO IJK’,, o CNPJ, ’67890’,. O próximo parâmetro é o segmento de mercado, vou colocar 1, e depois o faturamento previsto, 90000);.
[04:02] Vamos rodar agora a procedure. Ela foi rodada com sucesso, está aqui a mensagem. Se eu agora der um select, ok, incluiu. E notem que interessante, a categoria já foi colocada conforme o faturamento que foi colocado.
[04:31] Minha procedure de inclusão de cliente está completa, a data é a data do computador e a categoria é conforme a faixa de valores definida na função, e que usa como parâmetro o faturamento previsto que eu entro como parâmetro dentro da procedure incluir cliente.

create or replace PROCEDURE incluir_cliente (
    p_id cliente.id%type,
    p_razao cliente.razao_social%type,
    p_cnpj cliente.cnpj%type,
    p_segmercado cliente.segmercado_id%type,
    p_fat_previsto cliente.faturamento_previsto%type
)
IS
    v_categoria cliente.categoria%type;
BEGIN
    v_categoria := categoria_cliente(p_faturamento_previsto=>p_fat_previsto);

    INSERT INTO CLIENTE (ID, RAZAO_SOCIAL, CNPJ, SEGMERCADO_ID, DATA_INCLUSAO, FATURAMENTO_PREVISTO, CATEGORIA)
    VALUES (p_id, p_razao, p_cnpj, p_segmercado, SYSDATE, p_fat_previsto, v_categoria);
    COMMIT;
END;

select * from cliente;
delete from cliente;

EXECUTE incluir_cliente(p_id=>2,p_razao=>'Supermercados Alexandria',p_cnpj=>3212400982,p_segmercado=>1,p_fat_previsto=>50000);

--------------------------------------------------------------------------------------------------------------------------------------------------------- Procedure retornando valores

[00:00] Vamos continuar estudando. O nosso usuário, que está nos especificando as nossas rotinas a serem implementadas no Oracle, me disse que quando gravarmos os dados do CNPJ de um cliente na nossa tabela de clientes, precisamos formatar esse CNPJ. Porque o número do CNPJ é um número que possui uma determinada formatação na sua exibição.
[00:37] Claro que eu não vou usar no nosso exemplo do curso números de CNPJ verdadeiros nem a formatação real no CNPJ, vamos criar uma formatação específica e vamos implementar isso nas nossas rotinas. Logo, quando eu incluir novos clientes, o dado do CNPJ deve ser gravado na tabela já com um determinado formato.
[01:04] Se analisarmos o que aprendemos até agora, podemos dizer o seguinte: “Ok, eu posso criar uma função onde eu passo o CNPJ, deixo formatado e eu recebo o CNPJ formatado, resolvo meu problema”. É verdade, podemos usar isso, só que nosso objetivo é treinar vocês em Oracle PL/SQL. E eu vou apresentar uma segunda forma de se fazer isso.
[01:37] Essa segunda forma não é melhor nem pior do que a implementação função, é uma forma diferente, para vocês terem um leque maior de entendimento do PL/SQL e quem sabe, no futuro, poder ter variantes quando depararem com determinado problema.
[01:57] Como eu vou fazer isso sem ser por função? Eu vou fazer isso por procedure. Mas eu tinha falado a alguns vídeos atrás que procedure não retorna valor, que somente função retorna valor. Na verdade, a minha afirmação de que procedure não retorna valor não é verdadeira, eu posso, sim, retornar valores em uma procedure.
[02:29] Olha, por exemplo, o slide de cima, que foi o slide que eu apresentei mais em vídeos atrás, quando quis explicar a vocês a diferença entre procedure e função. Nós temos ali o nosso programa, chega em um momento, eu chamo a procedure, ela faz alguma coisa e continua. Já quando eu chamo a função, eu passo parâmetros para a função, ele faz alguma coisa e retorna para a chamada função um resultado.
[03:03] Na verdade, podemos ter isso. Quando eu passo parâmetros para uma procedure, eu posso dizer se esses parâmetros podem ou não voltar para o programa principal. Logo, quando declaramos os parâmetros de uma procedure, podemos dar essa característica à variável que está sendo passada como parâmetro.
[03:32] Ou seja, se eu tenho uma variável no programa principal e eu passo para a procedure, se ela é uma variável que pode voltar, o que acontecer com essa variável dentro da procedure é refletido quando a procedure volta para o programa principal.
[03:53] E isso permite com que possamos, ao passar parâmetros para uma procedure, ter não somente um único retorno, mas eu posso retornar também da procedure vários valores diferenciados.
[04:12] Eu posso resolver o meu problema todo com procedure, mas normalmente nós usamos função quando temos alguma coisa bem específica que sabemos que sempre vai retornar um valor, então normalmente implementamos como função.
[04:31] E procedure passando parâmetros de volta nós implementamos quando temos um método um pouco mais complexo de processamentos, que você precisa retornar coisas quando esse processamento que está sendo executado na procedure termina.
[04:53] Vamos entender melhor o nosso problema. Eu vou para o Oracle SQL Developer e estamos olhando a nossa última rotina que implementamos no vídeo passado, em PL/SQL.
[05:13] Eu vou então vir em cima e proceder como sempre, criar uma nova área de edição associada à conexão CURSO PL SQL. Se eu der um SELECT * FROM CLIENTE, está aqui o nosso CNPJ do cliente que foi incluído, só tem um cliente na minha tabela e ele tem cinco dígitos.
[05:52] Vamos supor hipoteticamente que a formatação do CNPJ necessite ser feita da seguinte maneira, esse CNPJ 67890 deve ser formatado assim, 678/90, ou seja, precisa ter essa barra depois do terceiro caractere. Claro que CNPJ não se formata assim, eu estou inventando esse formato simplesmente por uma questão de didática.
[06:27] Como então eu poderia aplicar isso no Oracle? Vamos relembrar do nosso treinamento de consulta avançadas usando SQL, que para ter esse formato basta usarmos a função SUBSTR. Assim, SELECT SUBSTR(CNPJ,1,3), ou seja, estou pegando o CNPJ que tem cinco caracteres e eu estou pegando do primeiro ao terceiro caractere. Isso vai retornar somente esses três primeiros caracteres.
[07:13] Eu vou concatenar com a barra e concateno com o que sobra, a partir do caractere 4, dois caracteres. Se eu rodo esse select eu vou ter o meu resultado no formato que eu preciso.
[07:45] Então o que nós vamos implementar é através de procedure, vou passar como parâmetro o CNPJ desformatado, aplicar esta transformação e retornar o CNPJ formatado, e isso vai ser enviado para dentro da tabela. Mas faremos isso no próximo vídeo.


SELECT * FROM CLIENTE;

-- FORMATAR CNPJ 00.000.000/0000-00
-- 00.083.310/2213-70

SELECT substr(cnpj, 1, 2)
    || '.'
    || substr(cnpj, 3, 3)
    || '.'
    || substr(cnpj, 6, 3)
    || '/'
    || substr(cnpj, 9, 4)
    || '-'
    || substr(cnpj, 14, 2)
FROM cliente
;
    
    SELECT TO_CHAR('01110', '000000000000') FROM DUAL;

------------------------------------------------------------------------------------------------------------------------------------------------------------------ Parâmetros IN e OUT

[00:00] Vamos fazer a nossa procedure para formatar o CNPJ conforme esta regra que eu especifiquei em cima, no meu select.
[00:11] Eu vou manter essas duas linhas, porque eu vou usar como modelo a nossa formatação, e eu vou criar a minha procedure, CREATE, IS, BEGIN, END;. O nosso create, nós já sabemos criar procedure, CREATE OR REPLACE, o nome da procedure, formata_cnpj.
[00:46] Vou passar como parâmetro o CNPJ que deve ser formatado, (p_CNPJ IN, o tipo vai ser o mesmo tipo do campo CNPJ da tabela cliente, então CLIENTE.CNPJ%type).
[01:14] Entre o is e o begin não vamos ter nenhuma variável de trabalho e eu vou dizer o seguinte, p_CNPJ :=, vou aplicar o quê? Vou aplicar essa transformação, SUBSTR(CNPJ,1,3) || ‘/’ || SUBSTR (CNPJ,4,2). Eu vou copiá-la, vou colar, tenho que fechar com ponto e vírgula. Só que não vou usar o CNPJ, eu vou usar a variável p_CNPJ. A princípio é isso.
[01:55] Eu vou selecionar os comandos para que eu possa criar a minha procedure, ficou faltando, CREATE OR REPLACE o quê? PROCEDURE. Temos que dizer, eu estou criando o quê? Uma procedure, uma função? Eu esqueci esse detalhe.
[02:18] Vamos selecionar, vou executar. Mas eu tive um erro, linha 5, coluna 4. Inclusive, para que você possa ter um guia melhor dessas linhas, se você der um botão direito do mouse, eu tenho essa opção “Alternar Números de Linha”, fazendo assim eu consigo ver os números das linhas.
[02:50] Mas ele está me dizendo, linha 5, coluna 4, só que para ele, a linha 5, ele conta a partir do bloco que eu selecionei, porque linha 5 está aqui, mas não tem nada a ver. Eu rodei, foi esse bloco. Então é linha 1, linha 2, linha 3, linha 4, linha 5. Tem um erro. Vamos entender a mensagem.
[03:24] “’p_CNPJ’ não pode ser usada como um destino de designação”, ou seja, eu não posso designar a esta variável p_CNPJ o valor, por quê? Por causa deste detalhe, IN. Quando eu digo que p_CNPJ é uma variável do tipo in, em inglês é como se fosse uma entrada, eu não posso sair, ou seja, essa variável não pode receber valor dentro da procedure. Logo, eu preciso ter outra variável que receba este valor.
[04:14] Eu vou criar outra variável, p_CNPJ_SAIDA IN, vai ser do tipo CLIENTE.CNPJ%type). E esta variável, p_CNPJ_SAIDA vai estar embaixo. Será que isso vai resolver? Vamos lá. Eu vou selecionar, vou executar. Continuo com o mesmo erro. Mas é claro, p saída também é in. Como eu faço então? Vamos à solução.
[05:05] Eu tenho que dizer que p saída é uma variável do tipo OUT. Ao dizer que a variável é do tipo out, eu estou dizendo, esta variável pode sair da procedure com seu valor, e eu tenho o valor da saída.
[05:28] Se eu selecionar agora e executar, agora a minha procedure foi formatada com sucesso. Vamos testá-la. E para testá-la nós vamos usar comandos de Oracle SQL Developer para atribuir valores às variáveis e ver o que acontece.
[05:52] Vou vir em VARIABLE g_CNPJ VARCHAR2(10). Vou criar outra variável, que é a g_CNPJ_SAIDA VARCHAR2(10). Vamos atribuir valor à variável g_CNPJ. EXECUTE :g_CNPJ := ‘12345’. Vamos dar um PRINT para vermos o valor g_CNPJ. Vamos só rodar isso por enquanto. Vamos ver o valor da variável, rodou. Valor da segunda variável, rodou. Vamos atribuir o valor, foi. Vamos dar um print, está lá. Valor da variável g_CNPJ é 12345.
[07:21] Eu vou agora executar a minha procedure. EXECUTE formata_cnpj e eu tenho que passar como parâmetros o g_CNPJ, só que tem que atribuir valor, então tem que ser com dois pontos, (:g_CNPJ, :g_CNPJ_SAIDA). Vou executar agora a minha rotina. Foi concluído com sucesso.
[08:15] Vamos agora dar um PRINT :g_CNPJ e depois um PRINT :g_CNPJ_SAIDA. O g_CNPJ ainda é o 12345, sem formatação. Mas a nova variável, se eu executar, é 123/45, com formatação.
[08:50] A minha procedure está implementada, note que eu declaro duas variáveis, uma é a variável que vai passar o parâmetro e a outra variável é a que vai receber a resposta. Eu inicializo, dou o meu print para ver, executo a minha procedure e eu verifico a minha saída.
[09:17] Por enquanto é isso, ainda vamos melhorar essa procedure e depois colocá-la dentro da procedure de inserir clientes. Mas vamos fazer essas coisas no próximo vídeo.

Parâmetro de modo IN

A maneira das aplicações externas se comunicarem com as procedures é através dos parâmetros, e os parâmetros com modo de passagem IN são os mais utilizados.

Qual a característica do parâmetro IN, abaixo, que é verdadeira?
É o modo de passagem padrão
Alternativa correta! Se omitirmos o tipo de parâmetro (IN ou OUT), o padrão será IN.

CREATE OR REPLACE PROCEDURE formatar_cnpj
(p_cnpj IN cliente.cnpj%type, p_cnpj_saida OUT cliente.cnpj%type)
IS
BEGIN
    p_cnpj_saida :=
       to_char(substr(p_cnpj, 1, 2), '0000')
    || '.'
    || to_char(substr(p_cnpj, 3, 3), '0000')
    || '.'
    || to_char(substr(p_cnpj, 6, 3), '0000')
    || '/'
    || to_char(substr(p_cnpj, 9, 4), '0000')
    || '-'
    || to_char(substr(p_cnpj, 14, 2), '0000')
    ;
    COMMIT;
END;

>>> Procedure FORMATAR_CNPJ compilado

variable g_cnpj number(10, 0);

variable g_cnpj_saida number(10);

execute :g_cnpj := 9993331248;

-- print :g_cnpj;
-- print :g_cnpj_saida;

execute formatar_cnpj(:g_cnpj, :g_cnpj_saida);

----------------------------------------------------------------------------------------------------------------------------------------------------------------- Chamando a procedure

[00:00] Antes de usarmos essa procedure, na outra procedure que inclui clientes, para que o CNPJ seja incluído dentro da tabela já com a formatação, eu vou voltar a essa procedure e mostrar a vocês que podemos melhorá-la.
[00:21] Acontece o seguinte, tivemos que criar duas variáveis, uma de entrada e outra de saída. Só que é possível dizermos para o PL/SQL que uma variável é de entrada e, ao mesmo tempo, de saída. Assim eu economizo número de parâmetros, eu economizo código e assim por diante.
[00:54] Vamos modificar a nossa procedure formata_cnpj para ter apenas um parâmetro. Eu vou tirar a declaração do parâmetro de saída, vou atribuir o valor nela, só que eu estou voltando para aquela minha primeira versão que deu erro. Se eu executar, eu tenho aquele erro.
[01:31] Mas eu já aprendi que se a variável é do tipo out, ela pode receber parâmetro e o seu valor acaba saindo da procedure. Mas ela é in. A resposta é óbvia, uma variável pode ser in e out ao mesmo tempo. Para fazer isso, basta eu colocar depois do IN, a palavra OUT.
[01:59] Então eu estou dizendo que a variável p_CNPJ é in e out ao mesmo tempo, ela é entrada e é saída. Se eu agora selecionar a área para criação da procedure, eu agora tenho a procedure criada de maneira correta.
[02:25] Aqui embaixo, onde fizemos o teste, eu não preciso ter mais essa variável de saída, na hora chamar a rotina eu não preciso chamar a variável de saída e na própria variável de entrada eu vou ter o valor final. Vamos testar?
[02:45] Crio a variável, atribuo valor a ela, vamos olhar o valor dela por enquanto, está lá, 12345, sem formatação. Executa o formato e vamos dar o print para ver como ficou o resultado. Está na própria variável de entrada eu tenho a formatação.
[03:16] Agora vamos usar a chamada dessa rotina na procedure incluir_cliente, para que o dado já seja incluído dentro da tabela formatada.
[03:35] Eu vou vir em “Procedures”, à esquerda, botão direito do mouse, vou dar um “Atualizar” e eu tenho a “INCLUIR_CLIENTE”. Se eu der um clique em cima, eu estou vendo o código da rotina “INCLUIR_CLIENTE”.
[03:58] Só que eu não vou editá-la, eu poderia até editá-la depois executar de novo, que eu faria a alteração. Mas eu vou criar outro script, CURSO PL SQL. Ela acabou ficando no início. Eu vou copiar esse código, que é o código já existente, e lá no novo script vou colar. Eu vou editar a minha rotina.
[04:44] Eu estou recebendo como parâmetro esse p_CNPJ, que é o CNPJ sem formatação. Eu preciso jogar para uma variável o valor dele, então eu poderia dizer o seguinte, p_CNPJ := formata_cnpj(p_CNPJ). Seria assim que eu vou usar? Não, porque formata_cnpj não é uma função. Isso é uma procedure, então eu não posso fazer isso.
[05:46] O que eu posso fazer é simplesmente, eu chamo a procedure, essa variável p_CNPJ já vem com o valor, ela vai entrar na procedure, ela vai modificar o seu valor e vai sair. E ao sair, ela já vai sair com o valor diferente e ela vai poder ser usada na inclusão.
[06:08] Será que isso vai dar certo? Vamos testar. Eu vou criar a procedure de novo. Ele ainda me deu um erro: “a expressão ‘P_CNPJ’ não pode ser usada como um destino de designação”. Por quê? Porque ela já está entrando na procedure principal, que é a incluir_cliente, como IN. Então ela não pode mudar o seu valor.
[06:46] Mas podemos criar uma variável de trabalho para isso aqui dentro. Então vou fazer isso, vou criar uma variável v_CNPJ, que vai ser do tipo CLIENTE.CNPJ%type. E ela já vai receber um valor inicial, que é o valor que está vindo de p_CNPJ;.
[07:18] Então esse cara p_CNPJ entra como parâmetro e logo no início o valor dele vai para essa variável v_CNPJ, que não é uma variável in, é uma variável de trabalho. Como é uma variável de trabalho, ela pode ser usada aqui dentro, porque ela vai entrar e lá dentro ela vai receber o valor formatado e vai sair com o valor formatado.
[07:46] E claro, como eu agora estou usando v_CNPJ, na hora de dar um insert não é a variável p, é a variável v. Vamos ver então. Vamos diminuir um pouco, selecionei, vou executar.
[08:14] Agora não deu erro, agora eu tenho o meu procedimento compilado. Vamos testar? Vou dar um SELECT * FROM CLIENTE;, então ele está lá, sem a formatação. Para podermos começar de novo, eu vou dar um DELETE FROM CLIENTE; para apagar o conteúdo da tabela. E eu agora vou executar a minha rotina de incluir cliente.
[08:57] Vou colocar EXECUTE incluir_cliente, vou passar como parâmetro um código, (2, ‘SUPERMERCADO IJK’, outro parâmetro. Vou botar o CNPJ, ’67890’, qual é o próximo parâmetro? Entro com segmento de mercado, que é 1,, depois o faturamento previsto, 90000);. Vamos executar agora a inclusão do cliente. Executou com sucesso. SELECT * FROM CLIENTE;.
[09:56] Se olharmos agora o conteúdo da tabela, notem, o CNPJ já foi incluído com a formatação. E ainda está executando aquela outra rotina, dizendo a categoria do meu cliente. Já temos o nosso processo de inclusão do CNPJ formatado pronto e funcionando.

Transformação

No último vídeo, ocorreu a seguinte transformação do CNPJ:

De: 68090
Para: 680/90
Usando o seu conhecimento de Oracle, e sabendo que o CNPJ sempre será de 5 dígitos, como deve ser a procedure, que criamos no curso, para transformar o CNPJ em 68/09-0?
Um exemplo de procedure é a seguinte:
CREATE OR REPLACE PROCEDURE formata_cnpj (
    p_CNPJ IN CLIENTE.CNPJ%type, 
    p_CNPJ_SAIDA OUT CLIENTE.CNPJ%type
)
IS
BEGIN
    p_CNPJ_SAIDA := SUBSTR(p_CNPJ,1,2) || '/' || SUBSTR(p_CNPJ,3,2) || '-' || SUBSTR(p_CNPJ,5,1);
END;



SELECT * FROM CLIENTE
SELECT SUBSTR(CNPJ,1,3) || '/' || SUBSTR(CNPJ,4,2) FROM CLIENTE


CREATE OR REPLACE PROCEDURE formatar_cnpj
(p_CNPJ IN CLIENTE.CNPJ%type, p_CNPJ_SAIDA OUT CLIENTE.CNPJ%type)
IS
BEGIN
   p_CNPJ_SAIDA := SUBSTR(p_CNPJ,1,3) || '/' || SUBSTR(p_CNPJ,4,2);
END;

VARIABLE g_CNPJ VARCHAR2(10)
VARIABLE g_CNPJ_SAIDA VARCHAR2(10)
EXECUTE :g_CNPJ := '12345'
EXECUTE formatar_cnpj(:g_CNPJ, :g_CNPJ_SAIDA)
PRINT :g_CNPJ
PRINT :g_CNPJ_SAIDA



CREATE OR REPLACE PROCEDURE formatar_cnpj
(p_CNPJ IN OUT CLIENTE.CNPJ%type)
IS
BEGIN
   p_CNPJ := SUBSTR(p_CNPJ,1,3) || '/' || SUBSTR(p_CNPJ,4,2);
END;

VARIABLE g_CNPJ VARCHAR2(10)
EXECUTE :g_CNPJ := '12345'
EXECUTE formatar_cnpj(:g_CNPJ)
PRINT :g_CNPJ



create or replace NONEDITIONABLE PROCEDURE incluir_cliente (
    p_id cliente.id%type,
    p_razao cliente.razao_social%type,
    p_cnpj cliente.cnpj%type,
    p_segmercado cliente.segmercado_id%type,
    p_fat_previsto cliente.faturamento_previsto%type
)
IS
    v_cnpj cliente.cnpj%type := p_cnpj;
    v_categoria cliente.categoria%type;
BEGIN
    formatar_cnpj(v_cnpj);
    v_categoria := categoria_cliente(p_faturamento_previsto=>p_fat_previsto);

    INSERT INTO CLIENTE (ID, RAZAO_SOCIAL, CNPJ, SEGMERCADO_ID, DATA_INCLUSAO, FATURAMENTO_PREVISTO, CATEGORIA)
    VALUES (p_id, p_razao, v_cnpj, p_segmercado, SYSDATE, p_fat_previsto, v_categoria);
    COMMIT;
END;

SELECT * FROM CLIENTE;
EXECUTE incluir_cliente(2,'SUPERMRECADO IJK','67890',1,90000);

------------------------------------------------------------------------------------------------------------------------------------------------------ Consolidando o seu conhecimento

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.
1) Crie um novo script para editar comandos Oracle, associados à conexão criada na aula anterior, indo em:
Observação: Você somente irá selecionar esta conexão se, no passo 25, do Consolidando o seu conhecimento da aula 1, você escolheu permanecer na conexão criada para este treinamento. Se você decidiu usar a conexão padrão criada durante a instalação, escolha uma nova área de edição nesta nova conexão.
No caso do vídeo, a conexão é:

2) Para criar a procedure, digite e execute:

CREATE OR REPLACE PROCEDURE incluir_cliente (
    p_ID IN CLIENTE.ID%type, 
    p_RAZAO_SOCIAL IN CLIENTE.RAZAO_SOCIAL%type,
    p_CNPJ IN CLIENTE.CNPJ%type, 
    p_SEGMERCADO_ID IN CLIENTE.SEGMERCADO_ID%type,
    p_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%type
)
IS
BEGIN
    INSERT INTO CLIENTE (ID, RAZAO_SOCIAL, CNPJ, SEGMERCADO_ID, DATA_INCLUSAO, FATURAMENTO_PREVISTO, CATEGORIA)
        VALUES (p_ID, p_RAZAO_SOCIAL, p_CNPJ, p_SEGMERCADO_ID, SYSDATE, p_FATURAMENTO_PREVISTO, '00000');
    COMMIT;
END;COPIAR CÓDIGO
3) Agora, logo abaixo, digite o seguinte código:

EXECUTE incluir_cliente (2, 'SUPERMRECADO IJK', '67890', 1, 90000);COPIAR CÓDIGO
4) Para visualizar, digite:

SELECT * FROM CLIENTE;COPIAR CÓDIGO
5) O resultado será o seguinte:

6) Crie um novo script para editar comandos Oracle, associados à conexão criada na aula anterior, indo em:
Observação: Você somente irá selecionar esta conexão se, no passo 25, do Consolidando o seu conhecimento da aula 1, você escolheu permanecer na conexão criada para este treinamento. Se você decidiu usar a conexão padrão criada durante a instalação, escolha uma nova área de edição nesta nova conexão.
No caso do vídeo, a conexão é:

7) Digite:

DECLARE
    v_FATURAMENTO_PREVISTO CLIENTE.FATURAMENTO_PREVISTO%type:= 65000;
    v_CATEGORIA CLIENTE.CATEGORIA%type;
BEGIN
    IF v_FATURAMENTO_PREVISTO < 10000 THEN
        v_CATEGORIA := 'PEQUENO';
    ELSIF v_FATURAMENTO_PREVISTO < 50000 THEN
        v_CATEGORIA := 'MÉDIO';
    ELSIF v_FATURAMENTO_PREVISTO < 100000 THEN
        v_CATEGORIA := 'MÉDIO GRANDE';
    ELSE
        v_CATEGORIA := 'GRANDE';
    END IF;    
END;

8) Para habilitar a escrita na área de saída do SQL Developer, por parte de uma função ou procedure, digite e execute:

SET SERVEROUTPUT ONCOPIAR CÓDIGO
9) Em seguida, entre o trecho contendo END IF e END, digite:

dbms_output.put_line('A Categoria é ' || v_CATEGORIA);COPIAR CÓDIGO
10) Execute a procedure para que seja possível ver a saída onde a classificação da categoria é apresentada:

11) Crie um novo script para editar comandos Oracle, associados à conexão criada na aula anterior, indo em:
Observação: Você somente irá selecionar esta conexão se, no passo 25, do Consolidando o seu conhecimento da aula 1, você escolheu permanecer na conexão criada para este treinamento. Se você decidiu usar a conexão padrão criada durante a instalação, escolha uma nova área de edição nesta nova conexão.
No caso do vídeo, a conexão é:

12) Digite o seguinte código e execute para criar a função:

CREATE OR REPLACE FUNCTION categoria_cliente (
    p_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%type
)
RETURN CLIENTE.CATEGORIA%type
IS
    v_CATEGORIA CLIENTE.CATEGORIA%type;
BEGIN
    IF p_FATURAMENTO_PREVISTO < 10000 THEN
        v_CATEGORIA := 'PEQUENO';
    ELSIF p_FATURAMENTO_PREVISTO < 50000 THEN
        v_CATEGORIA := 'MÉDIO';
    ELSIF p_FATURAMENTO_PREVISTO < 100000 THEN
        v_CATEGORIA := 'MÉDIO GRANDE';
    ELSE
        v_CATEGORIA := 'GRANDE';
    END IF;
    RETURN v_CATEGORIA;
END;COPIAR CÓDIGO
13) Logo abaixo, digite os seguintes códigos e execute-os separadamente:

VARIABLE g_CATEGORIA VARCHAR2(100);
EXECUTE :g_CATEGORIA := categoria_cliente(90000);
PRINT g_CATEGORIA;COPIAR CÓDIGO

17) Edite a procedure para o seguinte código mostrado abaixo:

Create or replace PROCEDURE incluir_cliente (
    p_ID IN CLIENTE.ID%type,
    p_RAZAO_SOCIAL IN CLIENTE.RAZAO_SOCIAL%type,
    p_CNPJ IN CLIENTE.CNPJ%type,
    p_SEGMERCADO_ID IN CLIENTE.SEGMERCADO_ID%type,
    p_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%type
)
IS
    v_CATEGORIA CLIENTE.CATEGORIA%type;
BEGIN
    v_CATEGORIA := categoria_cliente(p_FATURAMENTO_PREVISTO);
    INSERT INTO CLIENTE (ID, RAZAO_SOCIAL, CNPJ, SEGMERCADO_ID, DATA_INCLUSAO, FATURAMENTO_PREVISTO, CATEGORIA)
    VALUES (p_ID, p_RAZAO_SOCIAL, p_CNPJ, p_SEGMERCADO_ID, SYSDATE, p_FATURAMENTO_PREVISTO, v_CATEGORIA);
    COMMIT;
END;COPIAR CÓDIGO
18) Execute o novo código para alterar a procedure.

19) Digite e execute o comando de consulta da tabela Cliente:

SELECT * FROM CLIENTECOPIAR CÓDIGO

20) Limpe a tabela antes de executar novamente a procedure que foi modificada:
DELETE FROM CLIENTE

21) Insira um novo cliente, usando a nova versão da procedure. Para isso, digite e execute:

EXECUTE incluir_cliente (2, 'SUPERMERCADO IJK', '67890', 1, 90000);COPIAR CÓDIGO
22) Execute o comando SELECT * FROM CLIENTE, para visualizar o resultado:

24) Caso queira formatar a saída do campo CNPJ, para que ele exiba os três primeiros dígitos, seguidos de uma barra, e depois dos outros dois dígitos, basta executar o comando abaixo:

SELECT SUBSTR(CNPJ,1,3) || '/' || SUBSTR(CNPJ,4,2) FROM CLIENTECOPIAR CÓDIGO

25) Crie uma procedure que formate o campo CNPJ. Para isso, digite e execute:

CREATE OR REPLACE PROCEDURE formata_cnpj (
    p_CNPJ IN CLIENTE.CNPJ%type, 
    p_CNPJ_SAIDA OUT CLIENTE.CNPJ%type
)
IS
BEGIN
    p_CNPJ_SAIDA := SUBSTR(p_CNPJ,1,3) || '/' || SUBSTR(p_CNPJ,4,2);
END;COPIAR CÓDIGO
26) Declare duas variáveis, uma que terá o CNPJ inicial e o outra com o formatado. Para isso, digite e execute os comandos abaixo:

VARIABLE g_CNPJ VARCHAR2(10)
VARIABLE g_CNPJ_SAIDA VARCHAR2(10)COPIAR CÓDIGO
27) Inicialize o CNPJ inicial. Para isso, digite e execute:

EXECUTE :g_CNPJ := '12345'COPIAR CÓDIGO
28) Execute a procedure, passando como parâmetro o CNPJ sem formato, e atribuindo o CNPJ formatado à variável g_CNPJ_SAIDA. Para isso, digite e execute:

EXECUTE formata_cnpj(:g_CNPJ, :g_CNPJ_SAIDA)COPIAR CÓDIGO
29) Digite e execute os códigos abaixo para exibir o resultado:

PRINT :g_CNPJ
PRINT :g_CNPJ_SAIDACOPIAR CÓDIGO

30) É possível usar a mesma variável como entrada e saída da procedure. Para isso, modifique a procedure conforme mostrado abaixo, e execute-a:

CREATE OR REPLACE PROCEDURE formata_cnpj (
    p_CNPJ IN OUT CLIENTE.CNPJ%type
)
IS
BEGIN
    p_CNPJ := SUBSTR(p_CNPJ,1,3) || '/' || SUBSTR(p_CNPJ,4,2);
END;COPIAR CÓDIGO
31) Ao repetir os procedimentos, inicializar as variáveis e executar a procedure (Passos 26, 27, 28 e 29), observe que a procedure também retornará o CNPJ formatado.

32) Use esta procedure dentro da outra procedure criada para realizar a inclusão do cliente. Para isso, na árvore à esquerda do SQL Developer, selecione o nó Procedure e selecione INCLUIR_CLIENTE.

33) Copie o código da procedure e cole-o em um novo script de edição.

34) Edite o código copiado, incluindo a chamada da procedure de formatação do CNPJ, bem como o seu uso para a inclusão na tabela de clientes. Para isso, edite o código conforme mostrado abaixo, depois execute-o:

create or replace PROCEDURE incluir_cliente (
    p_ID IN CLIENTE.ID%type, 
    p_RAZAO_SOCIAL IN CLIENTE.RAZAO_SOCIAL%type,
    p_CNPJ IN CLIENTE.CNPJ%type, 
    p_SEGMERCADO_ID IN CLIENTE.SEGMERCADO_ID%type,
    p_FATURAMENTO_PREVISTO IN CLIENTE.FATURAMENTO_PREVISTO%type
)
IS
    v_CATEGORIA CLIENTE.CATEGORIA%type;
    v_CNPJ CLIENTE.CNPJ%type := p_CNPJ;
BEGIN
    formata_cnpj(v_CNPJ);
    v_CATEGORIA := categoria_cliente(p_FATURAMENTO_PREVISTO);
    INSERT INTO CLIENTE (ID, RAZAO_SOCIAL, CNPJ, SEGMERCADO_ID, DATA_INCLUSAO, FATURAMENTO_PREVISTO, CATEGORIA)
    VALUES (p_ID, p_RAZAO_SOCIAL, v_CNPJ, p_SEGMERCADO_ID, SYSDATE, p_FATURAMENTO_PREVISTO, v_CATEGORIA);
    COMMIT;
END;COPIAR CÓDIGO
35) Verifique o conteúdo da tabela, digitando e executando o comando:

SELECT * FROM CLIENTE;COPIAR CÓDIGO

36) Apague a tabela, digitando e executando o comando abaixo:

DELETE FROM CLIENTE;COPIAR CÓDIGO
37) Faça uma nova inclusão de cliente, digitando e executando:

EXECUTE incluir_cliente(2,'SUPERMRECADO IJK','67890',1,90000);COPIAR CÓDIGO
38) Verifique novamente a tabela cliente e veja que os dados são incluídos formatados:

SELECT * FROM CLIENTE;COPIAR CÓDIGO

O que aprendemos?
Nesta aula, aprendemos:
Como usar o comando IF
Como passar e retornar valores através de uma procedure
Como usar uma procedure dentro de outra procedure

-------------------------------------------------------------------------------------------------------------------------------------------------------- Alterando Segmento de Mercado

[00:00] Vamos continuar estudando. Nesses próximos vídeos, eu vou, de novo, criar área de edição associada ao link CURSO PL SQL, e vou executar aquela minha rotina de execução - vou até copiar do curso anterior - onde incluímos novos clientes.
[03:35] Nós só incluímos um cliente, que é o supermercado IJK, eu vou então copiar esse comando, EXECUTE incluir_cliente(2,’SUPERMERCADO IJK’,’67890’,1,90000);, vou colar, só que eu vou colocar o cliente (1,, vai ser ’MERCEARIA XYZ’,, o CNPJ dele vai ser ‘8923’,, o segmento de mercado vai ser também 1, e eu vou colocar como 10000);`.
[01:10] Eu vou copiar e colar mais umas quatro vezes. O cliente 2 nós já incluímos, então vamos incluir os clientes 3, 4, 5 6. Aqui vai ser a ’FARMACIA QWE’,, o CNPJ dela eu vou colocar 90000, e esse cara vai ser 80000);. O segmento de mercado eu vou manter 1 para todo mundo. Esse outro vai ser o ’MERCADINHO JKL’,, outro CNPJ, são cinco dígitos, então esse de cima eu vou colocar um a mais.
[02:19] Se vocês estão repetindo o que eu estou fazendo, vocês podem colocar qualquer nome, qualquer CNPJ com cinco dígitos, só mantenham essa sequência, ou seja, eu preciso ter o cliente 1, 2, 3, 4, 5 e 6, e todos com segmento de mercado 1. Os outros parâmetros vocês podem variar de forma aleatória.
[02:50] Vou colocar outro CNPJ, ’89236’,, vou colocar um valor 70000);´. Aqui embaixo eu vou colocar’TAVERNA SDF’,, um CNPJ de cinco dígitos,’45600’,, o valor60000);. E aqui eu vou colocar’BAR 222’,, e aqui vou colocar um CNPJ’76000’,, aqui vai ser20000);`.
[03:45] Recapitulando, cliente 1, 3, 4, 5, 6, porque o cliente 2 eu já tenho na tabela. O nome, qualquer um, CNPJ qualquer um de cinco dígitos, o segmento de mercado todo mundo com 1 e o faturamento previsto também qualquer valor. Eu vou selecionar essas cinco linhas e executar.
[04:12] Note que ele executou com sucesso e se dermos um SELECT * FROM CLIENTE;, tenho os meus cinco clientes incluídos, sendo que o cliente 2 que estávamos usando já estava dentro da tabela.
[04:41] Nosso objetivo é criar, ou uma função, ou uma procedure, depende do que o meu usuário quer, ainda não decidimos, mas que faça uma atualização do segmento de mercado. Eu passo como parâmetro o cliente, o novo segmento de mercado e ele me atualiza. Como isso não vai retornar valor, então, sim, eu sou obrigado a implementar uma procedure.
[05:19] Vou criar a minha CREATE OR REPLACE PROCEDURE, vai ter o IS, BEGIN, END;. O nome da procedure eu vou chamar de atualizar_cli_seg_mercado. E eu vou passar como parâmetro o ID do cliente e o segmento de mercado que eu quero alterar. Vai entrar (p_ID, o tipo da tabela de CLIENTE.ID%type. E o outro parâmetro vai ser o p_SEGMERCADO_ID, que vai ser do tipo CLIENTE.SEGMERCADO%type).
[06:34] Notem que eu não coloquei o in. Isso não é problema. Quando ignoramos o tipo do parâmetro, nós já aprendemos, o parâmetro pode ser in, pode ser out ou pode ser in e out. In quando ele é um parâmetro de entrada, out quando é um parâmetro de saída e in e out quando é de entrada e de saída ao mesmo tempo.
[07:05] Se eu não coloco nada, se eu na declaração dos parâmetros da procedure simplesmente ignoro o tipo dele, ele por padrão será sempre in. Então eu não preciso dizer o tipo do parâmetro.
[07:31] Eu não tenho variável de trabalho e dentro eu vou fazer o update, como fazemos update? Relembrando do treinamento de manipulação de dados usando Oracle, UPDATE, o nome da tabela, CLIENTE SET, o nome do campo que vai receber o valor, SEGMERCADO_ID =, recebem quem? O novo valor, que está vindo desta variável, então ele vai receber p_SEGMERCADO_ID.
[08:09] Mas eu não vou fazer isso para todo mundo, eu vou fazer um WHERE para um cliente específico. O código do cliente está nesse outro parâmetro, p_ID_CLIENTE, então WHERE ID = p_ID;. Ponto e vírgula para fechar o comando.
[08:31] Claro que depois eu tenho que dar o COMMIT;, porque eu abri uma transação, se eu não dou o commit essa atualização só fica valendo para a minha sessão, os outros usuários não conseguem vê-la.
[08:53] Vou selecionar da linha 10 em diante, eu vou executar. Eu cometi algum erro. O componente p segmercado deve ser declarado. O nome da tabela é segmercado, está aqui, eu errei completamente a declaração.
[09:31] Dentro de “CLIENTE”, o nome do campo é “SEGMERCADO_ID”, então é SEGMERCADO_ID, vamos corrigir. Se você ficou copiando o que eu estava fazendo e não prestou atenção também nisso, corrijam. A declaração é CLIENTE.SEGMERCADO_ID.
[09:59] Novamente um parêntese, eu não sei se você gosta ou não desse meu estilo, como eu tento fazer a coisa meio que na hora, sem ter que copiar e colar coisas de uma anotação, nós esquecemos coisas. Você que já trabalha com desenvolvimento, sabe que quando você está programando é natural que você esqueça a declaração da variável ou coloque a declaração da variável de uma forma diferente.
[10:33] Eu gosto de fazer a coisa assim na hora, para meio que simular uma situação real, em que você aluno, quando estiver trabalhando profissionalmente, vai fazer. Então é legal eu cometer erros, olharmos o resultado do erro e podermos interpretar isso e fazer a correção correta.
[10:57] Me desculpe se eventualmente vocês não gostem muito desse estilo, do tipo: “Professor, eu acho que deveria você já colocar o código correto”. Pelo menos nos meus treinamentos todos na Alura eu faço dessa maneira e tenho tido um feedback positivo me comportando desse jeito.
[11:20] Mas, mesmo assim, eu peço desculpas se por acaso você não esteja gostando muito dessa forma de trabalhar, cometendo talvez um ou outro erro na hora. Vamos fechar o parêntese, vamos voltar para o nosso problema. Eu corrigi a declaração da variável.
[11:49] No passo a passo do nosso treinamento todos esses scripts corretos estarão lá, então você pode assistir o vídeo, mas na hora de fazer o seu exemplo, em vez de digitar na hora, conforme eu vou fazendo, você entende o princípio da coisa, depois vai no passo a passo, copia e cola o código já pronto, que você já vai tê-lo funcionando sem a necessidade de passar por esses erros.
[12:22] Eu corrigi, vamos ver se agora vai. Agora foi. Aqui está a mensagem, “Procedure ATUALIZAR_CLI_SEG_MERCADO compilado”, atualizado com sucesso.
[12:35] Se eu der um select dentro da minha tabela de clientes, todos são segmentos de mercado 1, mas vamos alterar o do cliente 3, em vez de segmento 1, vai ser o segmento 2. Basta eu vir em EXECUTE atualizar_cli_seg_mercado, ele até já escreve aqui embaixo, sugerindo o nome da procedure que eu vou rodar. Basta eu dar um duplo clique.
[13:25] Vou abrir parênteses, vou entrar com o ID do cliente, eu quero pegar o cliente 3 e modificar para o segmento de mercado 2. Vou verificar se rodou. Se agora eu fizer um select na tabela de clientes, está aqui, o cliente 3 mudou o segmento de mercado 2.
[13:55] Nós treinamos mais um exemplo da construção de procedures e, no caso, usando um update, ou seja, indo no registro que já existe na tabela e modificando-o.
[14:12] Mas isso só foi o primeiro passo de outro exemplo que eu quero mostrar. No próximo vídeo, usando o que nós chamamos de loops, eu vou repetir esse comando várias vezes dentro de cada linha da tabela, mas vamos ver isso no próximo vídeo.

-- Incluindo dados na tabela Cliente:

EXECUTE incluir_cliente(1,'MERCEARIA XYZ','89231',1,10000);
EXECUTE incluir_cliente(3,'FARMACIA QWE','90000',1,80000);
EXECUTE incluir_cliente(4,'MERCADINHO JKL','89236',1,70000);
EXECUTE incluir_cliente(5,'TAVERNA SDF','45600',1,60000);
EXECUTE incluir_cliente(6,'BAR 222','76000',1,20000);

CREATE OR REPLACE PROCEDURE atualizar_cli_segmercado (
    p_id             IN  cliente.id%TYPE,
    p_segmercado_id  IN  cliente.segmercado_id%TYPE
) IS
BEGIN
    UPDATE cliente
    SET
        segmercado_id = p_segmercado_id
    WHERE
        id = p_id;

    COMMIT;
END;


--  IN, OUT ou INOUT ignorados
Quando o IN, OUT ou INOUT são ignorados, o programa interpreta automaticamente como?
IN  - >>> Alternativa correta! Automaticamente a procedure se torna um parâmetro de entrada.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------- LOOP e END LOOP

[00:00] Vamos continuar implementando um processo para atualizar todos os segmentos de mercado de todos os clientes.
[00:13] Eu vou pegar essa chamada, EXECUTE atualizar_cli_seg_mercado(3, 2);, vou copiá-la, dei um “Ctrl + C” e vou abrir uma nova área de edição, vou colar. Só que, por exemplo, eu sei que eu tenho seis clientes.
[00:44] Vamos modificar o segmento de mercado para esses seis clientes. Vamos botar todo mundo como sendo igual a 3. Então eu vou pegar o cliente 1, vai ser igual a 3. Se eu copiar EXECUTE atualizar_cli_seg_mercado(1, 3); e colar, vou pegar os clientes 2, 3, 4, 5 e 6. Se eu rodar essas seis linhas, funcionou, eu faço meu select, todo mundo agora está com o número 3.
[01:28] Só que eu queria implementar isso de uma maneira mais inteligente. Vamos fazer então um programa PL/SQL para fazer essa atualização. Vamos editar embaixo, eu vou ter um DECLARE, um BEGIN e um END;, nossa estrutura básica.
[01:53] Dentro do DECLARE eu vou declarar duas variáveis, uma variável vai ser o novo segmento de mercado que eu quero atualizar, eu vou chamar de v_SEGMERCADO_ID, esse vai ser o nome da variável.
[02:20] O tipo dela vai ser o mesmo tipo que eu tenho na tabela de cliente, CLIENTE.SEGMERCADO_ID%type;, está à esquerda, “SEGMERCADO_ID”, esse é o nome do campo que coloquei.
[02:44] Claro, eu poderia agora colocar essas seis linhas aqui dentro. Como está dentro do bloco de programa do PL/SQL, eu não preciso ter a palavra execute, e eu vou inicializar essa variável como sendo, por exemplo, 1, e eu substituo para o novo segmento de mercado, v_SEGMERCADO_ID.
[03:30] Só que isso não está muito elegante, o nosso objetivo é aprender loops, comandos que se repetem. Eu vou repetir esse comando seis vezes. Como eu vou fazer então para ele repetir seis vezes essa mesma linha?
[03:51] Estrutura de lógica básica, se eu criar um contador que vai começar no 1 e terminar no 6, eu faço um loop onde eu vou repetir isso seis vezes e para cada repetição eu executo o atualizar_cli_seg_mercado. Vamos criar a segunda variável, que eu vou chamar de v_I, que vai ser um NUMBER(3). E eu posso inicializa-la com o número 1, ela começa com o valor 1.
[04:37] Eu poderia fazer isso, o valor dela é 1, então eu vou usar sempre a minha variável, o contador, e eu posso incrementar, := v_I + 1; e repetir o comando. Isso também funcionaria.
[05:12] Mas ainda não estou usando o meu comando de loop, não tem sentido. Aqui vale 1, somei, agora vai ser 2, depois vai ser 3, 4, 5 e 6. Ainda não está legal. Vamos criar uma estrutura de loop.
[05:38] Existem várias formas de eu fazer loops dentro do PL/SQL, da maneira que vamos aprender, são três comandos básicos, LOOP, para dizer que eu estou começando o loop, EXIT WHEN, para dizer a condição de saída do loop e o END LOOP;, para dizer que o loop terminou.
[06:11] Dentro do LOOP o que eu vou fazer? Eu vou executar a atualização do segmento. Eu vou copiar essa linha, atualizar_cli_seg_mercado(v_I, v_SEGMERCADO_ID);.
[06:22] Depois que eu executei, vou incrementar o contador, porque quando o contador entrar pela primeira vez, vale 1. Como a linha 16 vai ficar repetindo várias vezes, cada repetição o valor do contador tem que subir de 1, então eu vou incrementar o contador.
[06:52] No EXIT WHEN é a condição de saída do loop, em que momento eu saio do loop? Quantos clientes nós temos? Seis. Quando meu contador for para 7, significa que eu tenho que parar, principalmente porque eu não tenho o cliente ID número 7. Então eu vou fazer EXIT WHEN v_I > 6;.
[07:28] Essa estrutura está simulando essa repetição. Então essa repetição eu passo apagar. Ficamos com essa estrutura de programação. Vou selecionar esse bloco, deixa eu ver antes. Todos os segmentos de mercado estão com o valor 3, eu vou inicializar com 1.
[08:00] Então eu vou selecionar, vou executar, executou com sucesso. Se eu selecionar agora a tabela de clientes, note que todos agora estão com o valor igual a 1.
[08:24] Não é muito prático esse exemplo, eu tenho que primeiro fornecer o segmento que eu quero atualizar e eu tenho que saber de antemão que eu tenho seis clientes, porque > 6; é a condição de saída.
[08:42] Mas nosso objetivo é um treinamento, precisamos ensinar a vocês o que fazer. Esse foi um bom exemplo para vocês entenderem como funciona a estrutura loop, exit when, end loop, dentro do PL/SQL.

-- select * from cliente;
-- UPDATE segmercado_id from ...
declare
    v_id_segmercado cliente.segmercado_id%type := 1;
begin
    FOR v_counter IN 1..10 LOOP
        update cliente set segmercado_id = v_id_segmercado where id = v_counter;
    END LOOP;
end;
--- Loop básico
Umas das maneiras de implementar uma estrutura de repetição é através do LOOP básico. As principais vantagens são:
-- O comando EXIT pode ser colocado em qualquer lugar do LOOP
-- O comando EXIT poderá ser codificado em qualquer lugar do LOOP, e depois da sua execução, os comandos que estão entre o EXIT e o END LOOP não serão processados.
-- Depois de executar o comando EXIT, as instruções que estão embaixo não são processadas
-- Quando o comando EXIT é executado, o fluxo do código irá para fora do LOOP, assim os comandos entre o EXIT e o END LOOP não serão processados.

EXECUTE atualizar_cli_segmercado(1, 2);
EXECUTE atualizar_cli_segmercado(2, 2);
EXECUTE atualizar_cli_segmercado(3, 2);
EXECUTE atualizar_cli_segmercado(4, 2);
EXECUTE atualizar_cli_segmercado(5, 2);
EXECUTE atualizar_cli_segmercado(6, 2);

-- select * from cliente;

create or replace procedure atualizar_cli_segmercado (
    p_id IN cliente.id%type,
    p_segmercado_id IN cliente.segmercado_id%type
) IS
    v_descricao cliente.segmercado_id%type := p_segmercado_id;
BEGIN
    UPDATE cliente SET segmercado_id = v_descricao WHERE id = p_id;
    COMMIT;
END;

--- Com Loop ...

DECLARE
    v_segmercado_id cliente.segmercado_id%type := 1;
    v_counter NUMBER(3) := 1;
BEGIN   
    atualizar_cli_segmercado(v_counter, v_segmercado_id);
    v_counter := v_counter + 1;
    
    atualizar_cli_segmercado(v_counter, v_segmercado_id);
    v_counter := v_counter + 1;
    
    atualizar_cli_segmercado(v_counter, v_segmercado_id);
    v_counter := v_counter + 1;
    
    atualizar_cli_segmercado(v_counter, v_segmercado_id);
    v_counter := v_counter + 1;
END;


DECLARE
    v_segmercado_id cliente.segmercado_id%type := 2;
    v_counter NUMBER(3) := 1;
BEGIN
    /*----------------------------------------------------
        No Loop iremos executar a atualização de segmento,
        depois incrementar o contador, para cada repetição 
        o contador v_counter deve aumentar mais um
        No Exit When é a condição de saída do LOOP,
        será quando contador atingir 7.
    -----------------------------------------------------*/
    
	
	LOOP       
        atualizar_cli_segmercado(v_counter, v_segmercado_id);
        v_counter := v_counter + 1;
    EXIT WHEN
        v_counter > 6;      
    END LOOP;
	
	
END;

select * from cliente;



select * from cliente;

declare
    v_segmercado_id cliente.segmercado_id%type := 2;
    v_counter number(10) := 1;
begin
    
    LOOP
        atualizar_cli_segmercado(v_counter, v_segmercado_id);
        v_counter := v_counter + 1;
    EXIT WHEN
        v_counter >= 3;
    END LOOP;
end;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------- FOR com PLSQL

[00:00] Será que essa é a melhor maneira que eu tenho para fazer esse loop? Loop este quando envolve um número já previamente definido de interações? Eu já sei de antemão que eu quero fazer isso do cliente 1 ao cliente 6.
[00:22] Existe outra estrutura que você pode utilizar quando você sabe o número de iterações que você quer fazer, que é a estrutura for. O for é muito usado em várias linguagens de programação estruturadas. Vamos aprender a ver como funciona o for dentro do PL/SQL.
[00:43] Para isso vamos criar de novo uma nova estrutura e vamos colocar o nosso DECLARE, BEGIN e o END;. Vamos aproveitar o script que fizemos antes, eu vou copiar a declaração da variável v_SEGMERCADO_ID.
[01:13] Como eu vou trabalhar com o for, eu não preciso ter a variável de contador, porque ela vai ser declarada dentro da própria estrutura for. E o for é composto por um FOR e termina com um END LOOP;.
[01:39] Dentro do for eu vou colocar a variável, que vai ser o contador, então eu vou colocar v_I, depois eu coloco a palavra IN e eu vou colocar o número inicial ao número final, separado por ponto. Como eu quero fazer isso de 1 a 6, eu coloco 1..6 e termino a frase com o LOOP. Ou seja, eu vou pegar esta variável, v_I, e variar de 1 a 6.
[02:26] Aqui dentro eu vou executar o atualizar_cli_seg_mercado, vou passar o código do cliente, o (v_ID,, que é o contador, e passo o segmento de mercado que vai ser atualizado, v_SEGMERCADO_ID);.
[03:05] Notem, essa estrutura ficou muito mais simples de se escrever do que a estrutura anterior, simplesmente eu coloco o for, especifico de onde a onde eu vou fazer o contador e executo.
[03:27] Vamos então verificar o conteúdo da tabela de clientes, todos os segmentos de mercado estão com o valor 1, eu vou então colocar o valor 3 e vamos executar esse loop.
[03:59] Cometi um erro, é v_ID e eu botei v_I. Pronto, agora foi. Foi concluído com sucesso, se eu olhar agora o meu conteúdo da tabela de clientes, todo mundo agora está com o número 3.
[04:27] Relembrando, o ID que eu uso é a variável que eu declaro dentro do for. E ela não precisa estar no declare, porque ao invocá-la dentro do for, ela é implicitamente declarada.
[04:47] Só que, claro, não sei se vocês já notaram, tanto esta rotina, quanto a do vídeo anterior, temos que saber de antemão que tem seis clientes, precisamos garantir que os clientes estão numa sequência.
[05:06] Imagine, se eu criar agora um cliente 9, eu vou ter sete clientes, mas eu vou ter os clientes 1, 2, 3, 4, 5, 6, 9. E como o ID do cliente está diretamente ligado ao contador, isso vai dar problema. Mas vamos tentar resolver esse detalhe nos próximos vídeos.

DECLARE
    v_segmercado_id cliente.segmercado_id%type := 2;
BEGIN
    /*----------------------------------------------------
        No FOR não precisa ter a variável de Contador,
        pois ela será declarada dentro da própria estrutua do FOR, v_counter
        estrutura; FOR e termina com END LOOP.
    -----------------------------------------------------*/
    
	
	FOR        
        v_counter IN 1..6 LOOP
            atualizar_cli_segmercado(v_counter, v_segmercado_id);
        
    END LOOP;
	
	
END;

------------------------------------------------------------------- Procedure inserir percentual

CREATE OR REPLACE PROCEDURE incluir_percentual (
    p_id IN cadastro_item.codigo_item%type,
    p_percentual IN cadastro_item.percentual%type
) IS    
    v_id cadastro_item.codigo_item%type := p_id;
    v_percentual cadastro_item.percentual%type := p_percentual;
BEGIN    
    UPDATE
        cadastro_item
    SET
        percentual = v_percentual
    WHERE
        codigo_item = v_id;
    COMMIT;
END;

------------------------------------------------------------------- Loop para inserir dados na tabela.

DECLARE
    v_codigo_de_parametro cadastro_item.codigo_item%type := 10; 
BEGIN
    FOR
        v_counter IN 471..6880 LOOP
            incluir_percentual(v_counter, v_codigo_de_parametro);
    END LOOP;
END;

select percentual, descricao_item from cadastro_item ;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------- Entendendo CURSOR

[00:00] Nossa rotina funciona direito, porque eu estou supondo que os IDs dos meus clientes são uma sequência bem comportada de 1 até 6, o que foi definido, 1..6.
[00:16] Então o meu contador vai de 1, 2, 3, 4, 5, 6, está aqui a declaração, eu vou passando como parâmetro esse contador e ele vai atualizando o cliente. Se olharmos a nossa tabela de clientes, nós temos os clientes de 1 a 6.
[00:37] Agora imagine que eu faça isso daqui, deixa eu criar uma nova área de edição, EXECUTE INCLUIR_CLIENTE, código do cliente, eu vou colocar (9,, nome do cliente, vou colocar ’MERCADO SÃO JOÃO’, por exemplo. O CNPJ, cinco dígitos, ’45623’,, segmento de mercado, vou colocar 1,. Próximo parâmetro é a previsão de faturamento, 120000);. Vou incluir isso daqui. Funcionou.
[01:43] Agora se eu der o meu SELECT * FROM CLIENTE;, eu tenho sete clientes, esse número que está do lado, de 1 a 7, é o contador das linhas. Mas que até o 6, legal, mas depois pula para 9.
[02:04] Se eu vier agora e rodar, nós temos sete clientes, eu posso considerar o loop de 1 a 7. Se eu rodar, vai de certa maneira funcionar, mas se dermos o nosso SELECT * FROM CLIENTE;. Vamos fazer melhor, porque já está todo mundo igual a 1, não foi um bom exemplo. Eu vou voltar, vou substituir esse “1” para “3”, vou rodar. Rodou.
[02:55] Quando eu dou meu select, note que até o cliente 6 ele fez, mas o cliente 9 continuou 1, por quê? Porque naquele contador ele nunca chegou a 9, então não está muito legal esse procedimento. Eu precisava ter uma estrutura em que eu pudesse não usar um contador para atualizar o segmento, mas usar o próprio código real do cliente.
[03:33] Vamos conseguir resolver esse problema através de uma estrutura que existe no Oracle chamada “cursor”. Vamos entender teoricamente como funciona o cursor e depois vamos fazer na prática isso dentro da nossa rotina.
[03:56] Cursor é uma estrutura implementada no Oracle e que permite uma interatividade linha a linha através de uma determinada ordem predefinida quando o cursor é definido, onde eu posso percorrer elementos da tabela que estão armazenados em memória.
[04:17] Para usarmos o cursor, temos quatro fases específicas. Primeira fase eu declaro o cursor. Ao declarar o cursor, eu dou um nome para ele e defino a forma com que o cursor vai ser populado em memória. Essa definição é através de um comando SQL, um comando select, igual àqueles que nós aprendemos no curso de consultas avançadas.
[04:45] Depois eu abro o cursor, ou seja, disponibilizo o cursor para uso, percorro linha a linha do cursor e obtenho os valores dele, e eu faço qualquer coisa que eu queira com esses valores. Depois eu fecho o cursor, ou seja, eu o libero da memória.
[05:07] Na prática, seria o seguinte, digamos que eu tenha essa tabela no Oracle e eu defino uma variável e defino um cursor. Aqui eu não estou me preocupando muito com a sintaxe correta do comando, mas vamos tentar entender.
[05:23] Nesse ponto eu defini um nome para uma variável e um cursor. Ao definir o cursor, eu digo como ele é definido, um select, e ele monta para mim isso em memória. Depois eu abro o cursor, basicamente o cursor fica disponível para consulta.
[05:51] Depois eu dou um comando chamado fetch. Ao dar o comando fetch, como o cursor foi aberto, o ponteiro inicial se posiciona na primeira posição do cursor, e eu jogo o conteúdo desse fetch dentro da variável. Então a minha variável vai ter o valor que está aqui.
[06:13] Quando eu dou o segundo fetch, eu passo para a próxima linha. Dou um terceiro ou quarto fetch, avanço até a última linha. E depois eu dou um close. Ao dar o close, o cursor é eliminado da memória e a memória fica limpa.
[06:33] O que nós vamos fazer é: nós vamos criar um cursor com o meu cadastro de clientes, vou percorrer linha a linha dando fetch, buscando o código do cliente daquela linha e eu vou usar este código para passar como parâmetro para a minha procedure de atualização do segmento.
[06:58] Não importa se os códigos dos meus clientes estão ou não em forma sequencial, vai funcionar, porque ele vai pegar o código do cliente naquele momento. No próximo vídeo faremos isso na prática no PL/SQL.

set serveroutput on;
DECLARE
    CURSOR cur_cadastro_item IS SELECT  categoria, count(*)  "QTD" from cadastro_item group by categoria;
    v_categoria cadastro_item.categoria%type;
    v_qtd cadastro_item.percentual%type;
    
BEGIN
    OPEN
        cur_cadastro_item;

    LOOP 
        FETCH cur_cadastro_item INTO v_categoria, v_qtd;

    EXIT WHEN
        cur_cadastro_item%notfound;
        dbms_output.put_line('Categoria: ' || v_categoria);
        dbms_output.put_line('Quantidade: ' || v_qtd);
    END LOOP;

    CLOSE
        cur_cadastro_item;
END;

----------------------------------------------------------------------------------------------------------------------------------------------------------- Usando o cursor na prática

[00:00] Vamos colocar em prática como funciona o cursor. Vimos no vídeo anterior uma apresentação mostrando o conceito de como o cursor funciona.
[00:12] Vamos colocar em prática primeiro fazendo um programa em PL/SQL bem simples, mostrando só como eu consigo percorrer o cursor e escrever o conteúdo dele.
[00:22] Depois já vamos aplicar esse conhecimento de cursor no nosso problema de atualização dos segmentos de mercado, que vimos no último vídeo da aula passada, que quando temos a sequência dos códigos dos clientes sem ser uma sequência, a forma com que estávamos atualizando o segmento de mercado estava dando problema.
[00:50] Vamos criar uma área de edição associada à conexão CURSO PL SQL e eu vou construir um bloco de programa, DECLARE, BEGIN e END;. Eu vou olhar a apresentação que eu mostrei no vídeo anterior e temos aqui quatro passos, declarar o cursor, abrir o cursor, percorrer linha a linha e fechar o cursor. Vamos primeiro começar com a declaração do cursor.
[01:33] A declaração do cursor vai ser feita dentro do declare, o cursor acaba sendo uma variável, essa variável não é do tipo inteira, não é do tipo string, não é do tipo lógica, ela é do tipo cursor. E eu declaro assim, CURSOR, o nome do cursor, cur_CLIENTE, por exemplo.
[01:53] Da mesma maneira que estamos colocando “v_” quando estamos usando uma variável de trabalho dentro do bloco PL/SQL, no caso de cursor nós vamos usar como padrão “cur_”.
[02:12] Novamente, padrões são regras para unificar coisas. Não significa na empresa que você trabalhe o padrão vai ser esse, mas é uma boa prática usar sempre a palavra “cur_” na frente de uma variável do tipo cursor.
[02:32] Depois eu coloco IS e eu vou associar ao cursor um comando de select, em cima de uma consulta de uma ou mais tabelas. O comando de select que eu vou colocar é qualquer comando de select que o SQL do Oracle suporte. Nós vimos muitos comandos de select no curso de consultas avançadas.
[03:03] Eu vou selecionar o código e o descritor dos clientes. SELECT ID, RAZAO_SOCIAL FROM CLIENTE;. Se eu selecionar somente esse select e executar, veja que ele trouxe os meus clientes.
[03:31] Quando eu declarar esse cursor, o resultado desta tabela vai para a memória associada a esta variável, cur_CLIENTE. É isso que vai acontecer.
[03:50] E eu vou declarar também duas variáveis de trabalho, porque eu vou ter que percorrer o cursor linha a linha. E a cada linha que eu percorrer o cursor, eu preciso jogar para variáveis o valor do ID da linha e o valor da razão social daquela linha que eu estou interagindo.
[04:10] Então eu vou declarar uma variável v_ID, ela vai ser do tipo CLIENTE.ID%type;. E outra variável v_RAZAO_SOCIAL CLIENTE.RAZAO_SOCIAL%type;. Eu declarei as três variáveis de trabalho.
[04:40] Vou fazer agora o seguinte, ao começar as linhas do programa PL/SQL, voltando para o nosso passo, o segundo passo é eu abrir o cursor. Para abrir o cursor eu vou colocar OPEN, o nome do cursor, cur_CLIENTE;. Com essa nova linha o cursor é aberto. Eu pego o resultado desse select e o jogo em memória.
[05:21] Quando eu declaro o cursor, ele não está em memória, ele só está preparado para ser usado. É preciso que eu use o comando open para realmente executar a query que está ali destacada, trazer o resultado e jogar em memória.
[05:42] Só que eu vou percorrer o cursor linha a linha. Eu não sei de antemão quantas linhas tem, então eu não posso ler linha a linha ou fazer um for de um até o número de linhas, eu preciso fazer um loop, onde a cada execução do loop eu vou testar se o cursor acabou ou não. Se o cursor não acabou, eu passo para a próxima linha. Se o cursor acabou, eu saio do loop.
[06:16] Lembrando, loop eu tenho LOOP, EXIT WHEN e END LOOP;. Não necessariamente – isso é um detalhe que talvez eu não tenha falado – o exit when precisa estar colado ao end loop, eu posso ter comandos entre o loop e o exit when e comandos entre o exit when e o end loop.
[06:42] O que vai acontecer é que numa interação do loop, quando eu executar os primeiros grupos de comando, se essa condição for verdadeira, eu pulo para a saída do loop e não executo esses comandos de baixo, eles não são executados.
[07:06] Estou dentro do loop, o que eu vou fazer? Eu preciso percorrer a linha, capturar o conteúdo da primeira linha. Aqui na apresentação eu mostrei, nessa transparência, vou até avançar um pouco mais, que o comando para buscar o conteúdo da linha é o fetch.
[07:35] O que está escrito não é bem a sintaxe do Oracle, mas nós vamos agora escrever como o fetch funciona no PL/SQL. Eu vou dar um comando FETCH, o nome da variável, cur_CLIENTE INTO, e eu vou jogar o conteúdo do cursor em duas variáveis, na variável v_ID, v_RAZAO_SOCIAL;.
[08:14] Como eu sei que tem que ser duas variáveis que eu tenho que colocar? Porque notem, o meu select traz duas colunas. Toda vez que o fetch for buscar uma linha do cursor, como o select tem duas colunas, eu preciso ter duas variáveis, a variável que vai receber o conteúdo da primeira coluna daquela linha e a variável que vai receber o conteúdo da segunda coluna daquela linha.
[08:44] Se esse meu select tivesse 20 colunas, eu teria que ter depois do into 20 variáveis que vão receber o conteúdo da linha do momento. Aqui no caso, como eu estou entrando o loop pela primeira vez, é a primeira linha.
[09:03] Eu vou fazer o seguinte, ao dar o fetch eu preciso testar se eu terminei o cursor, porque imagine – deixa eu voltar de novo à apresentação – eu estou na última linha - ao dar o fetch ele vai tentar dar o fetch no final da linha e vai dar um erro, porque ao dar o fetch a partir da última linha, eu não tenho mais nada.
[09:40] Ao fazer este comando, FETCH cur_CLIENTE INTO v_ID, v_RAZAO_SOCIAL;, quando eu o estiver fazendo na última linha, essas duas variáveis, v_ID e v_RAZAO_SOCIAL vão receber nulos, porque eu não tenho mais linhas, eu acabei.
[09:56] Então antes de fazer alguma coisa com essas variáveis, eu vou testar para saber se esse fetch achou o fim do arquivo e o comando para fazer isso é esse, cur_CLIENTE%NOTFOUND;. Ao fazer isso daqui, eu estou dizendo que saia do loop quando, ao dar o fetch, eu não achei uma linha.
[10:36] Porém, se ele fez o fetch e achou uma linha, ou seja, eu estou na primeira, na segunda, na terceira, eu não estou na última linha, EXIT WHEN cur_CLIENTE%NOTFOUND;, não vai ser verdade e eu continuo executando os comandos que estão a seguir.
[10:52] E eu vou simplesmente escrever na minha saída o conteúdo da variável v_ID e razão social. Eu vou usar aquele comando que temos usado, dbms_output.put_line, e eu vou escrever, por exemplo, (‘ID = ‘ || v_ID);.
[11:28] E depois eu vou escrever outra linha, dbms_output.put_line e eu vou escrever (‘Razão Social = ‘ || e vou concatenar com o conteúdo da variável v_RAZAO_SOCIAL);.
[12:00] Terminou? Ainda não. Depois que eu saio do loop, vamos voltar aqui, eu tenho que fechar o cursor, para poder descarregá-lo da memória. Para fechar o cursor é CLOSE cur_CLIENTE;. Aqui eu errei, dbms_output. Meu programa PL/SQL está finalizado.
[12:38] Relembrando, sempre quando rodamos dbms_output, temos que declarar antes o SET SERVER OUTPUT ON;. Nós rodamos esse comando isolado primeiro, depois executamos o programa PL/SQL. Vamos ver se não houve nenhum problema, vou executá-lo.
[13:09] Ele escreveu como saída ID 2 razão social, depois ele foi para a próxima linha e assim por diante. Ele escreveu o código e o descritor que eu tenho na tabela de clientes, percorrendo o cursor até o seu final. Se eu descarregar até aqui, ID 9, note que quando ele escreveu a última linha, que é a linha 9, o programa acabou.
[13:45] Já entendemos então como o cursor funciona. No próximo vídeo vamos aplicar esse conhecimento no nosso problema, para escrever novos segmentos de mercado dentro da tabela de clientes.


SET SERVEROUTPUT ON;

DECLARE
    CURSOR cur_cliente IS SELECT id, razao_social FROM cliente;

    v_id            cliente.id%TYPE;
    v_razao_social  cliente.razao_social%TYPE;

BEGIN
    OPEN cur_cliente;
    
    LOOP
        FETCH cur_cliente INTO v_id, v_razao_social;
            
    EXIT WHEN
        cur_cliente%NOTFOUND;
        dbms_output.put_line('ID = ' || v_id);
        dbms_output.put_line('Razão Social = ' || v_razao_social);
    
    END LOOP;

    CLOSE cur_cliente;
END;




DECLARE
    CURSOR cur_cliente IS SELECT percentual, descricao_item FROM cadastro_item;
    v_percentual cadastro_item.percentual%type;
    v_descricao_item cadastro_item.descricao_item%type;
    
BEGIN
    OPEN
        cur_cliente;
    
    LOOP
        FETCH cur_cliente INTO v_percentual, v_descricao_item;
    
    EXIT WHEN
        cur_cliente%NOTFOUND;
            dbms_output.put_line('Percentual: ' || v_percentual);
            dbms_output.put_line('Descricao:  ' || v_descricao_item);
    
    END LOOP;
    
    CLOSE cur_cliente;
    
    COMMIT;
END;

SET SERVEROUTPUT ON

'
O comando Fetch, do cursor, realiza a sua leitura. Abaixo, são verdadeiras as alternativas:

Alternativa correta
A quantidade de variáveis após a cláusula INTO, do comando FETCH, deverá ser igual à quantidade de colunas do cursor


Alternativa correta!

Alternativa correta
O processo de leitura só anda para frente

Alternativa correta!
'

----------------------------------------------------------------------------------------------------------------------------------------------- CURSOR na atualização Segmento Mercado

[00:00] Vamos colocar em prática o nosso conhecimento de cursor. Vamos agora aplicar o cursor na nossa rotina de atualização do segmento de mercado, dentro da tabela de clientes.
[00:15] Eu vou criar uma nova área de edição e eu vou pegar o nosso bloco de programa PL/SQL que fizemos no vídeo passado, vou copiá-lo, vou colá-lo dentro e nessa área abaixo, só como guia, eu vou pegar aquele bloco de programa que fizemos no último vídeo da aula passada, que faz a atualização do segmento de mercado dentro, usando um for.
[00:52] E que vimos que quando você não tem uma sequência de códigos de cliente respeitando uma sequência numérica, dá problema. Então eu vou copiar, vou colocar embaixo.
[01:07] Vamos entender primeiro como funciona o programa de atualização do segmento de mercado. Eu executo a procedure atualizar_cli_seg_mercado, passando como parâmetro o novo segmento de mercado, v_SEGMERCADO_ID, e o código ID, v_ID. Logo, eu vou precisar dessa variável do novo segmento de mercado, v_SEGMERCADO_ID CLIENTE.SEGMERCADO_ID%type :=3;. Eu vou pegá-la e vou colar dentro.
[01:41] O cursor eu vou usar esse mesmo, CURSOR cur_CLIENTE IS SELECT ID, RAZAO_SOCIAL FROM CLIENTE;, só que eu não preciso pegar o nome do cliente, porque eu só vou precisar na atualização do ID, v_SEGMERCADO_ID, é uma constante, que é declarada no início do programa, então eu não preciso usar SELECT ID, RAZAO_SOCIAL, só SELECT ID.
[02:10] Eu vou ter a minha variável v_SEGMERCADO_ID declarada como 3, nesse caso, e eu vou ter o v_ID, porque eu preciso usá-lo para receber o conteúdo do cursor. Essa outra v_RAZAO_SOCIAL eu vou apagar, eu não preciso dela.
[02:37] Eu vou abrir o cursor, vou jogar nas variáveis, porém esse, v_RAZAO_SOCIAL, não precisa ter, então eu vou apagar, ponto e vírgula. Testo se o cursor acabou. Se o cursor não acabou, o que eu vou fazer? Eu vou atualizar o segmento de mercado.
[03:06] Aqui eu vou executar isso, v_SEGMERCADO_ID, é constante, que é o 3, e o v_ID, é o conteúdo da variável da linha do cursor. E eu vou fazer o loop e fechar.
[03:22] Eu vou apagar esse guia, declare, e antes eu vou ver o conteúdo da tabela de clientes. SELECT * FROM CLIENTE;. Eu tenho os meus segmentos, todo mundo 3 e o último 1.
[03:47] Eu vou colocar “2”, por exemplo, e vou rodar isso para atualizar todo mundo com 2. Seleciono o meu bloco, vou rodar. Rodei, agora eu vou olhar o conteúdo da tabela. Note que está todo mundo com 2, independente se o ID tem ou não uma sequência, coisa que não funcionava quando rodamos aquele programa PL/SQL do último vídeo da aula passada.
[04:26] Então o cursor resolveu o nosso problema que tínhamos encontrado em vídeos anteriores, não conseguia atualizar o segmento de mercado quando o código do cliente não era sequencial.

'
- O comando SELECT, do cursor, é definido entre DECLARE/IS e o BEGIN do bloco. A query do cursor pode referenciar uma ou mais tabelas.
	Dentre as alternativas abaixo, qual é uma cláusula do comando do SELECT, do cursor?
	ORDER BY
- A query do cursor é o comando SELECT do SQL. Podemos utilizar qualquer recurso que esteja disponível para esse comando. 
	Por exemplo: pode conter várias tabelas, cláusulas WHERE, ORDER BY, GROUP BY, HAVING, ou qualquer outra cláusula que seja aceita no SELECT do SQL do Oracle.
'

set serveroutput on;
DECLARE
    CURSOR cur_cadastro_item IS SELECT  categoria, count(*)  "QTD" from cadastro_item group by categoria;
    v_categoria cadastro_item.categoria%type;
    v_qtd cadastro_item.percentual%type;
    
BEGIN
    OPEN
        cur_cadastro_item;

    LOOP 
        FETCH cur_cadastro_item INTO v_categoria, v_qtd;

    EXIT WHEN
        cur_cadastro_item%notfound;
        dbms_output.put_line('Categoria: ' || v_categoria);
        dbms_output.put_line('Quantidade: ' || v_qtd);
    END LOOP;

    CLOSE
        cur_cadastro_item;
END;



DECLARE 
    cursor cur_cliente IS SELECT ID FROM cliente;
    
    v_segmercado_id cliente.segmercado_id%type := 3;
    v_id cliente.id%type;
    
BEGIN
    OPEN cur_cliente;
    
    LOOP
        FETCH cur_cliente INTO v_id;
        
    EXIT WHEN
        cur_cliente%NOTFOUND;
        atualizar_cli_segmercado(  p_id=> v_id  ,     p_segmercado_id=>  v_segmercado_id  );
    
    END LOOP;

    CLOSE cur_cliente;
END;

SELECT * FROM cliente;


'-------------------------------------------------------------------------------------------------------------------------------------------------------------- Usando FOR com Cursor '


[00:00] Existe uma boa prática em programação que diz que, quanto mais simples é um programa, menor é a probabilidade de erro.
[00:12] Essa estrutura onde abrimos o cursor, fizemos um loop, capturamos a linha do cursor, testamos se o cursor terminou, saímos do loop e fechamos, dentro do PL/SQL pode ser executado de uma maneira muito mais simples.
[00:28] O comando for pode ser usado de tal maneira que dentro do próprio comando for do PL/SQL, uma série de funcionalidades de abrir o cursor, ir para a próxima linha, testar se o cursor existe e fechar o cursor, já estão de maneira implícita sendo executados. Como funciona isso? Vamos fazer o exemplo.
[00:56] Vou então criar uma nova área de edição e vou pegar esse programa, que foi o que nós fizemos na aula passada, eu vou copiar, colar e nós vamos agora editá-lo. Este passo inicial, onde nós declaramos o cursor e eu declarei o novo segmento de mercado, permanece.
[01:24] Desta outra forma, uma série de funcionalidades já ficam implícitas no comando. Primeira funcionalidade é que eu não vou precisar desta variável de trabalho, que é a variável v_ID, que eu uso para receber o valor do fetch, eu não preciso dela.
[01:53] Eu nem vou precisar abrir o cursor, porque esta nova forma de trabalhar cursor, da primeira vez que eu manipular o cursor, ele internamente já o abre, então eu não preciso disso, OPEN cur_CLIENTE;.
[02:09] Basicamente eu vou usar um for, que é assim: FOR, eu dou o nome de uma variável que eu não preciso declarar, vou chamá-la, por exemplo, de cli_rec e eu coloco IN, o nome do cursor, cur_CLIENTE, e eu termino com um LOOP e fecho com END LOOP;.
[02:47] Quando eu faço isso, eu já vou percorrer dentro desse loop todas as linhas do cursor e jogar o conteúdo da linha dentro dessa variável cli_rec, que não é do tipo inteira, não é do tipo string, ela é do tipo array.
[03:09] Se o meu select só tem uma coluna, cli_rec só vai ter uma posição, vai ser um array de uma posição. Se eu tivesse mais colunas, cli_rec vai ter o número de posições do número de colunas que eu vou ter no select. E eu posso me referenciar a essas posições.
[03:34] Dentro do for eu vou rodar a atualização do segmento. Essa variável v_SEGMERCADO_ID foi declarada. Agora, como eu passo para a rotina o código do cliente atual?
[03:54] O código do cliente atual está em algum lugar deste array. Como ele é o campo ID, eu me referencio nele dessa maneira, cli_rec.ID, cli_rec, o nome da variável que foi declarada no for, .ID, que é o nome da coluna do select.
[04:26] E esse loop é inteligente o suficiente a terminar quando eu encontro o fim do cursor. Então tudo isso foi substituído por esse for inteligente, onde eu não precisei dar open no cursor, não precisei dar fetch no cursor e não precisei testar se o cursor terminou.
[04:55] E melhor, quando eu saio do loop, ele automaticamente já fecha o cursor, então eu não preciso nem do close. Então aquela rotina ficou assim, bem mais simples. Vamos testar? Eu vou primeiro ver a situação da tabela de clientes no momento, SELECT * FROM CLIENTE;, vou rodar.
[05:26] Notem que está tudo com 2. Eu então agora vou mudar de 2 para 1, vou executar, executou com sucesso. Eu agora faço o select novamente. Note que ficou tudo agora com o valor 1. Ou seja, esse programa ficou igual a esse.
[05:59] Vamos comparar, eu vou dar um copiar e colar, só para vermos. Será que eu consigo diminuir o tamanho? Vamos ver, eu vou diminuir isso.
[06:19] Note que esse programa faz a mesma coisa que esse de baixo. Só que o de cima tem oito linhas e o de baixo 13 linhas. Então a estrutura de baixo é mais complexa que a estrutura de cima.
[06:49] Eu vou apagar de novo essa estrutura de baixo e ficou a nossa versão final do novo bloco de programa PL/SQL para esse vídeo, do jeito que está escrito em cima. Até o próximo.

'---------------------------------------------------------------------------------------------------------------------------------------------------------------- LOOP '

select * from cliente;

declare
    vCounter NUMBER := 1;
    vSegmercdoID cliente.segmercado_id%type;
begin
    
   LOOP
    atualizar_dados_tabela_cliente(  p_id=>  vCounter,  p_segmercado_id=> vSegmercdoID
    );
    
    vCounter := vCounter + 1;
   
   EXIT WHEN vCounter > 10;
    
   END LOOP;
    
    commit;
end;




declare
    vCounter cliente.id%type;
    vDataInclusao cliente.data_inclusao%type := '32/05/2022';

begin
    
    for vCounter in 1..10 loop
        
        update cliente set data_inclusao = vDataInclusao where id = vCounter;
        
    end loop;
end;




declare
    vCounter cliente.id%type;
    vFatur cliente.faturamento_previsto%type := 0.22 ;

begin
    
    for vCounter in 1..10 loop
        
        update cliente set faturamento_previsto = vFatur where id = vCounter;
        vFatur := vFatur + (1000 / 33.21);
        
    end loop;
end;

'---------------------------------------------------------------------------------------------------------------------------------------------------------------- FOR '

declare
    vSegmercadoID cliente.segmercado_id%type := 3;
begin
    for vCounter in 1..10 loop
        atualizar_dados_tabela_cliente(p_id=>   vCounter  ,  p_segmercado_id=>  vSegmercadoID
        );
    end loop;
    
end;



declare
    vSegmercadoID cliente.segmercado_id%type;
begin
    for vCounter in 1..2 loop
    
        atualizar_dados_tabela_cliente(p_id=>   vCounter  ,  p_segmercado_id=>  vSegmercadoID
        );
    end loop;
end;



declare
    vSegmercadoID cliente.segmercado_id%type :=4;
begin
    FOR vCounter IN 1..10 LOOP
        atualizar_dados_tabela_cliente(p_id=>   vCounter   ,p_segmercado_id=>  vSegmercadoID
        );
    END LOOP;
end;



begin
    FOR vCounter IN 4..10 LOOP
        inserir_dados_tabela_segmercado(p_id=> vCounter  ,p_descricao=>  'Atacadão'
        );
    END LOOP;
end;


begin
    FOR vCounter IN 1..10 LOOP
        
        delete from segmercado where descricao = upper('Atacadão');
        
    END LOOP;
end;

'---------------------------------------------------------------------------------------------------------------------------------------------------------------- CURSOR '

set serveroutput on;
set verify off;

declare
    CURSOR cur_cliente IS select * from departments;
    record_cliente cur_cliente%rowtype;
begin
    OPEN cur_cliente;
    
    LOOP
        fetch cur_cliente INTO record_cliente;
        
    EXIT WHEN
        cur_cliente%notfound;
        dbms_output.put_line
                     (record_cliente.department_id
                     || '  -  '
                     || record_cliente.department_name
                     || '  -  '
                     || record_cliente.manager_id
                     || '  -  '
                     || record_cliente.location_id);
    END LOOP;
    CLOSE cur_cliente;
end;





set serveroutput on;
set verify off;
accept p_employee_id prompt ' ... ';

declare
    CURSOR cur_employees IS 
        select * 
        from employees 
        where employee_id = &p_employee_id ;
    
    record_employees cur_employees%rowtype;  
   
begin
    OPEN cur_employees;
    
    LOOP
        FETCH cur_employees INTO record_employees;
    
    EXIT WHEN
        cur_employees%notfound;
        dbms_output.put_line
                                                (record_employees.employee_id           || '  -  ' ||
                                                record_employees.first_name                 || '  -  ' ||
                                                record_employees.last_name                  || '  -  ' ||
                                                record_employees.email                          || '  -  ' ||
                                                record_employees.phone_number         || '  -  ' ||
                                                record_employees.hire_date                    || '  -  ' ||
                                                record_employees.job_id                          || '  -  ' ||
                                                ltrim(to_char(record_employees.salary, 'L99G999G999D99'))    || '  -  ' ||
                                                record_employees.commission_pct       || '  -  ' ||
                                                record_employees.manager_id                || '  -  ' ||
                                                record_employees.department_id           || '  -  ' ||
                                                'fim');        
    END LOOP;
    close cur_employees;
end;





BEGIN
    open cur_cliente;
    
    LOOP
        FETCH cur_cliente into vRazaoSocial, vSoma;
        
    EXIT WHEN
        cur_cliente%NOTFOUND;
        dbms_output.put_line('Razao ' || vRazaoSocial);
        dbms_output.put_line('Soma Faturamento ' || vSoma);
    END LOOP;
        
    close cur_cliente;
END;




DECLARE

    CURSOR cur_cliente IS select id, razao_social, segmercado_id from cliente;        
        vID cliente.id%type;
        vRazaoSocial cliente.razao_social%type;
        vSegmercadoID cliente.segmercado_id%type;
BEGIN
    OPEN cur_cliente;
    
    LOOP
        FETCH cur_cliente INTO vID, VRazaoSocial, vSegmercadoID;
    
    EXIT WHEN 
        cur_cliente%NOTFOUND;
        dbms_output.put_line('ID ' || vID);
        dbms_output.put_line('Razão Social ' || VRazaoSocial);
        dbms_output.put_line('ID segmercado ' || vSegmercadoID);        
    END LOOP;
        
    CLOSE cur_cliente;
END;




declare
    CURSOR cur_cliente IS select categoria, sum(faturamento_previsto) as total from cliente group by categoria;
    vCategoria cliente.categoria%type;
    vSoma cliente.faturamento_previsto%type;

begin
    OPEN cur_cliente;

    LOOP
        FETCH cur_cliente into vCategoria, vSoma;

    EXIT WHEN
        cur_cliente%NOTFOUND;
        dbms_output.put_line('Categoria ' || vCategoria || ' a soma desta Categoria ' || vSoma);
        
    END LOOP;
    
    CLOSE cur_cliente;
end;




DECLARE
    CURSOR cur_cliente IS select id from cliente;
        vSegmercadoID cliente.segmercado_id%type := 2;
        vCounter cliente.id%type;
    
BEGIN
    OPEN cur_cliente;
    
    LOOP
        FETCH cur_cliente INTO vCounter;
    
    EXIT WHEN
        cur_cliente%NOTFOUND;
        atualizar_dados_tabela_cliente(vCounter, vSegmercadoID);
    
    END LOOP;
    
    CLOSE cur_cliente;
    
    commit;
END;




declare
    cursor cur_segmercado IS select id from segmercado;
        vDescricao segmercado.descricao%type := 'México';
        vCounter segmercado.id%type;
begin
    open cur_segmercado;
    
    loop
        fetch cur_segmercado into vCounter;
        
    exit when
        cur_segmercado%notfound;
            update segmercado set descricao = upper(vDescricao) where id = vCounter;
        
    end loop;
    
    close cur_segmercado;
end;




declare
    CURSOR cur_cliente IS select id, razao_social from cliente;
    vID cliente.id%type;
    vRazaoSocial cliente.razao_social%type;
    
begin
    open cur_cliente;

    loop
        fetch cur_cliente into vID, vRazaoSocial;
            
    exit when
        cur_cliente%notfound;
        dbms_output.put_line('ID ' || vID || ' Razão '  || vRazaoSocial);
        
    end loop;

    close cur_cliente;
end;



select * from cliente;

declare
    cursor cur_cliente IS select id from cliente;
    vID cliente.id%type;
    vSegmentoID cliente.segmercado_id%type := 2;
    
begin
    open cur_cliente;
    
    loop
        fetch cur_cliente into vID;
    
    exit when
        cur_cliente%notfound;
        atualizar_dados_tabela_cliente(p_id=>      vID   ,    p_segmercado_id=>     vSegmentoID     );
        
    end loop;
    
    close cur_cliente;
end;



declare
    CURSOR cur_cliente IS select id from cliente;
        v_razao_social cliente.razao_social%type;
        v_id cliente.id%type;

begin
    open cur_cliente;
    
    loop
        fetch cur_cliente into v_id;
    
    exit when
        cur_cliente%notfound;
        select razao_social into  v_razao_social from cliente where id = v_id;
        dbms_output.put_line('A Razão Social ' || ' do cliente nº ' || v_id || ' é ' || v_razao_social);
        
    end loop;
    
    close cur_cliente;
end;

'---------------------------------------------------------------------------------------------------------------------------------------------------------------- FOR com CURSOR 
 -- ATENÇÃO A VARIÁVEL vCounter (contador de repetição) a mesma precisa ter o tipo NUMBER.
'
declare
    CURSOR cursor_cliente IS select id from cliente;
        vSegmercado cliente.segmercado_id%type;

begin
    
    FOR record_cliente IN cursor_cliente LOOP
        atualizar_dados_tabela_cliente(p_id=>    record_cliente.id    ,p_segmercado_id=>   vSegmercado     );
    END LOOP;
end;


declare
    CURSOR cursorCliente IS select id from cliente;
    vSegmercadoID cliente.segmercado_id%type := 9;
    
begin
    
    FOR vCounter IN cursorCliente LOOP
        atualizar_dados_tabela_cliente(p_id=>   vCounter.id      ,    p_segmercado_id=>     vSegmercadoID      );
    END LOOP;

end;



declare
    CURSOR cursorSegmercado IS select id from segmercado;
    vDescricao segmercado.descricao%type := 'Atacado';
    
begin
    
    FOR vCounter IN cursorSegmercado LOOP
   
        atualizar_dados_tabela_segmercado(p_id=>  vCounter.id   ,    p_descricao=>    vDescricao   );
   
    END LOOP;
    
end;



declare
    CURSOR cursorCliente IS select id from cliente;
    vRazaoSocial cliente.razao_social%type := 'Supermercado Maxxi';

begin
    
    FOR vCounter IN cursorCliente LOOP
        
        update cliente set razao_social = vRazaoSocial where id = vCounter.id;
    
    END LOOP;

end;



declare
    cursor cursor_cliente IS select id from cliente;
        v_segmercado_id cliente.segmercado_id%type := 1;
begin
    
    FOR percorre_linhas IN cursor_cliente LOOP
    
        update cliente set segmercado_id = v_segmercado_id where id = percorre_linhas.id;
		
        dbms_output.put_line('Linha Atual ' || percorre_linhas.id || ', ID Segmento de Mercado ' || v_segmercado_id);
        
		v_segmercado_id := v_segmercado_id + 1;
        
    END LOOP;
end;


'----------------------------------------------------------------------------------------------------------------------------------------------------- JOIN - FOR LOOP com CURSOR '
DECLARE

CURSOR cur_job_emp IS
    select
        job.max_salary MAX_V,
        job.min_salary MIN_V,
        count(*) qtd,
        emp.job_id JO_ID
    from
        jobs job
    inner join
        employees emp
    on
        job.job_id = emp.job_id
    group by
        job.max_salary,
        job.min_salary,
        emp.job_id
    order by
        job.max_salary DESC
    ;

BEGIN
    
    FOR record_job_emp IN cur_job_emp LOOP
    
    dbms_output.put_line(record_job_emp.JO_ID || ' - ' ||
                                             record_job_emp.MIN_V || ' - ' ||
                                             record_job_emp.MAX_V
                                             );
    END LOOP;
END;







set serveroutput on;
set verify off;

DECLARE
    CURSOR cur_employees IS
    SELECT
        sum(emp.salary) as SOMA_SALARIO,
        job.job_title as CARGO
    FROM
        employees emp
    inner join
        jobs job
    on
        job.job_id = emp.job_id
    group by
       job.job_title ;

BEGIN
    FOR record_employees IN cur_employees LOOP
    
        dbms_output.put_line
                                (record_employees.SOMA_SALARIO
                             || ' --- '
                             || record_employees.CARGO
                               );
    END LOOP;
END;


'------------------------------------------------------------------------------------------------------------------------------------------------------------- WHILE LOOP com CURSOR '

set serveroutput on;
set verify off;

declare
    CURSOR cur_departments IS select * from departments;
    record_departments cur_departments%rowtype;
    
begin

    OPEN cur_departments;
    
    FETCH cur_departments INTO record_departments;
    
    WHILE cur_departments%found LOOP
        
        dbms_output.put_line
                                          (
                                            record_departments.department_id        || '  -  ' ||
                                            record_departments.department_name  || '  -  ' ||
                                            record_departments.manager_id              || '  -  ' ||
                                            record_departments.location_id
                                          );  
        fetch cur_departments INTO record_departments;
        
    END LOOP;
end;


'-------------------------------------------------------------------------------------------------------------------------------------------------------------- Introdução às Exceções '

[00:00] Vamos agora nessa aula falar um pouco sobre exceções. Todas as linguagens de programação possuem blocos de tratamento de exceções. O que é isso?
[00:11] Quando fazemos alguma coisa no nosso programa, pode ser que devido aos parâmetros que eu coloco para o meu programa ou devido a algum tipo de erro na construção do programa, ele vai me trazer mensagens de erros internas do sistema.
[00:32] Eu posso tratar essas mensagens e quando isso acontecer, em vez de mostrar o erro interno do Oracle, eu apresento um erro um pouco mais amigável. Vamos fazer um exemplo prático para entender o que é um erro, que situações podem acontecer um erro e vamos ver como vamos tratar isso.
[00:55] Eu vou criar uma nova área de edição e eu vou olhar o conteúdo da tabela de clientes, SELECT * FROM CLIENTE;. Está lá, eu tenho ali o meu código de clientes e eu tenho essa rotina que nós construímos durante o curso, que é a “INCLUIR_CLIENTE”, onde eu passo como parâmetros o ID, a razão social, o CNPJ, segmento de mercado e o faturamento previsto.
[01:31] Eu vou executar essa procedure novamente, EXECUTE INCLUIR_CLIENTE e eu vou colocar um novo ID, por exemplo, o ID (‘10’,, vou colocar razão social, MERCADO PPP’,, vou colocar o CNPJ, que tem que ser um número de cinco caracteres, ’40000’,.
[02:13] Vou colocar um segmento de mercado, o segmento 1, e o faturamento previsto, 120000);. Vou rodar esse comando. Eu o rodo, rodou com sucesso. Se eu rodar o select novamente, incluí o cliente 10.
[02:37] Agora olha uma coisa, eu vou agora rodar de novo o comando INCLUIR_CLIENTE, só que agora eu vou colocar ’MERCADO AAA’,, o CNPJ é outro, segmento eu vou manter esse, o faturamento previsto eu vou colocar 90000);. Só que o número do cliente eu vou colocar o número 1.
[03:05] Antes de rodar, reparem uma coisa, eu coloquei que o cliente a ser incluído é o cliente 1, mas notem que o cliente 1 já existe na tabela. E mais, quando criamos a tabela de clientes, nós especificamos que o ID, ou seja, o código do cliente, é chave primária. E quem se lembra do curso de manipulação de dados em Oracle, onde definimos que chave primária não pode se repetir numa tabela, é uma exceção.
[03:49] O que acontece se eu executar a minha procedure passando novamente um cliente com código 1, que é um cliente que já existe? Vamos ver? Se eu rodar essa linha de baixo eu vou ter um erro, “unique constraint (%s.%s) violated”. Eu não posso incluir um novo cliente com um código que já existe. Até aí, tudo bem. O Oracle fez certo. Só que imagina eu, usuário, eu estou manipulando e recebo essa mensagem de erro.
[04:38] Claro, eu estou manipulando o Oracle, normalmente eu vou ser um analista que entende o Oracle, mas vamos lembrar que, na prática, todas essas procedures nós estaremos usando em alguma aplicação que vai estar na mão do usuário. E quando o usuário rodar esse tipo de processo, ele vai receber essa mensagem, que para ele não significa muita coisa, porque ele não é técnico.
[05:04] Seria legal que ele recebesse uma mensagem amigável, em português, explicando para ele o que aconteceu, e o tratamento de exceções permite isso. Nós conseguimos interferir no programa e dizer: “Em vez de você mostrar o seu erro, mostra isso aqui”, e eu digo para o Oracle que ele deve apresentar quanto existir um erro, por exemplo, de chave primária repetida
[05:39] Como fazemos isso? Claro que para fazer isso eu preciso editar essa procedure INCLUIR_CLIENTE. Eu vou dar um clique sobre a procedure que está aqui e ela me mostra o código, “INCLUIR_CLIENTE”. Eu tenho o código da procedure.
[06:00] Eu vou copiar esse código todo e vou voltar lá para o meu script, ele está lá no final, quando vamos criando os scripts, ele vai sempre criando na última aba à direita. Aqui vou colar o comando, deixa eu diminuir bastante a saída para olharmos a nossa rotina.
[06:28] Relembrando, já fizemos essa rotina, entramos todos os parâmetros, declaramos duas variáveis de trabalho e o formato CNPJ. Eu passo o faturamento previsto e ele vai me dizer a categoria, se é um cliente médio, pequeno, grande, médio grande e faço o insert.
[06:57] O que nós vamos acrescentar nessa rotina é depois do final dela e antes do end, eu vou colocar mais um bloco chamado EXCEPTION. Então ficou create, is, * begin* exception e end.
[07:25] Dentro da área exception e end eu vou colocar isso daqui, WHEN dup_val_on_index THEN e eu vou escrever usando dbms_output.put_line e vou colocar uma mensagem (‘CLIENTE JÁ CADASTRADO !!!!’);.
[08:12] Vamos entender o comando. Quando eu dou esse WHEN dup_val_on_index, as palavras “dup val on index” me dizem que são erros do tipo chave primária duplicada. Você vai me perguntar: “Mas como você sabe que o Oracle dá como erro chave primária duplicada o nome dup val on index?”.
[08:42] “Dup val on index” é um tipo de exceção do PL/SQL e o PL/SQL possui uma lista de exceções que podem acontecer quando o programa é executado. Essa lista você pode ir à documentação da Oracle e buscá-la.
[09:01] Eu estou na documentação da Oracle, eu dei uma busca no Google em “Oracle documentation errors and exception handling”. Eu fiz a busca por essas palavras-chave e eu tive isso daqui.
[09:20] Ele explica como funciona a exceção de erros, mas o mais importante é essa lista. Esses nomes são os tipos de erros que podem acontecer durante a execução do PL/SQL. E se olharmos para baixo, eu tenho o erro “DUP_VAL_ON_INDEX”, que vai acontecer quando eu tento inserir valores duplicados numa coluna que é restrição única do índice, está ali a explicação do erro.
[10:09] O que vai acontecer? Se o programa funcionar direito, ele vai executar essas linhas, vai dar o insert. Se eu tentar dar um insert num código de cliente que não existe, esse insert vai funcionar, eu dou o commit e ele pula para o end e termina o programa.
[10:37] Se eu tentar inserir um cliente que já existe, ele vai rodar essas linhas, quando ele rodar essa linha do insert, ele vai dar um erro. Aí o PL/SQl vai pegar, que tipo de erro é esse? E esse tipo de erro é um erro dup_val_on_index, e eu tenho uma exception no meu código. Então quando ele der esse erro, ele vai pular para essa linha do dbms e ele vai escrever isso, “CLIENTE JÁ CADASTRADO”, em vez de escrever a mensagem padrão.
[11:16] Já que entendemos como funciona a exceção, vamos selecionar esse bloco para podermos alterar a nossa procedure. Rodei, “Procedure INCLUIR_CLIENTE compilado”. Agora vamos testar.
[11:41] Eu vou incluir o cliente 11, que é um cliente que não existe. ’MERCADO SSS’,, eu vou manter os mesmos parâmetros, que o mais importante é o ID do cliente. Vou rodar essa linha. Cliente concluído com sucesso, a mensagem embaixo, “Procedimento PL/SQL concluído com sucesso.”, funcionou. Se eu der um select eu tenho agora o cliente 11, funcionou.
[12:14] Agora eu vou tentar inserir o cliente 1 de novo, vou rodar, a mensagem que eu recebo é CLIENTE JÁ CADASTRADO. Eu não recebi aquela mensagem padrão do Oracle quando eu tentei incluir alguém que já existia. É isso que eu queria mostrar a vocês sobre exceções.
[12:46] Só um parêntese antes de iniciar um novo vídeo. Quando fizemos o vídeo passado e executamos a nossa rotina INCLUIR_CLIENTE colocando um cliente que já existia, lembre-se que colocamos o dbms_output como comando para escrever a mensagem cliente já cadastrado.
[13:11] É que não deu erro, mas eu esqueci de avisar a vocês que eu teria que colocar o SET SERVETOUTPUT ON antes de executar a minha rotina. Eu teria que ter executado isso daqui para depois executar isto, EXECUTE INCLUIR_CLIENTE(‘1’, ‘MERCADO AAA’, ‘45677’, 1, 90000);.
[13:37] Por que não deu problema? Porque eu já tinha rodado SET SERVETOUTPUT em rotinas anteriores, mas eu gostaria de deixar registrado que sempre que utilizarmos o dbms_output, temos que rodar antes o SET SERVEROUTPUT ON. Feito o registro, vamos continuar.

create or replace PROCEDURE inserir_dados_tabela_cliente (
    p_id                   IN cliente.id%TYPE,
    p_razao_social         IN cliente.razao_social%TYPE,
    p_cnpj                 IN cliente.cnpj%TYPE,
    p_segmercado_id        IN cliente.segmercado_id%TYPE,
    -- p_data_inclusao        IN cliente.data_inclusao%TYPE,
    p_faturamento_previsto IN cliente.faturamento_previsto%TYPE
    -- p_categoria            IN cliente.categoria%TYPE
) IS
    v_categoria cliente.categoria%type;
    v_cnpj cliente.cnpj%type := p_cnpj;
BEGIN
    v_categoria := retorna_categoria_conforme_fatur(p_faturamento_previsto);
   formata_cnpj_cliente(v_cnpj);

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
        v_cnpj,
        p_segmercado_id,
        sysdate,
        p_faturamento_previsto,
        v_categoria
    );
    COMMIT;
    
    
    EXCEPTION
	
        WHEN dup_val_on_index THEN
            dbms_output.put_line('Exceção de Chave Primaria, duplicidade')
		;
    
END;






create or replace PROCEDURE inserir_dados_tabela_cliente (
    p_id IN cliente.id%TYPE,    p_razao_social IN cliente.razao_social%TYPE,    p_cnpj IN cliente.cnpj%TYPE,    p_segmercado_id IN cliente.segmercado_id%TYPE,    p_faturamento_previsto IN cliente.faturamento_previsto%TYPE  ) IS
    v_categoria cliente.categoria%type;    v_cnpj cliente.cnpj%type := p_cnpj;
BEGIN
    v_categoria := retorna_categoria_conforme_fatur(p_faturamento_previsto);    formata_cnpj_cliente(v_cnpj);

    INSERT INTO cliente (        id,        razao_social,        cnpj,        segmercado_id,        data_inclusao,        faturamento_previsto,        categoria
    ) VALUES (        p_id,        upper(p_razao_social),        v_cnpj,        p_segmercado_id,        sysdate,        p_faturamento_previsto,        v_categoria    );

    commit;

EXCEPTION
    WHEN dup_val_on_index THEN
        dbms_output.put_line('Cliente já esta cadastrado');

END;


execute inserir_dados_tabela_cliente(p_id=> 1   ,p_razao_social=> 'Super Atacado', p_cnpj=> '12345', p_segmercado_id=> 4, p_faturamento_previsto=> 123451);

SQL >>> Cliente já esta cadastrado
SQL >>> Procedimento PL/SQL concluído com sucesso.


' --- Função da exceção  '
' --- No vídeo anterior, vimos uma introdução às exceções. Para que elas servem?  '
' --- Para poder tratar os erros que podem ocorrer na execução de um bloco PL/SQL. É para este objetivo !  '



'----------------------------------------------------------------------------------------------------------------------------------------------------------------  Lançando exceções '


[00:00] Para customizarmos a nossa mensagem de erro, tivemos que usar aquele comando, o dbms_output, para poder escrever na saída e, é claro, ao usá-lo, tivemos que usar o comando SET SERVEROUTPUT ON antes de executar a minha procedure.
[00:27] Só que tem uma forma diferente de você lançar uma exceção customizada. E você pode usar um programa, é uma procedure que já vem interna dentro do Oracle, ou seja, todo mundo pode usar, que é a raise application error.
[00:45] A raise_application_error lança uma exceção, mas com a sua mensagem, digamos assim, customizada. E eu preciso passar dois parâmetros na raise application error, um é o código do meu erro, em segundo, o descritor do erro.
[01:10] No caso do código do erro, eu tenho uma faixa de números que a Oracle disponibiliza para nós. Essa faixa fica entre -20.000 e -20.999, ou seja, eu posso criar até 999 erros customizados dentro das minhas exceções de um programa PL/SQL.
[01:39] Vamos ver como funciona o uso do raise_application_error. Para isso eu vou novamente criar uma nova área de edição e eu vou copiar o nosso create or replace e vou colar.
[02:02] Simplesmente eu vou mudar onde eu declaro o dbms_output e vou substituir essa linha chamando a raise_application_error. E eu vou colocar como parâmetro um número do meu erro, vou botar (-20010,, por exemplo, e o segundo parâmetro, a mensagem ’Cliente já cadastrado !!!!’);.
[02:50] Ou seja, substituí o dbms pelo uso do raise application error, passando como parâmetro o número do erro e o texto. Vou executar para poder alterar a minha procedure. Procedure foi compilada com sucesso e eu vou voltar para aquele código anterior, vou copiar essas três linhas, vou colar em cima e vamos executar.
[03:32] Primeiro vamos incluir um cliente novo, vou olhar a saída, funcionou. E agora eu vou de novo tentar incluir o cliente 1, só que agora eu não preciso rodar o set serveroutput on. Eu vou agora rodar a inclusão do cliente 1, que vai dar erro.
[04:04] A mensagem de erro que é escrita é isso daqui, “Erro a partir da linha : 3 no comando -“, ele mostra que foi o comando INCLUIR_CLIENTE. E cria o “ORA-20010”, um número interno do Oracle, só que esse é um número nosso de trabalho, e temos a mensagem cliente já cadastrado.
[04:32] Eu não preciso usar aquela diretiva do set serveroutput on, porque eu estou usando a rotina interna raise application error, que já me escreve o meu erro customizado ali, numa forma já padronizada, no estilo do erro normal do Oracle. Era esse detalhe que eu queria mostrar para vocês neste vídeo.


declare
    cursor cursor_segmercado is select id from cliente;
    vDescricao segmercado.descricao%type;
    vID segmercado.id%type;

begin
    open cursor_segmercado;
    
    loop
        fetch cursor_segmercado into vID;

    exit when
        cursor_segmercado%notfound;
            update segmercado set descricao = vDescricao where id = vID;
        
    end loop;
        
        close cursor_segmercado;

exception
    when dup_val_on_index then
        dbms_output.put_line('DUP_VAL_ON_INDEX: ' || sqlerrm);
        dbms_output.put_line('Solução: mude o valor de ID');
        
end;




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


'----------------------------------------------------------------------------------------------------------------------------------------------------------------  Lançando exceções '


