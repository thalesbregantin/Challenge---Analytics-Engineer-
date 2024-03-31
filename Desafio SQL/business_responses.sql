
/* 1. Liste os usuários que fazem aniversário hoje e cujo número 
de vendas realizadas em janeiro de 2020 é superior a 1.500.  */

SELECT
    C.nome,
    C.sobrenome,
    C.email
FROM
    Cliente AS C
JOIN (
    SELECT
        V.vendedor_id,
        SUM(V.preco_venda) AS total_vendas
    FROM
        Vendas AS V
    WHERE
        V.data_venda BETWEEN '2020-01-01' AND '2020-01-31'
    GROUP BY
        V.vendedor_id
    HAVING
        SUM(V.preco_venda) > 1500
) AS VendasJaneiro ON C.id = VendasJaneiro.vendedor_id
WHERE
    MONTH(C.data_nascimento) = MONTH(CURRENT_DATE)
    AND DAY(C.data_nascimento) = DAY(CURRENT_DATE);



/* 1. 2. Para cada mês de 2020 são solicitados os 5 principais usuários que mais venderam ($) 
na categoria Celulares. São obrigatórios o mês e ano da análise, nome e sobrenome do vendedor, 
quantidade de vendas realizadas, quantidade de produtos vendidos e valor total transacionado .      */

SELECT
    EXTRACT(YEAR FROM V.data_venda) AS ano,
    EXTRACT(MONTH FROM V.data_venda) AS mes,
    C.nome,
    C.sobrenome,
    COUNT(V.id) AS quantidade_vendas,
    SUM(V.preco_venda) AS valor_total_vendas
FROM
    Vendas AS V
JOIN
    Item AS I ON V.item_id = I.id
JOIN
    Categoria AS Cat ON I.categoria_id = Cat.id
JOIN
    Cliente AS C ON V.vendedor_id = C.id
WHERE
    Cat.nome = 'Celulares'
    AND EXTRACT(YEAR FROM V.data_venda) = 2020
GROUP BY
    ano,
    mes,
    C.id
ORDER BY
    mes,
    valor_total_vendas DESC
LIMIT 5;


/* É solicitada uma nova tabela a ser preenchida com o preço e status dos Itens no final do dia.
 Lembre-se de que deve ser reprocessável . Vale ressaltar que na tabela Item teremos apenas o último
  status informado pelo PK definido. (Pode ser resolvido através de StoredProcedure)         */


DELIMITER //

CREATE PROCEDURE AtualizarPrecoStatusItens()
BEGIN
    -- Atualiza o preço e status dos itens no final do dia
    UPDATE Item
    SET preco = (SELECT novo_preco FROM NovoPrecoItem WHERE Item.id = NovoPrecoItem.item_id),
        status = (SELECT novo_status FROM NovoStatusItem WHERE Item.id = NovoStatusItem.item_id)
    WHERE EXISTS (
        SELECT 1
        FROM NovoPrecoItem
        WHERE Item.id = NovoPrecoItem.item_id
    ) OR EXISTS (
        SELECT 1
        FROM NovoStatusItem
        WHERE Item.id = NovoStatusItem.item_id
    );
    
    -- Limpa as tabelas temporárias
    DELETE FROM NovoPrecoItem;
    DELETE FROM NovoStatusItem;
END//

DELIMITER ;
