-- Queremos ter uma lista de todas as categorias
SELECT *
FROM categorias;
-- Como as categorias não possuem imagens, você está interessado em obter apenas um Nome e descrição da lista de categorias;
SELECT CategoriaNome , Descricao
FROM categorias;
--  Obtenha uma lista dos produtos
SELECT *
FROM produtos;
-- Existem produtos descontinuados? (Descontinuado = 1). Não
SELECT *
FROM produtos
WHERE Descontinuado = 1;
-- Na sexta-feira, você deve se reunir com o fornecedor nr. 8. Quais são os produtos que eles fornecem? 4 produtos, chocolate e biscoitos.
SELECT ProdutoNome, ProvedorID
FROM produtos
WHERE ProvedorID = 8;
-- Queremos saber todos os produtos cujo preço unitário se encontra entre 10 e 22.
SELECT PrecoUnitario
FROM produtos
WHERE '10 >= 22';
-- Fica definido que um produto deve ser solicitado ao fornecedor se suas unidades em estoque forem inferiores ao nível de reabastecimento Existem produtos a solicitar? Sim.
SELECT UnidadesEstoque, NivelReabastecimento
FROM produtos 
WHERE UnidadesEstoque < NivelReabastecimento;
-- Você quer saber todos os produtos da lista anterior, mas que as unidades pedidas sejam iguais a zero.
SELECT UnidadesEstoque, NivelReabastecimento, UnidadesPedidas
FROM produtos 
WHERE UnidadesEstoque < NivelReabastecimento
AND UnidadesPedidas = 0;
-- Obtenha uma lista de todos os clientes com contato, empresa, cargo, País. Classifique a lista por país
SELECT Contato, Empresa, Pais, Titulo 
FROM clientes
ORDER BY Pais;
-- Queremos atender todos os clientes que possuem o título de  “Proprietário". Esse título estará em inglês  (Owner).
SELECT Titulo 
FROM clientes 
WHERE Titulo 
LIKE '%Owner%';
--  A Operadora de telefonia atendeu um cliente e não lembra o nome dele. Sabe apenas que começa com "C". Podemos ajudá-lo a obter uma lista com todos os contatos que começam com a letra C?
SELECT Contato 
FROM clientes 
WHERE Contato 
LIKE "c%";
-- Obtenha uma lista de todas as faturas, ordenadas por data da fatura em ordem ascendente.
SELECT * 
FROM faturas 
ORDER BY DataFatura;
-- Agora é necessário uma lista de faturas com o país de envio "EUA" e que a FormaeEnvio seja diferente de 3.
SELECT PaisEnvio, FormaEnvio 
FROM faturas
WHERE PaisEnvio 
LIKE '%USA%'
AND FormaEnvio != 3;
-- O cliente 'GOURL' fez um pedido? Sim.
SELECT NomeEnvio
FROM faturas 
WHERE NomeEnvio 
LIKE '%Gourl%';
-- Você deseja visualizar todas as faturas dos funcionários 2, 3, 5, 8 e 9.
SELECT EmpregadoID, FaturaId 
FROM faturas 
WHERE EmpregadoID 
IN (2,3,5,8,9);
-- Obtenha a lista de todos os produtos em ordem decrescente por preço unitário.
SELECT * 
FROM produtos 
ORDER BY PrecoUnitario DESC;
-- Obtenha a lista dos 5 melhores produtos cujo preço unitário é o mais "Caro".
SELECT ProdutoNome, PrecoUnitario 
FROM produtos 
ORDER BY PrecoUnitario DESC LIMIT 5;
-- Obtenha um top 10 dos produtos com mais unidades em estoque.
SELECT UnidadesEstoque, ProdutoNome 
FROM produtos 
ORDER BY UnidadesEstoque DESC LIMIT 10;
-- Obtenha uma lista de FaturaId, Produto, Quantidade.
SELECT FaturaId, ProdutoID, Quantidade 
FROM detalhefatura;
-- Classifique a lista acima por Quantidade decrescente.
SELECT FaturaId, ProdutoID, Quantidade 
FROM detalhefatura 
ORDER BY Quantidade DESC;
-- Filtre a mesma lista apenas para os produtos cuja quantidade esteja entre 50 e 100. 
SELECT FaturaId, ProdutoID, Quantidade 
FROM detalhefatura 
WHERE Quantidade >= 50 
AND Quantidade <= 100;
-- Em outra nova consulta, obtenha uma lista com os seguintes nomes de coluna: Número da fatura (FaturaId), Produto (ProdutoId), Total (Preço Unitário * Quantidade)
SELECT FaturaId AS Fatura, ProdutoID AS Produto, (PrecoUnitario * Quantidade) AS Total 
FROM detalhefatura;