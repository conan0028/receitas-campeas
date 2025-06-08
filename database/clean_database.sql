-- Este script remove todos os dados das tabelas, mas mantém a estrutura.
-- O "RESTART IDENTITY" zera a contagem dos IDs autoincrementais.
-- O "CASCADE" garante que as tabelas sejam truncadas na ordem correta,
-- respeitando as chaves estrangeiras.

TRUNCATE TABLE
    cozinheiros,
    degustadores,
    editores,
    livros,
    restaurantes,
    categorias,
    ingredientes,
    empregados_rg,
    receitas,
    inclui,
    ingredientes_receita,
    restaurantes_cozinheiro,
    testa,
    possui
RESTART IDENTITY CASCADE;