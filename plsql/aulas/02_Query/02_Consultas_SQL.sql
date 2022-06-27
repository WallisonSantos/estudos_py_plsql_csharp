----------------------------------------------------------------------------------------------------------------------------------------------------------- CONHECENDO O BANCO DE DADOS

[00:00] Quando nós vamos fazer consultas numa base de dados, é um pré-requisito fundamental que nós conheçamos a estrutura da base. Nós precisamos saber quais são as tabelas, quais são os campos, quais são os relacionamentos entre as tabelas. E inclusive, saber o que significa cada dado que está armazenado no banco, para justamente saber que consultas eu vou fazer.
[00:28] Quando nós estamos em uma empresa grande, que tem uma série de banco de dados, existe uma vasta documentação que você pode consultar antes de começar a fazer as suas consultas. Se você está em uma empresa pequena, talvez você mesmo seja a pessoa que projetou o banco e nem precisa dessa documentação. Mas é fundamental que sempre haja alguma informação sobre o banco para que você tenha acesso a ela antes de fazer as consultas.
[01:00] Mas o SQL Developer fornece algumas informações que eu posso estar olhando na base antes começar a planejar as minhas consultas. Por exemplo, eu tenho a minha lista de três tabelas cadastrais. Se eu der um duplo clique sobre TABELA_DE_VENDEDORES, ele vai me mostrar a estrutura da tabela. Eu posso ver que no caso da TABELA_DE_VENDEDORES, eu tenho MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS e BAIRRO. Isso são os nomes dos campos.
[01:49] Ao lado, eu tenho seus tipos, como eles foram definidos na criação da tabela. Outra coluna importante é se ele aceita ou não nulos. No caso, quando nós queremos consultar dados, essa informação não é importante. Mas se nós quiséssemos incluir dados na tabela, se ele aceita ou não nulo, é uma informação importante. Não só essa, bem como qual é o padrão do campo. Quando eu for inserir alguma informação no banco, se eu omitir a informação, qual é o valor default.
[02:24] Uma ordem sequencial das colunas. E finalmente, o comentário. Esse campo comentário, as pessoas quase nunca preenchem quando criam uma tabela. Mas é legal, porque você pode colocar um texto dizendo, por exemplo, o que significa cada campo daquela tabela. Mas eu tenho aqui também uma aba dados, onde eu tenho o conteúdo da tabela. Ou seja, eu tenho aqui várias abas. A primeira aba que nós vimos foi Colunas. Eu tenho a aba Dados e eu tenho outras abas que pode ser que haja informações a respeito da tabela ou não.
[03:14] A aba Model me mostra graficamente a tabela e com quem ela se relaciona. Eu tenho a minha tabela e ela tem uma relação com a tabela NOTAS_FISCAIS. Eu sei que essas duas tabelas têm um relacionamento. Ele sempre mostra os relacionamentos a partir da tabela que eu estou analisando. Como eu estou analisando a TABELA_DE_VENDEDORES, ele mostra os relacionamentos a partir da TABELA_DE_VENDEDORES.
[03:53] Constraints são todas as restrições que a tabela possui. Basicamente, essa tabela tem uma chave primária e uma chave estrangeira. Eu vou ver que a primeira é uma restrição de chave primária e ele tem uma ligação com a tabela NOTAS_FISCAIS através do campo MATRICULA. Aqui, concessões, eu não tenho. São privilégios de acesso. Algumas estatísticas de consulta. Por enquanto, eu não comecei a fazer nenhuma consulta na tabela.
[04:34] Triggers, que é uma coisa que nós não vamos ver nesse curso, mas para não deixar vocês sem resposta, uma trigger é uma regra de comandos que eu vou executar quando alguma coisa acontece com a tabela. Tenho as minhas dependências. Alguns detalhes da tabela, as partições.
[04:56] Índices, que no caso, quando nós temos uma chave primária, automaticamente o banco cria um índice para ela. Também, a estrutura de índice não vai ser tema desse treinamento. Mas também para não deixar vocês sem respostas, é uma estrutura auxiliar que nós temos associada à tabela, que faz com que quando nós façamos uma busca, isso seja mais rápido. O índice ajuda a procurar alguém dentro da tabela.
[05:26] Se eu vier aqui e clicar na TABELA_DE_PRODUTOS, eu vou ver as mesmas informações de colunas, dados, modelos. Em Dados já tem uma lista de maior de produtos, modelo vai mostrar graficamente o relacionamento.
[05:47] Mas eu poderia estar montando também o que nós chamamos de um diagrama de relacionamento do banco todo. E o SQL Developer me ajuda a fazer isso. Para nós fazermos isso, nós vamos aqui em Exibir, Data Modeler, Browser. Eu vou ter aqui embaixo um modelo de dados, que por enquanto está sem título. E se eu clicar nele, eu vou ter aqui modelos relacionais, e eu tenho aqui um Relacional_1.
[06:39] Eu vou clicar aqui, Novo Modelo Relacional. Ele vai abrir uma área vazia, porque eu tinha um modelo relacional criado e ele quis mostrar o que estava sendo criada, então eu tenho aqui uma área vazia. Ficou meio confuso isso. Eu vou repetir de novo. Deixa eu fechar aqui, deixa eu fechar aqui o browser. Vamos fazer novamente.
[07:12] Eu vim aqui em Exibir, Data Modeler, Browser. Eu abro a parte aqui. Eu vou clicar com o botão direito do mouse sobre Modelo Relacionais, vou escolher Novo Modelo Relacional e ele vai abrir a aba vazia. Eram esses passo que eu tinha que ter feito direto.
[07:38] E o que eu posso fazer? Eu posso pegar a minha tabela, por exemplo, a TABELA_DE_VENDEDORES, eu vou arrastar para cá. Nós temos que clicar sobre a tabela e manter mouse pressionado e arrastar ela para cá.
[08:01] Eu tenho a TABELA_DE_VENDEDORES nos meus modelos de relacionamento. Vou fazer a mesma coisa com produto, clico e mantenho. E TABELA_DE_CLIENTES, vou tentar fazer a mesma coisa. Selecionei ele, mantenho apertado. É meio chato mesmo, tem que ficar tentando até conseguir arrastar a tabela para o modelo relacional. Tenho aqui os modelos relacionais. E eu vou agora tentar arrastar a NOTAS_FISCAIS.
[09:15] Note que ao arrastar a tabela NOTAS_FISCAIS, ele me desenha o relacionamento. Quem se relaciona com quem. A minha tabela NOTAS_FISCAIS tem um relacionamento com a TABELA_DE_VENDEDORES, e esse relacionamento é pela matrícula. Porque eu tenho MATRICULA aqui, ele tem esse F, porque ela tem uma chave estrangeira, uma foreign key, com o campo matrícula, que tem um P nessa tabela, que é uma primary key. Ela é uma restrição, ou seja, não posso ter vendedores com a mesma matrícula.
[09:55] E eu agora vou tentar arrastar aqui a tabela de itens, que está aqui em cima. E eu tenho aqui a minha tabela. Esse diagrama que eu estou mostrando, é o diagrama que se eu puder eu imprimo ele, coloco aqui na minha baia.
[10:27] Com esse diagrama nós conseguimos ver, de forma gráfica, como é que essas tabelas estão organizadas no banco, o nome de cada tabela, o nome de cada campo e os relacionamentos. E isso vai me ajudar a fazer as minhas consultas. Era isso que eu queria mostrar a vocês.

Por que devemos visualizar o esquema de dados?
Para poder executar os comandos SQL corretamente
Para determinar que consultas vou fazer, é fundamental conhecer a estrutura do banco de dados.

---------------------------------------------------------------------------------------------------------------------------------------------------------------- REVISANDO AS CONSULTAS

[00:00] Vamos começar a fazer algumas consultas simples na nossa base de dados. Eu vou usar, por enquanto, como exemplo, a TABELA_DE_CLIENTES. Vamos olhar aqui como é que está organizada a TABELA_DE_CLIENTES. E eu tenho aqui os campos que estão na TABELA_DE_CLIENTES. Se eu vier aqui e colocar “SELECT* FROM TABELA_DE_CLIENTES;”. Vou selecionar esse comando, vou executar. E eu tenho o meu resultado.
[00:51] Como eu coloquei “SELECT * ”, o asterisco funciona como um coringa, então eu selecionei todos os campos da tabela, e eu consigo ver o resultado, todo mundo de forma tabular. Mas eu posso também especificar campo a campo. “SELECT CPF, NOME, ENDERECO_1, ENDERECO_2”. Eu coloco os campos todos separados por vírgula. “BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA FROM TABELA DE_CLIENTES”.
[02:08] Esse segundo comando que eu coloquei aqui, digitando todos os campos, ou seja, todos os campos que estão aqui, eu especifiquei aqui no meu comando. Se eu executar, eu vou ter o mesmo resultado que eu teria se eu tivesse colocado o SELECT* FROM a tabela. E eu posso especificar somente algumas colunas. Eu não quero ver todas as colunas. No caso, eu estou especificando que eu quero ver só CPF e NOME.
[02:55] Note, o meu resultado fica limitado à coluna CPF e à coluna NOME. Eu não vejo as outras colunas da tabela. Existe uma coisa no Oracle chamado alias, que seria um apelido que eu posso dar para cada campo. CPF, por exemplo, eu posso colocar assim “SELECT CPF AS IDENTIFICADOR”, e o “NOME AS CLIENTE”. Ao fazer isso, a coluna, ao invés de ter o nome CPF, ela vai ter o nome IDENTIFICADOR. Já a segunda coluna, ao invés de ter no seu cabeçalho a palavra NOME, que é o nome do campo na tabela, eu vou ter CLIENTE. Vamos rodar.
[03:55] Note que agora eu tenho como identificador das colunas, IDENTIFICADOR e CLIENTE. Vamos pegar agora a TABELA_DE_PRODUTOS. E eu posso usar filtros. Se eu botar aqui “SELECT * FROM TABELA_DE_PRODUTOS”, como é que é o filtro? Eu coloco a palavra “WHERE” e digo um campo que vai servir como critério para limitar a saída do resultado do SELECT.
[04:38] No caso, vou botar assim “SABOR = ‘uva’”. Note que ao fazer o filtro, eu coloquei aqui aspas simples entre aquilo que eu quero buscar. Vamos rodar esse comando aqui. Selecionei a linha. Note que eu só trouxe um produto de sabor uva. Vamos pegar outro critério que talvez retorne mais linhas. Eu vou botar aqui “‘laranja’”. Eu tenho agora a lista de produtos que são do sabor laranja. No caso, retornou aqui cinco produtos.
[05:39] Não preciso usar somente um filtro, eu posso usar outro campo com filtro. “SELECT * FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = ‘PET’”. Eu vou ver todos os produtos que têm como embalagem pet. Tem bastante produto aqui, tudo com embalagem pet.
[06:12] Vamos fazer um teste aqui. Notem que eu escrevi PET com letra maiúscula e aqui embaixo ele também é escrito com letra maiúscula. E se eu colocar aqui, por exemplo, pet em letra minúscula, será que ele vai achar? Vamos ver.
[06:32] Note, ele não achou. Ou seja, quando nós buscamos como critério um texto, eu preciso que o critério tenha os mesmos caracteres maiúsculos e minúsculos que eu tenho gravado na base, é o que nós chamamos de 'case' sensitive. Ou seja, o teste é 'case' sensitive. Quando nós lidamos com números, nós podemos usar, por exemplo, maior, menor, maior ou igual, menor ou igual.
[07:08] Por exemplo, 'SELECT * FROM' TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA > 19.50;”. Quando nós nos referimos, na consulta SQL, a um valor decimal, nós temos que colocar o ponto e não colocar a vírgula, senão não vai dar certo. Se você notar aqui, todos os preços de lista são maiores que 19.50, que foi o meu critério de seleção.
[08:02] Eu fiz aqui alguns exemplos de consultas, que foi inclusive algumas dessas consultas que nós vimos no curso de introdução ao SQL. São consultas simples, diretas, com condições de filtro também muito simples, mas isso é o ponto de partida para nós começarmos mostrar consultas mais avançadas.

SELECT
    cpf   AS identificador,
    nome  AS cliente
FROM
    tabela_de_clientes
;

SELECT * FROM tabela_de_produtos WHERE sabor                    = 'Laranja';
SELECT * FROM tabela_de_produtos WHERE embalagem        = 'PET';
SELECT * FROM tabela_de_produtos WHERE preco_de_lista  > 19.50;

Qual é o comando SQL para listar dados de uma tabela?

SELECT * FROM TABELA
O asterisco (*) determina que todos os campos da tabela serão selecionados.

---------------------------------------------------------------------------------------------------------------------------------------------------------------- CONSULTAS CONDICIONAIS

[00:00] Até agora, quando nós fizemos uma consulta em uma tabela Oracle, nós colocamos o comando SELECT, especificamos aqui ou o asterisco ou os campos, FROM uma tabela, WHERE uma condição. Normalmente, eu posso comparar um campo com outro, ou um campo com um valor. Pode ser igual, diferente, maior, menor. Mas o que acontece é que essa expressão aqui, X = A, pode retornar verdadeira ou falsa.
[00:34] O que é que o Oracle faz? Ele vai percorrer toda da tabela, e a cada linha da tabela, ele vai essa aplicar essa condição. Se for verdadeira, ele exibe. Se for falsa, ele não exibe. É assim que funciona quando nós executamos o comando. Agora, nós podemos também estar usando o OR ou o AND. O OR, do inglês, significa ou. E o AND é e. Ou seja, SELECT * FROM a tabela WHERE. Eu testo uma condição ou a outra condição. E no caso da linha de baixo é uma condição e outra condição.
[01:27] Nós estamos trabalhando um pouquinho com lógica. Funciona da seguinte maneira. Quando eu tenho o ou, a expressão da esquerda pode ser verdadeira ou falsa e a expressão da direita pode ser verdadeira ou falsa. A mesma coisa se aplica com o e, ou o AND. Quando eu tenho essa expressão, a expressão da esquerda pode ser verdade ou não, bem como a expressão da direita.
[01:58] O OR funciona da seguinte maneira, se uma das expressões for verdadeira, a expressão toda vai ser verdadeira. Então, se X = A é verdadeiro, mas Y = B é falso, a expressão toda será verdadeira. A expressão toda com o OR só será falsa quando as duas forem falsas. Já com AND é diferente. Na expressão AND, a expressão vai ser verdadeira quando tanto a da esquerda como a da direita forem verdadeiras. Se uma delas por falsa, a expressão toda será falsa.
[02:48] Por exemplo, na expressão com o OR, se eu tiver verdadeiro com verdadeiro, vai ser verdadeiro. Se eu tiver verdadeiro com falso, vai ser verdadeiro, porque uma delas sendo verdadeira, a expressão está confirmada. Falso com verdadeiro, vai ser verdadeiro. E o OR só vai ser falso quando as duas forem falsas.
[03:11] Já o AND, se eu tiver verdadeiro com verdadeiro, a expressão é verdadeira, mas se uma só é verdadeira como, por exemplo, a segunda ou a terceira linha, a expressão vai ser falsa. E finalmente, quando as duas são falsas, a expressão é falsa.
[03:31] A expressão NOT, que eu posso colocar antes de uma expressão condicional, inverte o resultado. Se a expressão for verdadeira, se eu colocar um NOT na frente, ela vira falsa. Se ela for falsa, eu coloco um NOT na frente, ela fica verdadeira. Vai inverter o resultado. Com o NOT, o OR só é verdadeiro quando os dois forem falsos. A mesma coisa com o AND. Ele só vai ser falso quando os dois forem verdadeiros. Ou seja, inverte o resultado da expressão.
[04:14] Claro, quando eu faço um SELECT, por exemplo, faço um SELECT X = A. Eu tenho aqui a coluna X com vários valores. Eu vou testar se X é igual a A. Como eu vou testar a linha a linha, eu vou fazer um teste na primeira linha, um teste na segunda linha, um teste na terceira linha, ele vai substituir o X pelo valor do campo. Ou seja, a primeira expressão que originalmente é X = A, vai ser A = A. Na segunda linha, eu vou substituir o X pelo C. Então, a expressão vai ser C = A. Na terceira linha, que o valor é D, a coluna A tem o valor D, eu vou testar D = A.
[05:04] Desculpa, a coluna X tem valor de D, vai ser D = A. Claro, esse cara aqui, está na cara, é verdadeiro. Já esses dois aqui, são falsos. Quando eu fizer o teste, ele vai me colocar aqui. Aqui é verdadeiro, aqui é falso, aqui é verdadeiro, aqui é falso, porque A = A aqui, então são verdadeiros. Qualquer outro resultado diferente desse será falso. E ele só vai exibir, na saída da consulta, as linhas que são verdadeiras.
[05:51] Agora, se eu tiver X = A ou Y = B, ele vai pegar aqui X = A, ele vai pegar o A e substituir, vai ficar A = A. E Y = B vai substituir a expressão. Essa expressão aqui é verdadeira, essa expressão aqui isolada é verdadeira. Depois, como eu tenho aqui um OR, ele vai fazer o teste. A primeira deu verdadeira, a segunda deu verdadeira. Eu sei de antemão que é um OR. Então, o resultado vai ser verdadeiro. A primeira deu falso, porque C não é igual a A. Segunda deu falso, E não é igual a B. Aqui vai dar falso. E assim por diante.
[06:47] Eu só vou exibir as linhas que tiveram como resultado verdadeiro. Estão destacadas as linhas que o SELECT* FROM irá trazer. E o AND? Eu só vou trazer quando as duas expressões forem verdadeiras. Se eu rodar aqui, eu tenho as expressões e eu tenho os resultados. No caso do AND, só três linhas satisfazem a condição X = A e Y = B. Quando eu tenho um NOT, a coisa se inverte. Onde era verdadeiro, vira falso. Onde era falso, vira verdadeiro.
[07:59] Se eu tiver a condição X = A e Y = B, eu teria esse resultado, porque só quando as duas são verdadeiras. Mas como eu tenho um NOT na frente, eu vou inverter. Onde está verdadeiro vira falso. Onde está falso, vira verdadeiro. Fica assim. O resultado da expressão é o que está marcado. E se eu tiver isso X = A AND NOT Y = B. Vai ficando um pouco complicada a expressão, mas a lógica é a mesma. Fazemos os testes isoladamente.
[08:43] Temos X = A, Y = B eu tenho os resultados. Só que eu tenho um NOT aqui, então a segunda expressão eu inverto. Por causa do NOT, onde estiver verdadeiro, virou falso e onde é falso, virou verdadeiro. Agora, eu vou pegar as duas expressões, o resultado da expressão que está aqui e o resultado da expressão que está nessa outra coluna aqui, e aplicar o AND. E o AND só é verdadeiro quando os dois forem verdadeiros. Se eu rodar, está lá. Esse resultado só vai trazer duas linhas. A a linha 4 e a linha 8.
[09:24] Nós temos até uma brincadeira que nós podemos fazer para saber, por exemplo, se essa expressão é verdadeira ou falsa. Nós começamos sempre de dentro para fora. Pegando as expressões mais internas e trabalhando. Por exemplo, se eu pegar as duas expressões, verdadeiro AND falso, e verdadeiro OR falso. Verdadeiro e falso, vai dar falso. Porque o AND só dá certo quando as duas expressões são verdadeiras.
[09:57] A vermelha ficou falsa e a expressão roxa é verdadeira, porque tem um OR. Eu agora vou aplicar o NOT do F, o falso vira verdadeiro. A outra expressão roxa eu ainda não descompactei. Agora, eu tenho aqui uma expressão que está em verde, é um verdadeiro e verdadeiro. Como as duas são verdadeiras, é um AND, fica verdadeiro. Eu agora vou ter um OR aqui no meio, que eu vou comparar o falso, que estava sempre aqui no canto da expressão, e que agora eu vou fazer o teste dele, verdadeiro ou falso. Como é um ou, virou verdadeiro.
[10:45] Isso aqui é o que nós chamamos de decompor a expressão para saber se ela é uma expressão verdadeira ou falsA. Se vocês acharam um pouco confuso, não se assustem. Com a prática, nós começamos a bater o olho numa expressão e nós sabemos se ela vai dar verdadeira ou falsa. Nós começamos a criar práticas em relação isso.
[11:12] Isso tem muito a ver com matemática. Quando nós víamos equação, -1 vira 1. Mais com menos vira menos, mais com menos vira mais. Tem aquelas expressões matemáticas que nem me lembro direito como são, mas o princípio da coisa é a mesma. Eu quis percorrer um pouquinho essa brincadeirinha das expressões para nós botarmos na prática, no Oracle, como é que nós fazemos consultas na base de dados usando essas condições.

Analise a expressão abaixo:
(NOT ((3 > 2) OR (4 >= 5)) AND (5 > 4)) OR (9 < 0)

Fazendo o passo a passo, vemos que a expressão é falsa:
(NOT ((3 > 2) OR (4 >= 5)) AND (5 > 4)) OR (9 < 0)
(NOT ((Verdadeiro) OR (Falso)) AND (Verdadeiro)) OR (Falso)
(NOT (Verdadeiro) AND (Verdadeiro)) OR (Falso)
(Falso AND Verdadeiro) OR (Falso)
(Falso) OR (Falso)
Falso

------------------------------------------------------------------------------------------------------------------------------------------------------ APLICANDO CONSULTAS CONDICIONAIS

[00:00] Vamos praticar um pouco aquilo que nós vimos no vídeo passado do AND, do OR, e ver como é que isso se reflete dentro do Oracle. Para isso, eu vou clicar nesse ícone aqui em cima, SQL. Vou escolher a minha conexão e vou abrir um editor de texto limpo para fazer novas consultas.
[00:23] Eu vou botar “SELECT* FROM TABELA”. Note que à medida que eu vou digitando, ele vai até me mostrando sugestões que eu posso estar colocando. Mas como são tabelas que são nome simples, nós sabemos mais ou menos os campos, eu vou digitar tudo. “TABELA_DE_PRODUTOS WHERE”. Eu vou fazer o seguinte teste. “sabor = ‘manga;’”. Vou rodar esse cara aqui.
[01:00] Me trouxe todo mundo que é manga. Agora, vamos supor que eu coloque isso daqui “OR TAMANHO = ‘472 ml’”. Isso aqui é um ou outro. Está lá o resultado. Se nós olharmos os resultados, essa coluna tem que ser 470 ml e essa coluna aqui manga. Se um dos dois for verdade, a linha tem que aparecer. Na primeira linha é verdade, é verdade. Apareceu.
[01:41] Na segunda, o tamanho é um litro, é falso. Mas o sabor é manga, é verdadeiro. Apareceu também no resultado. Falso, verdadeiro. E aqui é verdadeiro e falso. Tanto faz o verdade ser na esquerda ou na direita. É um OR. Se um dos dois é verdade, vai aparecer a condição.
[02:06] E se eu quisesse colocar agora um AND? Tem que ser um e outro. Se eu olhar essas opções que tem aqui em baixo, note que a única linha que os dois são verdadeiros é essa primeira linha aqui. Será que o resultado vai trazer só uma linha? Vamos ver.
[02:33] Trouxe só um resultado. Agora, se eu pegasse esse cara aqui e colocar um NOT, ou seja, coloquei o NOT e a expressão. Ele vai inverter. Quem era para aparecer, não aparece. Quem não era para aparecer, vai aparecer.
[03:08] Veio inclusive um montão de gente. O único que não apareceu aqui foi esse daqui. O AND é produto 1078680. Se eu seu olhar aqui, eu não tenho o 1078680. Aqui pula de 1041 para 1086. Não tenho, ele não apareceu na lista. Todos os outros apareceram, porque é o NOT daquela condição.
[03:54] E o NOT do OR? Ele é mais abrangente ainda. Também vai trazer uma série de opções. E notem, como é o OR, ele não vai funcionar se aparecer manga ou 470 na linha. Se eu olhar aqui, eu não tenho nenhum 470 aqui e nenhuma manga aqui. Significa que o OR inverteu a minha consulta.
[04:45] Nós também podemos fazer isso daqui. “SABOR = ‘manga’ AND NOT (TAMANHO = 470 ml);”. Vai aparecer, do lado esquerdo, só manga. A condição está no lado esquerdo, mas a coluna está do lado direito. A condição do lado esquerdo, só manga. E na condição do lado direito, como tem um NOT, aqui não vai aparecer 470. Vão aparecer todas, menos 470 ml.
[05:36] Nós temos outras expressões que nós podemos estar usando que não tem muito a ver com a igualdade, que é o IN. “SELECT* FROM TABELA_DE_PRODUTOS WHERE SABOR IN”, e dentro dos parentes eu coloco as opções separadas por vírgula. Por exemplo, “(‘laranja’, ‘manga’)”. Só apareceu laranja e manga.
[06:30] O IN funciona como se fosse um OR. Esse cara de cima é como se fosse isso aqui. “= ‘Laranja’ OR SABOR = ‘Manga’;”. Essas duas expressões aqui são iguais. O IN funciona como se eu tivesse vários ORs, um do lado do outro. Vamos ver. Está lá, a mesma coisa. Apareceu o laranja, o manga aqui do lado.
[07:18] E eu posso, por exemplo, concatenar o AND ou o OR com condições de maior ou menor. Por exemplo, eu vou pegar alguma coisa da TABELA_DE_CLIENTES. “SELECT* FROM TABELA_DE_CLIENTES WHERE CIDADE IN (‘Rio de Janeiro’, ‘Sao Paulo’);”. Estou pegando todos os clientes que são ou do Rio de Janeiro ou de São Paulo.
[08:00] E eu posso concatenar aqui com “AND IDADE >= 20”, ou seja, eu quero pegar todo mundo que tem mais de 20 anos e que mora na cidade do Rio de Janeiro e na cidade de São Paulo. Quero fazer uma um trabalho de marketing, uma mala direta. O banco vai me selecionar. Eu tenho aqui somente gente de São Paulo e do Rio de Janeiro e somente com mais de 20 anos. Eu consegui concatenar essas consultas.
[08:43] E eu posso colocar isso daqui também. É uma expressão mais rebuscada ainda. E aqui dentro, eu coloco “IDADE >= 20 AND IDADE <= 22”. Essa expressão aqui, eu estou querendo dizer que eu quero ver todo mundo que tem entre 20 e 22 anos. Quem tem mais que tem mais 22 ou menos de 20, não vai aparecer nessa consulta. E more na cidade do Rio de Janeiro ou na cidade de São Paulo.
[09:23] Eu vou rodar a consulta. As idades, deu aqui o 22, porque é menor ou igual, então o 22 está dentro da condição. E somente na cidade do Rio de Janeiro e de São Paulo. Vocês notem que nós misturando ANDs e ORs com consultas, nós conseguimos fazer bastante consulta complicada e buscar, talvez responder, às perguntas dos nossos usuários quando eles querem saber alguma coisa específica na nossa base de dados.

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    NOT ( sabor = 'Manga'
          OR tamanho = '470 ml'
          OR embalagem = 'PET'
          OR nome_do_produto LIKE '%700%' );

SELECT
    nome_do_produto,
    sabor,
    embalagem,
    tamanho,
    preco_de_lista,
    codigo_do_produto
FROM
    tabela_de_produtos
WHERE
    NOT ( embalagem  LIKE '%PET%'
          OR tamanho LIKE '%470%'
          OR sabor   LIKE '%Manga%'
          OR sabor   LIKE '%Lima%'
          OR sabor   LIKE '%Uva%'
        );

SELECT
    *
FROM
    tabela_de_produtos
WHERE
    NOT ( sabor IN ( 'Laranja', 'Manga', 'Acai', 'Uva', 'Lima/Limao',
                     'Cereja/Maca', 'Morango', 'Melancia' ) )
;

SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga' OR tamanho = '470 ml';
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga' AND tamanho = '470 ml';
SELECT * FROM tabela_de_produtos WHERE NOT (sabor = 'Manga' AND tamanho = '470 ml');

Qual seria o comando SQL para selecionar todos os itens de notas fiscais, cuja quantidade seja maior que 60 e preço menor ou igual a 3?
SELECT * FROM ITENS_NOTAS_FISCAIS WHERE QUANTIDADE > 60 AND PRECO <= 3
.. Este comando irá obter a resposta para o pedido no enunciado.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------- USANDO LIKE

[00:00] Vamos falar um pouquinho do comando LIKE, que é um comando que serve para você fazer igualdades com textos. O LIKE funciona apenas para textos. Mas diferente do igual, com o LIKE eu posso usar o % como um coringa para poder ignorar coisas que estão no início ou no final de uma expressão que eu quero buscar. Melhor eu mostrar na prática para ver como é que funciona.
[00:34] Eu tenho essa lista aqui de nomes e eu quero procurar todo mundo que tem o sobrenome Soares. Se eu colocar LIKE ‘%Soares%’, ele vai buscar para mim todo mundo que tem Soares no nome. Independente do que vem antes ou depois. Porque ao colocar o % tanto no início quanto no final da palavra Soares durante a condição, eu estou ignorando o que vem antes e o que vem depois. Eu estou achando Soares em qualquer parte do texto.
[01:15] Agora, se eu fizer isso daqui, ou seja, no final do texto eu fecho aspas e, antes da palavra Soares eu tenho o %, ele só vai me retornar quem terminar com Soares. Aqui, no caso, esse Carlos Soares da Silva tem Soares no nome, mas não veio, porque como não tem % no final da palavra Soares na condição, ele só vai trazer quem termina com Soares. Ele tem esse sobrenome aqui, da Silva, que vem depois. Ele não vai ser selecionado.
[01:58] Vamos colocar isso na prática. Eu vou aqui no SQL Developer e vou criar mais um novo editor de texto. Vou colocar isso aqui “SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE ‘%Maca%’;”. Lembrando que na minha base está Maca, sem o cedilha. Ou seja, eu vou buscar todo mundo que tem Maca no sabor. No sabor, todo mundo que tem Maca no campo sabor. Está aqui. Eu tenho esse sabor aqui que é maçã pura e tem um outro sabor que é cereja e maçã.
[03:09] Se eu quiser só ver esses caras que têm embalagem pet, eu tenho esses três aqui. Eu posso juntar o comando LIKE com comando “AND EMBALAGEM = ‘PET’”. Se eu rodar essa consulta, eu só vou ver todo mundo que tem maçã no nome, não interessa onde, e todo mundo que tem a embalagem pet. Esse é um pequeno exemplo que eu quis mostrar a vocês sobre o uso do comando LIKE para nós aplicarmos sobre filtros de campos texto.
SELECT * FROM tabela_de_produtos WHERE sabor LIKE '%Maca%';   -- Trazer qualquer coisa na Direita e Esquerda 'MACA', 'CEREJA/MACA'

SELECT * FROM tabela_de_produtos WHERE sabor LIKE '%ca%';         -- Trazer qualquer coisa na Direita e Esquerda 'ACAI', 'MACA', 'CEREJA/MACA'

SELECT * FROM tabela_de_produtos WHERE sabor LIKE 'Ma%';           -- Trazer qualquer coisa na Direita e Esquerda 'Manga', 'Maracuja', 'Maca';

SELECT * FROM tabela_de_produtos WHERE sabor LIKE 'Ma_a%' ;      -- Trazer qualquer coisa na Direita e Esquerda 'Maca', 'Maracuja';

SELECT * FROM tabela_de_produtos WHERE sabor LIKE '%c_a%';      -- Trazer Sabor Melancia 'CIA'

SELECT * FROM tabela_de_produtos WHERE sabor LIKE '%Maca%' AND embalagem LIKE '%PET%';

Quantos clientes possuem o último sobrenome Mattos?

SELECT * FROM TABELA_DE_CLIENTES
WHERE NOME LIKE '%Mattos'
Teremos 2 clientes selecionados.

--------------------------------------------------------------------------------------------------------------------------------------------------------- CONSOLIDANDO SEU CONHECIMENTO

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.

1) Para que possam ser efetuadas as consultas na base de dados, é preciso conhecer as suas tabelas e seus relacionamentos. Para isso, vá no SQL Developer e no canto esquerdo, aba Conexões, expanda o grupo Tabelas e verifique se as tabelas da base de dados estão lá:
2) Se você efetuar um duplo clique sobre a tabela, à direita você verá a sua estrutura e características:
3) Vá no menu do SQL Developer e selecione Exibir --> Data Modeler --> Browser.
4) À esquerda, na parte de baixo, expanda a árvore do Data Modeler até encontrar Modelos Relacionais:
5) Clique com o botão direito do mouse sobre Modelos Relacionais e escolha Novo Modelo Relacional.

6) Para a área à direita que abriu, arraste as seguintes tabelas:
- TABELA_DE_CLIENTES
- TABELA_DE_PRODUTOS
- TABELA_DE_VENDEDORES
- NOTAS_FISCAIS
- ITENS_NOTAS_FISCAIS
Você verá o esquema visual das tabelas:

7) Sabendo como é base de dados, você pode realizar as consultas. Com a base de dados selecionada, crie um novo script de SQL, e, para ver todos os campos da tabela Tabela_de_Clientes, digite:
SELECT * FROM TABELA_DE_CLIENTES;
Ao colocar asterisco, você estará selecionando todos os campos da tabela em questão, que é o mesmo que selecionar os campos um a um.

8) Mas não é necessário selecionar todos os campos de uma tabela, basta você destacar os campos que serão vistos, por exemplo:
SELECT CPF AS IDENTIFICADOR, NOME AS CLIENTE FROM TABELA_DE_CLIENTES;

9) Nem sempre o nome original da coluna é o nome que você quer que seja retornado pela consulta. Por isso, você pode criar um alias (apelido) para o campo, escrevendo algo após o comando AS, por exemplo:
SELECT CPF as INDENTIFICADOR, NOME AS CLIENTE FROM tabela_de_clientes;

10) Você pode filtrar a sua consulta, por exemplo:
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';
Aqui, o retorno foi uma linha, pois foi feito um filtro através da chave primária, que não se repete.

11) Você pode implementar filtros que retornem mais linhas, podendo utilizar qualquer coluna como critério. Veja:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Uva';
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja';
SELECT * FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = 'PET';
SELECT * FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = 'pet';

12) Existem filtros aplicados a valores:
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA > 19.50;
SELECT * FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA > 19.50;
Você também pode usar os sinais de menor (<), maior ou igual (>=), menor ou igual (<=), diferente (<>) e Between.

13) É possível aplicar consultas condicionais, usando os operadores AND e OR. Por exemplo, para selecionar os produtos que tenham o sabore manga ou o tamanho de 470 ml, digite:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR TAMANHO = '470 ml';

14) Digite:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' AND TAMANHO = '470 ml';
Agora, por causa do operador AND, o retorno somente ocorrerá quando as duas condições ocorrerem na mesma linha da tabela.

15) Outros exemplos de uso de filtros condicionais:
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' AND TAMANHO = '470 ml');
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' OR TAMANHO = '470 ml');
SELECT * FROM TABELA_DE_PRODUTOS WHERE (SABOR = 'Manga' AND NOT ( TAMANHO = '470 ml'));

16) O filtro IN permite que seja incluído um conjunto de condições a serem buscadas. Funciona como se fosse uma série de condições encadeadas com OR:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Laranja', 'Manga');
Esta consulta seria equivalente a:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja' or SABOR = 'Manga';

17) É possível juntar o IN com AND ou OR, por exemplo:
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro','Sao Paulo') AND IDADE >= 20;
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro','Sao Paulo') AND (IDADE >= 20 AND IDADE <= 22);

18) Você pode usar parte de um texto para ser usado como critério de localização de registros da tabela. Por exemplo, para buscar todos os registros cujos sabores possuam a palavra "Maca", não importando se no início, no meio ou no final do texto, digite:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Maca%';

19) Você pode mesclar condições LIKE com outras. Por exemplo, para buscar os registros cujos sabores possuam a palavra "Maca", mas apenas para aqueles que tenham embalagens PET, digite.
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Maca%' AND EMBALAGEM = 'PET';

Nesta aula, aprendemos:

A importância de conhecer a base de dados antes de fazer as consultas
Os comandos de consultas e como podemos filtrá-las
Como podemos mesclar filtros condicionais com AND e OR
Que podemos usar operadores condicionais nos filtros que envolvem valores
Como funciona o comando LIKE

-------------------------------------------------------------------------------------------------------------------------------------------------- USANDO DISTINCT P/ VISUALIZAR TABELA

[00:00] Nós vamos falar agora do comando DISTINCT. O comando DISTINCT faz com que linhas repetidas, ou seja, linhas que possuem os mesmos valores em todas as colunas selecionadas sejam exibidas apenas uma vez. E o DISTINCT nós usamos dentro do comando SQL depois do SELECT e antes da seleção dos campos. É assim, por exemplo, SELECT DISTINCT. Eu tenho a seleção dos campos que vem depois e eu tenho o SELECT que vem antes.
[00:40] Por exemplo, se eu der um SELECT * FROM TABELA, ou seja, sem o DISTINCT, eu vou ter esse resultado aqui. E se nós olharmos meio que rapidamente, essa linha aqui repete aqui. A X está tanto aqui quanto aqui. E também, eu tenho o B X aparece aqui e aparece aqui. E o A Z aparece aqui em cima e aparece aqui embaixo. Agora, se eu der um SELECT DISTINCT, eu vou transformar esta saída numa saída de somente quatro linhas. Ou seja, as linhas repetidas são exibidas uma vez só.
[01:39] Vamos no Developer fazer alguns exemplos. Vou abrir mais um script de edição e eu vou colocar aqui, por exemplo, “SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS”. Eu vou selecionar somente a coluna embalagem. Note que eu fazer isso, eu tenho aqui pet, por exemplo, se repete várias vezes. Garrafa se repete várias vezes. O que vai acontecer se eu botar o DISTINCT? Eu agora vou pegar esse comando e, depois do SELECT e antes da seleção, eu vou colocar a palavra “DISTINCT”. Note que ele só me mostrou as opções diferentes.
[02:41] O DISTINCT é muito usado em campos que são propriedades que eu quero saber quais são as propriedades que eu posso estar associando a esse cliente? Eu vejo aqui, por exemplo, todas as embalagens possíveis. Se eu quisesse ver todos os sabores, “SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS”. Eu tenho aqui 12 sabores possíveis dentro dos meus produtos. Eu fiz um SELECT DISTINCT dentro do sabor, ele mostrou somente os que não se repetem.
[03:23] E eu posso aplicar sobre o DISTINCT, filtro. Se eu fizer aqui “SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS WHERE SABOR = ‘Laranja’;”. Claro, ele só deve trazer uma linha, que é a linha laranja. E o DISTINCT também funciona se eu colocar mais de um campo. Por exemplo, “SELECT DISTINCT EMBALAGEM SABOR FROM TABELA_DE_PRODUTOS”. Agora, eu vou fazer uma combinação entre as embalagens e os sabores existentes.
[04:16] Eu tenho aqui esse resultado. De pet, eu tenho maçã, melancia, cereja. Pet também, eu tenho manga. Garrafa, eu tenho esses sabores e assim por diante. Eu consigo ver as combinações diferentes entre embalagem e sabor. Não preciso estar olhando a base de dados toda, ou seja, a tabela toda e sair procurando as combinações que eu quero. Era isso que eu queria falar com vocês sobre o DISTINCT.


SELECT embalagem FROM tabela_de_produtos;                         			--- Irá trazer todos os dados, PET, Garrafa e Lata conforme quantidade inserida na tabela,
SELECT DISTINCT embalagem FROM tabela_de_produtos;   			--- Irá trazer os dados do Campo EMBALAGEM de forma consolidada,
SELECT DISTINCT sabor FROM tabela_de_produtos                			--- Irá trazer os dados do Campo SABOR de forma consolidada,
SELECT DISTINCT bairro FROM tabela_de_clientes WHERE bairro LIKE '%r%';      --- Irá trazer os dados do Campo BAIRRO de forma consolidada quando houver a letra 'r' minuscula em BAIRRO,

SELECT DISTINCT
    cidade,
    bairro
FROM
    tabela_de_clientes
WHERE
    bairro NOT LIKE '%Tijuca%'
    AND bairro NOT LIKE '%Jardins%'
    AND bairro NOT LIKE '%Sant%';


Query:

Sao Paulo 	Bras
Rio de Janeiro	Inhauma
Rio de Janeiro	Piedade
Rio de Janeiro	Cidade Nova
Rio de Janeiro	Humaita
Sao Paulo 	Lapa

Quantos bairros diferentes da cidade do Rio de Janeiro possuem clientes?
Executando o comando SQL:
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES WHERE CIDADE = 'Rio de Janeiro'
Obteremos 7 bairros listados.

---------------------------------------------------------------------------------------------------------------------------------------------------------- LIMITANDO A SAIDA DA CONSULTA

[00:00] Vamos aprender a usar o campo ROWNUM. O campo ROWNUM é um campo interno que toda tabela tem. E me retorna o número da linha da consulta. Por exemplo, eu tenho uma tabela que tem 10 linhas. Eu quero fazer um SELECT e só trazer as quatro primeiras. Isso é muito comum. Às vezes, eu tenho uma tabela de um milhão de registros e eu quero ver só os 100 primeiros, os 50 primeiros. Se eu pegar “SELECT * FROM TABELA WHERE ROWNUM <= 4”, eu só vou ver os quatro primeiros.
[00:47] Porque, por exemplo, João, o número da linha é 1. O Pedro, a linha é 2. Margarida é 3. José é 4, o Carlos é 5. Como é menor que 4, eu só vou pegar de José da Silva Almeida para cima. E eu trago esse resultado. Outros bancos de dados de SQL possuem também a possibilidade de trazer não somente os primeiros, mas também de baixo para cima, ou os que estão dentro de um intervalo. No Oracle, nós não termos uma função direta para fazer isso.
[01:34] Normalmente, para fazer essas manipulações, nós temos que usar subconsulta. Eu ainda não falei sobre subconsulta, então eu vou me limitar, nesse momento, o uso do ROWNUM somente para pegar menores de um número. Porque, inclusive, o ROWNUM não funciona quando eu uso ele na condição WHERE, ele não funciona se eu usar o maior ou o maior ou igual. Ele só funciona se eu usar o menor ou o menor ou igual.
[02:13] com subconsulta nós conseguimos explorar melhor a função ROWNUM, mas eu não vou fazer isso nesse momento, porque nós nem sabemos ainda o que é uma subconsulta. Vamos ver como é que nós podemos brincar com o ROWNUM normalmente.
[02:38] Eu voltei aqui para o SQL Developer e vou acessar aqui um editor em branco e eu vou fazer isso daqui. “SELECT CODIGO_DO_PRODUTO, NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS”. Eu vou trazer o código e a descrição do produto.
[03:04] Se eu colocar aqui “ROWNUM”, note que ele vai me exibir aqui um sequencial com o número da linha. Não vamos confundir com esse sequencial aqui, esse sequencial que está no início é o número da linha do grid que eu estou olhando. Esse número que está no ROWNUM vem de dentro da tabela.
[03:32] Se eu tenho isso, eu posso fazer isso daqui. WHERE ROWNUM <= 5. Ao fazer isso, eu só trago os cinco primeiros. Como eu falei na apresentação, se eu fizer isso, nós poderíamos pensar que eu vou ver da quinta linha até o final, vamos ver o que vai acontecer. Se eu rodo isso, ele não traz nada. O ROWNUM, eu só consigo limitar quando for menor ou menor ou igual.
[04:22] Se eu quisesse pegar uma consulta só entre o número 3 e o número 6. Com o ROWNUM do jeito que nós estamos vendo aqui, eu não consigo fazer isso, porque eu não consigo usar o maior ou maior ou igual. Eu consigo fazer isso através de subconsulta, mas nós vamos ver esse exemplo de limitar a saída entre dois intervalos mais à frente, quando formos ver subconsulta.

Queremos obter as 10 primeiras vendas do dia 01/01/2017. Qual seria o comando SQL para obter este resultado?
O comando para obter as 10 primeiras vendas do dia 01/01/2017 é o seguinte:

SELECT
    *
FROM
    notas_fiscais
WHERE
        data_venda = TO_DATE('2017-01-01', 'YYYY-MM-DD')
 
 AND ROWNUM <= 10;

Query:
CPF   -                    MATRICUA  -    DATA_VENDA  -    NUMERO  -   IMPOSTO
9283760794	00235	01/01/17                      54476	0,12
50534475787	00237	01/01/17 	54477	0,12
492472718	00235	01/01/17 	54478	0,12
3623344710	00235	01/01/17 	54479	0,12
94387575700	00236	01/01/17 	54480	0,1
94387575700	00235	01/01/17 	54481	0,12
9283760794	00237	01/01/17 	54482	0,1
2600586709	00235	01/01/17 	54483	0,1
9283760794	00235	01/01/17 	54484	0,1
5576228758	00237	01/01/17 	54485	0,12


SELECT
    ROWNUM,
    codigo_do_produto,
    nome_do_produto
FROM
    tabela_de_produtos
WHERE
    ROWNUM <= 5;

Query:
ROWNUM - CODIGO - NOME
1	1000889   	Sabor da Montanha - 700 ml - Uva
2	1002334   	Linha Citros - 1 Litro - Lima/Limao
3	1002767   	Videira do Campo - 700 ml - Cereja/Maca
4	1004327   	Videira do Campo - 1,5 Litros - Melancia
5	1013793   	Videira do Campo - 2 Litros - Cereja/Maca

--------------------------------------------------------------------------------------------------------------------------------------------------------- ORDENANDO A SAIDA DA CONSULTA

[00:00] Muitas vezes nós queremos ver o resultado da nossa seleção ordenado. Ordenado alfabeticamente, ordenado por valores. Para fazer isso, nós usamos o comando ORDER BY. E diferente do DISTINCT, o ORDER BY nós utilizamos no final da consulta. Depois do WHERE. Por exemplo, eu tenho minha lista de nomes. Se eu dou um “SELECT * FROM TAB ORDER BY UM CAMPO”, e esse campo de ordem alfabética, quando eu rodar, ele vai ordenar alfabeticamente do maior para o menor. É o padrão dele.
[00:54] Claro que eu posso determinar a direção. Se eu não falar nada, ele vai ser sempre ascendente. Do menor para o maior. Mas eu posso dizer: me ordena descendente, ou seja, do maior para o menor. Quando eu uso descendente, eu tenho que especificar que quero usar esse tipo de ordenação. E eu posso inclusive fazer a ordenação de mais do que um campo, e ele vai fazer quebras.
[01:31] Por exemplo, eu tenho um campo aqui que são letras e números. Se eu der um ORDER BY o campo 1, que são as letras, quebrado pelo campo 2, que são os números, ele vai fazer assim, ele vai ordenar primeiro todo mundo que é A. E dentro do A, ele vai ordenar os números. Depois, ele ordena todo que está dentro do B. E dentro do B, os números. Ou seja, vai fazer uma quebra.
[02:00] Vamos botar a mão na massa e vamos no SQL Developer ver como é que isso funciona. Vou novamente criar aqui uma nova área de edição e vou escrever “SELECT* FROM TABELA_DE_PRODUTOS”. Tenho todas as minhas informações. Note que aqui no canto eu tenho o PRECO_DE_LISTA e ele está bagunçado, porque quando eu faço o SELECT * FROM a tabela, ele vai me trazer essa lista na ordem com que os registros foram incluídos na tabela.
[02:44] Se eu fizer isso daqui. “ORDER BY PRECO_DE_LISTA”, eu vou ver primeiro o produto mais barato e por último o produto mais caro. Note que aqui em cima ele está do mais barato para o mais caro. Eu consigo ver aqui o mais barato é o Clean - 350 ml Laranja, e o mais caro está no finalzinho da lista. É o Festival de Sabores - 2 Litros - Açaí.
[03:24] Agora, se eu quiser listar do mais caro para o mais barato, tem que trocar a ordem da ordenação. Eu coloco depois ali do ORDER BY, “DESC”. Porque o ASC, que é o ascendente, é o padrão. Aqui em cima, não coloquei nada, ele é ascendente. Do menor para o maior. Quando eu especifico ORDER BY esse campo DESC, vai ser do maior para o menor. Vou executar. Inverteu o resultado da consulta. O primeiro é o Festival de Sabores - 2 Litros - Açaí e o último é o mais barato, que é o Clean - 350 ml Laranja.
[04:14] Eu também posso ordenar por um texto. E ele vai vir pela ordem alfabética. “SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO”, por exemplo. Quando eu rodo isso daqui, ele me trás as informações em ordem alfabética. E eu posso, por exemplo, fazer uma seleção de mais de um campo. Eu vou botar “SELECT * FROM TABELA_DE_PRODUTOS WHERE”, e eu vou selecionar “EMBALAGEM DESC, NOME_DO_PRODUTO ASC;”.
[05:15] Eu estou ordenando pela embalagem, da maior para a menor, ou seja, a ordem alfabética ao contrário. E dentro de cada embalagem, eu vou ver os produtos em ordem alfabética, do menor para o maior. Vamos executar. Eu esqueci o ORDER BY, “ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC”. Vou recapitular aqui. SELECT, ORDER BY EMBALAGEM DESC, NOME ASC. Agora está certo.
[06:36] Só um parênteses. Foi até bom nós termos mostrado esse comando errado, porque nós olhamos aqui como é que o Oracle apresenta o erro. Se eu errar o comando, ele mostra operador relacional inválido. Eu estava fazendo EMBALAGEM DESC sem o ORDER BY. E ele mostra, inclusive, esse erro aqui, esse número de erro ORA-00920 é um número muito importante. Às vezes você encontra, quando você faz o SELECT, um erro que você de cara você não acha o motivo.
[07:12] É legal pegar esse número ORA e colocar no Google, que você vê um montão de solução. E você consegue pescar, muitas vezes, a correção de problemas do seu SQL através desse indicador de erro. Vamos voltar para o assunto ORDER BY. Vou rodar agora aqui. Pronto. Eu estou vendo as embalagens, ele tem tudo de pet primeiro. Depois, ele vem lata. Depois de garrafa.
[07:51] E dentro, por exemplo, aqui dentro de lata, eu tenho essa ordem aqui. Vai de C, F, L, B, V. Depois, quando vem o garrafa, ele volta a mostrar o C, o F, o L. E assim vai descendo. Então, eu tenho uma quebra. Sendo que embalagem está do maior para o menor e produto do menor para o maior. Era isso que eu queria mostrar para vocês sobre o ORDER BY.

Utilizando duas querys SQL, qual foi a maior venda do produto "Linha Refrescante - 1 Litro - Morango/Limao", em quantidade ?
Primeiro, vamos buscar o código do produto "Linha Refrescante - 1 Litro - Morango/Limão":
SELECT * FROM TABELA_DE_PRODUTOS WHERE nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limao'

Com esta consulta obtemos o resultado do código deste produto: '1101035'. Com esta informação em mãos, fazemos a consulta para achar a maior quantidade vendida deste produto:
SELECT * FROM ITENS_NOTAS_FISCAIS WHERE codigo_do_produto = '1101035' ORDER BY QUANTIDADE DESC
Veremos que a maior quantidade foi 99.

SELECT
    nome_do_produto,
    embalagem,
    preco_de_lista
FROM
    tabela_de_produtos
WHERE
    nome_do_produto LIKE '%Laranja%'
    OR nome_do_produto LIKE '%Maca%'
ORDER BY
    nome_do_produto DESC;


SELECT
    nome_do_produto,
    embalagem,
    sabor
FROM
    tabela_de_produtos
WHERE
    NOT ( nome_do_produto LIKE '%Maca%'
          OR nome_do_produto LIKE '%Laranja%'
          OR nome_do_produto LIKE '%Uva%'
          OR nome_do_produto LIKE '%Acai%'
          OR nome_do_produto LIKE '%Morango%'
          OR nome_do_produto LIKE '%Melancia%'
          OR nome_do_produto LIKE '%Manga%' )
ORDER BY
    embalagem DESC,
    sabor DESC,
    nome_do_produto DESC;


Query:
Nome Do Produto                                                                     Embal.       Sabor

Festival de Sabores - 1,5 Litros - Maracuja	PET	Maracuja
Linha Citros - 1 Litro - Lima/Limao              	PET	Lima/Limao
Festival de Sabores - 700 ml - Maracuja     	Garrafa	Maracuja
Linha Citros - 700 ml - Lima/Limao             	Garrafa	Lima/Limao
Sabor da Montanha - 700 ml - Cereja           	Garrafa	Cereja

--------------------------------------------------------------------------------------------------------------------------------------------------------------- AGRUPANDO OS RESULTADOS

[00:00] Vamos ver outra forma de apresentar os resultados que é através do GROUP BY. O GROUP BY nós usamos muito parecido com o ORDER BY. É um comando que fica no final do comando SELECT, inclusive depois do WHERE. E nós fazemos GROUP BY em um campo. Quando nós fazemos um GROUP BY, ele é como se fosse um DISTINCT. Ele vai pegar todo mundo que for igual dentro da chave que nós selecionamos no GROUP BY, ou seja, os campos e junta todo mundo.
[00:38] Só que ele faz uma coisa a mais. Os dados que são textos, datas e assim por diante, ele junta em um só. Agora, os dados que são números, são valores, ele vai fazer uma operação matemática. Ao juntar, ele pode pegar esses números e somar ou pegar o valor máximo, o valor mínimo ou a média. Ou seja, eu vou fazer uma operação matemática.
[01:10] Vamos ver esse exemplo que está aqui do lado. Eu tenho aqui uma tabela onde eu tenho um campo X e um campo Y. O campo X possui vários valores que são letras. E note que a letra A se repete duas vezes, a letra B se repete três vezes e assim por diante. A letra C também se repete três vezes. A letra D, não. E aqui do lado, eu tenho números. Se der aqui SELECT X, SUM. O SUM é uma fórmula que diz para eu somar, vou pegar X e somar Y FROM a tabela GROUP BY X, que é a coluna texto.
[02:00] Ele vai fazer um DISTINCT da tabela pela coluna X, ou seja, como eu tenho A, B, C e D, esse resultado vai vir em quatro linhas, porque os dois As que eu tenho aqui, os três Bs, os três Cs e o D vão reduzir e vai ter só um A, uma linha B, uma linha C e uma linha D. Só que os valores vão ser somados, porque eu estou usando aqui o SUM. Ao fazer isso, eu vou ter essa resposta aqui. A é 2 + 1, se eu somar tudo que eu tenho na linha A dá 3. Se eu somar tudo que tem na linha B, da 6.
[02:53] Quando eu faço GROUP BY, onde eu tinha o A, ficou 3. E onde eu tinha o B, ficou 6. Eu fiz esse cálculo. Eu posso usar SUM, máximo, mínimo, AVG que é média ou COUNT. Se eu usar, ao invés de SUM do campo Y, eu usar o MAX, eu vejo o maior. Se eu usar o MIN, eu vejo o menor. O AVG vai ver a média e o COUNT vai contar quantas ocorrências acontecem.
[03:30] Por exemplo, o soma, como eu já mostrei, daria isso daqui 3, 6, 8 e 3. Se eu usar o máximo, ele traria para A 2, porque entre 1 e 2, o maior é o 2. Já entre os Bs, o maior é o 3. Ele traz 2, 3 e assim por diante. O mínimo é o inverso, ele traria o menor valor na hora de agrupar. A média, no caso do A, ele ia pegar 2 + 1, 3. Dividido por 2, daria 1.5, que é o número que está aqui. E o COUNT é o número de ocorrências, quantos As eu tenho? 2. Quantos Bs eu tenho? 3. Eu tenho 2 e 3. É assim que nós utilizamos o GROUP BY.
[04:31] Quando nós usamos o SUM, ou o AVG, ou mínimo, ou máximo sem especificar no SELECT um campo de chave como, por exemplo, está sendo mostrado ali. Eu estou pegando só o SUM de Y, que é o campo numérico. Eu não preciso usar o GROUP BY, porque eu não vou agrupar por nenhuma chave, eu vou na verdade somar todo mundo. No caso, essa consulta aqui, se eu coloco SELECT SUM de Y FROM a tabela sem o GROUP BY, ele vai somar esses valores todos aqui, que vai dar 20.
[05:13] Claro que se eu usasse SELECT MIN de Y, daria o menor. MAX daria o maior. O AVG daria a média, que daria 17.333. E o COUNT daria 9, porque eu tenho 9 linhas na tabela. Vamos agora no Developer fazer alguns exemplos. Novamente, vou vir aqui, selecionar uma nova consulta e vamos começar agora pela nossa tabela de clientes. “SELECT* FROM TABELA_DE_CLIENTES”. Eu tenho vários dados sobre os clientes.
[06:02] Vou agora selecionar dois campos específicos. “SELECT ESTADO, LIMITE_DE_CREDITO FROM TABELA_DE_CLIENTES;”. Aqui no caso, eu só vou ver os estados SP, RJ e os limites de crédito. Mas eu quero saber o seguinte, qual é o total de limite de crédito que eu tenho para o Rio de Janeiro e qual é o total de limite de crédito que eu tenho para São Paulo. Para isso, eu posso usar o GROUP BY.
[06:40] Eu simplesmente vou fazer isso daqui: “SELECT ESTADO, SUM(LIMITE_DE_CREDITO);”. Geralmente quando eu uso o SUM, é legal nós colocarmos um alias, porque senão o nome da coluna vai ficar SUM(LIMITE_DE_CREDITO). Eu vou colocar aqui “AS TOTAL_CREDITO FROM TABELA_DE_CLIENTES GROUP BY ESTADO;”. Eu estou agrupando por estado. Vamos rodar.
[07:33] Está ali. O total de crédito de São Paulo é 810.000, o total de crédito do Rio de Janeiro 995.000. Eu poderia agora fazer o seguinte, eu quero ver os preços de lista por embalagem. Eu agora estou pegando a tabela de produtos. “SELECT EMBALAGEM, PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS;”.
[08:10] Me fizeram a seguinte pergunta, qual é o maior preço por embalagem? Ou seja, qual é a embalagem mais cara que eu tenho? Eu posso vir aqui e rodar isso daqui. “MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;”. Agora, eu vou estar vendo a embalagem mais cara. O produto mais caro que tem embalagem em lata, custa 4,56. Já o que tem pet, 38,01. E o que tem garrafa 13,31. Eu tenho aqui o meu resultado usando a função MAX para poder ver isso.
[09:18] Quantos produtos, no meu catálogo, tem embalagem em lata, tem embalagem pet, tem embalagem de garrafa? Eu posso fazer isso pelo COUNT. “SELECT EMBALAGEM, COUNT(*) AS NUMERO_PRODUTOS FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;”. Se nós rodarmos agora isso daqui.
[10:18] Eu tenho 5 produtos do meu catálogo que são em lata, 15 que são em pet e 11 que têm como embalagens, garrafa. Eu posso também fazer a seguinte consulta “SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS TOTAL_CREDITO FROM TABELA_DE_CLIENTES GROUP BY BAIRRO;”. Eu vou ver aqui muito parecido com o que eu fiz ali em cima, é a soma dos limites de crédito por bairro. Tem os bairros, mas digamos que eu só quero ver os bairros da cidade do Rio de Janeiro.
[11:36] Eu posso aplicar, sobre a consulta que tem GROUP BY, um filtro. Só que lembra, o GROUP BY, igual o ORDER BY, tem que ficar no final da consulta. O comando WHERE, de filtro, vai ficar depois do FROM e antes do GROUP BY. Vai ficar assim “WHERE CIDADE = ‘Rio de Janeiro’”. Ficou assim FROM, a tabela. WHERE, o filtro. GROUP BY, quem eu quero grupar. Eu vou ver agora por bairros da cidade do Rio de Janeiro, o valor total do crédito.
[12:40] Note, eu só estou vendo o bairros do Rio de Janeiro. Quem não conhece o Rio de Janeiro, acredite no que eu estou falando, ali só tem bairros da cidade do Rio de Janeiro. E para cada bairro desses, eu estou vendo a soma dos limites de crédito.
[12:58] Eu posso também grupar, igual ao comando ORDER BY, eu posso usar mais do que um campo para agrupar. Olha esse exemplo. “SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS TOTAL_CREDITO FROM TABELA_DE_CLIENTES GROUP BY ESTADO, BAIRRO;”.
[14:16] Eu consigo ver ali, dentro do Rio de Janeiro, as cidades e os valores grupados. Claro que para organizar isso daqui, depois do GROUP BY, eu poderia botar um ORDER BY. “ORDER BY ESTADO, BAIRRO;”. Sempre o GROUP BY primeiro e o ORDER BY depois.
[14:45] A ordem geralmente é FROM, WHERE, GROUP BY e ORDER BY. A minha consulta fica mais ordenada. Além de ver os dados grupados por bairro, eu tenho primeiro Rio de Janeiro. Eu tenho os bairros ordenados pelo Rio de Janeiro em ordem alfabética. Depois, eu tenho São Paulo e eu tenho os bairros da cidade de São Paulo ordenados em ordem alfabética. Nós fizemos bastante treino usando o GROUP BY e vimos como é que nós podemos mesclar o GROUP BY com o ORDER BY.

Aproveitando o exercício do vídeo anterior, quantos itens existem com a maior quantidade de venda para o produto '1101035'?

SELECT
    COUNT(*)           AS quantidade,
    codigo_do_produto  AS cod
FROM
    itens_notas_fiscais
WHERE
        codigo_do_produto = '1101035'
    AND quantidade = 99
GROUP BY
    codigo_do_produto;

Teremos como resposta 79.

SELECT
    estado,
    sexo,
    SUM(limite_de_credito) AS total
FROM
    tabela_de_clientes
GROUP BY
    sexo,
    estado,
    bairro;

Query:
Estado       Sexo           total
SP	F	70000
SP	M	140000
RJ	M	60000
RJ	M	315000
SP	M	120000
SP	M	310000
RJ	M	150000
RJ	M	100000
RJ	M	110000
RJ	M	12000
SP	F	170000
RJ	M	90000
RJ	M	170000


SELECT
    estado,
    SUM(limite_de_credito) AS total
FROM
    tabela_de_clientes
GROUP BY
    estado;

Query:
Estado       total
SP	810000
RJ	1007000


SELECT
    embalagem,
    MAX(preco_de_lista) AS maior_preco
FROM
    tabela_de_produtos
GROUP BY
    embalagem;

Query:
Emba.        maior_preco
Lata	4,56
PET	38,012
Garrafa	13,312


SELECT
    nome_do_produto,
    MAX(preco_de_lista) AS maior_preco
FROM
    tabela_de_produtos
WHERE
    nome_do_produto LIKE '%Mo%'
GROUP BY
    nome_do_produto
ORDER BY
    nome_do_produto DESC
    ;

Query:
Nome_Do_Produto                                                                   maior_preco
Sabor da Montanha - 700 ml - Uva                	6,309
Sabor da Montanha - 700 ml - Morango     	7,709
Sabor da Montanha - 700 ml - Cereja           	8,409
Linha Refrescante - 700 ml - Morango/Limao	6,3105
Linha Refrescante - 1 Litro - Morango/Limao	9,0105


SELECT
    bairro,
    MAX(volume_de_compra) AS max_vol_compra
FROM
    tabela_de_clientes
GROUP BY
    bairro;

Query:
Bairrro                           max_vol_compra
Agua Santa	20000
Tijuca         	22000
Humaita    	26000
Barra da Tijuca	18000
Santo Amaro	21000
Cidade Nova	25000
Piedade     	12000
Inhauma    	22000
Jardins       	24500
Lapa            	16000
Bras            	20000


SELECT
    bairro,
    cidade,
    SUM(volume_de_compra) AS volume_total
FROM
    tabela_de_clientes
GROUP BY
    bairro,
    cidade
ORDER BY
    cidade;

Query:
Bairro                             Cidade                             Volume_Total
Humaita    	Rio de Janeiro	26000
Inhauma   	Rio de Janeiro	22000
Tijuca         	Rio de Janeiro	53500
Piedade     	Rio de Janeiro	12000
Agua Santa	Rio de Janeiro	20000
Cidade Nova	Rio de Janeiro	25000
Barra da Tijuca	Rio de Janeiro	18000
Jardins       	Rio de Janeiro	12000
Bras            	Sao Paulo 	20000
Santo Amaro	Sao Paulo 	21000
Lapa            	Sao Paulo 	16000
Jardins       	Sao Paulo 	67500


SELECT
    bairro,
    cidade,
    SUM(volume_de_compra) AS volume_total
FROM
    tabela_de_clientes
WHERE
    CIDADE LIKE '%S%'
GROUP BY
    bairro,
    cidade
ORDER BY
    cidade;


SELECT
    bairro,
    SUM(limite_de_credito) AS lim_credito
FROM
    tabela_de_clientes
WHERE
    bairro LIKE '%Tijuca%'
GROUP BY
    bairro;

Query:
Bairro                             Lim_Credito
Tijuca         	315000
Barra da Tijuca	90000


SELECT
    to_char(data_de_nascimento, 'MM')      AS mes_nasc,
    SUM(volume_de_compra)                  vol_compra
FROM
    tabela_de_clientes
WHERE
    to_char(data_de_nascimento, 'MM') <= 7
GROUP BY
    to_char(data_de_nascimento, 'MM')
ORDER BY
    to_char(data_de_nascimento, 'MM');

Query:
Mes_Nasc    Vol_Compra
01	   40000
02	   20000
03	   63000
06	   12000
07	   9500

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ USANDO CONDIÇÕES PARA CLASSIFICAR RESULTADOS

[00:00] Vamos ver outro comando importante nas consultas, que é o CASE. O CASE são testes. Eu testo uma condição para cada linha da consulta, e dependendo do resultado, eu vou fazer uma coisa ou outra. Na verdade, o CASE permite que eu construa várias condições. Se for igual 1, faz isso. Se for igual a 2, faz isso. Se for igual a 3, faz isso. Ou seja, diversas condições. E eu tenho no final, o ELSE. O ELSE é quando nenhuma das condições acima forem satisfeitas e eu vou fazer o valor do ELSE.
[00:40] Por exemplo, se eu tenho um campo Y aqui com valores. E se o valor de Y estiver maior do que 8 e menor do que 10, isso é uma nota ótima. Se ele estiver entre 7 e 8, ele é bom. Se ele estiver entre 5 e 7, ele é médio. Senão, ELSE, ele é ruim. Se eu mandar um SELECT do X, que é do campo cliente, em vez de fazer uma seleção de Y, eu aplico esse CASE todo aqui, o meu resultado vai ser esse. Em vez de eu ter o valor, eu tenho a classificação ótimo, médio, ruim e assim por diante.
[01:39] Vamos no SQL Developer fazer na prática e ver como é que funciona o CASE no Oracle. Vou criar aqui mais uma área de trabalho e eu vou começar por um CASE simples. “SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA, CASE WHEN PRECO_DE_LISTA >= 12 THEN ‘PRODUTO CARO’”. E embaixo eu faço outro WHEN. “WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN ‘PRODUTO EM CONTA’”. E quando não for nem maior que 12, nem estiver entre 12 e 7, ele vai entrar no ELSE. “ELSE ‘PRODUTO BARATO’”.
[03:15] Termino esse CASE com “END” e depois eu posso botar um alias, “AS STATUS_PRECO”. Na verdade, o processo todo está aqui entre parênteses. Termina aqui. E continuo o meu SELECT. Ele não acabou. “FROM TABELA_DE_PRODUTOS”. Sabor da Montanha, 6,30, é um produto barato, porque 6,30 deu menor que 7. Linha Citros é um produto em conta, porque deu 7. Está entre 7 e 12. Esse também é em conta. Videira do Campo - 2 Litros - Cereja/Maca está 24,01. Ele é um produto caro, porque ele é maior do que 12.
[04:23] Eu tenho aqui a classificação dos produtos que eu usei para poder mostrar aqui para vocês se o produto é caro ou se o produto é barato. Claro que eu posso vir aqui e aplicar um filtro. “WHERE SABOR = ‘Manga’”. Eu vou estar aqui vendo essa seleção somente para os produtos que são de manga.
[05:06] Eu posso, por exemplo, usar esse produto caro ou barato dentro do GROUP BY. Eu quero saber a média dos produtos caros e a média dos produtos baratos.
[05:48] Eu vou ver a “EMBALAGEM”, vou ter a classificação do produto caro e barato. E aqui embaixo, eu vou colocar o “PRECO_DE_LISTA”. Vou tirar aqui o WHERE. Essa consulta aqui é muito parecida com que nós já rodamos, mas eu estou vendo esse produto garrafa é barata, é caro. Só que em vez de usar o PRECO_DE_LISTA, eu vou usar um “AVG(PRECO_DE_LISTA)”.
[06:32] Só que eu tenho que botar aqui um GROUP BY. Quais são os campos textos que eu tenho? Eu tenho o EMBALAGEM, que eu tenho que grupar. E eu tenho a classificação. Que é onde temos o STATUS_PRECO. Eu vou botar “GROUP BY EMBALAGEM, STATUS_PRECO”. Por que eu estou colocando no GROUP BY esse cara? Porque esse cara tem o alias que é esse CASE todo. Vamos ver se vai funcionar isso. Deu erro. Porque na verdade eu não posso usar o alias. Dentro do GROUP BY eu vou repetir esse cara todo. Vai ficar assim.
[07:19] A consulta ficou até um pouquinho mais rebuscada. Eu estou selecionando EMBALAGEM, classificação, média de preço from a tabela, GROUP BY esses caras. Eu vou ter o seguinte. Produtos em garrafa, os que são baratos da garrafa, em média, custam 5,23.
[07:47] Os pet em conta, em média, custam 9,10. Os pet caros, em média, custam 20,40. Isso já é uma informação legal. Eu consigo ver a média de preço dos produtos baratos, em conta e caro por embalagem. Eu consigo ver isso através desse comando aqui em cima. Ou seja, o CASE entrou na condição do GROUP BY.

Veja o ano de nascimento dos clientes e classifique-os como:

Nascidos antes de 1990 são velhos
Nascidos entre 1990 e 1995 são jovens
Nascidos depois de 1995 são crianças
Liste o nome dos clientes e suas classificações.

Um exemplo de consulta que atende o que foi pedido é:
SELECT
    nome,
    (
        CASE
            WHEN to_char(data_de_nascimento, 'YYYY') < '1990' THEN
                'Velho'
            WHEN to_char(data_de_nascimento, 'YYYY') >= '1990'
                 AND to_char(data_de_nascimento, 'YYYY') <= '1995' THEN
                'Jovens'
            ELSE
                'Crianças'
        END
    ) AS classificações
FROM
    tabela_de_clientes;


SELECT
    preco_de_lista,
    (
        CASE
            WHEN preco_de_lista >= 12 THEN
                'PRODUTO CARO'
            WHEN preco_de_lista >= 7
                 AND preco_de_lista < 12 THEN
                'PRODUTO EM CONTA'
            ELSE
                'PRODUTO BARATO'
        END
    ) AS status_preco
FROM
    tabela_de_produtos
WHERE
        (
        CASE
            WHEN preco_de_lista >= 12 THEN
                'PRODUTO CARO'
            WHEN preco_de_lista >= 7
                 AND preco_de_lista < 12 THEN
                'PRODUTO EM CONTA'
            ELSE
                'PRODUTO BARATO'
        END
    ) LIKE '%CARO%'
;

Query:
Preco         Status
19,51	PRODUTO CARO
24,01	PRODUTO CARO
38,012	PRODUTO CARO
16,008	PRODUTO CARO
13,312	PRODUTO CARO
16,5105	PRODUTO CARO
12,011	PRODUTO CARO
28,512	PRODUTO CARO
19,505	PRODUTO CARO
18,011	PRODUTO CARO
12,008	PRODUTO CARO


SELECT
    bairro,
    estado,
    (
        CASE
            WHEN estado LIKE '%SP%' THEN
                'sp@outlook.com'
            WHEN estado LIKE '%RJ%' THEN
                'rj@outlool.com'
            ELSE
                '***'
        END
    ) AS descrição
FROM
    tabela_de_clientes
ORDER BY
    estado ASC,
    cidade ASC;


SELECT
    embalagem,
    tamanho,
    preco_de_lista,
    (CASE
        WHEN TAMANHO LIKE '%700%' THEN 'MÉDIO'
        WHEN TAMANHO LIKE '%350%' THEN 'PIQUENO'
        WHEN TAMANHO LIKE '%2 Litros%' THEN 'GRANDE'
        ELSE 'MÉDIO/GRANDE'
    END) AS CLASSIFICAÇÃO
FROM
    tabela_de_produtos
WHERE SABOR = 'Manga';


SELECT
    embalagem,
    preco_de_lista,
    (CASE
        WHEN preco_de_lista >= 12                       THEN 'PRODUTO CARO'
        WHEN preco_de_lista >=7 AND preco_de_lista < 12 THEN 'PRODUTO EM CONTA'
        ELSE 'PRODUTO BARATO'
    END) CLASSIFICAÇÃO
FROM
    tabela_de_produtos;

Query (primeiras 4 linhas):
Embal.       Preco         Classificação
Garrafa	6,309	PRODUTO BARATO
PET	7,004	PRODUTO EM CONTA
Garrafa	8,41	PRODUTO EM CONTA
PET	19,51	PRODUTO CARO


SELECT
    embalagem,
    preco_de_lista,
    sabor,
    AVG(preco_de_lista) as MED_PRECO_LISTA,
    MIN(preco_de_lista) AS MIN_PRECO_LISTA,
    MAX(preco_de_lista) AS MAX_PRECO_LISTA,
    COUNT(*),
    (CASE
        WHEN preco_de_lista >= 12                       THEN 'PRODUTO CARO'
        WHEN preco_de_lista >=7 AND preco_de_lista < 12 THEN 'PRODUTO EM CONTA'
        ELSE 'PRODUTO BARATO'
    END) CLASSIFICAÇÃO
FROM
    tabela_de_produtos
GROUP BY
    embalagem,
    preco_de_lista,
    sabor,
    (CASE
        WHEN preco_de_lista >= 12                       THEN 'PRODUTO CARO'
        WHEN preco_de_lista >=7 AND preco_de_lista < 12 THEN 'PRODUTO EM CONTA'
        ELSE 'PRODUTO BARATO'
    END);

Query (Emba. Preco, Sabor, Media, Minimo, Maximo, Qtd., Classificação.

Garrafa	8,41	Cereja/Maca	8,41	8,41	8,41	1	PRODUTO EM CONTA
PET	38,012	Acai             	38,012	38,012	38,012	1	PRODUTO CARO
PET	11,0105	Manga        	11,0105	11,0105	11,0105	1	PRODUTO EM CONTA


SELECT
    sabor,
    nome_do_produto,
    AVG(preco_de_lista) as MED_PRECO_LISTA,
    MIN(preco_de_lista) AS MIN_PRECO_LISTA,
    MAX(preco_de_lista) AS MAX_PRECO_LISTA,
    COUNT(*),
    (CASE
        WHEN preco_de_lista >= 12                       THEN 'PRODUTO CARO'
        WHEN preco_de_lista >=7 AND preco_de_lista < 12 THEN 'PRODUTO EM CONTA'
        ELSE 'PRODUTO BARATO'
    END) CLASSIFICAÇÃO
FROM
    tabela_de_produtos
WHERE
    SABOR LIKE 'M%'
GROUP BY
    sabor,
    nome_do_produto,
    (CASE
        WHEN preco_de_lista >= 12                       THEN 'PRODUTO CARO'
        WHEN preco_de_lista >=7 AND preco_de_lista < 12 THEN 'PRODUTO EM CONTA'
        ELSE 'PRODUTO BARATO'
    END)
ORDER BY
    sabor
;

Query
SABOR       NOME DO PRODUTO                                         MED           MIN            MAX           QTD            CLASSIFICAÇÃO
Maca	Pedacos de Frutas - 350 ml - Maca	4,211	4,211	4,211	1	PRODUTO BARATO
Maca	Pedacos de Frutas - 1,5 Litros - Maca	18,011	18,011	18,011	1	PRODUTO CARO
Maca	Pedacos de Frutas - 1 Litro - Maca	12,011	12,011	12,011	1	PRODUTO CARO
Manga	Frescor do Verao - 350 ml - Manga	3,8595	3,8595	3,8595	1	PRODUTO BARATO
Manga	Linha Refrescante - 1 Litro - Manga	11,0105	11,0105	11,0105	1	PRODUTO EM CONTA


SELECT
    embalagem,
    AVG(preco_de_lista) as MED_PRECO_LISTA,
    MIN(preco_de_lista) AS MIN_PRECO_LISTA,
    MAX(preco_de_lista) AS MAX_PRECO_LISTA,
    COUNT(*),
    (CASE
        WHEN preco_de_lista >= 12                       THEN 'PRODUTO CARO'
        WHEN preco_de_lista >=7 AND preco_de_lista < 12 THEN 'PRODUTO EM CONTA'
        ELSE 'PRODUTO BARATO'
    END) CLASSIFICAÇÃO
FROM
    tabela_de_produtos
WHERE
    SABOR LIKE 'M%'
GROUP BY
    embalagem,
    (CASE
        WHEN preco_de_lista >= 12                       THEN 'PRODUTO CARO'
        WHEN preco_de_lista >=7 AND preco_de_lista < 12 THEN 'PRODUTO EM CONTA'
        ELSE 'PRODUTO BARATO'
    END)
ORDER BY
    embalagem
;

Query
Embal.       MED           MIN            MAX           QTD            CLASSIFICAÇÃO
Garrafa	7,70975	7,709	7,7105	2	PRODUTO EM CONTA
Garrafa	5,4673	4,912	6,3105	3	PRODUTO BARATO
Lata	4,29637	3,8595	4,56	4	PRODUTO BARATO
PET	17,1095	12,011	19,51	5	PRODUTO CARO
PET	10,1776	9,0105	11,0105	3	PRODUTO EM CONTA

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ USANDO A CONDIÇÃO HAVING

[00:00] Vamos entender como é que funciona o comando HAVING. O HAVING é uma condição de filtro que é aplicada sobre o resultado de uma agregação, ou seja, sob aquele valor que é calculado quando nós aplicamos o GROUP BY. Por exemplo, eu tenho uma tabela que tem um campo X e um campo Y. Campo X, que são letras, e campo Y. E eu aplico esse SELECT X, SUM(Y) FROM TABELA GROUP BY X.
[00:37] Vou ter esse resultado aqui. A é 3, B é 6, C é 8 e o D é 3. Vamos supor que após a agregação, eu só quero listar quem está entre maior do que 4. O meu resultado vai ser só B e C, porque B é 6, C é 8 e os dois valores são maiores que 4. Para fazer isso basta eu aplicar, depois do GROUP BY, o HAVING. E eu aplico a soma que eu estou usando, que no caso é o SUM(Y), e eu coloco aqui maior que 4. É assim que eu uso o comando HAVING.
[01:37] Vamos ver na prática como é que funciona no SQL Developer. Eu vou criar aqui mais uma área de edição. Vamos começar pelo GROUP BY. “SELECT ESTADO SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM TABELA_DE_CLIENTES GROUP BY ESTADO;” esse SELECT fizemos no vídeo passado. Note que eu tive 810.000 para São Paulo e 995.000 para o Rio. Mas vamos supor que eu só quero ver os estados cuja a soma do limite_de_credito é maior do que, por exemplo, 900.000.
[02:54] Eu vou fazer o seguinte, como aqui o SUM(LIMITE_DE_CREDITO) é esse campo aqui, a SOMA_LIMITE, será que isso funciona? “WHERE SOMA_LIMITE >= 900000;”. Vamos rodar? Tem um erro. Será que isso aqui funciona? “SUM(LIMITE_DE_CREDITO) > 900000”. Também não funcionou.
[03:32] Eu vou usar o HAVING. Se eu quero que esse valor somado filtre somente valores acima de 900.000, eu faço isso daqui. Depois do GROUP BY, eu dou um “HAVING SUM(LIMITE_DE_CREDITO) >= 900000;”. Ou seja, a condição de filtro, eu uso o HAVING e depois do GROUP BY. Agora sim, ele só trouxe os estados maiores do que 900.000. Eu posso inclusive, não obrigatoriamente, usar no HAVING a mesma condição que eu estou usando na agregação.
[04:32] Vamos dar aqui outro exemplo. “SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;”. Aqui eu vou ver, para cada embalagem, o preço do produto mais caro e o preço do produto mais barato. O produto em lata mais caro custa 4,56 e o mais barato 2,80. O produto pet mais caro custa 38,01 e o mais barato 7. E o produto mais caro de garrafa custa 13,31 e o mais barato 3,78.
[05:54] Mas eu quero ver isso só para a soma dos preços de lista menor do que 80. Eu posso fazer isso aqui. “HAVING SUM(PRECO_DE_LISTA) <= 80”. Eu estou segregando, aplicando um filtro, usando agregação, que é diferente do que está sendo usado na consulta. Ele faz uma filtragem. Por que não apareceu pet? Porque a soma dos preços de listas de pet dá mais do que 80. Ele não aparece na minha lista, só vai aparecer na lista quem tem a soma dos preços de lista menor do que 80. É isso que eu queria mostrar para vocês sobre o HAVING.

Quais os clientes que fizeram mais de 2000 compras em 2016?
Execute a consulta:

SELECT
    cpf,
    COUNT(*) AS qtd
FROM
    notas_fiscais
WHERE
    to_char(data_venda, 'YYYY') = '2016'
GROUP BY
    cpf
HAVING
    COUNT(*) > 2000;

Query:
CPF                                   QTD.
3623344710	2012
50534475787	2037
492472718	2008


SELECT
    estado,
    SUM(limite_de_credito) AS lim_credito
FROM
    tabela_de_clientes
GROUP BY
    estado
HAVING SUM(limite_de_credito) >= 1007000
;

Query:
ESTADO    LIM_CREDITO
RJ	1007000


SELECT
    embalagem,
    MAX(preco_de_lista)     AS maior_preco,
    MIN(preco_de_lista)     AS menor_preco,
    AVG(preco_de_lista)     AS média_preco
FROM
    tabela_de_produtos
GROUP BY
    embalagem;

Query (Preço de Lista):

Embal.       MAX           MIN             MÉD
Lata	4,56	2,808	3,9987
PET	38,012	7,004	16,6428
Garrafa	13,312	3,768	6,99395


SELECT
    embalagem,
    MAX(preco_de_lista)     AS maior_preco,
    MIN(preco_de_lista)     AS menor_preco,
    AVG(preco_de_lista)     AS média_preco
FROM
    tabela_de_produtos
GROUP BY
    embalagem
HAVING
    SUM(preco_de_lista) <= 80;

Query (Preço de Lista):
Embal.       MAX           MIN             MÉD
Lata	4,56	2,808	3,9987
Garrafa	13,312	3,768	6,9939



SELECT
    COUNT(*) AS QTD,
    SUM(preco_de_lista) AS PRECO,
    SABOR
FROM
    tabela_de_produtos
WHERE
    embalagem = 'PET'
GROUP BY
    SABOR
HAVING
    SUM(preco_de_lista) >= 30.022
ORDER BY
    SUM(preco_de_lista);


Query
2	30,022	Maca
3	36,024	Laranja
2	39,015	Melancia
2	66,524	Acai


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- CONSOLIDANDO SEU CONHECIMENTO

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.

1) Voltando ao SQL Developer, veja agora formas diferentes de exibir os resultados. Selecione as embalagens dos produtos:

SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;


Veja que há linhas onde a embalagem se repete.

2) Agora, incluia a cláusula DISTINCT no comando, fazendo assim com que os registros não se repitam:

SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS;


3) Você pode aplicar filtros à seleção com DISTINCT:

SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja';


4) E você pode acrescentar mais campos à seleção DISTINCT:

SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;


5) Você pode limitar o número de linhas a serem exibidas na saída. Por exemplo, para exibir somente os cinco primeiros registros:

SELECT ROWNUM, CODIGO_DO_PRODUTO, NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS
WHERE ROWNUM <= 5;


6) As saídas de um comando SELECT podem ser apresentadas de forma ordenada. Por exemplo, para ordenar os registros por preço de lista, do menor para o maior, digite:

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA;


7) Você pode mudar esta ordem:

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;


8) Os valores podem vir ordenados alfabeticamente quando você inclui um campo texto no critério de ordenação:

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO;


9) No critério de ordenação do tipo texto, você também pode mudar a ordem para ser "do maior para o menor":

SELECT * FROM tabela_de_produtos ORDER BY NOME_DO_PRODUTO DESC;


10) O critério de ordenação pode ser diferente para cada tipo. Veja o exemplo abaixo, onde são usados dois campos como critério de ordenação e a ordem diferente para cada um deles:

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;


11) Os dados podem ser agrupados. Quando isso acontece, você tem que aplicar um critério de agrupamento para os campos numéricos. Você pode usar SUM, AVG, MAX, MIN e outros mais. Digite o comando abaixo:

SELECT ESTADO, LIMITE_DE_CREDITO FROM TABELA_DE_CLIENTES;


Note que há várias linhas para RJ e SP. Como fazer para somar todos os limites de crédito para RJ e SP?

12) A solução está no comando abaixo:

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS TOTAL_CREDITO FROM TABELA_DE_CLIENTES GROUP BY ESTADO;


13) Você pode usar outros critérios, como o valor máximo. Por exemplo, para ver maior preço de lista para cada tipo de embalagem:

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;


14) O comando COUNT conta o número de ocorrências na tabela. Por exemplo, para ter o número de produtos com embalagens PET, garrafa e lata:

SELECT EMBALAGEM, COUNT(*) AS NUMERO_PRODUTOS FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;


15) O filtro pode ser aplicado sobre o agrupamento, como uma consulta qualquer:

SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS TOTAL_CREDITO FROM TABELA_DE_CLIENTES
WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;


16) O agrupamento também pode ser feito por mais de um campo:

SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS TOTAL_CREDITO FROM
TABELA_DE_CLIENTES GROUP BY ESTADO, BAIRRO ORDER BY ESTADO, BAIRRO;


17) Veja a consulta abaixo:

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM TABELA_DE_CLIENTES
GROUP BY ESTADO;


Como aplicar um filtro sobre o resultado desta consulta?

18) Para isso, utilize o HAVING, para filtrar a saída de uma consulta, usando como critério o valor agrupado:

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE
FROM TABELA_DE_CLIENTES
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;


19) O critério usado no HAVING não precisa ser o mesmo usado no filtro. Veja o comando abaixo:

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA) <= 80;


20) O comando CASE permite que cada registro da tabela possa ser classificado. Por exemplo, é possível classificar os produtos como CARO, BARATO ou EM CONTA, conforme o valor do seu preço de lista:

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_lISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
    END
) AS STATUS_PRECO
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga';


21) Você também pode usar o CASE como critério de agrupamento:

SELECT EMBALAGEM,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_lISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
    END
) AS STATUS_PRECO,
AVG(PRECO_DE_LISTA) AS MEDIA_PRECO
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_lISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
    END
);

Nesta aula, aprendemos:

Como apresentar somente linhas distintas em uma seleção
A ordenar a saída da seleção
Como agrupar linhas por um conjunto de campos e aplicar um critério de agrupamento sobre os campos numéricos
O comando HAVING, que aplica um filtro usando como condição os campos numéricos agrupados
Como limitar a saída das consultas
A usar o CASE para classificar um determinado campo por um critério

------------------------------------------------------------------------------------------------------------------------------------------------------------------------ USANDO JOIN's

[00:00] Nós vimos que o Oracle é um banco de dados relacional. Isso significa que as tabelas se relacionam entre si. E nós aprendemos que esse relacionamento normalmente é feito pela chave estrangeira. Durante uma consulta, nós também podemos relacionar as tabelas. E ela não precisa ter chave estrangeira para participar de um relacionamento na consulta.
[00:28] É claro que se tiver essa chave estrangeira, esse relacionamento vai ter uma performance melhor ao apresentar o resultado. Mas não é o foco, pelo menos desse treinamento, falar de performance. Vamos falar de como que eu junto duas tabelas durante uma consulta. E nós temos várias maneiras de fazer isso. Todas elas nós chamamos de JOIN, significa juntar.
[00:59] Vamos começar por verificar alguns tipos de JOIN que o Oracle apresenta. E nós vamos começar inicialmente pelo INNER JOIN. Para nós entendermos como é que funciona os joins e mais detalhadamente o INNER JOIN, vamos olhar aqui essas duas tabelas. A tabela da esquerda tem o nome do cliente e um ID identificador. Esse ID identificador seria um código do hobby daquele cliente.
[01:36] Na tabela da direita eu tenho o cadastro de hobbies. Praia é o hobby 1, futebol é o hobby 3, fotografia é o hobby 5 e artesanato é o hobby 9. Eu quero saber qual é o hobby de cada cliente. Se eu usar o INNER JOIN eu vou juntar as duas tabelas pelo código em comum, que no caso, é o identificador.
[02:08] Quando eu uso o INNER JOIN, os dois códigos tem que existir nas duas tabelas. Quem não estiver nas duas tabelas, não será selecionado quando nós usarmos o INNER JOIN. Não importa se tem na tabela de cliente e não tem na tabela de hobby ou vice-versa.
[02:29] Vamos para esse caso aqui. Na tabela da esquerda eu tenho o 1 e o 3. E note que na tabela da direita eu também tenho o 1 e o 3. Já o Pedro que tem o hobby 4, se nós olharmos na tabela de hobbies, não existe o hobby 4. E a mesma coisa acontece com a Cláudia que tem hobby 6, não temos esse código dentro da tabela de hobbies. Quando eu fizer o INNER JOIN entre essas duas tabelas, somente quem existir nas duas é que será selecionado. No caso, código 1 é código 3, tanto da tabela da esquerda quanto a tabela da direita.
[03:14] E ao fazer isso, o resultado vai ser o que está aqui embaixo. Duas linhas apenas, porque somente duas linhas é que possuem códigos iguais. Eu vou saber que João tem como hobby praia e a Maria tem como hobby futebol. Vamos ver isso na prática no SQL Developer. Eu vou criar aqui um script novo na minha conexão e eu vou começar fazendo a seguinte análise. Vamos olhar aqui a tabela de vendedores. Na tabela de vendedores, eu tenho aqui a matrícula do vendedor, que é o código interno do vendedor dentro empresa de suco de frutas. E o nome.
[04:16] Vamos olhar aqui a tabela de notas fiscais. Na tabela de notas fiscais, que é o cabeçalho da nota fiscal, eu também tenho aqui a matrícula do vendedor que fez aquela venda. Ou seja, no registro da nota fiscal, dentro do sistema da empresa de suco de frutas, eu tenho um registro dizendo o vendedor que fez aquela venda, ou seja, o vendedor responsável pela emissão daquela nota fiscal.
[04:50] Eu quero saber agora a seguinte informação. Quantas notas fiscais cada vendedor emitiu. Eu posso chegar aqui, eu aprendi GROUP BY. O COUNT conta o número de ocorrências e eu sei que na tabela de notas fiscais, como a chave primária é o número da nota, cada linha é uma nota fiscal. Eu vou fazer isso daqui. “SELECT MATRICULA, COUNT(*) AS NUMERO_NOTAS FROM NOTAS_FISCAIS”. E como eu estou usando COUNT, eu preciso usar o GROUP BY. “GROUP BY MATRICULA”.
[05:48] Pronto. Eu tenho aqui que a matrícula 236, 29.400 notas fiscais. A 237, 29.139 e assim por diante. Só que esse relatório não está muito legal. Seria legal eu ver o nome do vendedor, não só a matrícula. Mas o nome do vendedor não está na tabela de notas fiscais. O nome do vendedor está na tabela de vendedores.
[06:31] Se eu colocar aqui, por exemplo, “GROUP BY MATRICULA, NOME”, eu vou ter um erro, porque não existe esse campo NOME nessa tabela de notas fiscais. Logo, se eu quiser ver o nome junto com o contador de notas fiscais, eu preciso juntar na mesma consulta a tabela de vendedores com a tabela de notas fiscais e buscar, da tabela de vendedores, o nome e, da tabela de notas fiscais, o número de notas fiscais.
[07:11] E qual é o campo em comum? Eu preciso ter um campo em comum entre os dois que faça com que eu junte essas duas. É a matrícula do vendedor, porque a matrícula do vendedor existe tanto na tabela de vendedores quanto na tabela de notas fiscais. Vamos fazer o seguinte, eu vou dar um SELECT. Por enquanto, eu vou deixar asterisco, depois eu volto para nós fazermos a seleção dos campos.
[07:44] Vou botar aqui “SELECT* FROM NOTAS_FISCAIS”, é o seguinte, quando nós usamos JOIN, é interessante nós damos um apelido para as tabelas, porque quando eu vou juntar duas tabelas, eu posso ter campos que tenham o mesmo nome em tabela diferentes. E quando eu fizer a minha consulta, o SQL vai ficar confuso, porque ele não vai saber se eu quero pegar o campo tal da primeira tabela ou da segunda tabela.
[08:26] No nosso exemplo aqui, nós sabemos que MATRICULA existe tanto em NOTAS_FISCAIS quanto em TABELA_DE_VENDEDORES. Quando eu juntar as duas tabelas e dizer, eu quero selecionar matrícula, o SQL vai perguntar, mas você quer selecionar a matrícula de onde? Da tabela de vendedores ou da tabela de notas fiscais? Eu preciso diferenciar o campo MATRICULA que vem da TABELA_DE_VENDEDORES e o que vem na tabela NOTAS_FISCAIS. E como é que eu faço isso? Criando esse alias.
[09:04] Esse alias pode ser uma letra, pode ser um nome, pode ser inclusive o próprio nome da tabela. Eu vou colocar aqui, por exemplo, a letra A. Eu estou chamando tudo que vier de NOTAS_FISCAIS vai ter o alias A. E eu coloco aqui INNER JOIN e eu coloco a outra tabela, “TABELA_DE_VENDEDORES”. E a TABELA_DE_VENDEDORES eu vou chamar de B. Eu vou fazer um SELECT na primeira tabela, INNER JOIN, porque eu vou juntar elas pelo código que acontece nas duas tabelas. E a outra tabela é a TABELA_DE_VENDEDORES.
[09:58] Só que quando eu faço o JOIN, eu preciso dizer qual é o campo em comum nas duas tabelas que eu vou fazer a minha junção. O campo é a MATRICULA, então eu coloco “ON A.MATRICULA = B.MATRICULA”. O que isso significa? Eu estou pegando o campo MATRICULA da tabela A, que é NOTAS_FISCAIS, e igualando com campo MATRICULA B, que é a TABELA_DE_VENDEDORES. Com isso aqui, eu juntei as minhas tabelas. Só que no meu relatório, eu quero ver isso daqui. Eu quero ver MATRICULA e NOME, e o contador das notas.
[10:50] Matrícula. Pego da tabela A ou da tabela B? Quando nós vamos referenciar a um campo que faz parte da união, a resposta é tanto faz. Tanto faz eu pegar da A quanto da B. Eu vou pegar aqui da A. O nome. O nome está onde? Não está em NOTAS_FISCAIS. O nome está na TABELA_DE_VENDEDORES. E a TABELA_DE_VENDEDORES eu chamei de tabela B. Logo, eu vou botar aqui “B.NOME”, vou colocar o “COUNT”. COUNT não tem campo, pode ser COUNT(*). Só que como tem COUNT, eu preciso colocar “GROUP BY”.
[11:47] Só que GROUP BY, quais campos? Os campos que não são sumarizadores, que é o campo MATRICULA e NOME. Como MATRICULA e NOME têm o alias na frente, tem que ficar assim. A minha consulta ficou SELECT, o campo, onde eu tenho o alias na frente, o COUNT FROM a tabela A, JOIN com a tabela B juntando os dois campos e GROUP BY. Vamos ver o que vai sair daqui? Pronto. Eu tenho o relatório que eu queria. Eu sei que o Péricles Alves teve 23 vendas. A Cláudia Moraes teve 29.400. O Márcio Almeida 29.398 e a Roberta Martins 29.139.
[12:39] Se por acaso o resultado de vocês não der os mesmos números, não importa. Aqui nós não estamos muito preocupados com os valores, e sim com a forma com que nós fazemos a coisa. Pode ser que a base de dados que vocês baixaram para fazer esse treinamento esteja diferente da que eu estou usando, porque houve alguma correção, acrescentou-se alguma coisa. Mas o importante é mostrar a vocês como é que eu juntei as duas tabelas. Isso tudo pelo INNER JOIN, que junta as tabelas onde as ocorrências acontecem nas duas ao mesmo tempo.

Levando em consideração que o valor financeiro das vendas consiste em multiplicar a quantidade pelo preço, obtenha o faturamento anual da empresa.
Um exemplo de consulta que atende o que foi pedido é:

SELECT
    to_char(data_venda, 'YYYY'),
    SUM(quantidade * preco) AS faturamento
FROM
         notas_fiscais nf
    INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero
GROUP BY
    to_char(data_venda, 'YYYY')


SELECT
    matricula,
    COUNT(*) AS QTD_NOTAS
FROM
    notas_fiscais
GROUP BY
    matricula
;

Query:
MATRI.      QD_NOTAS
00236	29400
00237	29139
00235	29398
00238	23


SELECT
    nfs.matricula,
    vend.nome,
    COUNT(*)
FROM
    notas_fiscais NFS
INNER JOIN
    tabela_de_vendedores VEND
ON
    nfs.matricula = vend.matricula
GROUP BY
    nfs.matricula,
    vend.nome
;

Query:
MATRIC.   NOME_VENDEDOR                       QTD_NOTAS
00238	Pericles Alves              	23
00236	Claudia Morais            	29400
00235	Marcio Almeida Silva	29398
00237	Roberta Martins         	29139

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ EXEMPLOS LEFT / RIGHT JOIN

[00:00] Não é só usando INNER JOIN que nós podemos juntar duas tabelas. Nós podemos também usar o que nós chamamos de LEFT JOIN. O left significa esquerda. Quando nós fizemos o nosso SELECT no INNER JOIN, nós declaramos sempre uma tabela, aqui no caso está o LEFT JOIN, mas no nosso exemplo foi o INNER JOIN que nós usamos. Foi essa mais ou menos essa consulta. Não foi bem essa consulta, mas foi usando o modelo.
[00:46] Nós declaramos o INNER JOIN e nós colocamos uma tabela cruzando com outra tabela. Vamos considerar que está tudo na mesma linha. Tabela 1, INNER JOIN, tabela outro. Olhando o INNER JOIN, nós temos uma tabela que está à esquerda do comando e uma que fica à direita do comando. Basicamente, o da esquerda que fica antes do INNER JOIN e tem a que fica depois do INNER JOIN.
[01:15] Nós chamamos a tabela que fica antes do INNER JOIN de tabela da esquerda, left. E o que fica depois do INNER JOIN, a tabela da direita, right. Sabendo esse apelido de quem é left e quem é right, nós chegamos ao LEFT JOIN. O LEFT JOIN significa o seguinte, como tem left no nome, significa que eu tenho um foco sobre a tabela que vem antes do JOIN. No nosso caso aqui, nós temos a tabela de nomes e o identificador. Ela está no meu comando declarado antes do JOIN, ou seja, na parte left. Ou seja, ela é a esquerda, ela é o left.
[02:01] E nós temos a tabela da direita, que vem depois do JOIN que está aqui. Quando nós temos um LEFT JOIN significa o seguinte. Eu vou pegar todo mundo da tabela que está na esquerda, e somente quem tem as mesmas ocorrências na tabela da direita. No nosso caso aqui, eu vou pegar todo mundo da esquerda, então os quatro registros à esquerda serão selecionados. E os da tabela da direita, somente quem existe na esquerda. No caso, o 1 e o 3. O 5 e o 9 não existem aqui.
[02:43] Essa consulta usando o LEFT JOIN vai me dar este resultado aqui embaixo. Note que ele vai colocar isso daqui. O João e Maria, ele faz a relação, porque ele acha nas duas tabelas. Porém, o Pedro e Cláudia, que são selecionados na tabela da esquerda, ele não acha ninguém na direita. Aparece aqui NULL. É essa a seleção final quando eu uso LEFT JOIN. Já o RIGHT JOIN é o inverso. O RIGHT JOIN vai selecionar todo mundo que está declarado na tabela depois do JOIN e só os que têm a mesma ocorrência na tabela que está antes do JOIN.
[03:31] No nosso caso aqui, o 1 e 3, como têm nas duas, vai ser selecionado. O 5 e 9, como ele está na tabela da direita, na right, ele será selecionado independente se há ou não ocorrências. E na tabela da esquerda, o 4 e o 8 não serão selecionados. O meu resultado será esse daqui. Eu vou ter fotografia e artesanato do lado direito sem nenhuma relação do lado esquerdo. Significa que nenhum cliente colocou como hobby fotografia nem artesanato.
[04:10] Vamos no SQL Developer fazer alguns exemplos do LEFT e do RIGHT JOIN. Pronto. Eu vou criar uma nova área de edição e nós vamos fazer a seguinte coisa. “SELECT COUNT(*) FROM TABELA_DE_CLIENTES”. Como eu tenho a fórmula de agrupamento sozinha, sem nenhum campo texto, eu não preciso colocar GROUP BY. Eu vou ter aqui o número de clientes que eu tenho no meu cadastro de clientes. Se eu rodar, eu tenho aqui 16 clientes no meu cadastro.
[05:22] Agora, vou fazer isso daqui. “SELECT CPF, COUNT(*) FROM NOTAS_FISCAIS GROUP BY CPF”. Essa consulta aqui, eu vou pegar cada CPF, ou seja, cada cliente, eu vou contar quantas notas estão associadas a esses clientes, ou seja, quantas vendas foram feitas para cada cliente. Note que ao olhar isso, eu tenho aqui 15 linhas, o que significa isso? Significa que 15 clientes fizeram pelo menos uma compra no período completo da minha base. Mas nós vimos no cadastro de clientes que eu tenho 16 clientes.
[06:21] Significa que teve um cliente, que está no meu cadastro, e que nunca comprou. Eu cadastrei, mas ele não fez nenhuma venda. Como é que eu descubro quem é esse cliente? Nós podemos fazer um LEFT JOIN. Eu vou fazer assim. “SELECT * FROM TABELA_DE_CLIENTES” porque eu quero que venha todos os 16 clientes, então a TABELA_DE_CLIENTES vem primeiro “LEFT JOIN” lembrando, se estou usando LEFT JOIN, vai vir todo mundo da tabela que vem antes do JOIN. E eu vou colocar “NOTAS_FISCAIS”.
[07:16] Lembrando que eu vou botar aqui um alias. E o que junta a tabela de cliente com a tabela de notas fiscais? É o CPF, porque eu tenho nas duas tabelas, TABELA_DE_CLIENTES eu tenho código do CPF. E na tabela NOTAS_FISCAIS eu também tenho o código do CPF. Vou colocar aqui “ON A.CPF = B.CPF”. E eu preciso selecionar o que eu quero ver, “A.CPF, A.NOME, B.CPF”. Vou botar um alias aqui “AS CPF_DA_NOTA” e aqui na frente eu vou botar “AS CPF_DO_CADASTRO”.
[08:28] Eu seleciono o CPF da TABELA_DE_CLIENTES, porque é A. Seleciono o nome e seleciono o CPF, que vem da tabela NOTAS_FISCAIS. Estou fazendo um LEFT JOIN, ou seja, vai vir todo mundo dessa tabela e somente os que não se repetem nesta outra tabela. E para que eu não tenho uma linha muito grande, vou usar o “DISTINCT”. O DISTINCT pega as linhas iguais e coloca em uma linha.
[09:04] Vamos ver o que nós vamos ter dessa consulta aqui. Note que eu trouxe 16 clientes. E olha esse cliente aqui, Maurício de Souza. Note que a terceira coluna é o CPF que vem de notas fiscais. Ele veio null. Por que veio null? Porque ele trouxe o Maurício de Souza, que é o cliente do cadastro de clientes e não achou ele na tabela NOTAS_FISCAIS. É esse cliente que é o cliente que eu estou procurando. É ele que está no cadastro e que nunca fez nenhuma venda.
[09:53] E se nós quiséssemos só vê-lo, ou seja, se a minha consulta fosse assim: traga todos os clientes que não compraram na empresa de suco de frutas, bastaria eu botar aqui “WHERE B.CPF IS NULL”. Ou seja, só me traz quem tem na coluna CPF o valor nulo, que é justamente quem está na tabela de clientes, mas não está na tabela de notas. Se eu rodar isso aqui, trouxe só o Mauricio de Souza. Eu dei um exemplo aqui do LEFT JOIN.
[10:34] O RIGHT JOIN seria a mesma coisa, mas, por exemplo, para funcionar com o RIGHT JOIN, eu teria que trocar a ordem, NOTAS_FISCAIS teria que vir primeiro e TABELA_DE_CLIENTES teria que vir depois. E eu coloquei aqui um RIGHT JOIN.
[10:57] Ele vai me trazer o mesmo resultado. Está trazendo todo mundo da tabela da direita e só quem tem ocorrências na tabela da esquerda. Quem ele não acha, coloca nulo nesse campo. Como eu só estou trazendo quem é nulo nesse campo, eu só trago o cliente que realmente está no cadastro, mas não tem nota.


Tendo em vista o comando SQL abaixo:
SELECT
    *
FROM
    tab1 xxxxx
tab2 ON tab1.cod = tab2.cod

Sabendo que queremos ver todos os registros de TAB2, e apenas os que correspondem de TAB1, o que deve estar no lugar de XXXXX?
O RIGHT JOIN é a opção correta.

SELECT DISTINCT
    cli.cpf     AS cpf_cli,
    cli.nome    AS nome_cli,
    nfs.cpf     AS cpf_nota
FROM
    tabela_de_clientes cli
    LEFT JOIN notas_fiscais nfs
ON
    cli.cpf = nfs.cpf;

Query:
CPF_CLIENTE             NOME_CLIENTE        CPF_NOTA
8502682733	Valdeci da Silva	8502682733
3623344710	Marcos Nogueira	3623344710
7771579779	Marcelo Mattos	7771579779
50534475787	Abel Silva 	50534475787
1471156710	Erica Carvalho	1471156710
5576228758	Petra Oliveira	5576228758
19290992743	Fernando Cavalcan	19290992743
492472718	Eduardo Jorge	492472718
5648641702	Paulo Cesar Mattos	5648641702
5840119709	Gabriel Araujo	5840119709
9283760794	Edson Meilelles	9283760794
2600586709	Cesar Teixeira	2600586709
95939180787	Fabio Carvalho	95939180787
94387575700	Walber Lontra	94387575700
8719655770	Carlos Eduardo	8719655770
49992702121	Wallison Tiago	(null)


SELECT
    produtos.embalagem,
    itens.quantidade,
    COUNT(*)
FROM
    tabela_de_produtos   produtos
    LEFT JOIN itens_notas_fiscais  itens
ON
    produtos.codigo_do_produto = itens.codigo_do_produto
WHERE
    produtos.sabor LIKE '%Uva%'
    AND produtos.codigo_do_produto LIKE '%1000889%'
GROUP BY
    produtos.embalagem,
    itens.quantidade;


SELECT
    clientes.cpf     AS cpf_cliente,
    clientes.nome    AS nome_cliente,
    notas.cpf        AS cpf_nota
FROM
    notas_fiscais       notas
RIGHT JOIN
    tabela_de_clientes  clientes
ON
    notas.cpf = clientes.cpf
WHERE
    notas.cpf IS NULL;

Query:
CPF_CLIENTE             NOME_CLIENTE        CPF_NOTA
49992702121	Wallison Tiago	(null)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ EXEMPLOS FULL / CROSS JOIN

[00:00] Vamos falar agora do FULL JOIN. O FULL JOIN pega todo mundo de um lado e todo mundo do outro. Quem tem racionamento, ele mostra. Quem não tem relacionamento de um lado, ele vai mostrar o que vem na tabela da esquerda e null na direita. Quem não tem racionamento vindo da direita, ele vai mostrar o registro da direita e quem não tem, na esquerda.
[00:24] No nosso exemplo, o 1 e o 3, nós temos nas duas. O 4 e o 8, só existem na tabela da esquerda. E o 5 e 9, só existem na tabela da direita. Se eu uso o FULL JOIN, eu vou ter isso daqui. O que tem relacionamento vai aparecer ambos os nomes. O que tem relacionamento só na da esquerda, vai aparecer com o null desse lado. E o que tem relacionamento na direita, vai aparecer com null aqui embaixo. É como se fosse um LEFT e um RIGHT ao mesmo tempo.
[01:02] Já o CROSS JOIN faz toda a análise combinatória dos cruzamentos. Ele vai pegar o João cruzando com todos os quatro daqui. A Maria, cruzando com todos os quatro daqui. O Pedro cruzando com todos os quatro daqui e a Cláudia cruzando com todos os quatro daqui. Como é todo mundo cruzando com todo mundo, o CROSS JOIN, eu não preciso declarar aqui o ON. Eu não preciso dizer que campo iguala um com o outro, porque vai vir todo mundo.
[01:41] Esse é um exemplo de como viria o FULL JOIN. João cruzando com praia, Maria cruzando com praia, Pedro cruzando com praia, Cláudia cruzando com praia, João cruzando com futebol, Maria com futebol, Pedro com futebol, Cláudia futebol e eu coloquei aqui esses três pontinhos dizendo que a combinação continua além do que está sendo representado aqui.
[02:07] Vamos no SQL Developer fazer alguns testes para ver como é que funciona esse tipo de JOIN. Aqui no SQL Developer eu vou criar um script e vou fazer a seguinte coisa. Na TABELA_DE_CLIENTES, nós temos aqui o BAIRRO onde o cliente tem sede. E também na TABELA_DE_VENDEDORES, nós temos aqui um BAIRRO, que é o bairro onde o vendedor tem seu escritório. No caso da nossa empresa de suco de frutas, os vendedores são autônomos e eles têm um escritório próprio.
[02:53] E eu quero fazer um estudo para saber os bairros onde os meus vendedores têm sede, comparando com os bairros onde os clientes têm sede. Porque assim, teoricamente, o vendedor vai atender melhor o cliente que está próximo dele, ou seja, que tem sede no bairro onde ele tem escritório. Vamos fazer esse estudo. Eu vou vir aqui e vou colocar “SELECT* TABELA_DE_VENDEDORES INNER JOIN TABELA_DE_CLIENTES”.
[03:38] Eu poderia colocar o alias A ou B, mas eu vou fazer uma maneira diferente. Nós podemos omitir o alias desde que nós coloquemos o nome da tabela na frente do nome do campo. Vou selecionar, por exemplo, da “TABELA_DE_VENDEDORES.”, eu vou selecionar o “NOME” do vendedor e vou chamar esse cara de “NOME_VENDEDOR”. Depois também vai ter a “TABELA_DE_VENDEDORES.BAIRRO”. Vou chamar esse campo de “BAIRRO_VENDEDOR”.
[04:35] Depois, eu vou querer ver o nome do cliente, “TABELA_DE_CLIENTES.NOME AS NOME_CLIENTE”. E vou colocar agora o nome do bairro do cliente. “TABELA_DE_CLIENTES.BAIRRO AS BAIRRO_CLIENTE”. Qual é o campo que liga as duas tabelas? É o bairro. “ON TABELA_DE_VENDEDORES.BAIRRO = TABELA_DE_CLIENTES.BAIRRO”. A ordem com que eu coloco essas igualdades não tem nada a ver com a ordem que eu declaro as tabelas. Só para deixar isso claro.
[05:58] Note o seguinte. Aqui são clientes. Eu tenho aqui 8 clientes. no primeiro vídeo dessa aula, eu fiz um COUNT de clientes e nós temos 16 clientes. Como eu tenho 8 clientes aqui, significa que somente 8 clientes têm a sua sede em bairros em que os vendedores também tem sede.
[06:26] Por exemplo, a Cláudia Morais, que é uma vendedora, tem um escritório no Jardins. A cliente Érica Carvalho também está no Jardins. O Márcio Almeida tem um escritório na Tijuca e eu tenho 3 clientes que ficam na Tijuca. O Cesar Teixeira, o Eduardo Jorge e o Paulo César Mattos.
[06:50] A Cláudia Moraes, Jardins, continua aqui também. Ela, além de ter a Érica Carvalho, tem o Valdecir da Silva, o Carlos Eduardo e o Mauricio de Souza. E o vendedor Péricles Alves, que tem no escritório em Santo Amaro, o único cliente de Santo Amaro é o Gabriel Araújo.
[07:12] Agora, eu quero ver vendedores que não têm nenhum cliente no bairro onde eles têm sede. Logo, basta eu pegar essa mesma consulta e fazer um LEFT JOIN, lembrando que a tabela left é a TABELA_DE_VENDEDORES que vem antes, ou seja, vou ver todos os vendedores e depois vou ver somente os clientes que estão associados aos vendedores
[07:41] Ou seja, onde eu tiver TABELA_DE_CLIENTE.NOME e TABELA_DE_CLIENTE.BAIRRO igual a null, significa um vendedor que não tem nenhum cliente no bairro onde ele tem sede. Eu vou copiar aqui, colar aqui embaixo e eu vou botar agora um “LEFT”.
[08:08] A Roberta Martins, que é uma vendedora que tem o escritório em Copacabana, veio null do lado. Significa que não existe nenhum cliente em Copacabana. Ou seja, ou eu demito a Roberta Miranda, ou então eu peço para ela mudar de sede, já que eu digo que vendedores que tem seus clientes no mesmo bairro que eles, têm uma performance melhor. Nossa função é apenas olhar os dados e depois fornecer isso para os diretores da empresa tomarem a decisão.
[08:51] Se eu dou um RIGHT JOIN, eu vou ver agora todos os clientes e os vendedores que estão associados a esses clientes pelo bairro. Todos esses clientes aqui, que tem sede em Água Santa, Cidade Nova, Humaitá, Lapa, Brás, são clientes que não têm nenhum vendedor no bairro onde ele tem sede, ou seja, não existe nenhum vendedor no Humaitá, na Cidade Nova, na Lapa, no Brás.
[09:32] Pode ser que eu possa tomar uma decisão e contratar alguém que tenha escritório nessas regiões para atender esses caras, porque eu vou ter uma performance melhor.
[09:41] Eu consigo diferenciar os clientes que não têm nenhum vendedor no bairro onde eles têm sede. Agora, eu precisei fazer um LEFT, precisei fazer um RIGHT. Mas se eu fizer agora um “FULL JOIN”, eu consigo ver o LEFT e o RIGHT ao mesmo tempo. Nós temos aqui a Roberta Martins em Copacabana, que é a vendedora que não tem nenhum cliente do bairro onde ela tem sede. E nós temos aqui os nulls, que são os clientes que não têm nenhum vendedor no bairro onde eles têm sede.
[10:34] O FULL JOIN me deu o resultado do LEFT e do RIGHT ao mesmo tempo. O CROSS JOIN, que é o que eu vou falar agora, traz análises combinatórias de todo mundo. Se seu rodar aqui um FULL JOIN basta eu fazer isso daqui. Vou colocar vírgula, a outra tabela e tirar o ON. Não preciso ter nenhum link entre as duas tabelas, porque eu vou fazer a análise combinatória. Isso aqui vai me trazer todo mundo cruzando com todo mundo.
[11:33] O CROSS JOIN nós usamos mais quando nós queremos que ele me dê todas as combinações para eu poder escolher qual é a valida. Eu tenho um sistema onde eu quero mostrar opções possíveis. Eu uso o FULL JOIN, mostra uma listinha e alguém que está mexendo lá no sistema vai marcando. Para nós deixarmos bem claro, o CROSS JOIN traz todas as combinações o FULL JOIN traz o LEFT e o RIGHT ao mesmo tempo.


Tendo em vista o comando SQL abaixo:

SELECT * FROM
TAB1 XXXXX TAB2 ON TAB1.COD = TAB2.COD
Sabendo que queremos ver todos os registros de TAB2 e todos de TAB1, o que deve estar no lugar de XXXXX?

FULL JOIN. Esta irá mostrar todos os registros das duas tabelas, correspondendo ou não.

SELECT
    tabela_de_vendedores.NOME AS NOME_VENDEDOR,
    tabela_de_vendedores.BAIRRO AS BAIRRO_VENDEDOR,
    tabela_de_clientes.NOME AS NOME_CLIENTE,
    tabela_de_clientes.BAIRRO AS BAIRRO_CLIENTE
FROM
    tabela_de_vendedores
INNER JOIN
    tabela_de_clientes
ON
    tabela_de_clientes.bairro = tabela_de_vendedores.bairro
;

Query:
NOME_VENDEDOR                       BAIRR_VENDED        NOME_CLIENTE        BAIRRO_CLI
Claudia Morais            	Jardins		Erica Carvalho	Jardins
Wallison Tiago            	Jardins		Erica Carvalho	Jardins
Marcio Almeida Silva	Tijuca		Cesar Teixeira	Tijuca
Marcio Almeida Silva	Tijuca		Eduardo Jorge	Tijuca
Marcio Almeida Silva	Tijuca         	Paulo Cesar Matt	Tijuca
Pericles Alves              	Santo Amaro	Gabriel Araujo	Santo Amaro
Claudia Morais            	Jardins		Valdeci da Silva	Jardins
Wallison Tiago            	Jardins		Valdeci da Silva	Jardins
Claudia Morais            	Jardins		Carlos Eduardo	Jardins
Wallison Tiago            	Jardins		Carlos Eduardo	Jardins
Claudia Morais            	Jardins		Wallison Tiago	Jardins
Wallison Tiago            	Jardins		Wallison Tiago	Jardins


SELECT
    tabela_de_vendedores.NOME AS NOME_VENDEDOR,
    tabela_de_vendedores.BAIRRO AS BAIRRO_VENDEDOR,
    tabela_de_clientes.NOME AS NOME_CLIENTE,
    tabela_de_clientes.BAIRRO AS BAIRRO_CLIENTE
FROM
    tabela_de_vendedores
LEFT JOIN
    tabela_de_clientes
ON
    tabela_de_clientes.bairro = tabela_de_vendedores.bairro
;

Query (Agora, eu quero ver vendedores que não têm nenhum cliente no bairro onde eles têm sede. Logo, basta eu pegar essa mesma consulta e fazer um LEFT JOIN, lembrando que a tabela left
é a TABELA_DE_VENDEDORES que vem antes, ou seja, vou ver todos os vendedores e depois vou ver somente os clientes que estão associados aos vendedores. Ou seja, onde eu tiver
TABELA_DE_CLIENTE.NOME e TABELA_DE_CLIENTE.BAIRRO igual a null, significa um vendedor que não tem nenhum cliente no bairro onde ele tem sede)

NOME_VENDEDOR                       BAIRR_VENDED        NOME_CLIENTE        BAIRRO_CLI
Claudia Morais            	Jardins         	Erica Carvalho	Jardins
Wallison Tiago            	Jardins         	Erica Carvalho	Jardins
Marcio Almeida Silva            	Tijuca         	Cesar Teixeira	Tijuca
Marcio Almeida Silva	Tijuca         	Eduardo Jorge	Tijuca
Marcio Almeida Silva	Tijuca         	Paulo Cesar Matt	Tijuca
Pericles Alves                                   Santo Amaro	Gabriel Araujo	Santo Amaro
Claudia Morais            	Jardins       	Valdeci da Silva         	Jardins
Wallison Tiago            	Jardins       	Valdeci da Silva         	Jardins
Claudia Morais            	Jardins       	Carlos Eduardo         	Jardins
Wallison Tiago            	Jardins       	Carlos Eduardo         	Jardins
Claudia Morais            	Jardins       	Wallison Tiago         	Jardins
Wallison Tiago            	Jardins       	Wallison Tiago         	Jardins
Roberta Martins            	Copacabana	(null)	                     (null)


SELECT
    vendedores.nome AS NOME_VENDEDOR,
    vendedores.bairro AS BAIRRO_VENDEDOR,
    cliente.nome AS NOME_CLIENTE,
    cliente.bairro AS BAIRRO_CLIENTE
FROM
    tabela_de_vendedores VENDEDORES
RIGHT JOIN
    tabela_de_clientes CLIENTE
ON
    cliente.bairro = vendedores.bairro;

Query (Se eu dou um RIGHT JOIN, eu vou ver agora todos os clientes e os vendedores que estão associados a esses clientes pelo bairro. Todos esses clientes aqui, que tem sede em Água Santa,
Cidade Nova, Humaitá, Lapa, Brás, são clientes que não têm nenhum vendedor no bairro onde ele tem sede, ou seja, não existe nenhum vendedor no Humaitá, na Cidade Nova, na Lapa, no Brás)

NOME_VENDEDOR                       BAIRR_VENDED        NOME_CLIENTE        BAIRRO_CLI
Marcio Almeida Silva	Tijuca         	Cesar Teixeira	Tijuca
Marcio Almeida Silva	Tijuca         	Eduardo Jorge	Tijuca
Marcio Almeida Silva	Tijuca         	Paulo Cesar Matt	Tijuca
Claudia Morais            	Jardins         	Erica Carvalho	Jardins
Claudia Morais            	Jardins         	Valdeci da Silva	Jardins
Claudia Morais            	Jardins         	Carlos Eduardo	Jardins
Claudia Morais            	Jardins         	Wallison Tiago	Jardins
Pericles Alves                        	Santo Amaro	Gabriel Araujo	Santo Amaro
Wallison Tiago            	Jardins         	Erica Carvalho	Jardins
Wallison Tiago            	Jardins         	Valdeci da Silva	Jardins
Wallison Tiago            	Jardins         	Carlos Eduardo	Jardins
Wallison Tiago            	Jardins         	Wallison Tiago	Jardins
(NULL)    	                     (NULL)                           Fernando Caval	Agua Santa
(NULL)	                      	(NULL)                      	Abel Silva 	Humaita
(NULL)	                      	(NULL)                     	Fabio Carvalho	Barra da Tijuca
(NULL)	                      	(NULL)                      	Walber Lontra	Piedade
(NULL)	                      	(NULL)                     	Edson Meilelles	Cidade Nova
(NULL)	                      	(NULL)                      	Marcos Nogueira	Inhauma
(NULL)	                      	(NULL)                     	Petra Oliveira	Lapa
(NULL)	                      	(NULL)                     	Marcelo Mattos	Bras


Query FULL JOIN
SELECT
    vendedores.nome AS NOME_VENDEDOR,
    vendedores.bairro AS BAIRRO_VENDEDOR,
    cliente.nome AS NOME_CLIENTE,
    cliente.bairro AS BAIRRO_CLIENTE
FROM
    tabela_de_vendedores VENDEDORES
FULL JOIN
    tabela_de_clientes CLIENTE
ON
    cliente.bairro = vendedores.bairro;


Query CROSS JOIN
SELECT
    vendedores.nome      AS nome_vendedor,
    vendedores.bairro    AS bairro_vendedor,
    cliente.nome         AS nome_cliente,
    cliente.bairro       AS bairro_cliente
FROM
    tabela_de_vendedores  vendedores,
    tabela_de_clientes    cliente;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- JUNTANDO CONSULTAS

O UNION ELE JUNTA DUAS SELEÇÕES NUMA SÓ, ENTÃO POR EXEMPLO, TEMOS DUAS TABELAS, UMA QUE TEM O IDENTIFICADOR E HOBBY E UMA SEGUNDA COM IDENTIFICADOR E HOBBY TBM.
QUANDO FAZEMOS UNION O RESULTADO VAI SER A JUNÇÃO DESSAS DUAS TABELAS

IDENTIFICADOR     HOBBY
1	                   PRAIA
3	                   FUTEBOL
5	                   FOTOGRAFIA
8	                   ARTESANATO

IDENTIFICADOR     HOBBY
1	                   PRAIA
14	                   COMPUTADOR
15	                   VER TV
18	                   TÊNIS

IDENTIFICADOR     HOBBY
1	                   PRAIA
3	                   FUTEBOL
5	                   FOTOGRAFIA
8	                   ARTESANATO
14	                   COMPUTADOR
15	                   VER TV
18	                   TÊNIS

É impo que as tabelas que serão Unidas tenham o mesmo número e tipo de campo. Se tivermos 'varchar' no segundo campo da segunda tabela e 'Inteiro' no segunda campo da primeira tabela, o UNION não será executao, não vai deixar unir os CAMPOS. Além disso se eu tiver DUAS colunas na primeira tabela preciso ter DUAS colunas na segunda tabela.
Temos dois tipo de Union, o UNION Simples e o UNION All, o SIMPLES se eu tiver registros iguais tanto na primeira quanto na segunda TABELA, será feito como se fosse um DISTINCT e será UNIDO então.
Já o UNION ALL não, neste ele irá repitir os dados,  conforme exemplo acima, no UNION SIMPLES o HOBBY Praia aparce uma única vez já no UNION ALL ele irá trazer as DUAS vezes.

Quando eu quero listar todos os registros, listando os repetidos, qual UNION eu devo usar?
UNION ALL
Alternativa correta! Esta irá mostrar todos repetindo os valores.

SELECT DISTINCT
    bairro
FROM
    tabela_de_clientes
UNION
SELECT DISTINCT
    bairro
FROM
    tabela_de_vendedores;

É importante que sempre que usarmos o UNION SIMPLES ou UNION ALL, iidentifique o CAMPO que estamos consultando, para melhor diferenciar.
Neste caso abaixo irá trazer somente o Bairro Cliente, pois ele considera a primeira consulta como guia, a segunda consulta ele despresa o ALIAS se houver,
e irá fazer o unico teste de verificar se os CAMPOS são os mesmo.

SELECT DISTINCT
    bairro as BAIRRO_CLIENTE
FROM
    tabela_de_clientes
UNION ALL
SELECT DISTINCT
    bairro as BAIRRO_VENDEDOR
FROM
    tabela_de_vendedores;

Forçando ERRO, no primeiro UNION temos DOIS campos já no segundo temos apenas UM campo.

SELECT DISTINCT
    BAIRRO as BAIRRO,
    'CLIENTE' as TIPO
FROM
    tabela_de_clientes
UNION ALL
SELECT DISTINCT
    BAIRRO as BAIRRO
FROM
    tabela_de_vendedores;

Agora como o UNION tem os TIPOS 'cliente' e 'vendedor' o resultado irá trazer duas vezes os Bairros, por mais que seja uilizado UNION SIMPLES ou UNION ALL.

SELECT DISTINCT
    bairro     AS bairro,
    'CLIENTE'  AS tipo
FROM
    tabela_de_clientes
UNION ALL
SELECT DISTINCT
    bairro      AS bairro,
    'VENDEDOR'  AS tipo
FROM
    tabela_de_vendedores;

Query:
BAIRRO              TIPO
Bras            	  CLIENTE
Piedade            	CLIENTE
Santo Amaro	        CLIENTE
Cidade Nova	        CLIENTE
Humaita            	CLIENTE
Agua Santa	        CLIENTE
Inhauma            	CLIENTE
Tijuca            	CLIENTE
Barra da Tijuca	    CLIENTE
Jardins            	CLIENTE
Lapa            	  CLIENTE
Tijuca            	VENDEDOR
Jardins            	VENDEDOR
Copacabana	        VENDEDOR
Santo Amaro	        VENDEDOR


Quando eu quero listar todos os registros, listando os repetidos, qual UNION eu devo usar?
UNION ALL
Alternativa correta! Esta irá mostrar todos repetindo os valores.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ SUB CONSULTAS

[00:00] Veja o seguinte exemplo. Eu tenho aqui duas tabelas. Uma tabela que tem um campo X e um campo Y. O campo X são letras e o campo Y são números. E eu tenho uma tabela Y que tem dois números. Número 1 e número 2. Digamos o seguinte, eu quero selecionar todo mundo na tabela da esquerda, cujo valor de Y seja o que está na tabela da direita. Até agora, nós faríamos um SELECT na tabela onde só tem o número 1 e o número 2. Eu veria que valores eu tenho, o 1 e 2.
[00:42] Eu monto esse select aqui. SELECT X, Y FROM TAB1 WHERE Y IN (1,2). E a minha seleção seria essa. Mas vamos supor que, por algum motivo, alguém inclua mais uma linha na tabela de condição. Ou seja, o número 3. Vou e coloco o número 3 e eu tenho a minha resposta. Mas note que eu tenho que ficar checando toda hora a tabela Y para saber qual é o critério de condições que eu uso no meu SELECT. Será que eu não posso fazer uma coisa mais dinâmica? Posso.
[01:28] Eu posso fazer isso daqui. No IN, ao invés de eu colocar as opções, eu coloco outro SELECT. Como esse SELECT está pegando só um campo, o resultado desse SELECT será um conjunto de valores. E o SQL entende automaticamente que esse conjunto de valores vai fazer parte do IN. Então, não importa se na tabela Y eu tenho só 1; 1 e 2; 1, 2, 3 e 4. Não importa. Sempre quando eu vou dar o SELECT do lado, ele vai usar como critério registros que existem na tabela Y.
[02:18] Ele vai fazer corretamente, sem eu precisar ter que ficar editando essa consulta e colocando de forma constante as opções que devem estar dentro do conjunto de Ys usados no WHERE. Também posso usar a minha subquery para fazer filtros como se fosse substituindo o que nós usamos no HAVING.
[02:51] Eu faço uma consulta usando o SUM, eu tenho esse resultado. Depois, eu só quero ver todo mundo que é igual a 3. Eu posso fazer isso daqui. Dentro da minha consulta eu tenho outra consulta que está entre parênteses. E ela funciona como se fosse uma tabela. Eu vou usar aqui o FROM esse SELECT todo aqui. O importante é que eu dê uma referência para esse critério. E eu coloco o critério que eu vou usar. Isso é outra forma de usar subquery.
[03:40] “Não entendi direito, não, Vitorino. Ficou meio confuso.” Vamos no SQL Developer e vamos fazer na prática esses dois exemplos com mais cuidado para nós entendermos como é que funciona a coisa. Eu vou abrir uma seleção nova. Vamos fazer isso aqui primeiro. “SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES”.
[04:36] Um parênteses. Eu tinha feito isso aqui, eu não tinha sacado que eu tinha errado o FROM. Note que quando ele escreveu a TABELA_DE_VENDEDORES com essa linha meio rosinha sublinhando o nome da tabela, isso me dá uma suspeita de que tem alguma coisa errada na minha consulta. Isso que fez eu dar uma observada e vi que aqui era pra ser FROM.
[05:05] Voltando. Eu tenho esses 4 bairros. Eu quero agora selecionar todos os clientes que têm como bairros, bairros dos vendedores. Eu poderia estar fazendo isso aqui “SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO IN (‘Tijuca’, ‘Santo Amaro’, ‘Jardins’, ‘Copacabana’)”. E eu tenho meu resultado como eu espero. Só os clientes que possuem bairros que têm como sede bairros onde existem vendedores sediados também. Mas eu tive que olhar essa tabela, ver o resultado dela aqui embaixo e escrito na mão o resultado.
[06:19] Será que não teria uma forma mais automática? Teria. Basta eu colocar isso daqui. “SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO 'IN('. E dentro dos parênteses eu coloco este SELECT aqui. O resultado aqui vai ser mesmo.
[06:53] Com a vantagem que se amanhã eu inserir um novo vendedor dentro da tabela, se eu estiver fazendo SELECT, eu vou ter que vir aqui e escrever o novo bairro do vendedor para resolver o problema. Já usando este SELECT aqui embaixo, eu não preciso nem me preocupar. Basta aparecer um vendedor novo que esse SELECT continua valendo. Muito mais eficiente.
[07:25] Outro uso da a subconsulta é o seguinte. Vamos lembrar da consulta aqui. “SELECT EMBALAGEM MAX(PRECO_DE_LISTA) AS MAIOR_PRECO”. E eu vou botar aqui “SELECT EMBALAGEM, SUM(DE PRECO_DE_LISTA) AS SOMA_PRECO FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM HAVING 'SUM(PRECO_DE_LISTA <= 80;'. Ele me trouxe as embalagens cuja soma dos preços é menor do que 80.
[08:55] Eu poderia fazer isso da seguinte maneira. Eu primeiro vou construir essa consulta aqui. Eu tenho a lista de todos os preços por embalagem. Agora, eu quero aplicar um filtro sobre esta consulta. Eu vou fazer isso daqui. Essa consulta vou botar entre parênteses e vou chamar ela de “Z”. Eu faço isso daqui “SELECT Z.EMBALAGEM”. Por que “Z.EMBALAGEM”? Porque como esse cara aqui é Z, ele tem esse campo aqui, embalagem, e tem esse campo aqui. Aqui, sim é o alias que é importante, SOMA_PRECO.
[09:48] Eu vou selecionar, dessa tabela que virou Z, o campo Z.EMBALAGEM e o “Z.SOMA_PRECO FROM” esse cara todo. E depois que eu faço isso, eu coloco “WHERE Z.SOMA_PRECO <= 80”. Ou seja, estou aplicando esse filtro sobre essa tabela, que na verdade não é uma tabela, é uma consulta.
[10:48] Esse SELECT aqui de cima olha esse cara do meio como se fosse uma tabela. Só que eu chamei ela de Z e eu posso aplicar o filtro, ou seja, essa consulta é igualzinha à que é usada pelo HAVING ali em cima. Vou executar, o mesmo resultado que eu teria aqui. Aqui eu tenho esse resultado, aqui eu teria o mesmo resultado. Só que aqui embaixo eu usei subconsulta para fazer isso. Era isso eu queria explicar para vocês.

Tendo em vista a seguinte consulta:

SELECT
    cpf,
    COUNT(*)
FROM
    notas_fiscais
WHERE
    to_char(data_venda, 'YYYY') = '2016'
GROUP BY
    cpf
HAVING
    COUNT(*) > 2000;

query:
CPF         COUNT
3623344710	2012
50534475787	2037
492472718	  2008

Qual seria a consulta, usando subconsulta, que seria equivalente à consulta acima?
A consulta seria a seguinte:

SELECT
    x.cpf,
    x.contador
FROM
    (
        SELECT
            cpf,
            COUNT(*) AS contador
        FROM
            notas_fiscais
        WHERE
            to_char(data_venda, 'YYYY') = 2016
        GROUP BY
            cpf
    ) x
WHERE
    x.contador > 2000
;

Query:
CPF         CONTADOR
3623344710	2012
50534475787	2037
492472718	2008


SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    bairro IN ( 'Tijuca', 'Santo Amaro', 'Jardins', 'Copacabana' );

SELECT
    *
FROM
    tabela_de_clientes
WHERE
    bairro IN (
        SELECT DISTINCT
            bairro
        FROM
            tabela_de_vendedores
    )
;


SELECT
    embalagem,
    SUM(preco_de_lista) AS soma_preco
FROM
    tabela_de_produtos
GROUP BY
    embalagem
HAVING
    SUM(preco_de_lista) <= 80
;

Query:
embalagem    soma_preco
Lata	     19,9935
Garrafa      76,9335


SELECT
    z.embalagem,
    z.soma_preco
FROM
    (
        SELECT
            embalagem,
            SUM(preco_de_lista) AS soma_preco
        FROM
            tabela_de_produtos
        GROUP BY
            embalagem
    ) z
WHERE
    z.soma_preco <= 80
;

Query:
embalagem  soma_preco
Lata	     19,9935
Garrafa	   76,9335

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- USANDO VIEW

[00:00] Agora, vamos falar de uma coisa chamada view. View é uma tabela lógica que tem por detrás dela um comando SQL, um SELECT. É assim, eu pego um SELECT, ele pode ser um SELECT simples ou um SELECT super complicado, e eu crio uma view, cujo conteúdo dela é esse SELECT. E eu consigo tratar essa view como se fosse uma tabela. Posso fazer SELECT só de alguns campos, fazer JOIN com outras tabelas, colocar aliás, GROUP BY, ORDER BY. Tudo que eu faço com uma tabela, eu acabo fazendo com uma view.
[00:46] Só que essa view, na verdade, tem outro SELECT por dentro. Nós tivemos esse exemplo aqui, onde eu tinha uma tabela, eu faço esse SELECT para ter a tabela grupada, que depois eu aplicava um filtro. Eu posso pegar esse SELECT que está aqui e transformar ele numa view. Eu dou esse nome, VW_VIEW.
[01:21] Boa prática. Normalmente, nós colocamos a letra VW_ na frente do nome de uma view. Mas isso é só boas práticas. Dentro do Oracle, você pode criar a view com qualquer nome que você queira. E depois, eu posso pegar e fazer um SELECT * FROM VIEW. Posso pegar uma tabela 3 e fazer um JOIN, por exemplo. Aqui eu estou fazendo um JOIN entre a view e uma tabela 3 normalmente. Porque eu vou ter o meu resultado. Ou seja, passo a tratar a view como se fosse uma tabela qualquer.
[02:12] E ao fazer o JOIN, ele vai juntar as coisas, vai pegar da view e fazer todas as ligações da mesma maneira que essa query está executando isso. Nós vimos que a view é uma tabela lógica. Que por detrás dela, tem outro SQL e eu posso tratar ela do jeito que eu quiser, como se fosse uma tabela normal. Vamos ver na prática isso no SQL Developer. Eu vou pegar esse mesmo que nós fizemos no vídeo anterior, que nós chegamos a fazer essa consulta aqui.
[02:59] Eu vou copiar ela. Eu vou criar aqui um novo editor e eu vou colar ela. Vocês lembram que nós fizemos uma subconsulta nessa consulta aqui. Essa consulta aqui, eu vou pegar ela aqui sozinha, ela está aqui. Vamos rodar ela? Tem lá lata, pet, garrafa e a soma dos preços. Eu vou fazer o seguinte. Eu tenho um negócio chamado views. Tem já algumas views criadas, mas são views de sistema. Eu vou dar botão direito do mouse e selecionar opção Nova View.
[03:45] Eu vou ter isso aqui. Eu vou pegar essa consulta aqui e vou dar um “Ctrl + C”. Eu vou vir aqui e vou colar a consulta. E vou chamar essa view de “VW_EMBALAGENS”. Vou dar ok. Note que eu tenho aqui a minha view criada. Eu posso vir aqui e fazer isso daqui “SELECT * FROM VW_EMBALAGENS”. Tenho a minha resposta. Posso colocar aqui WHERE SOMA_PRECO <= 80.
[05:02] Posso pegar, por exemplo, eu tenho aqui as embalagens “SELECT * FROM TABELA_DE_PRODUTOS”. Aqui em tabela de produtos, eu tenho o campo embalagem também. Vou fazer aqui “A INNER JOIN VW_EMBALAGENS B ON A.EMBALAGEM = B.EMBALAGEM”.
[05:38] Ou seja, eu estou fazendo um JOIN entre a view e uma tabela por esse campo. O campo B.EMBALAGEM está aqui defina na view, essa aqui foi a consulta que eu usei para definir a view. E o outro, o A.EMBALAGENS, vem da TABELA_DE_PRODUTO. Se eu vier aqui, eu consigo fazer um JOIN, porque eu tenho os valores da soma dos preços aqui todos associados a essa tabela final.
[06:13] A view acaba substituindo a subquery, que acaba substituindo inclusive o HAVING. Eu consigo, por aqui, resolver o problema, que antes eu tinha resolvido pelo HAVING, depois eu fiz por subconsulta e agora por view. Era isso que eu queria mostrar para vocês

Sobre as características da visão, selecione as alternativas verdadeiras:
Podemos criar uma view de qualquer comando SQL
Podemos sim criar uma view de qualquer comando SQL.
Podemos criar uma view usando comandos ou um assistente do Workbench
Podemos sim criar uma view usando comandos ou um assistente do Workbench.

CREATE VIEW vw_embalagem AS
    SELECT
        embalagem,
        SUM(preco_de_lista) AS soma_preco
    FROM
        tabela_de_produtos
    GROUP BY
        embalagem
;

SELECT
    *
FROM
    vw_embalagem
;

Query:
embalagem  soma_preco
Lata	   19,9935
PET	       249,6425
Garrafa	   76,9335


SELECT
    *
FROM
    vw_embalagem
WHERE
    soma_preco <= 80
;

Query:
embalagem  soma_preco
Lata	   19,9935
Garrafa	   76,9335


SELECT
    produtos.tamanho,
    v_emba.embalagem,
    v_emba.soma_preco
FROM
    tabela_de_produtos produtos
INNER JOIN
    vw_embalagem v_emba
ON produtos.embalagem = v_emba.embalagem;

SELECT
    "A1"."CODIGO_DO_PRODUTO"    "CODIGO_DO_PRODUTO",
    "A1"."NOME_DO_PRODUTO"      "NOME_DO_PRODUTO",
    "A1"."EMBALAGEM"            "EMBALAGEM",
    "A1"."TAMANHO"              "TAMANHO",
    "A1"."SABOR"                "SABOR",
    "A1"."PRECO_DE_LISTA"       "PRECO_DE_LISTA"
FROM
    "SYSTEM"."TABELA_DE_PRODUTOS" "A1"
INNER JOIN
    "SYSTEM"."VW_EMBALAGEM" "VEMB"
ON
    "A1"."EMBALAGEM" = "VEMB"."EMBALAGEM"
;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- CONSOLIDANDO SEU CONHECIMENTO

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.

1) Veja o conteúdo das tabelas TABELA_DE_VENDEDORES e NOTAS_FISCAIS, digitando os comandos abaixo:

SELECT * FROM TABELA_DE_VENDEDORES;
SELECT * FROM NOTAS_FISCAIS;

2) Você pode conectar essas duas tabelas pelo campo em comum, que é MATRICULA. Digite:

SELECT A.MATRICULA, B.NOME, COUNT(*) FROM NOTAS_FISCAIS A
INNER JOIN TABELA_DE_VENDEDORES B
ON A.MATRICULA = B.MATRICULA
GROUP BY A.MATRICULA, B.NOME

3) Nem sempre todas as linhas podem ser conectadas. Existem outros tipos de JOIN que permite identificar quem não pode ser conectado. Veja a consulta abaixo, que mostra que há 15 clientes:

SELECT COUNT(*) FROM TABELA_DE_CLIENTES;

4) Verifique quantos clientes realizaram compras na empresa de suco de frutas:

SELECT CPF, COUNT(*) FROM NOTAS_FISCAIS GROUP BY CPF;

Se você contar verá que, na consulta acima, há 14 linhas. Existe um cliente que está no cadastro mas não teve nota fiscal emitida.

5) Você pode usar o LEFT JOIN. Por exemplo:

SELECT DISTINCT A.CPF AS CPF_DO_CADASTRO, A.NOME, B.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES A LEFT JOIN NOTAS_FISCAIS B
ON A.CPF = B.CPF
WHERE B.CPF IS NULL;

O cliente que possui o CPF vindo da tabela de notas com o valor nulo é o cliente que nunca emitiu nota fiscal.

6) Há outros tipos de JOIN:

SELECT TABELA_DE_VENDEDORES.NOME AS NOME_VENDEDOR,
TABELA_DE_VENDEDORES.BAIRRO AS BAIRRO_VENDEDOR,
TABELA_DE_CLIENTES.NOME AS NOME_CLIENTE,
TABELA_DE_CLIENTES.BAIRRO AS BAIRRO_CLIENTE
FROM TABELA_DE_VENDEDORES
FULL JOIN TABELA_DE_CLIENTES
ON TABELA_DE_VENDEDORES.BAIRRO = TABELA_DE_CLIENTES.BAIRRO;

7) Você pode juntar duas ou mais consultas, desde que os campos selecionados sejam os mesmos. Por exemplo:

SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

8) O UNION ALL não faz a seleção com um DISTINCT. As linhas se repetem se existirem em ambas as tabelas. Por exemplo:

SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

Veja que Santo Amaro aparece duas vezes. Uma vindo da tabela de clientes e outra da tabela de produtos.

9) As subconsultas permitem que seleções possam ser feitas usando como critérios outras seleções. Por exemplo:

SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO
IN (SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES);

10) Ou aplicar uma consulta, em vez de ser sobre uma tabela, sobre outra consulta. Por exemplo:

SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM (
    SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
    GROUP BY EMBALAGEM
) X
WHERE X.PRECO_MAXIMO >= 10;

11) Você pode transformar uma consulta em uma visão (view), que depois pode ser usada em outras consultas, como uma tabela. Crie a visão. Para isso expanda, na árvore do canto esquerdo, onde temos a aba Views e escolha Nova View:
12) Digite as informações conforme a imagem abaixo:
13) Você pode manipular a visão como uma tabela. Por exemplo:

SELECT * FROM VW_EMBALAGENS WHERE SOMA_PRECO <= 80;

14) Logo, a consulta:
SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM (
    SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO
    FROM TABELA_DE_PRODUTOS
    GROUP BY EMBALAGEM
) X
WHERE X.PRECO_MAXIMO >= 10;

Pode ser substituída por:

SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM
VW_EMBALAGENS X WHERE X.PRECO_MAXIMO >= 10;

Nesta aula, aprendemos:

Como conectar duas ou mais tabelas através de JOINs
Os tipos de JOIN existentes e quais são suportados pelo Oracle
Os comandos UNION e UNION ALL para juntar duas ou mais seleções, desde que tenham os mesmos campos selecionados
A usar uma consulta como critério de filtro de uma outra consulta
Como usar uma consulta dentro de outra consulta
A criar e usar visões

-------------------------------------------------------------------------------------------------------------------------------------------------------------------- FUNCÕES DE STRING

[00:00] Nós vamos falar agora de funções. O que é isso, funções? Quando eu faço um select, eu pego o conteúdo de um campo e exibo no meu resultado. Eu posso, ao buscar este campo, aplicar uma função para que eu veja no resultado não o campo, mas o resultado dessa função, usando como parâmetro este campo. Nós usamos durante algumas consultas desse treinamento algumas funções, mas vamos agora rever as funções.
[00:42] Claro, eu não vou estar apresentando todas, porque são muitas funções que o Oracle possui. Eu vou falar das principais. E eu vou ser sincero com vocês, às vezes, quando eu quero usar uma função específica, ainda consulto documentação, ou manual, ou internet, para buscar a melhor função para aquilo que eu quero usar.
[01:05] E nós vamos separar as funções em tipos. E eu vou começar falando das funções que nós aplicamos sobre campos do tipo varchar, ou seja, campos texto. A primeira função é o LOWER. O LOWER pega o valor do campo e coloca tudo em letra minúscula. Se eu tenho um texto que tem uma ou mais caracteres com a letra maiúscula, ao aplicar o LOWER, eu vou ver tudo em minúsculo.
[01:40] Já o UPPER faz o inverso do LOWER. Se eu aplico o UPPER sobre um campo texto, eu vou ver tudo em letra maiúscula. O INITCAP pega sempre a primeira letra de cada palavra do campo e coloca em maiúsculo.
[02:03] O INITCAP é muito legal se você tem um campo com nomes próprios e quer arrumar esses nomes. Nós aplicamos o LOWER para deixar tudo em minúsculo. Não interessa de que maneira foi cadastrado o nome, fica tudo em minúsculo. Depois, eu aplico o INITCAP, onde a primeira letra de cada nome fica em maiúscula, eu acabo arrumando os nomes próprios que estão numa base de dados.
[01:49] O CONCAT concatena dois textos. Eu até citei a função CONCAT, mas nós temos uma maneira melhor de concatenar strings. Inclusive, nós podemos usar essa outra maneira para concatenar não somente dois strings, mas muitos strings, que é usar o pipe, pipe. Para quem não sabe, o pipe é aquela linha vertical que tem aqui no teclado. Dependendo do teclado, ela fica em um lugar específico. Nós vamos fazer exemplos práticos e eu vou mostrar a vocês como é que nós usamos o pipe, pipe para concatenar textos.
[01:49] O LPAD preenche a esquerda do texto com algum tipo de caractere. Digamos que eu esteja emitindo um relatório e eu sei, por exemplo, que determinado campo tem que ocupar 50 posições. Mas eu não sei, de antemão, quantas posições vão retornar do banco. Eu posso colocar um LPAD de vazios, por exemplo, para que se retornar um texto com 10 caracteres, ele vai colocar na frente mais 40 caracteres vazios, de tal maneira que eu tenha como resultado final 50.
[04:21] Se voltar 15, ele vai botar 35. Se voltar 20, ele vai botar 30. Ou seja, com o LPAD, eu garanto que o meu resultado final vai ter sempre o mesmo tamanho. E eu não preciso preencher somente com vazios, eu posso colocar um carácter específico para fazer esse tipo de preenchimento.
[04:33] O RPAD faz o inverso do LPAD. Em vez de preencher esses vazios ou esses caracteres para completar o tamanho do campo à esquerda, eu faço isso à direita. O SUBSTR é uma função muito usada. Nós conseguimos extrair parte do texto dentro da própria cadeia. Nós passamos basicamente o string que nós queremos trabalhar, a posição onde eu vou começar a extrair o string e o número de caracteres a serem contados a partir daquela posição. Nós vamos fazer alguns exemplos disso para entender melhor esse conceito.
[05:09] O INSTR vai buscar, dentro do string, algum caractere. E quando ele acha, ele devolve a posição onde aqueles string começa. O INSTR vai voltar 0 se eu não acho aquele caractere dentro do string, ou a posição onde ele se encontra dentro do string. Que pode ser 1, 2, 3 e assim por diante. Mas com certeza será um valor maior do que 0, porque se ele achou o caracter dentro do string, o valor que vai retornar vai ser um valor maior que 0.
[06:08] O LTRIM tira espaços à esquerda. Às vezes eu tenho alguns strings que tem um espaço em branco à esquerda, eu tiro esses espaços. Já o RTRIM tira espaços à direita. Quando eu aplico o LTRIM e o RTRIM sobre texto, eu garanto que espaços à esquerda e espaços à direita são removidos, e o meu resultado é o string correto, sem vazios nas bordas desse string.
[06:44] O LENGTH me devolve o número de caracteres que o string possui. Isso pode ser importante para algum tipo de trabalho. O TRANSLATE substitui algum tipo de caractere em outro caractere. Ele vai, por exemplo, substituir dentro de um string tudo que é letra A por letra X. Tudo que é letra P para Y. Eu passo esses parâmetros para a função TRANSLATE.
[07:29] A função REPLACE faz uma coisa parecida com o TRANSLATE, só que eu não vou trabalhar caractere com caractere, mas string para string. Eu posso pegar determinada cadeia de strings de textos, e onde eu acho elas dentro do campo, eu substituo por outras.
[07:45] Vimos algumas funções texto. Vamos fazer na prática alguns exemplos para fixar e entender melhor como essas funções funcionam. Eu vou entrar aqui no SQL Developer e vou criar aqui uma área de string.
[08:10] Eu tenho aqui “SELECT NOME FROM TABELA_DE_CLIENTES”. Eu vou ter o nome dos meus clientes. Agora, se eu aplico sobre o nome a função UPPER, eu vou fazer o seguinte, eu vou escrever aqui do lado o nome original e depois eu vou aplicar um UPPER sobre o nome. Note que aqui o texto veio normal, mas o texto final veio todo com letras maiúsculas, porque eu apliquei o UPPER. Nós podemos também aplicar o LOWER. O LOWER vai trazer tudo em minúsculo. A letra E, que era maiúscula, ficou minúscula. A letra C ficou minúscula.
[09:16] O INITCAP vai pegar sempre a primeira letra e colocar maiúscula. Eu vou pegar, por exemplo, “SELECT NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS”. Só que eu vou aplicar, sobre o nome do produto, o INITCAP. É claro que o meu texto já traz a maioria das letras começando com maiúscula, mas olha esse exemplo aqui. 350 ml. O m do ml, é minúsculo. Mas quando eu apliquei o INITCAP, ele colocou maiúsculo. Todo início de palavra, ele coloca maiúsculo a letra que vai estar minúsculo.
[10:24] Lembra que eu falei para vocês do CONCAT, que eu quero concatenar 2 strings. Se eu pegar aqui, por exemplo, “SELECT CONCAT(ENDERECO_1, BAIRRO) FROM TABELA_DE_CLIENTES;”, eu vou ter o endereço e o bairro juntos. Mas não fica muito legal isso. Às vezes eu quero, por exemplo, ter um texto onde eu tenho o endereço completo.
[10:58] Então, eu posso usar o pipe, pipe. Eu posso fazer isso daqui “SELECT NOME, ‘Endereço: ‘ || ENDERECO_1 || ‘ ’ BAIRRO ‘ ’ || CIDADE ‘ ’ || ‘ ’ || ESTADO || ‘, CEP: ’ || CEP FROM TABELA_DE_CLIENTES”. Esse aqui é um string, outro string. E eu fui concatenando eles usando o pipe, pipe aqui para juntá-los. Olha como é que ficou o resultado. Eu tenho o cliente e o endereço dele. Num formato um pouco mais agradável para mostrar isso no resultado da minha consulta.
[12:53] O LPAD, “SELECT NOME_DO_PRODUTO LPAD(NOME_DO_PRODUTO, 60 ‘*’) FROM TABELA_DE_PRODUTOS;”. Eu coloquei o número de caracteres asteriscos na frente dependendo do tamanho. Eu sei que esse total aqui, se eu contar o número de caracteres, vão ter 60 caracteres. O número de asteriscos que ele preencheu na frente, vai depender desse tamanho aqui. É a diferença entre o tamanho do campo e 60. Claro que se eu executar não o LPAD, mas o RPAD, eu vou preencher os asteriscos não na frente, mas atrás.
[14:19] O SUBSTRING, por exemplo, “SELECT NOME_DO_PRODUTO, SUBSTR(NOME_DO_PRODUTO,3,5) FROM TABELA_DE_PRODUTOS;”. Eu peguei, do terceiro caractere, os próximos 5. Por exemplo, o terceiro caractere aqui é o B. Depois, eu peguei os próximos 5 contando o B. 1, 2, 3, o branco 4 e D, 5. O resultado desse cara aqui, para o primeiro campo, foi bor d. Linha Citrus, a partir do terceiro caractere, eu peguei mais 5. Deu nha C.
[15:57] O INSTR. Eu vou pegar aqui “SELECT NOME_DO_PRODUTO INSTR(NOME_DO_PRODUTO, ‘-‘) FROM TABELA_DE_PRODUTOS;”. Nessa primeira linha deu 19, porque o traço está aqui. Quantos caracteres têm aqui? Se nós contarmos, na posição 19, eu tenho o traço. Aqui, deu 14, porque o traço está aqui. Se eu contar o número de caracteres que eu tenho aqui, vão dar 13 e o traço começa no 14º caractere. Aqui, eu tenho as posições onde começa o traço.
[17:12] O LTRIM e o RTRIM, de tirar brancos. SELECT LTRIM (‘ AAA’) FROM DUAL;”. Parênteses, o que é esse DUAL? Quando nós fazemos um SELECT DUAL, eu estou dizendo que eu estou fazendo um SELECT neutro. Eu estou fazendo um SELECT para nenhuma tabela. Ele vai simplesmente resolver esse cara e pronto.
[17:45] É claro que aqui dentro eu não posso colocar o nome de um campo, principalmente porque não existe uma tabela. O DUAL é como se eu estivesse dando FROM de uma tabela que não existe. E eu posso aplicar somente a função. Por exemplo aqui, se eu rodar, note que eu vou ter como resultado o AAA sem espaços em branco na frente.
[18:12] O RTRIM vai fazer a mesma coisa, apesar de que nós não vamos conseguir ver aqui o resultado final. Mas vocês confirmem, eu tenho vários espaços. Quando eu rodar o RTRIM, aqui não existe espaço, aqui é nulo. Atenção, isso é muito importante. Espaço e nulo são coisas diferentes.
[18:46] Eu tenho o REPLACE. Eu posso, por exemplo, “SELECT NOME_DO_PRODUTO FROM TABELA_DE_PRODUTOS;”. Onde eu tenho litros, eu quero mudar L. Digamos que eu não quero representar litros com a palavra litros, eu quero representar a letra L. Eu posso chegar aqui e fazer isso daqui “REPLACE(NOME_DO_PRODUTO, ‘Litro’, ‘L’) FROM TABELA_DE_PRODUTOS;”.
[20:10] É assim que eu uso o replace. Quem eu estou buscando e o que eu vou usar como substituição. Se nós rodarmos isso daqui, note que aqui do lado, onde eu tenho litro, ele botou L. Eu posso fazer isso daqui, REPLACE de REPLACE. E depois aqui, onde eu tenho Ls, eu substituo para L. Eu estou usando uma função como parâmetro para outra função. O litro, ele botou L. E litros, ele também colocou L. Eu apliquei aqui um REPLACE dentro de um REPLACE.
[21:21] Nós podemos, inclusive, usar funções como parâmetro de outras funções. E juntado essas funções, nós conseguimos fazer uma boa manipulação do dado e transformando esse dado para exibir ele na saída do SQL, de maneira que o meu usuário, por exemplo, especificou para nós, para que nós pudéssemos fazer isso na base de dados. É isso que eu queria falar sobre funções aplicadas a string.

SELECT
    nome,
    upper(nome)
FROM
    tabela_de_clientes
;

SELECT
    nome,
    lower(nome)
FROM
    tabela_de_clientes
;

SELECT
    nome_do_produto,
    initcap(nome_do_produto)
FROM
    tabela_de_produtos;

SELECT
    concat(endereco_1, bairro)
FROM
    tabela_de_clientes
;


SELECT
    nome,
    'Endereco: '
    || endereco_1
    || ' '
    || bairro
    || ' '
    || cidade
    || ' '
    || estado
    || ', CEP: '
    || cep
FROM
    tabela_de_clientes;

NOME            CONCAT com pipe ||
Erica Carvalho	Endereco: R. Iriquitia Jardins Sao Paulo SP, CEP: 80012212
Fernando Cavalc	Endereco: R. Dois de Fevereiro Agua Santa Rio de Janeiro RJ, CEP: 22000000
Cesar Teixeira	Endereco: Rua Conde de Bonfim Tijuca Rio de Janeiro RJ, CEP: 22020001
Marcos Nogueira	Endereco: Av. Pastor Martin Luther King Junior Inhauma Rio de Janeiro RJ, CEP: 22002012

SELECT
    *
FROM
    (
        SELECT
            nome,
            'Endereco: '
            || endereco_1
            || ' '
            || bairro
            || ' '
            || cidade
            || ' '
            || estado
            || ', CEP: '
            || cep
        FROM
            tabela_de_clientes
    ) z
WHERE
    z.nome LIKE '%Erica%';

Query:
Erica Carvalho	Endereco: R. Iriquitia Jardins Sao Paulo SP, CEP: 80012212


SELECT
    nome_do_produto,
    lpad(nome_do_produto, 60, '*')
FROM
    tabela_de_produtos
;

nome_do_produto                                                      LPAD
Sabor da Montanha - 700 ml - Uva	      ****************************Sabor da Montanha - 700 ml - Uva
Linha Citros - 1 Litro - Lima/Limao	      *************************Linha Citros - 1 Litro - Lima/Limao
Videira do Campo - 700 ml - Cereja/Maca	  *********************Videira do Campo - 700 ml - Cereja/Maca


SELECT
    nome_do_produto,
    SUBSTR(nome_do_produto,3,5)
FROM
    tabela_de_produtos
;

nome_do_produto,                                                   SUBSTR
Sabor da Montanha - 700 ml - Uva	      bor d
Linha Citros - 1 Litro - Lima/Limao	      nha C
Videira do Campo - 700 ml - Cereja/Ma     deira
Videira do Campo - 1,5 Litros - Melancia  deira


SELECT
    nome_do_produto,
    INSTR(nome_do_produto,'-')
FROM
    tabela_de_produtos
;

nome_do_produto                         Posição caractere "-"
Sabor da Montanha - 700 ml - Uva	    19
Linha Citros - 1 Litro - Lima/Limao	    14
Videira do Campo - 700 ml - Cereja/Ma	18


SELECT
    ltrim('               AAAAA')
FROM
    dual
;

LTRIM
AAAAA


SELECT
    nome_do_produto,
    replace(replace(nome_do_produto, 'Litro', 'L'), 'Ls', 'L')
FROM
    tabela_de_produtos
;

nome_do_produto,                        replace/replace
Sabor da Montanha - 700 ml - Uva	    Sabor da Montanha - 700 ml - Uva
Linha Citros - 1 Litro - Lima/Limao	    Linha Citros - 1 L - Lima/Limao
Videira do Campo - 700 ml - Cereja/M	Videira do Campo - 700 ml - Cereja/Maca
Videira do Campo - 1,5 Litros - Melan	Videira do Campo - 1,5 L - Melancia

Faça uma consulta listando o nome do cliente e o endereço completo (com rua, bairro, cidade e estado).
Um exemplo de consulta é a seguinte:
SELECT NOME, ENDERECO_1 || ' ' || BAIRRO || ' ' || CIDADE || ' ' || ESTADO AS COMPLETO
FROM TABELA_DE_CLIENTES

--------------------------------------------------------------------------------------------------------------------------------------------------------------------- FUNÇÕES DE DATAS

[00:00] Agora, eu vou falar das funções de datas, que manipulam datas. Primeiro, vamos entender que o Oracle armazena a data dentro do banco de dados num formato numérico. Nós não sabemos, mas lá dentro ele está colocando número. E esse número tem 7 bytes, onde cada byte armazena o ano, o mês, o dia, a hora, o minuto e o segundo. E esse número é numérico, mas é um número com casas decimais, onde a parte inteira mostra o ano, o mês e dia. E a parte decimal, as horas, minutos e segundos.
[00:47] E aquele número é expresso internamente em dias. Quando nós vemos a data, ele internamente faz a conversão daquele número decimal, que é expresso dias, em datas. E esses dias, ele começa a contar a partir de 1º de janeiro de 4712 antes de cristo. Isso é só uma curiosidade, quando nós manipulamos data, nós não vemos esses números internos. E quando nós olhamos a data, normalmente nós vamos ver essa data com o formato dia, mês e ano com um traço separando o dia o mês e o ano.
[01:32] Dependendo, claro, do internacional que o seu computador Windows está usando. Na verdade, não é o seu computador, é onde está o servidor. Se eu estiver usando o internacional inglês, eu vou ver mês, dia, ano. Se eu estiver usando o internacional, por exemplo, português, eu vou ver dia, mês e ano.
[01:53] E a função TO_CHAR, que nós vamos praticar mais à frente, converte a data em formato data em string, mostrando para você de diversas formas, ano, mês, dia. Hora, minuto, segundo. Dia, mês, ano. Ou só mês e ano. E nós podemos ir especificando a forma com que a data é exibida através da função TO_CHAR.
[02:23] Tem uma função que eu não preciso passar parâmetro, que é a SYSDATE. A SYSDATE me dá a hora do computador, daquele momento que eu estou rodando a consulta. E se eu aplicar o TO_CHAR no SYSDATE, eu consigo ver a hora do computador num formato mais amigável. Hora, minuto, segundo. Dia, mês, ano. E eu posso especificar.
[02:54] Eu posso operar as datas, somar, diminuir, fazendo como se fosse uma operação matemática. Se eu pegar uma data e somar de um número, basicamente eu estou acrescentando dias àquela data. Pego uma data e somo de 10, eu estou pegando aquela data e acrescentando 10 dias. Internamente, a data é armazenada como dia. Se eu pego a data e diminuo de um número, eu estou diminuindo a data. E eu posso também pegar uma data e diminuir de outra data, e eu vou ter o número de dias como resultado.
[03:39] A função MONTHS_BETWEEN eu passo duas datas e ela me dá o número de meses que eu tenho entre essas duas datas. Às vezes, isso é importante. Eu tenho um sistema financeiro e quero calcular o número de meses que faltam para acabar um contrato, coisas desse tipo, eu posso usar o MONTHS_BETWEEN para me dar esse valor.
[03:50] Claro que o resultado pode ser com um monte de casa decimal, porque eu posso pegar duas datas, mas internamente ele tem hora, minuto e segundo. E nem sempre esse valor vai dar um número correto. Por exemplo, se eu pegar uma data e diminuir de SYSDATE, o SYSDATE vai pegar hora, minuto e segundo. Essa casa decimal corresponde a hora, minuto e segundo depois de meia noite na hora que eu fiz o cálculo de meses entre essas duas datas.
[04:45] Já o ADD_MONTHS pega uma data e adiciona N meses. Eu posso pegar aquela data, dar ADD_MONTHS dela de 10, e eu vou adicionar 10 meses à data que eu especifiquei. O NEXT_DAY mostra qual é o meu dia após uma determinada referência. Por exemplo, se eu der NEXT_DAY de uma data e botar, entre aspas, sexta, ele vai pegar qual é a data da próxima sexta-feira a contar da data que eu estou.
[05:39] Ou eu posso colocar um número específico, por exemplo, o número 6, e ele vai me dizer também o mesmo resultado. Eu vou colocar sempre alguém que representa um dia da semana e ele sempre vai me dar a próxima data a contar da data de referência, qual é a próxima data naquele dia da semana que eu especifiquei.
[05:46] O LAST_DAY vai me pegar sempre o último dia do mês da data atual. Eu tenho uma data, dou a função LAST_DAY e ele me dá sempre o último dia daquela data. O TRUNC trunca a data, sendo que ele sempre vai pegar a primeira data do ano onde a data que eu estou truncando existe. Por exemplo, se eu pego uma data do ano de 2019, aplicando o TRUNC eu vou pegar o primeiro dia do ano de 2019.
[06:31] Vai depender, é claro, do tipo de parâmetro que eu colocar aqui. Ele vai pegar o primeiro dia do ano se eu colocar o parâmetro YEAR. Mas se eu pegar o parâmetro MONTH, ele vai pegar o primeiro dia do mês da data que eu estou. Se eu pegar o parâmetro HOUR, ele vai pegar a primeira hora do dia onde eu estou. Vai depender do parâmetro que eu colocar aqui.
[06:52] Já o ROUND faz a mesma coisa que o TRUNC, só que depende do período que eu estou. Vou dar um exemplo. Se eu dou um ROUND de uma data e essa data é maio, como maio ainda está na primeira parte do ano, na hora que eu der o TRUNC, ele vai pegar o primeiro dia do ano que eu estou. Agora, se eu der o ROUND de uma data depois de julho, ou seja, no segundo semestre, o ROUND vai arredondar a data para o primeiro dia do ano seguinte que eu estou.
[07:52] Já o TRUNC, se a data for maio ou se a data agosto, por exemplo, ele sempre vai truncar para o primeiro dia do ano que eu estou. O TRUNC e o ROUND funcionam muito parecido quando nós truncamos ou arredondamos um número. Nós vamos, inclusive, ver no próximo vídeo, na parte de funções numéricas, como é o TRUNC e o ROUND aplicados a números. Aqui, eu estou aplicando a datas. E o princípio sempre é o mesmo.
[08:11] Vamos lá no SQL Developer para fazer alguns exemplos. Vou criar aqui um script novo. Primeiro, eu vou fazer isso aqui “SELECT SYSDATE FROM DUAL”. Relembrando, DUAL é uma tabela nula, SYSDATE vai me dar a data do meu computador. Eu estou gravando esse vídeo no dia 16 de julho de 2019. Então ele me exibiu esse valor aqui. Mas usando o TO_CHAR, eu posso visualizar essa data de maneiras diferentes.
[08:54] Por exemplo, “SELECT TO_CHAR(SYSDATE ‘YYYY/MM/DD’ HH:MM:SS) FROM DUAL;”. Se eu rodar isso daqui, eu tenho mais menos o horário que eu estou gravando esse vídeo. Estou gravando esse vídeo nesse momento, nesse exato momento. Dia 16 do 7 de 2019 às 3:07 da tarde, e com 50 segundos. Eu consegui pegar o SYSDATE, que originalmente eu só consigo ver dia, mês e ano com dois dígitos e eu consigo destrinchar ele e ver mais detalhes sobre a data.
[10:15] É que na verdade o Oracle armazena sempre a data, como eu falei, naquele formato numérico, com a parte inteira sendo ano, mês e dia. E a parte decimal, hora, minuto e segundo. Toda data tem hora, minuto e segundo, mas quando exibo, eu só vejo ela dia/mês/ano. Mas com o TO_CHAR, eu consigo destrinchar mais essa visualização.
[10:46] Eu faço operações matemáticas com a data. “SELECT SYSDATE + 10 FROM DUAL”. Eu estou pegando hoje, que é 16/07/2019 e somando 10 dias. A data é armazenada internamente em dias, então quando eu dou + 10, eu somo de 10 dias. Eu fui para o dia 26/07/ 2019. E também posso diminuir de 10 dias. Eu voltei ao dia 06/07/2019.
[11:41] Eu posso contar o número de meses que existem entre duas datas. Por exemplo, vou botar aqui “SELECT MONTH_BETWEEN(SYSDATE”. Esse cara tem que estar no formato data. Existe uma função que é “TO_DATE”. Nós vamos falar mais sobre essa função lá na frente quando nós virmos o vídeo sobre conversão de dados. O TO_DATE vai converter um string do formato data em uma data. Então, eu pego o TO_DATE, por exemplo, de “‘2019-01-01’”. E eu especifico como é que eu estou representando esse string. “‘YYYY-MM-DD’)) FROM DUAL”.
[12:49] Aqui, eu estou pegando quantos meses existem entre a data de hoje e o primeiro dia do ano de 2019. Se eu rodar, eu tenho isso aqui. Ele deu como resultado 6.50. Estranho, era para dar sete e alguma coisa, na verdade. Enfim, eu não vou questionar o Oracle. O Oracle não tem bug nisso. Algum tipo de conversão ele faz em relação a isso, mas o MONTHS_BETWEEN me dá esse resultado.
[13:32] Eu tenho também o ADD_MONTHS. “SELECT ADD_MONTHS(SYSDATE, 10)”. Eu tenho a minha resposta, maio de 2020. O NEXT_DAY eu posso, por exemplo, saber qual é o qual é o próximo dia da próxima sexta-feira. Vou botar aqui “‘SEXTA’”. Ele deu dia 19 do 07. Eu estou no dia 16 de julho, é uma terça. A sexta-feira está aqui, é dia 19. Bate com o resultado que eu tive aqui.
[14:42] O LAST_DAY. Vamos pegar aqui “SYSDATE FROM DUAL”. Ele pegou o último dia do mês eu estou. Como eu estou no mês 7, o último dia é 31. O TRUNC, eu estou em julho. Julho já está na segunda metade do ano de 2019. Se eu der um “TRUNC(SYSDATE, ‘YEAR’)”. Ele vai me dar como resultado o primeiro dia do ano 2019.
[15:48] Se eu por acaso colocar aqui “MONTH”, eu vou ter o primeiro dia do mês. Agora, eu vou aplicar sobre essa mesma consulta, o ROUND. O ROUND do ano me dá primeiro de janeiro de 2020 quando deu o ROUND, porque como eu estou na segunda metade do ano, ele arredonda para cima.
[16:28] Como é que nós fazemos com o número? Se eu dou um ROUND de um número que é maior do que 3,5, tipo o ROUND de 3,6 dá 4. O ROUND 3,4 dá 3. Vai depender se a casa decimal está antes ou depois da metade, que é o 5. O ROUND sobre a data funciona da mesma maneira.
[16:54] Como o meio do ano é, mais ou menos, o primeiro dia de julho, se eu estiver depois, o ROUND vai arredondar para cima. E quando eu estiver antes, o ROUND vai arredondar para baixo. Se eu agora fizer o ROUND sobre o mês, ele também me deu o mês de primeiro dia de agosto. Porque como eu estou no dia 16, eu já passei a metade do mês.
[17:22] Agora, se eu pegar esse SYSDATE e diminuir de 10 dias, esse dia do dia 16 vai ser dia 6. E quando eu aplicar o ROUND sobre ele, ele já vai pegar o mês 7. Porque eu desloquei a data que eu quero fazer o ROUND para mais próximo do início do mês e o ROUND acabou arredondando para baixo. Essas são as funções que eu queria mostrar a vocês sobre datas.

Crie uma consulta que mostre o nome e a idade atualizada dos clientes.
Um exemplo de consulta é a seguinte:
SELECT
    nome,
    months_between(sysdate, data_de_nascimento) / 12 AS idade
FROM
    tabela_de_clientes
;

SELECT SYSDATE FROM DUAL;
Query Sysdate: 26/04/22

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MM:SS') FROM DUAL;
Query Sysdate: 2022/04/26 10:04:09

SELECT SYSDATE + 10 FROM DUAL;
Query Sysdate: 06/05/22

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('15/08/1996', 'DD/MM/YYYY')) FROM DUAL;
Query saber quantos meses tem entre duas Datas: 308,38469459378733572281959378733572282

SELECT ADD_MONTHS(SYSDATE, 1) FROM DUAL;
Query para somar o mês a uma data qualquer (Sysdate neste exemplo mais 1 mês): 26/05/22

SELECT NEXT_DAY(SYSDATE, 'SEXTA') FROM DUAL;
Query para saber qual sera o dia da semana (neste caso com relação ao Sysdate, quando será a próxima Sexta ?):  29/04/22

SELECT
    last_day(sysdate) "LAST_DAY(SYSDATE)"
FROM
    "SYS"."DUAL" "A1";
Query para saber quando sera o ultimo dia do MÊS: 30/04/22

SELECT
    trunc(sysdate, 'YEAR') "TRUNC(SYSDATE,'YEAR')"
FROM
    "SYS"."DUAL" "A1";
Query para saber qual é o 1º dia do ANO: 01/01/22

SELECT
    trunc(sysdate, 'MONTH') "PRIMEIR_DIA_DO_MES"
FROM
    "SYS"."DUAL" "A1";
Query para saber qual é o 1º dia do MÊS: 01/04/22

SELECT ROUND(SYSDATE + 100, 'YEAR') FROM DUAL;
Query para arredondar 1º dia do ANO, estando o ANO mais da metado o mesmo será: 01/01/23

SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL;
Query para arredondar 1º dia do MÊS, estando o MÊS mais da metado o mesmo será: 01/05/22

------------------------------------------------------------------------------------------------------------------------------------------------------------------ FUNÇÕES MATEMÁTICAS

[00:00] Vamos falar agora das funções matemáticas. Nós vamos começar pelo ROUND. O ROUND, nós já vimos mais ou menos o sentido dele na data. Ou seja, eu tenho um número decimal. Se esse número decimal está abaixo do mesmo número 1.5, por exemplo, eu tenho o número decimal 4.4. Como 4.4 é menor que 4.5, quando eu dou um ROUND, ele vai ser arredondado para 4. Agora, se eu tiver o número 4.6, 4.7, ou seja, acima de 4.5, na hora de arredondar, ele vira 5. Esse é o ROUND.
[00:50] Já o TRUNC, ele trunca sempre para o número inteiro da casa do número decimal. Não importa se é 4.4 ou 4.7, na hora de truncar, eu vou ter o número 4. A mesma coisa que nós mostramos com a data. O CEIL me dá o maior valor inteiro em cima do número decimal. O CEIL é como se fosse um TRUNC para cima. O TRUNC, se eu tenho de 4.1 a 4.9, truncando, ele dá 4.
[01:31] O CEIL é ao contrário, se eu tiver de 4.1 a 4.9, se eu der o CEIL, eu vou ter 5. Ou seja, é como se fosse TRUNC para cima. O FLOOR é um TRUNC para baixo. Ele trunca para baixo. O FLOOR e o TRUNC dão o mesmo resultado.
[01:58] Nós geralmente costumamos usar o FLOOR, porque ele é uma função que aparece muito em outros bancos de dados SQL. É legal usar o FLOOR em vez do TRUNC, porque se um dia você precisar converter as suas consultas SQL, o FLOOR vai funcionar não somente em Oracle, mas vai funcionar também em SQL Server e MySQL. Por exemplo.
[02:19] O POWER pega um número e eleva à potência do parâmetro que eu colocar. Se eu pegar o número 10 e eu colocar aqui no n, 2, vai ser 10 elevado à segunda potência. Ou seja, 10 ao quadrado. É uma forma de eu fazer uma operação matemática de números à potência. Já o EXP é o exponencial. Existe um número exponencial, que é o 2.7182818. Já não me recordo mais das minhas aulas de matemática, mas eu me lembro que tem o número e, que ele é representado por esse valor aqui.
[03:25] E quando eu coloco o EXP de um número, é sempre esse número E, elevado ao número que eu colocar como parâmetro. Ou seja, se eu botar aqui 10, vai ser o 2.71 elevado a 10. O SQRT é a raiz quadrada. Se eu coloco SQRT e o número, eu vou achar a raiz quadrada dele. O SIGN vai me mostrar o sinal do número. Se é um número negativo, ele me devolve -1. Se é um número positivo, ele me devolve 1. E se é 0, e vai me devolver 0. É para me mostrar o sinal do número.
[04:00] O ABS é o valor absoluto. Ou seja, tanto faz o número ser positivo ou negativo. Se eu der ABS, ele fica positivo. O ABS de 10 é 10, agora o ABS de -10 é 10 também. Ele vai estar sempre mostrando o número positivo daquele número. O MOD me dá o resto da divisão. Se eu pegar, por exemplo, o MOD de 10 com 5, ele vai me dar 0, porque se eu pegar o 10 dividido por 5, não tem resto. Agora, se eu pegar 10 dividido por 6, o resto é 4. Então, o MOD(10, 6) vai me dar 4 como resposta.
[04:54] E tem alguma funções matemáticas que eu confesso a vocês, nunca precisei usar. É logaritmo, seno, seno hiperbólico, tangente, tangente hiperbólica, coseno, coseno hiperbólico, ou seja, caso eu precise usar o Oracle para fazer cálculos matemáticos mais complexos, nós temos essas funções matemáticas para estar usando.
[05:16] Vamos no SQL Developer fazer alguns exemplos. “SELECT ROUND(3.4) FROM DUAL;”. 3.4 é menor que 3.5, o ROUND vai me dar 3. Olha o resultado, 3. Agora, se eu der o “ROUND(3.6)”, eu já vou subir o negócio para 4. Eu tenho o ROUND, onde eu posso usar essas duas coisas.
[06:14] O TRUNC, eu vou pegar esses dois SELECT, vou colocar aqui, vou usar o TRUNC tanto em cima quanto embaixo. O TRUNC de cima deu 3. O 3.6 também vai dar 3. E o CEIL, vou escrever aqui. “CEIL”. O 3.4 vai me dar 4. E o 3.6 vai me dar 4 também. O FLOOR(3.4) vai me dar o 3. E o FLOOR(3.6) vai me dar o 3. Quer dizer, o FLOOR e o TRUNC me dão resultados parecidos.
[07:26] O POWER, se eu pegar “SELECT POWER(10, 2) FROM DUAL;” eu vou ter aqui o número 100, porque eu estou pegando 10 x 10. Se eu pegar aqui 10 elevado a 4, vai ser 10 x 10 x 10 x 10, ou seja, 10, 4 vezes. Está lá, deu 10.000. Já o exponencial, estou pegando 2.7 daquele número todo, elevado ele a 10. Tem esse número aqui, 22026 e uns quebrados. Eu estou pegando o número exponencial e multiplicando ele por ele mesmo 10 vezes.
[08:26] A raiz quadrada. “SQRT(10) FROM DUAL;”. Raiz quadrada de 10 é 3.16. Raiz quadrada de 144 é 12. Eu tenho aqui a raiz quadrada. O SIGN, se eu botar -10, deu -1, porque é um número negativo. Se eu der um SIGN de 10, eu tenho 1, é positivo. O valor absoluto, “ABS(-10.000)”. Valor absoluto, se é negativo, vira positivo. Se o número é positivo, continua positivo.
[09:36] E finalmente, o MOD. Se eu pegar o “MOD(10, 6)”, ou seja 10 dividido por 6 qual é o resto? Vou ter como resultado o 4. Nós percorremos um pouquinho as funções matemáticas para que você ficasse mais a par de como elas funcionam.

Na tabela de notas fiscais, temos o valor do imposto. Já na tabela de itens, temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano de 2016, arredondando para o menor inteiro.
Um exemplo de consulta é a seguinte:

SELECT
    to_char(data_venda, 'YYYY'),
    floor(SUM(imposto *(quantidade * preco)))
FROM
         notas_fiscais nf
    INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero
WHERE
    to_char(data_venda, 'YYYY') = 2016
GROUP BY
    to_char(data_venda, 'YYYY')
;

SELECT ROUND(3.5) FROM DUAL;
Query para arredondar valor de 3,50:  4,00

SELECT ROUND(3.4) FROM DUAL;
Query para arredondar valor de 3,40:  3,00

SELECT TRUNC(3.5) FROM DUAL;
Query para truncar o valor de 3,50:  3,00

SELECT TRUNC(3.4) FROM DUAL;
Query para truncar o valor de 3,40:  3,00

SELECT CEIL(3.5) FROM DUAL;
Query para arredondar sempre para cima, valor de 3,50:  4,00

SELECT CEIL(3.4) FROM DUAL;
Query para arredondar sempre para cima, valor de 3,40:  4,00

SELECT FLOOR(3.9) FROM DUAL;
Query para arredondar para valor absoluto, truncar, valor de 3,50:  3,00

SELECT FLOOR(3.8) FROM DUAL;
Query para arredondar para valor absoluto, truncar, valor de 3,40:  3,00

SELECT POWER(10,2) FROM DUAL;
Query para realizar Potencia de 10 ^ 2:  10

SELECT POWER(10,4) FROM DUAL;
Query para realizar Potencia de 10 ^ 4:  1000

SELECT EXP(1) FROM DUAL;
Query para realizar Exponenciação, o valor de 'e' elevado a 1 sendo e= 2,71:  2,71828182845904523536028747135266249776

SELECT SQRT(144) FROM DUAL;
Query para realizar Raiz Quadrada, para o valor 144:  12

SELECT SIGN(-991) FROM DUAL;
Query para devolver o sinal do valor -991:  -1

SELECT SIGN(991) FROM DUAL;
Query para devolver o sinal do valor 991:  1

SELECT ABS(-991) FROM DUAL;
Query para devolver o valor Absoluto, sendo negativo -991:  991

SELECT SIGN(991) FROM DUAL;
Query para devolver o valor Absoluto, sendo positivo 991:  991

SELECT MOD(10, 6) FROM DUAL;
Query para devolver o MOD de 10 divido por 6:  4

SELECT MOD(9, 6) FROM DUAL;
Query para devolver o MOD de 9 divido por 6:  3

------------------------------------------------------------------------------------------------------------------------------------------------------------------- CONVERSÃO DE DADOS

[00:00] Vamos falar agora das funções de conversão. Nós já vimos algumas funções de conversão, já estamos usando elas desde o início desse treinamento. Nós vamos agora assentar a definição delas.
[00:14] A primeira função de conversão é TO_DATE. A TO_DATE pega um string e converte para data. Quando eu tenho um string que eu quero converter para data, é importante que eu coloque a máscara, para que eu diga para o Oracle quem daquele string é ano, quem daquele string é mês, é dia, é hora, minuto e segundo.
[00:36] É importante, porque senão o Oracle não sabe o que vai converter. Eu posso mandar essa data de diversos formatos dentro de uma string, então a máscara é muito importante. Nós costumamos usar a máscara com o Y representando o ano, sempre em quatro dígitos. O M representando o mês e o D representando o dia. E normalmente nós usamos o HH para hora, o MM para minuto e o SS para segundo.
[01:12] O TO_CHAR é o contrário. Eu tenho uma data e eu preciso converter ela para string. E a máscara vai me servir para mostrar o formato com que eu quero exibir a data convertida. Eu posso exibir aquela data com hora, ou só a data, com segundo, com minuto. Também uso a máscara usando o mesmo tipo de máscara que usei no TO_DATE.
[01:47] Aqui eu tenho alguns exemplos de máscaras que eu posso usar no tempo. Por exemplo, se eu usar YY, eu vou ver o ano com dois dígitos. Eu posso colocar aqui, por exemplo Y,YYY, eu vou separar o milhar do ano. Se eu colocar CC, eu vou ver o século. E se eu botar SCC, vou eu vou ter antes de Cristo ou depois de Cristo. O SYEAR vai mostrar o ano por extenso. Se eu botar MONTH, ele vai botar o mês por extenso. Eu tenho várias maneiras de usar a máscara.
[02:37] Aqui tem alguns exemplos e aqui tem outros. Semana, dia. Se eu botar AM, PM, eu vou ver se é período da manhã ou à tarde dentro da hora. E assim por diante. Temos bastantes máscaras aqui que nós podemos depois consultar quando nós quisermos um formato específico da data.
[03:00] O comando EXTRACT extrai da data uma parte dela. Se eu botar o EXTRACT year, eu vou pegar o ano da data. O EXTRACT month, eu vou pegar o mês na data. O week, a semana. O day, o dia. Hour, a hora e assim por diante. Temos os exemplos que estão disponíveis no comando EXTRACT.
[03:28] O TO_NUMBER vai converter um número que é um string, ou seja, é um número que tem o formato varchar num número numérico. Eu também posso usar máscaras para esse número, para saber como é que eu quero exibir ele.
[03:53] Eu posso usar tanto o TO_NUMBER quanto o TO_CHAR. O TO_CHAR, que vem do inglês para caractere, eu posso tanto colocar uma data quanto colocar um número, que eu vou converter ele para um número caractere e eu uso a máscara como está sendo mostrado aqui.
[04:11] O NVL vai converter um valor, caso ele ache nulo. Eu vou botar um valor e o valor de conversão. Por exemplo, digamos que v1 um seja um campo. Se esse campo for nulo, você preenche com v2, senão, você preenche o próprio campo. É assim que funciona o NVL.
[04:43] O GREATEST me dá, entre três números, o maior deles. Se eu botar o GREATEST de 1, 2 e 3, ele vai me trazer como resposta o 3, que é o maior número entre os três parâmetros que estão dentro do GREATEST. Eu posso ter vários paramos, não fico limitado a apenas dois ou três parâmetros.
[05:06] Vamos na prática fazer alguns exemplos de conversão lá no SQL Developer. Vou criar aqui um novo script. “SELECT TO_DATE(‘12/11/2019’, ‘DD/MM/YYYY’) FROM DUAL;”. Ou seja, nessa data aqui, eu estou dizendo que os primeiros dois dígitos são do dia, porque está aqui o DD. Os segundos dígitos são do mês, porque está aqui o MM e os outros quatro dígitos depois da barra são do ano. Se eu rodar esse cara aqui, ele vai me dar a data 12/11/2019.
[06:14] Porém, se eu disser que essa data é assim, “MM/DD/YYYY”, ou seja, ela veio no formato americano, ele vai me trocar. Ele vai me dizer que essa data aqui é 11 de dezembro, apesar que estar representado assim. Porque os primeiros dois dígitos é o mês e ele me mostra esse resultado.
[06:38] O to_char vai fazer o contrário, vai pegar a data e transformar em caractere. “SELECT TO_CHAR(SYSDATE, ‘MM/DD/YYYY HH12:MM:SS AM’) FROM DUAL;”. Essa conversão aqui, eu estou colocando a data em formato inglês. Esse doze significa que a hora vai sempre ser de 0 a 12, uma da tarde não vai ser 13, vai ser 1. Duas da tarde não vai ser 14, vai ser 2. E eu vou ter aqui AM, PM para mudar o período que eu estou, se no período da manhã ou no período da tarde.
[07:39] Se eu rodar esse cara aqui, ele mostra aqui a data no formato americano, a hora atual que eu estou gravando esse vídeo e dizendo que eu estou no período da tarde.
[07:57] Eu posso também fazer isso daqui: ”SELECT EXTRACT(MONTH FROM TO_DATE(‘12/11/2019’, ‘DD/MM/YYYY’)) FROM DUAL;”. Esse cara aqui, o mês é 11, porque eu estou colocando no formato em português. Vamos ver o que ele vai extrair. Ele extraiu como mês, o mês 11.
[08:33] Agora, se eu pegar esse EXTRACT e colocar esse TO_DATE de cima, que converte para o formato americano. Se eu pedir para extrair o mês, ele me traz o 12, porque para esta data, como está no formato americano, o mês não é o novembro é dezembro, é o 12. Eu consigo pelo EXTRACT pegar corretamente a data.
[09:07] O TO_NUMBER eu posso pegar um número aqui. Ele é um caractere, porque ele está entre aspas simples. Claro que se eu rodar isso daqui ele vai me trazer o 10, eu não consigo ver eficiência nessa função. Porém, se eu pegar esse cara e somar de 100, ou seja, eu estou pegando um caractere que está sendo convertido para número e somando de 100. Eu vou ter como resultado o 110.
[09:39] O TO_CHAR, eu posso pegar aqui um número e eu posso colocar uma máscara. Por exemplo, eu estou pegando o 10 e usando essa máscara aqui. Vou botar 5 zeros. O que essa máscara vai fazer? Ela vai preencher com 0 até o número convertido para o caractere ter 5 dígitos.
[10:07] Por exemplo, esse SELECT aqui vai me trazer isso daqui. Eu tenho o 10 que está aqui. Como eu tenho 5 zeros, o 10 tem dois dígitos, ficou faltando 3 e ele preencheu com 3 zeros aqui. Isso é um exemplo de uma máscara quando eu pego um número, converto para string e quero ver ele num formato específico.
[10:37] Um NVL, “SELECT NVL(10,0) FROM DUAL;” aqui eu não vou conseguir mostrar para vocês a eficiência desse comando, porque eu só vou conseguir rodar ele se eu tiver um campo que pode retornar nulo. E eu tenho um exemplo que faz isso. Se eu recuperar aqui, eu tenho essa consulta aqui que nós fizemos.
[11:17] Nós fizemos essa consulta aqui no vídeo onde nós vimos o FULL JOIN. Eu tenho duas tabelas e o FULL JOIN pega tanto quem combina quanto quem só tem na primeira e não tem na segunda e quem tem na segunda e não tem na primeira. E quando ele pega a relação que não combina, ele coloca nulo tanto na esquerda quanto na direita, dependendo de quem está faltando na relação. Eu vou rodar esse select aqui. Note que ele colocou nulo aqui, nulo aqui.
[11:56] Mas digamos que eu não goste do nulo, eu quero que apareça outro texto. Eu vou pegar essa coluna aqui como exemplo, nome do vendedor, e vou fazer o seguinte, eu vou copiar aqui para baixo. O nome do vendedor é esse campo aqui. Que é feito através dessa consulta. Se o nome do vendedor for diferente de nulo, ok. Se for igual a nulo, você escreve isso aqui. “Vendedor Vazio”. Ficou assim, NVL, o campo. Se esse campo for nulo, escreve Vendedor Vazio, se não for nulo, você vai escrever o próprio campo.
[12:48] Vamos ver a consulta como é que ficou? Ele não escreveu nulo. Ele escreveu um string que está me chamando a atenção para dizer que aqui onde estaria nulo, eu estou escrevendo Vendedor Vazio.
[13:13] E só para nós fazermos um exemplo do GREATEST, que eu confesso a vocês que até antes de eu ter preparado esse treinamento, eu nem sabia que existia essa função. Porque ela não tem muito sentido, mas eu posso pegar aqui o 15. Eu vou pegar aqui o maior entre esses três números, é o 20.
[13:42] Na verdade, ela tem um certo sentido, sim. Eu posso fazer isso daqui: “SELECT * FROM TABELA_DE_CLIENTES”. Quando fizer um SELECT aqui, note que eu tenho aqui dois valores. O limite_de_credito e o volume_de_compra. São valores que não se comparam, mas vamos supor que eu tivesse aqui duas colunas monetárias, que hora essa coluna é maior, hora essa coluna é maior. O que eu poderia fazer é isso daqui “SELECT GREATEST(VOLUME_DE_COMPRA, LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES”.
[15:47] Eu vou exibir VOLUME_DE_COMPRA, LIMITE_DE_CREDITO e vou dar o GREATEST desses dois campos. É claro que a ordem de grandeza do VOLUME_DE_COMPRA é sempre menor do que o LIMITE_DE_CREDITO, então sempre vai estar vencendo esse cara. O 140.000 é o maior desses dois, que deu esse. Mas é uma forma talvez de usar a função GREATEST para nós podermos comparar, por exemplo, duas colunas que tem valores numéricos bem parecidos para saber quem é maior.
[16:36] É isso, desculpe qualquer falha que eu tenha tido agora para fazer esse exemplo. Mas às vezes eu preparo alguma coisa para mostrar para vocês, mas na medida em que eu vou mostrando, nós tentamos improvisar um pouco e faz alguns vacilos, mas é isso. Eu gosto de jogar autenticidade durante o treinamento para mostrar a vocês, inclusive, na prática, que quando nós estamos trabalhando na prática com banco de dados, nós cometemos erros.
[17:10] Nós vemos que a função não funcionou, vemos que erramos um campo e corrigimos. Nós nunca fazemos o comando SELECT quando estamos programando direto no Oracle ou no IDE. Seja só Oracle, seja trabalhando com MYSQL, com SQL Server, nós nunca vamos acertar de primeira. Nós sempre vamos dar o SELECT, vemos que erramos um campo, corrigimos a vírgula aqui, bota o nome do campo de novo ali. Principalmente, quando nós estamos fazendo os exemplos de cabeça, olhando a base de dados.

Queremos construir um SQL cujo resultado seja, para cada cliente:
"O cliente João da Silva faturou 120000 no ano de 2016".
Faça isso somente para o ano de 2016.
Um exemplo de consulta é a seguinte:

SELECT
    'O cliente '
    || tc.nome
    || ' faturou '
    || to_char(round(SUM(inf.quantidade * inf.preco), 2))
    || ' no ano '
    || to_char(data_venda, 'YYYY') AS sentenca
FROM
         notas_fiscais nf
    INNER JOIN itens_notas_fiscais  inf ON nf.numero = inf.numero
    INNER JOIN tabela_de_clientes   tc ON nf.cpf = tc.cpf
WHERE
    to_char(data_venda, 'YYYY') = '2016'
GROUP BY
    tc.nome,
    to_char(data_venda, 'YYYY')
;

SELECT TO_DATE('15/08/1996','DD/MM/YYYY') FROM DUAL;
Query para converter a data '15/08/1996' de string para data normal:  15/08/96

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL;
Query para converter a data atual do Sistema para caractere, formtado no padrão AMD americano:  2022/04/26

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH12:MM:SS PM') FROM DUAL;
Query para converter a data atual do Sistema para caractere, formtado no padrão AMD e Horas, Min e Segs. Americano:  2022/04/26 11:04:30 TARDE

SELECT EXTRACT(MONTH FROM TO_DATE('15/08/1996','DD/MM/YYYY')) FROM DUAL;
Query para extrair o MÊS da data, qual esta em caractere no padrão DMA:  8

SELECT TO_NUMBER('10') + 100 FROM DUAL;
Query para converter Caractere em Numero, depois realizando a soma por 100:  110

SELECT TO_CHAR(10, '000000') FROM DUAL;
Query para criar uma Mascara de formatação, onde irá manter a quantidade de numeros conforme quantidade de zeros (6 numero):   000010

SELECT
    vend.nome      AS nome_vendedor,
    vend.bairro    AS bairro_vendedor,
    cli.nome       AS nome_cliente,
    cli.bairro     AS bairro_cliente
FROM
    tabela_de_vendedores  vend
FULL JOIN
    tabela_de_clientes    cli 
ON 
    vend.bairro = cli.bairro;

SELECT
    nvl(vend.nome, 'VENDOR NULL')          AS nome_vendedor,
    nvl(vend.bairro, 'BAIRRO NULL')        AS bairro_vendedor,
    cli.nome                               AS nome_cliente,
    cli.bairro                             AS bairro_cliente
FROM
    tabela_de_vendedores  vend
    FULL JOIN tabela_de_clientes    cli ON vend.bairro = cli.bairro;

Query para alterar o campo onde consta informação (null) vazia para uma mensagem pré definida.

SELECT
    volume_de_compra,
    limite_de_credito,
    greatest(volume_de_compra, limite_de_credito)
FROM
    tabela_de_clientes;

Query para Comparar quem seria o maior valor, neste exemplo entre Volume de Compra X Limite de Crédito.

-------------------------------------------------------------------------------------------------------------------------------------------------------- CONSOLIDANDO SEU CONHECIMENTO

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.

1) Você viu as funções do tipo texto. Veja alguns exemplos, com seus respectivos retornos:

SELECT NOME, UPPER(NOME) FROM TABELA_DE_CLIENTES;
SELECT NOME, LOWER(NOME) FROM TABELA_DE_CLIENTES;
SELECT NOME_DO_PRODUTO, INITCAP(NOME_DO_PRODUTO) FROM TABELA_DE_PRODUTOS;
SELECT CONCAT(ENDERECO_1, BAIRRO) FROM TABELA_DE_CLIENTES;
SELECT NOME, 'Endereço: ' || ENDERECO_1 || ' ' || BAIRRO || ' ' || CIDADE || ' ' || ESTADO || ', CEP: ' || CEP FROM TABELA_DE_CLIENTES;
SELECT NOME_DO_PRODUTO, LPAD(NOME_DO_PRODUTO, 60, '*') FROM TABELA_DE_PRODUTOS;
SELECT NOME_DO_PRODUTO, RPAD(NOME_DO_PRODUTO, 60, '*') FROM TABELA_DE_PRODUTOS;
SELECT NOME_DO_PRODUTO, SUBSTR(NOME_DO_PRODUTO,3,5) FROM TABELA_DE_PRODUTOS;
SELECT NOME_DO_PRODUTO, INSTR(NOME_DO_PRODUTO, '-') FROM TABELA_DE_PRODUTOS;
SELECT LTRIM('AAAAAAA') FROM DUAL;
SELECT NOME_DO_PRODUTO, REPLACE(REPLACE(NOME_DO_PRODUTO, 'Litro', 'L'),'Ls','L') FROM TABELA_DE_PRODUTOS;

2) Há também as funções de datas. Execute os comandos abaixo:

SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MM:SS') FROM DUAL;
SELECT SYSDATE + 10 FROM DUAL;
SELECT SYSDATE - 10 FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2019-01-01','YYYY-MM-DD')) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 10) FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 'SEXTA') FROM DUAL;

Observação: Se você usa um Windows em um idioma que não seja o português, deve colocar o dia da semana neste mesmo idioma (Por exemplo: Inglês - FRIDAY).

SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL;
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL;
SELECT ROUND(SYSDATE, 'YEAR') FROM DUAL;
SELECT ROUND(SYSDATE - 10, 'MONTH') FROM DUAL;

3) Alguns exemplos de funções matemáticas:

SELECT ROUND(3.4) FROM DUAL;
SELECT ROUND(3.6) FROM DUAL;
SELECT TRUNC(3.4) FROM DUAL;
SELECT TRUNC(3.6) FROM DUAL;
SELECT CEIL(3.4) FROM DUAL;
SELECT CEIL(3.6) FROM DUAL;
SELECT FLOOR(3.4) FROM DUAL;
SELECT FLOOR(3.6) FROM DUAL;
SELECT POWER(10,4) FROM DUAL;
SELECT EXP(10) FROM DUAL;
SELECT SQRT(10) FROM DUAL;
SELECT SQRT(144) FROM DUAL;
SELECT SIGN (10) FROM DUAL;
SELECT ABS(10000) FROM DUAL;
SELECT MOD(10, 6) FROM DUAL;

4) Há também funções de conversão. Execute os exemplos abaixo:

SELECT TO_DATE('12/11/2019', 'DD/MM/YYYY') FROM DUAL;
SELECT TO_DATE('12/11/2019', 'MM/DD/YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM/DD/YYYY HH12:MM:SS AM') FROM DUAL;
SELECT EXTRACT(MONTH FROM TO_DATE('12/11/2019', 'DD/MM/YYYY')) FROM DUAL;
SELECT EXTRACT(MONTH FROM TO_DATE('12/11/2019', 'MM/DD/YYYY')) FROM DUAL;
SELECT TO_NUMBER('10') + 100 FROM DUAL;
SELECT TO_CHAR(10, '00000') FROM DUAL;
SELECT NVL(10,0) FROM DUAL;

SELECT NVL(TABELA_DE_VENDEDORES.NOME, 'Vendedor Vazio') AS NOME_VENDEDOR, 
TABELA_DE_VENDEDORES.BAIRRO AS BAIRRO_VENDEDOR, 
TABELA_DE_CLIENTES.NOME AS NOME_CLIENTE, 
TABELA_DE_CLIENTES.BAIRRO AS BAIRRO_CLIENTE
FROM TABELA_DE_VENDEDORES
FULL JOIN TABELA_DE_CLIENTES
ON TABELA_DE_VENDEDORES.BAIRRO = TABELA_DE_CLIENTES.BAIRRO;

SELECT GREATEST(10,20,15) FROM DUAL;

SELECT VOLUME_DE_COMPRA, LIMITE_DE_CREDITO,
GREATEST(VOLUME_DE_COMPRA,LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES;

O que aprendemos?

Nesta aula, aprendemos:

Algumas funções de texto
Funções matemáticas
Funções de datas
Funções de conversão

---------------------------------------------------------------------------------------------------------------------------------------------------------- RELATÓRIO DE VENDAS VALIDAS

[00:00] Agora, nós vamos colocar em prática tudo aquilo que nós aprendemos. Nós vamos fazer dois relatórios que os gerentes da empresa de Suco de Frutas nos requisitaram. O pessoal da área de vendas está querendo ver se as vendas que estão sendo realizadas dentro dos meses estão válidas ou não válidas.
[00:30] O que é uma venda válida e uma venda não válida? Eu vou criar um novo script e eu vou fazer o seguinte, “SELECT * FROM TABELA_DE_CLIENTES”. Note que eu tenho, dentro da minha tabela de clientes, uma informação chamada VOLUME_DE_COMPRA. Esse VOLUME_DE_COMPRA diz o seguinte: aquele cliente só pode comprar, no máximo, o valor especificado na coluna VOLUME_DE_COMPRA.
[01:15] Eu quero fazer um relatório que vai comparar o volume total que aquele cliente comprou dentro de um mês, e eu vou comparar com esse VOLUME_DE_COMPRA. Se o volume total do que o cliente comprou no mês for menor ou igual a esse volume, significa que as vendas foram dentro daquilo que empresa de suco estava esperando.
[01:39] Porém, se o total de vendas for maior do que este VOLUME_DE_COMPRA, ou aquele cliente tem que reajustar o cadastro ou não deveria ter vendido mais do que esse limite para ele. E o relatório vai dizer que o volume de vendas foi inválido.
[01:58] Esse é o meu problema. Eu vou começar calculando, dentro de um mês, qual foi o volume de venda que eu vendi para os clientes. Eu sei que cliente está no cabeçalho da nota fiscal. No cabeçalho da nota fiscal que eu tenho aqui, eu tenho o CPF do cliente. E o volume de vendas está na tabela ITENS_NOTAS_FISCAIS. Se eu quero consolidar todos os volumes de cada cliente, eu vou precisar fazer um JOIN entre a tabela de notas fiscais e a tabela de itens pelo número da nota fiscal.
[02:58] Vou pegar aqui “SELECT * FROM NOTAS_FISCAIS”. Eu vou chamar essa tabela NOTAS_FISCAIS de “NF”, por exemplo. “INNER JOIN ITENS_NOTAS_FISCAIS” e eu vou chamar essa de “INF”. E qual é o campo que junta as duas? É o campo “ON NF.NUMERO = INF.NUMERO;”. Deixa eu rodar isso aqui para saber se funcionou. Eu tenho as minhas informações. Eu queria agora selecionar aquilo que é importante para mim. É o CPF do cliente, que vem da tabela de notas fiscais, então é o “NF.CPF”.
[04:07] É importante para mim a data da venda, porque tenho que consolidar isso dentro do mês. E a data da venda também tem na tabela NF, então “NF.DATA_VENDA”. A quantidade vem da tabela de itens, então “INF.QUANTIDADE”. Eu segreguei aqui a consulta que eu quero fazer. Só que agora, eu preciso consolidar essa informação por mês. Em primeiro lugar, eu preciso ver essa data da venda dentro do mês.
[04:58] Então, eu vou fazer o seguinte. Eu sei que se eu aplicar aqui o TO_CHAR desse campo que é date, e eu olhar assim “‘YYYY-MM’”, eu vou chamar esse cara aqui de “MES_ANO”. Se eu olhar minha consulta desta maneira, eu agora passo a ver o meu mês e o meu ano do jeito que eu queria. Só que agora, eu preciso consolidar essa venda dentro do mês, porque esse cliente aqui, dentro do mês de janeiro de 2015, ele fez 4 vendas, então eu preciso somar essas vendas.
[06:01] Eu vou fazer isso daqui. “SUM(INF.QUANTIDADE) AS VOLUME_VENDIDO FROM NOTAS_FISCAIS NF”. E se eu fiz o SUM, eu tenho que usar o GROUP BY pelos campos caracteres que eu tenho aqui. Só que quando eu uso o GROUP BY, eu não coloco alias, então ficou assim: o campo, o segundo campo com o seu alias, o SUM da quantidade e eu estou pegando aqui o GROUP BY pelos campos que aparecem aqui em cima.
[06:53] Agora, eu vou juntar as vendas desse cliente e somar esse valor. Eu tenho aqui esse CPF, em janeiro 2015, ele comprou isso daqui. Nós da empresa Suco de Frutas é que vendemos para ele 23.106 litros. Já esse CPF tem este volume. Eu agora preciso comparar esse cara com o que está no cadastro. Eu vou guardar essa consulta aqui e nós vamos agora olhar o limite de compra. O limite está na tabela de clientes. E esse limite está aqui, é o VOLUME_DE_COMPRA.
[07:59] Eu vou agora só segregar os campos que me interessam. Eu vou pegar o “CPF”, vou pegar o “NOME” e vou pegar o “VOLUME_DE_COMPRA”, “FROM TABELA_DE_CLIENTES”. Pronto, agora eu tenho aqui o CPF, o nome do cliente e o volume de compra. O que eu preciso fazer agora é juntar esta consulta com esta consulta.
[08:39] Usando quem como referência? O CPF, porque o CPF eu tenho tanto aqui quanto aqui. E eu vou usar subconsultas. “SELECT * FROM”. A primeira tabela do FROM vai esse cara aqui todo. Eu preciso colocar um alias para ele, eu vou colocar aqui, por exemplo, “VENDAS”. “INNER JOIN” a segunda consulta, que é essa daqui, que eu vou botar como alias “CADASTRO”. “ON”, quais são os campos que juntam uma à outra? Vai ser o CPF, que vem da consulta vendas, é “VENDAS.CPF = CADASTRO.CPF”.
[10:09] E quais são os campos que eu quero ver? Eu quero ver o CPF, como eu tenho nas duas subtabelas, tanto faz eu pegar o CPF de vendas como o CPF de cadastro. Eu vou pegar do cadastro. “CADASTRO.CPF”. O nome do cliente também vem da tabela cadastro. “CADASTRO.NOME”. O que mais? O campo de volume de compra máximo, está vindo do cadastro. O volume de compra vai ser “CADASTRO.VOLUME_DE_COMPRA”.
[10:58] Antes eu vou colocar aqui a data. A data MES_ANO vem da tabela vendas, então vou colocar aqui “VENDAS.MES_ANO”, CADASTRO.VOLUME_DE_COMPRA e o valor real da venda está vindo desse campo aqui, VOLUME_VENDIDO da tabela vendas. Então, é “VENDAS.VOLUME_VENDIDO”.
[11:35] Vamos ver esse 'SELECT' todo aqui para ver se funciona? Está aqui. Eu tenho aqui dentro de um período. Eu tenho nessa coluna o VOLUME_DE_VENDA, e eu tenho essa coluna o VOLUME_VENDIDO. Se esse volume for maior que esse, foi inválido. Se for menor, é válido. Eu vou colocar aqui um “WHERE”, só para limitarmos o mês, “VENDAS.MES_ANO = ‘2018-01’;”. Vamos ver como é que ficou aqui a minha consulta.
[12:34] Pronto, eu tenho aqui os meus clientes. O nome do cliente, o mês, o volume de compra e o volume vendido. Agora, eu quero criar um alerta para me dizer se por acaso ele for menor, é inválido. Se não, é válido. Eu vou usar aqui, no caso, um CASE. Eu vou escrever aqui em cima do FROM “CASE WHEN CADASTRO.VOLUME_DE_COMPRA <= VENDAS.VOLUME_VENDIDO THEN ‘Vendas Válidas’ ELSE ‘Vendas Inválidas’ AND AS RESULTADO”.
[13:53] Seleciono todo mundo, rodo. Está lá. Essa primeira linha, o Carlos Eduardo, em janeiro de 2018, as vendas dele foram inválidas. O volume vendido dele foi 20.753. E o volume de compra, 24. Ele comprou 24 mil, mas ele só podia comprar até 20.753, então foi inválido.
[14:42] Já o Valdecir da Silva, em janeiro de 2018, o que ele realmente comprou na nossa empresa de Suco de Frutas, foi 19.000 litros. Mas o volume vendido, ou seja, o máximo que ele poderia vender é 21.644. As vendas são válidas.
[15:21] Esse campo aqui, VOLUME_VENDIDO, eu vou chamar de “AS VOLUME_LIMITE”. Esse é o VOLUME_DE_COMPRA e esse é o VOLUME_LIMITE. Se esse cara é maior, é inválido. Se esse cara é menor, é válido. Eu consigo ver aqui quem é que está válido, quem é que está inválido. E eu posso, por exemplo, somente nesses clientes aqui fazer um trabalho para ou aumentar o volume limite ou poder dizer: “Você não pode comprar mais do que aquele volume, porque isso é uma regra da empresa”.
[16:09] Esse foi um exemplo de como é que com o SQL, juntando uma série de conceitos que nós aprendemos no treinamento, nós conseguimos dar uma informação que o nosso usuário quer saber. Por exemplo, se o volume de vendas para cada cliente foi válido ou não, dentro de um mês, baseado naquele cadastro de volume limite que ele tem no nosso sistema de vendas da empresa de suco de frutas.


select * from itens_notas_fiscais;
select * from notas_fiscais;

SELECT
    nfs.cpf                                   AS cpf_cliente,
    to_char(nfs.data_venda, 'MM-YYYY')        AS data_venda,
    SUM(itens.quantidade)                     AS vol_vendas
FROM
         notas_fiscais nfs
    INNER JOIN itens_notas_fiscais itens ON nfs.numero = itens.numero
GROUP BY
    nfs.cpf,
    to_char(nfs.data_venda, 'MM-YYYY');


Nesta aula, construímos um relatório que apresentou os clientes que tiveram vendas inválidas. Complemente este relatório, listando somente os que tiveram vendas inválidas e calculando a diferença entre o limite de venda máximo e o realizado, em percentuais. Dica:
Capture a SQL final da aula
Filtre somente as linhas onde: (X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0
Liste a coluna de X.QUANTIDADE_LIMITE
Crie uma nova coluna, fazendo a fórmula:
(1 - (X.QUANTIDADE_LIMITE/X.QUANTIDADE_VENDAS)) * 100

Este desafio pode obter diversas respostas. Abaixo segue uma delas:
SELECT
    x.cpf,
    x.nome,
    x.mes_ano,
    x.quantidade_vendas,
    x.quantidade_limite,
    CASE
        WHEN ( x.quantidade_limite - x.quantidade_vendas ) < 0 THEN
            'INVÁLIDA'
        ELSE
            'VÁLIDA'
    END                                                              AS status_venda,
    ( 1 - ( x.quantidade_limite / x.quantidade_vendas ) ) * 100            AS percentual
FROM
    (
        SELECT
            nf.cpf,
            tc.nome,
            to_char(nf.data_venda, 'YYYY-MM')        AS mes_ano,
            SUM(inf.quantidade)                      AS quantidade_vendas,
            MAX(tc.volume_de_compra)                 AS quantidade_limite
        FROM
                 notas_fiscais nf
            INNER JOIN itens_notas_fiscais  inf ON nf.numero = inf.numero
            INNER JOIN tabela_de_clientes   tc ON tc.cpf = nf.cpf
        GROUP BY
            nf.cpf,
            tc.nome,
            to_char(nf.data_venda, 'YYYY-MM')
    ) x
WHERE
    ( x.quantidade_limite - x.quantidade_vendas ) < 0;

--------------------------------------------------------------------------------------------------------------------------------------------------------- RELATÓRIO DE VENDAS P/ SABOR

[00:00] Recebi uma segunda demanda por parte da área usuária da empresa de Suco de Frutas. Eles querem que eu construa um relatório que mostre, dentro do ano 2016, as vendas por sabor. E ele quer ver isso ordenado do sabor que mais vendeu ao que menos vendeu. E ele quer criar uma coluna de distribuição percentual dessas vendas. Ou seja, vamos dar um exemplo aqui hipotético, porque eu não sei ainda a ordem de grandeza dos números.
[00:32] Mas vamos supor que o primeiro colocado seja laranja, então o relatório tem que vir primeiro colocado, laranja. Vendeu no ano 2016, 250 mil litros. E isso representa 15% de todas as vendas. O segundo colocado foi maçã. Vendeu 200 mil litros. Esse segundo colocado representa 12% das vendas. E o relatório vai decrescendo, do maior para o menor, e a distribuição que começa alta, claro, vai vir menor. E no final dessa distribuição, a soma tem que dar 100.
[01:16] Esse é o nosso desafio. Aqui, eu estou fazendo a coisa, até certo ponto, de cabeça. Nós estamos direto programando, mas o legal é que quando você tiver um desafio desse, você coloque no papel ou na planilha de Excel como é o relatório, crie números fictícios para você entender como é que vai ser esse relatório e partir para o SQL.
[01:48] Vou criar um novo script. Eu quero ver o volume de vendas por sabor. Primeiro, eu preciso saber o volume de vendas por produto, porque o sabor está ligado ao produto. Vou pegar aqui “SELECT * FROM ITEMS_NOTAS_FISCAIS;” eu tenho o volume, que é o campo quantidade, que está aqui por produto. E sabor está na tabela de produtos.
[02:33] Eu vou chamar esse cara de itens de nota fiscal, “INF”. “INNER JOIN TABELA_DE_PRODUTOS”, vou chamar esse cara de “TP”. Qual é o código que liga as duas tabelas? É o código do produto, que tem tanto na tabela de itens quanto na tabela de produtos. Vou botar “NF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO”. Vamos ver se pelo menos o join está funcionando.
[03:37] Vamos pegar só os campos que nos interessam. O campo que me interessa é do lado da tabela de produtos, é o sabor, “TP.SABOR”. Eu quero fazer isso para ano 2016, eu não tenho o ano de 2016 no itens, eu tenho o ano de 2016 no cabeçalho da nota. Vamos primeiro esquecer a data, vamos pegar só o que eu tenho aqui nesse join, que é o sabor. Do “INF.”, o que me interessa é a “QUANTIDADE”.
[04:20] Só que eu preciso agora partir e buscar a data da tabela de notas fiscais. Eu vou fazer outro inner join aqui embaixo. Agora, eu vou juntar a tabela de itens de notas fiscais com a tabela de notas fiscais. Então “NOTAS_FISCAIS”, vou chamar de “NF”. Qual é o campo que liga a tabela de itens de notas fiscais com notas fiscais? É o número da nota. É esse campo aqui, que tem tanto na tabela de itens quanto na tabela de notas. Vou pegar o “ON INF.NUMERO = NF.NUMERO;”.
[05:22] Vamos ver se esse join aqui está funcionando. Não teve erro, então significa que funcionou. E eu vou buscar, da tabela de notas fiscais, a data, “NF.DATA_VENDA”. Olha que interessante essa consulta, eu tenho dois joins. Esse primeiro inner join, eu estou pegando itens com produtos. E o segundo inner join eu estou pegando itens com notas, porque aqui na igualdade do inner join é que eu vejo. Eu estou pegando o INF que está aqui em cima com o NF que está aqui do lado.
[06:25] Já o outro inner join está pegando INF, que é essa tabela, com TP, que é essa tabela. Eu juntei as três tabelas. Juntei a tabela de produtos com tabela de itens com a tabela de notas. E eu estou pegando os campos que me interessam. Eu quero pegar, da tabela de produtos, sabor. Quero pegar, da tabela de notas, a data. E da tabela de itens, a quantidade. Vamos rodar agora aqui. Tenho o que eu preciso. Só que nós queremos ver isso no ano de 2016, somente. E eu quero ver o valor total de vendas por quantidade de cada sabor no ano de 2016.
[07:11] A primeira providência que eu vou tomar é olhar esse relatório, não por essa data da venda, mas por ano. Eu posso usar aqui o “TO_CHAR”, por exemplo. Eu vou converter a data da venda somente por ano. E eu vou chamar esse cara aqui de “ANO”.
[07:35] Vamos ver como é que ficou a consulta. Estou vendo por ano. Mas eu estou vendo uma linha para cada nota fiscal. Eu preciso grupar isso. Eu vou botar aqui “SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDIDA”. E como eu coloquei o SUM, eu tenho que usar o “GROUP BY” aqui. Os campos de string que fazem parte da chave do SUM da quantidade. Vamos ver como é que ficou.
[08:34] Agora o meu relatório ficou mais enxuto e eu tenho aqui os volumes vendidos por sabor. Só quero ver isso do ano de 2016, então eu vou pegar essa consulta aqui e vou repetir aqui embaixo. E aqui, antes do GROUP BY, eu coloco o meu “WHERE”. Esse campo aqui “= ‘2016’”. Como ele é um TO_CHAR, eu boto ele entre aspas para poder fazer o teste. Pronto, só tenho aqui 2016.
[09:25] O meu usuário me disse que ele quer ver isso ordenado do maior para o menor. Eu vou fazer o seguinte, depois do GROUP BY, eu vou botar um ORDER BY. Qual é o campo que eu quero ordenar? É este campo aqui, QUANTIDADE_VENDIDA. Só que eu não posso colocar o alias, eu tenho que colocar o que forma o campo, é o SUM de quantidade. Vamos ver se vai funcionar. Na verdade, ele está ordenado do menor para o maior. Eu preciso do maior para o menor, então eu coloco aqui um “DESC” para poder ser do maior para o menor.
[10:22] O produto que mais vendeu foi sabor manga, depois melancia, depois laranja. Já tem aqui um ranking, mas não é só isso. Ele quer a distribuição. E vamos lembrar o seguinte, o que é distribuição? A distribuição vai ser o seguinte. Por exemplo, quantos por cento esse cara representa do total? É 613.309 dividido pelo total de venda. Isso vai me dar o percentual de venda da manga.
[11:09] Como é que o sei o percentual de venda da melancia, que foi 487.625? Vai ser 487.625 dividido pelo total de venda. Vai me dar o percentual de venda da melancia. Logo, eu preciso ter aqui uma coluna que tenha o total, porque depois eu faço a conta.
[11:41] Eu preciso disso. Eu vou guardar essa consulta aqui. Vamos agora calcular o valor total. O valor total é essa mesma consulta aqui, só que eu não uso o sabor. Então se eu tirar o sabor do SELECT, eu tenho que tirar o sabor do GROUP BY. Se eu rodar esse cara aqui, uma linha só. E esse cara aqui total de venda de todos os sabores.
[12:24] Eu vou fazer agora o seguinte. Abre e fecha parêntese. Essa consulta grandona aqui é a consulta 1. Ela vai ficar aqui dentro dos parênteses. Eu vou chamar ela aqui de “VENDA_SABOR”. Abro parênteses, fecho parêntese.
[13:01] Essa segunda consulta aqui, eu vou chamar de “TOTAL_VENDA”. Eu posso fazer isso aqui “SELECT * FROM”, essa primeira consulta, “INNER JOIN”, com a segunda consulta. Qual é o campo em comum dessas consultas? O ano é comum. O nome do campo é ano, porque dentro da subquery o identificador é ano. Eu vou fazer o seguinte aqui, eu vou botar “ON VENDA_SABOR.ANO = TOTAL VENDA.ANO”.
[14:22] Vamos rodar esse SELECT só para ver se funciona. Consegui colocar. Aqui é a venda de cada sabor e aqui eu tenho uma constante que é o total. Basta agora fazer a operação matemática. Este dividido por este. Nós vamos colocar agora só os campos que me interessam.
[14:54] Da primeira subquery, que é a VENDA_SABOR, eu vou pegar a “VENDA_SABOR.SABOR”. Eu vou pegar o ano. O ano, tanto faz, porque o ano eu tenho tanto aqui quanto aqui embaixo, então vou pegar da própria VENDA_SABOR. “VENDA_SABOR.ANO”. O próximo campo é a QUANTIDADE_VENDIDA, que também vem da subquery VENDA_SABOR. E depois, eu vou pegar a venda total, que vem da subquery TOTAL_VENDA. ”TOTAL_VENDA.QUANTIDADE_VENDIDA”. E nós vamos colocar um alias para ele “AS TOTAL”.
[16:04] Vamos olhar essa consulta como ficou. Eu acho que está ok. Está dando esse erro aqui, mas vamos ver. Veio, está ali. Agora, eu preciso fazer uma conta, este dividido por esse. Eu vou copiar aqui embaixo. Vou fazer agora uma conta que vai ser este dividido por este. “AS PARTICIPACAO”.
[17:29] Só que esse número, primeiro que tem que ser um número percentual, então eu preciso multiplicar por 100. E eu quero tirar essas casas decimais. Eu posso fazer isso daqui. Eu quero multiplicar por 100. E esse número todo aqui, eu vou aplicar o “ROUND”. Só que o ROUND tem um parâmetro que eu não mencionei quando vimos a função, que é isso daqui. “,2”. Quando eu boto o ROUND vírgula 2, ele vai arredondar com duas casas decimais.
[18:20] Essa coluna TOTAL, eu só estou usando para calcular essa participação. Ela não precisa aparecer no relatório. Eu vou tirar ela. Vamos copiar a consulta, jogar aqui embaixo. E aqui em cima, essa quantidade total eu posso tirar fora do meu relatório e vou rodar. Pronto, está aqui o relatório que me pediram. Eu tenho um ranking por sabor, do maior para o menor. No ano de 2016.
[18:59] E eu sei que o primeiro lugar, que é manga, tem uma participação de 16.91% das vendas totais. O segundo produto, que é melancia, tem uma participação de 13.45. O terceiro, que é laranja, tem uma participação de 13.34 e assim por diante. Eu tenho a participação de cada sabor que eu tenho na minha empresa de Suco de Frutas. Era isso que o meu usuário tinha pedido. Meu relatório está pronto.

Modifique o relatório, mas agora para ver o ranking das vendas por tamanho. Dica: pode parecer difícil, mas este é o exercício mais fácil de resolver.
Basta substituir o campo SABOR por TAMANHO:

SELECT
    venda_tamanho.tamanho,
    venda_tamanho.ano,
    venda_tamanho.quantidade,
    round((venda_tamanho.quantidade / venda_total.quantidade) * 100, 2) AS participacao
FROM
         (
        SELECT
            tp.tamanho,
            to_char(nf.data_venda, 'YYYY')         AS ano,
            SUM(inf.quantidade)                   AS quantidade
        FROM
                 tabela_de_produtos tp
            INNER JOIN itens_notas_fiscais  inf ON tp.codigo_do_produto = inf.codigo_do_produto
            INNER JOIN notas_fiscais        nf ON nf.numero = inf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = 2016
        GROUP BY
            tp.tamanho,
            to_char(nf.data_venda, 'YYYY')
    ) venda_tamanho
    INNER JOIN (
        SELECT
            to_char(nf.data_venda, 'YYYY')         AS ano,
            SUM(inf.quantidade)                   AS quantidade
        FROM
                 tabela_de_produtos tp
            INNER JOIN itens_notas_fiscais  inf ON tp.codigo_do_produto = inf.codigo_do_produto
            INNER JOIN notas_fiscais        nf ON nf.numero = inf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = 2016
        GROUP BY
            to_char(nf.data_venda, 'YYYY')
    ) venda_total ON venda_tamanho.ano = venda_total.ano
ORDER BY
    venda_tamanho.quantidade DESC;



SELECT
    venda_sabor.sabor,
    venda_sabor.ano,
    venda_sabor.vol_vendido,
    ROUND((venda_sabor.vol_vendido/total_venda.vol_vendido * 100), 2) as PARTICIPACAO
FROM    
(
SELECT
    produtos.sabor,
    TO_CHAR(nfs.data_venda, 'YYYY') AS ANO,
    SUM(itens.quantidade) AS VOL_VENDIDO
FROM
    itens_notas_fiscais ITENS
INNER JOIN
    tabela_de_produtos PRODUTOS
ON
    itens.codigo_do_produto = produtos.codigo_do_produto
INNER JOIN
    notas_fiscais NFS
ON
    itens.numero = nfs.numero
WHERE
    TO_CHAR(nfs.data_venda, 'YYYY') = '2016'
GROUP BY
    produtos.sabor,
    TO_CHAR(nfs.data_venda, 'YYYY')
ORDER BY
    SUM(itens.quantidade) desc
) VENDA_SABOR 
INNER JOIN
(
SELECT
    TO_CHAR(nfs.data_venda, 'YYYY') AS ANO,
    SUM(itens.quantidade) AS VOL_VENDIDO
FROM
    itens_notas_fiscais ITENS
INNER JOIN
    tabela_de_produtos PRODUTOS
ON
    itens.codigo_do_produto = produtos.codigo_do_produto
INNER JOIN
    notas_fiscais NFS
ON
    itens.numero = nfs.numero
WHERE
    TO_CHAR(nfs.data_venda, 'YYYY') = '2016'
GROUP BY
    TO_CHAR(nfs.data_venda, 'YYYY')
ORDER BY
    SUM(itens.quantidade) desc
) TOTAL_VENDA
ON
    venda_sabor.ano = total_venda.ano;
	
-------------------------------------------------------------------------------------------------------------------------------------------------------------------- ARRUMANDO AS SQLs

[00:00] Eu vou pegar essa última consulta que nós construímos. Eu vou copiar, vou abrir outro editor e vou colar ela aqui. Note que ela tem várias linhas. E a coisa fica meio confusa de entender. Imagina, por exemplo, que eu vou tirar essa vírgula que está do lado do ano. Se eu rodar essa consulta, eu vou ter um erro. E às vezes, você não consegue achar na query onde está o erro, porque a query está muito confusa.
[00:47] É interessante que você, quando faça o seu comando SQL, que você o organize de tal maneira que fique mais simples de se trabalhar. Normalmente, eu gosto de fazer a seguinte coisa. Eu gosto de, primeiro, todos os comandos de SELECT, cada um em uma linha. Eu gosto pessoalmente de colocar vírgula no início da linha. Isso é um gosto meu, porque nós conseguimos facilmente descobrir quando falta uma vírgula.
[01:22] Aqui, por exemplo, vou fazer isso aqui. O FROM fica aqui. O INNER JOIN, sempre assim. FROM, INNER JOIN, ON. Não acho legal fazer isso aqui. Na mesma linha, ter o FROM e o INNER JOIN. Eu dou um Enter aqui. Eu gosto de separar o WHERE. GROUP BY, a mesma coisa. ORDER BY, a mesma coisa. Você tem aqui INNER JOIN. De novo, cada seleção aqui da consulta numa linha. O FROM, aqui. INNER JOIN, ON. O WHERE aqui embaixo. GROUP BY, ORDER BY.
[02:22] Pronto, fica de uma maneira mais fácil. Isso é um gosto pessoal meu. Porém, você também pode, selecionando toda essa consulta, botão direito do mouse e você tem essa opção aqui: formatar. E o SQL Developer formata para você a sua consulta. Ele não formatou do jeito que eu gosto, não. Porque ele colocou, por exemplo, a vírgula no final. Eu gosto de botar a vírgula no início. E note que ele até deixou as palavras chaves do SQL, por exemplo, SELECT, FROM, SUM em maiúsculas.
[03:15] E ele colocou o nome dos campos minúsculas, as funções maiúsculas, o nome da tabela minúsculo. Ele fez uma organização até mais criteriosa do que eu faria. E você salva a sua consulta desse jeito, formatada. Porque fica muito mais fácil de você ou fazer uma modificação ou tentar achar o erro que você está cometendo.
[03:47] Agora, eu fiz isso usando o SQL Developer. Mas também, se nós formos na internet e colocar aqui Google, vamos buscar aqui por exemplo, “format sql online”. Eu vou também ter uma série de sites. Têm vários aqui. Vamos pegar esse primeiro aqui, o Instant SQL Formatter. Eu posso até escolher aqui a sintaxe que eu vou usar. Eu tenho aqui no canto desse site, critérios. Como é que eu gosto de organizar o meu código. Vou dar um “Ctrl + C” nesse SELECT que está mais zoneado, que foi o que nós construímos durante a aula.
[04:36] E aqui no site, vou colar. E eu clico no botão aqui embaixo, Format SQL. Eu tenho aqui a query formatada. Vai formatar de um jeito talvez um pouco diferente que o SQL Plus formataria, mas também é um formato válido. Se eu pegar esse cara aqui, vou criar aqui outra área de edição e colar, é uma formatação um pouco diferente, mas está organizado, está claro, está limpo.
[05:08] Você consegue, olhando a consulta, achar facilmente o campo que você quer modificar. Tanto pelo SQL Developer ou por um aplicativo externo web, é sempre legal você formatar os seus comandos SQL e salvar eles formatados para te ajudar na manutenção dos mesmos, caso seja necessário. Ou, por exemplo, caso você queira fazer alguma modificação na consulta. É esse ponto específico que eu gostaria de chamar a atenção de vocês.

-------------------------------------------------------------------------------------------------------------------------------------------------------- CONSOLIDANDO SEU CONHECIMENTO

Chegou a hora de você pôr em prática o que foi visto na aula. Para isso, execute os passos listados abaixo.

1) Monte uma seleção que determina se as vendas mensais por cliente são válidas ou não. Considere como válidas as vendas abaixo da quantidade limite, e não válidas as vendas acima da quantidade limite existente no cadastro do cliente. A consulta é a mostrada abaixo:

SELECT
    cadastro.cpf,
    cadastro.nome,
    vendas.mes_ano,
    cadastro.volume_de_compra,
    vendas.volume_vendido    AS volume_limite,
    CASE
        WHEN cadastro.volume_de_compra <= vendas.volume_vendido THEN
            'Vendas Válidas'
        ELSE
            'Vendas Inválidas'
    END                      AS resultado
FROM
         (
        SELECT
            nf.cpf,
            to_char(nf.data_venda, 'YYYY-MM')        AS mes_ano,
            SUM(inf.quantidade)                      AS volume_vendido
        FROM
                 notas_fiscais nf
            INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero
        GROUP BY
            nf.cpf,
            to_char(nf.data_venda, 'YYYY-MM')
    ) vendas
    INNER JOIN (
        SELECT
            cpf,
            nome,
            volume_de_compra
        FROM
            tabela_de_clientes
    ) cadastro ON vendas.cpf = cadastro.cpf
WHERE
    vendas.mes_ano = '2018-01';

2) Outro exemplo de relatório é o que determina a venda por sabores, para o ano de 2016, apresentando o percentual de participação de cada um destes sabores, ordenados:

SELECT
    venda_sabor.sabor,
    venda_sabor.ano,
    venda_sabor.quantidade_vendida,
    round(((venda_sabor.quantidade_vendida / total_venda.quantidade_vendida) * 100), 2) AS participacao
FROM
         (
        SELECT
            tp.sabor,
            to_char(nf.data_venda, 'YYYY')        AS ano,
            SUM(inf.quantidade)                   AS quantidade_vendida
        FROM
                 itens_notas_fiscais inf
            INNER JOIN tabela_de_produtos  tp ON inf.codigo_do_produto = tp.codigo_do_produto
            INNER JOIN notas_fiscais       nf ON inf.numero = nf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = '2016'
        GROUP BY
            tp.sabor,
            to_char(nf.data_venda, 'YYYY')
        ORDER BY
            SUM(inf.quantidade) DESC
    ) venda_sabor
    INNER JOIN (
        SELECT
            to_char(nf.data_venda, 'YYYY')        AS ano,
            SUM(inf.quantidade)                   AS quantidade_vendida
        FROM
                 itens_notas_fiscais inf
            INNER JOIN tabela_de_produtos  tp ON inf.codigo_do_produto = tp.codigo_do_produto
            INNER JOIN notas_fiscais       nf ON inf.numero = nf.numero
        WHERE
            to_char(nf.data_venda, 'YYYY') = '2016'
        GROUP BY
            to_char(nf.data_venda, 'YYYY')
        ORDER BY
            SUM(inf.quantidade) DESC
    ) total_venda ON venda_sabor.ano = total_venda.ano;


Nesta aula, aprendemos:

A colocar em prática o nosso conhecimento, montando dois relatórios, conforme especificado pela empresa de suco de frutas
A importância de arrumar e indentar as consultas SQL

Conclusão:

[00:00] Terminamos mais um treinamento. Espero que esse treinamento tenha cumprido as expectativas de cada um sobre o que vocês queriam realmente aprender sobre consultas avançadas em Oracle. Apesar do nome consultas avançadas, o assunto pode ser muito mais aprofundado.
[00:22] Mas eu acho que o que nós cobrimos nesse treinamento é o suficiente para que vocês possam estudar mais sobre esse assunto. E inclusive, botar a mão na massa caso no trabalho de vocês, ou na faculdade, ou onde você tenha contato com banco de dados Oracle, eu acho que você tem condições de começar a fazer coisas reais na prática.
[00:54] Esse curso é uma continuação do curso de introdução ao SQL usando Oracle. Mas aquele curso de introdução ao SQL usando Oracle é voltado muito para quem nunca tinha visto SQL. Muitas pessoas começam essa carreira de Oracle por este treinamento, porque já tem uma noção de SQL.
[01:23] Nós iniciamos esse curso fazendo as instalações dos produtos. E quem fez o curso de introdução ao SQL não precisou fazer as instalações, porque já tinha o ambiente na sua máquina. Mas você que começou a carreira dentro desse curso, você teve que seguir e fazer as instalações.
[01:54] E nós também preparamos um ambiente onde nós lemos uma massa de dados e criamos um banco Oracle na nossa máquina, que esse banco Oracle nós usamos durante o treinamento com um exemplo para fazer várias consultas.
[01:58] E como curiosidade, eu falei um pouquinho nesse treinamento sobre a história do SQL e a história da Oracle. Finalmente, nós passamos à aula 2, onde nós tivemos que conhecer o nosso banco de dados. Nós vimos nesse vídeo 2.1 que conhecer o banco de dados é fundamental para nós começarmos a fazer consultas. Nós precisamos saber quais são as tabelas que eu tenho disponíveis, quais são os campos, o que significa cada campo, quais são os relacionamentos entre as tabelas.
[02:31] Normalmente, esse tipo de conhecimento está contido em alguma documentação que você vai encontrar na sua empresa. Só que em muitos casos, infelizmente isso acontece, você não acha a documentação. E nós vimos, neste capítulo, como é que nós, usando o SQL Developer, conseguimos, olhando um banco, descobrir mais ou menos o que eu tenho nele.
[02:58] Ou seja, as tabelas, os campos e os relacionamentos. Nós passamos para o vídeo 2.2, onde nós fizemos uma revisão das consultas. Nós fizemos uma revisão do que foi ensinado no curso de introdução ao SQL com Oracle. Você que tinha um conhecimento de SQL, mas estava um pouco enferrujado, pôde relembrar algumas coisas nesse vídeo 2.2. E passamos a falar um pouquinho de teoria. E nós explicamos como é que funciona a lógica quando nós vamos fazer um filtro em uma consulta.
[03:31] Como é que funciona o AND e o OR dentro de uma expressão complexa, para nós sabermos se essa expressão é verdadeira ou é falsa. E colocamos a mão na massa fazendo nesse vídeo 2.4 consultas práticas usando AND e OR. Finalmente, nós fechamos a aula 2 falando sobre o LIKE, que é uma forma de nós fazermos um filtro usando como critério um texto e nós usamos o % como coringa, para buscarmos, dentro de um campo texto na nossa tabela, registros que possuem um pedaço de um texto.
[04:10] Nós passamos para a aula 3, cujo objetivo é formatar a saída do nosso SQL. Nós vimos o comando DISTINCT, que consegue grupar linhas que são iguais. Nós vimos como é que se limita a saída de uma consulta no vídeo 3.2. Ou seja, eu faço uma consulta e quero somente ver os 10 primeiros registros, ou os 100 primeiros registro. Às vezes, a limitação é importante, porque nós conseguimos, pegando uma parte dos registros, ver e ter uma noção se o nosso comando SQL está legal.
[04:50] Nós aprendemos a ordenar as consultas através do ORDER BY. E nós vimos que nós podemos ordenar ascendente ou descendente, nós podemos usar mais de um campo como critério de ordenação. E o critério de ordenação pode ser campo numérico, campo de data ou campo de texto. Nós falamos de como nós conseguimos agrupar os registros usando o GROUP BY. E o GROUP BY automaticamente requer que você use uma fórmula matemática para agrupar os campos que são valores.
[05:30] Nós temos o SUM, AVERAGE, o MIN, o MAX, o COUNT. E nós vimos vários exemplos usando esses tipos de agregação. Durante a apresentação da agregação, nós apresentamos um problema, às vezes eu posso querer aplicar um filtro sobre o valor agregado, e nós vimos que não funciona direito se nós usarmos a forma de filtro que tínhamos aprendido nas aulas anteriores.
[05:55] E no vídeo 3.5 nós aprendemos o HAVING, que conseguia resolver esse problema. Finalmente, nós aprendemos também outra estrutura, que é a estrutura de CASE, onde eu consigo classificar as minhas seleções e dar, por exemplo, uma nota ou uma qualificação para cada linha da minha consulta.
[06:22] Nós passamos para o vídeo da aula 4, onde nós falamos de joins. Os nossos bancos de dados Oracle são bancos de dados relacionais, ou seja, as tabelas se relacionam. Então, eu posso, numa mesma consulta Oracle, juntar duas tabelas. E nós fazemos isso através do JOIN. E nós aprendemos que existem vários tipos de JOIN.
[06:42] Nós temos o JOIN normal, que pega todo mundo que têm nas duas tabelas. Nós temos o LEFT JOIN e o RIGHT JOIN, que pega todo mundo que existe numa tabela e somente as coincidências na outra tabela. O FULL JOIN, que consegue pegar não somente as coincidências, mas as exceções. E o CROSS JOIN, que cria uma análise combinatória das nossas seleções.
[07:05] Nós também aprendemos como é que unificamos consultas através do UNION. E vimos que tem uma diferença entre o UNION e o UNION ALL. O UNION junta registros que possuem os mesmos valores na linha. Já o UNION ALL mantém esses registros separados.
[07:30] E depois, nós fomos para a parte de subconsulta, que é uma técnica bem poderosa, onde nós podemos pegar um SQL e aplicar ele dentro de um outro SQL. Ou usando como filtro, ou usado como JOIN dentro de uma tabela. E o assunto subconsultas naturalmente nos levou a falar de views, que eu pego SELECTs, crio viewS associados a esses SELECTs, e eu consigo usar a minha view como se fosse uma tabela normal.
[08:07] Nós passamos depois para a aula 5, onde nós falamos de funções, que são métodos que eu uso dentro do meu banco para aplicar fórmulas, ou aplicar determinadas regras em cima dos campos que estão vindo do meu SQL. Nós vimos funções de string, funções de datas, funções matemáticas e funções de conversão.
[08:33] Finalmente, nas nossa aula 6, nós pegamos tudo aquilo que nós aprendemos em todas as aulas e fizemos dois exemplos práticos. Nós fizemos um relatório de vendas válidas, onde nós comparamos o volume vendido para um cliente dentro do mês e comparamos com o limite de vendas que existe no cadastro do cliente. E comparamos para ver se aquele volume de vendas foi válido ou não.
[09:04] E depois, nós fizemos um segundo relatório, que foi um ranking de vendas das quantidades vendidas por sabor, do maior para o menor, e criamos uma coluna de percentual de distribuição.
[09:19] E eu falei só uma pitadinha do assunto de arrumando as SQL, porque quando nós começamos a ter SQL muito grande, é legal nós arrumamos elas. Como falei, o assunto é muito amplo. Nós demos uma pincelada um pouco de cada coisa e eu acho que depois desse treinamento você está apto a começar a construir as suas consultas de maneira mais fácil e entender melhor como é que funciona o SQL para obter dados dentro do nosso banco Oracle.
[09:58] Muito obrigado por pela preferência. Muito obrigado pela audiência. E nós nos vemos em próximos cursos por aí.



CREATE OR REPLACE PACKAGE BODY PK_CAEF0008 IS
--
vv_string       varchar2(32767);
ve_erro         exception;
--
vv_sistema      varchar2(32767);
vv_processo     varchar2(32767);
vv_msg_erro     varchar2(32767);
vn_cd_erro      number(10);
--
vv_param1       varchar2(500);
--
-- Desenvolvido por: 
-- Data: 
-- Definição: Valida o status
--
FUNCTION FKG_VAL_STATUS( EV_PROCESSO  IN VARCHAR2
                       , EN_STATUS    IN NUMBER
                       ) RETURN BOOLEAN IS
--
BEGIN
   return( pk_fat_status.fkg_val_status( ev_processo => ev_processo, en_status => en_status ) );
EXCEPTION
   when others then
      pk_soft.pkb_raise_erro(-20000,'PK_CAEF0008.FKG_VAL_STATUS - '||sqlerrm);
END FKG_VAL_STATUS;