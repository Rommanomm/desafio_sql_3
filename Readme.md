# Projeto SQL - Banco de dados Relacional de E-commerce

Este projeto consiste na construção e consulta de um banco de dados relacional para um sistema de E-commerce, com base em um modelo conceitual previamente elaborado no projeto desafio_sql. A estrutura abrange as principais entidades do domínio, como produtos, clientes, pedidos, fornecedores, vendedores, estoques, pagamentos e entregas.

## Objetivos

- Criar um banco de dados funcional a partir de um esquema relacional
- Realizar consultas SQL utilizando `SELECT`, `JOIN`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, `EXISTS`, `NOT EXISTS`, subqueries e derivação de atributos

## Consultas Desenvolvidas

1. **Quantos pedidos foram feitos por cada cliente?**  
   Usa `GROUP BY` para contar os pedidos por cliente.

2. **Algum vendedor também é fornecedor?**  
   Usa `JOIN` para verificar sobreposição de nomes entre vendedores e fornecedores.

3. **Relação de produtos, fornecedores e estoques**  
   Combina múltiplas tabelas com `JOIN` e `LEFT JOIN` para mostrar fornecedores e localização dos produtos.

4. **Relação de nomes dos fornecedores e nomes dos produtos**  
   Exibe quais produtos são fornecidos por quais empresas.

5. **Produtos com valor acima de R$200 ordenados por valor**  
   Utiliza `WHERE` e `ORDER BY` para filtrar e organizar.

6. **Calcular frete com taxa adicional de 10%**  
   Aplica uma expressão aritmética para gerar atributo derivado.

7. **Clientes com mais de um pedido**  
   Filtra com `HAVING` após `GROUP BY`.

8. **Pedidos com e sem entrega (LEFT JOIN)**  
   Mostra todos os pedidos, incluindo os sem entrega registrada.

9. **Produtos e seus pedidos (RIGHT JOIN)**  
   Exibe os produtos e em quais pedidos aparecem.

10. **Clientes que fizeram pedido com frete acima da média**  
    Utiliza `IN` com subquery aninhada para filtrar.

11. **Quantidade total vendida por produto**  
    Soma as vendas por produto com `SUM` e `GROUP BY`.

12. **Fornecedores que fornecem pelo menos um produto (EXISTS)**  
    Verifica se existem registros relacionados para exibição.

13. **Produtos que não estão em nenhum estoque (NOT EXISTS)**  
    Lista produtos sem associação a estoque.

14. **Vendedores e os produtos que vendem**  
    Usa `JOIN` para cruzar dados entre vendedores e produtos.

15. **Produtos com preço acima da média**  
    Subquery para calcular a média e filtrar os mais caros.

## Como utilizar

1. Execute o script de criação das tabelas no MySQL.
2. Insira os dados de exemplo (já fornecidos nos arquivos `.sql`).
3. Execute as queries no seu ambiente SQL para visualizar os resultados.

