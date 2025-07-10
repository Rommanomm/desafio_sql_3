-- Quantos pedidos foram feitos por cada cliente?
SELECT c.nome, COUNT(p.idPedido) AS total_pedidos
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.nome;

-- Algum vendedor também é fornecedor? (Verificação por nome)
SELECT ve.razaoSocial AS vendedor, f.razaoSocial AS fornecedor
FROM VendedorExterno ve
JOIN Fornecedor f ON ve.razaoSocial = f.razaoSocial;

-- Relação de produtos, fornecedores e estoques
SELECT p.descricao AS produto, f.razaoSocial AS fornecedor, e.local AS estoque
FROM Produtos p
JOIN Disponibilizando d ON p.idProdutos = d._idProdutos
JOIN Fornecedor f ON f.idFornecedor = d._idFornecedor
LEFT JOIN Produtos_has_Estoque pe ON p.idProdutos = pe.Produtos_idProdutos
LEFT JOIN Estoque e ON pe.Estoque_idEstoque = e.idEstoque;

-- Relação de nomes dos fornecedores e produtos
SELECT f.razaoSocial, p.descricao
FROM Fornecedor f
JOIN Disponibilizando d ON f.idFornecedor = d._idFornecedor
JOIN Produtos p ON d._idProdutos = p.idProdutos;

-- Produtos com valor acima de 200 ordenados por valor
SELECT * FROM Produtos
WHERE valor > 200
ORDER BY valor DESC;

-- Calcular frete com taxa adicional de 10%
SELECT idPedido, frete, frete * 1.10 AS frete_com_taxa FROM Pedido;

-- Clientes com mais de 1 pedido (HAVING)
SELECT c.nome, COUNT(p.idPedido) AS total_pedidos
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.nome
HAVING COUNT(p.idPedido) > 1;

-- Pedidos com e sem entrega (LEFT JOIN)
SELECT p.idPedido, p.status, e.status AS status_entrega
FROM Pedido p
LEFT JOIN Entrega e ON p.Entrega_idEntrega = e.idEntrega;

-- Produtos e seus pedidos (RIGHT JOIN)
SELECT pr.descricao, pp.quantidade, pd.idPedido
FROM Pedido_has_Produtos pp
RIGHT JOIN Produtos pr ON pr.idProdutos = pp.Produtos_idProdutos
JOIN Pedido pd ON pd.idPedido = pp.Pedido_idPedido;

-- Clientes que fizeram pedido com frete acima da média
SELECT nome FROM Cliente
WHERE idCliente IN (
    SELECT Cliente_idCliente FROM Pedido
    WHERE frete > (SELECT AVG(frete) FROM Pedido)
);

-- Quantidade total vendida por produto
SELECT p.descricao, SUM(pp.quantidade) AS total_vendido
FROM Produtos p
JOIN Pedido_has_Produtos pp ON p.idProdutos = pp.Produtos_idProdutos
GROUP BY p.descricao;

-- Fornecedores que fornecem pelo menos um produto (EXISTS)
SELECT f.razaoSocial
FROM Fornecedor f
WHERE EXISTS (
    SELECT 1 FROM Disponibilizando d
    WHERE d._idFornecedor = f.idFornecedor
);

-- Produtos que não estão em nenhum estoque (NOT EXISTS)
SELECT p.descricao FROM Produtos p
WHERE NOT EXISTS (
    SELECT 1 FROM Produtos_has_Estoque pe
    WHERE pe.Produtos_idProdutos = p.idProdutos
);

-- Vendedores e os produtos que vendem
SELECT ve.razaoSocial AS vendedor, p.descricao AS produto
FROM VendedorExterno ve
JOIN Produto_VendedorExterno pve ON ve.idVendedorExterno = pve.VendedorExterno_idVendedorExterno
JOIN Produtos p ON p.idProdutos = pve.Produtos_idProdutos;

-- Produtos com preço acima da média
SELECT descricao, valor FROM Produtos
WHERE valor > (SELECT AVG(valor) FROM Produtos);
