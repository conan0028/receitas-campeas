-- Insert data into independent tables

-- Cozinheiros
INSERT INTO cozinheiros (cpf_coz, nome_coz, nome_fantasia, dt_contrato_coz, salario_coz) VALUES
('11122233344', 'Ana Silva', 'Chef Ana', '2020-01-15', 50000),
('55566677788', 'Bruno Costa', 'Brunos Kitchen', '2019-03-20', 55000),
('99988877766', 'Carla Dias', 'Carlas Delights', '2021-06-01', 48000),
('33344455511', 'Daniela Rocha', 'Danis Dishes', '2018-11-10', 60000),
('22211133344', 'Eduardo Lima', 'EduCooks', '2022-02-28', 52000),
('77744411122', 'Fernanda Souza', 'Fezinha Culinaria', '2023-01-05', 49000);

-- Degustadores
INSERT INTO degustadores (cpf_deg, nome_deg, dt_contrato_deg, salario_deg) VALUES
('10120230340', 'Gustavo Pereira', '2022-04-10', 40000),
('12345678900', 'Helena Almeida', '2023-07-22', 42000),
('98765432100', 'Igor Rodrigues', '2021-11-01', 38000);

-- Editores
INSERT INTO editores (cpf_edit, nome_edit, dt_contrato_edit, salario_edit) VALUES
('40450560670', 'Julia Mendes', '2021-09-15', 45000),
('70780890910', 'Kleber Nunes', '2022-12-01', 47000);

-- Livros
INSERT INTO livros (titulo_livro, isbn) VALUES
('Sabores da Ana', 1001),
('Culinária do Bruno', 1002),
('Receitas de Família', 1003),
('Doces e Sobremesas', 1004),
('Cozinha Contemporânea', 1005),
('Aventuras na Cozinha', 1006);

-- Restaurantes
INSERT INTO restaurantes (nome_rest, endereco) VALUES
('Sabor Divino', 'Rua das Flores, 123'),
('Cantinho Gourmet', 'Av. Central, 456'),
('Delícias do Mar', 'Praça da Sé, 789'),
('O Gosto Perfeito', 'Alameda dos Anjos, 101');

-- Categorias
INSERT INTO categorias (cod_categoria, desc_categoria) VALUES
(1, 'Salgados'),
(2, 'Doces'),
(3, 'Pratos Principais'),
(4, 'Sobremesas'),
(5, 'Massas'),
(6, 'Vegetariano');

-- Ingredientes
INSERT INTO ingredientes (cod_ingred, nome_ingred) VALUES
(101, 'Farinha de Trigo'),
(102, 'Ovo'),
(103, 'Açúcar'),
(104, 'Leite'),
(105, 'Sal'),
(106, 'Manteiga'),
(107, 'Chocolate'),
(108, 'Frango'),
(109, 'Tomate'),
(110, 'Cebola'),
(111, 'Batata');

-- Empregados_rg
INSERT INTO empregados_rg (rg, salario) VALUES
('1234567-8', 30000),
('8765432-1', 35000);

-- Receitas
INSERT INTO receitas (cod_rec, nome_rec, dt_criacao_rec, cod_categoria_rec, cpf_coz, isbn_rec) VALUES
(1, 'Bolo de Chocolate da Ana', '2023-03-10', 4, '11122233344', 1001),
(2, 'Frango Xadrez da Ana', '2023-04-20', 3, '11122233344', 1001),
(3, 'Torta de Limão da Ana', '2023-05-01', 4, '11122233344', 1001),
(4, 'Macarrão com Brócolis', '2023-01-15', 5, '55566677788', 1002),
(5, 'Salada Colorida', '2023-02-28', 6, '99988877766', 1003),
(6, 'Feijoada Completa', '2024-03-05', 3, '22211133344', 1005),
(7, 'Pudim de Leite Condensado', '2024-04-12', 4, '22211133344', 1005),
(8, 'Risoto de Cogumelos', '2024-05-20', 3, '22211133344', 1005),
(9, 'Bife a Rolê', '2024-06-01', 3, '22211133344', 1005),
(10, 'Moqueca de Peixe', '2023-07-07', 3, '11122233344', 1001),
(11, 'Brigadeiro Gourmet', '2024-01-20', 2, '55566677788', 1002),
(12, 'Sopa de Legumes', '2024-02-14', 6, '99988877766', 1003),
(13, 'Lasanha à Bolonhesa', '2023-09-01', 5, '33344455511', 1004),
(14, 'Coxinha de Frango', '2024-10-10', 1, '77744411122', 1006);


-- Inclui
INSERT INTO inclui (cod_rec_inc, titulo_liv_inc) VALUES
(1, 'Sabores da Ana'),
(2, 'Sabores da Ana'),
(3, 'Sabores da Ana'),
(4, 'Culinária do Bruno'),
(5, 'Receitas de Família'),
(6, 'Cozinha Contemporânea'),
(7, 'Cozinha Contemporânea'),
(8, 'Cozinha Contemporânea'),
(9, 'Cozinha Contemporânea'),
(10, 'Sabores da Ana'),
(11, 'Culinária do Bruno'),
(12, 'Receitas de Família'),
(13, 'Doces e Sobremesas'),
(14, 'Aventuras na Cozinha');

-- Ingredientes_receita
INSERT INTO ingredientes_receita (cod_rec_ingrec, cod_ing_ingrec, quant_ingrec, med_ingrec) VALUES
(1, 101, 250.00, 'g'), (1, 103, 200.00, 'g'), (1, 107, 150.00, 'g'),
(2, 108, 500.00, 'g'), (2, 109, 2.00, 'unid'), (2, 110, 1.00, 'unid'),
(3, 101, 300.00, 'g'), (3, 102, 3.00, 'unid'), (3, 104, 200.00, 'ml'),
(4, 101, 400.00, 'g'), (4, 106, 50.00, 'g'), (4, 110, 1.00, 'unid'),
(5, 109, 3.00, 'unid'), (5, 110, 1.00, 'unid'),
(6, 108, 800.00, 'g'), (6, 105, 10.00, 'g'),
(7, 104, 500.00, 'ml'), (7, 103, 300.00, 'g'),
(8, 110, 1.00, 'unid'), (8, 105, 5.00, 'g'),
(9, 108, 600.00, 'g'), (9, 109, 2.00, 'unid'),
(10, 105, 10.00, 'g'), (10, 110, 1.00, 'unid'),
(11, 107, 200.00, 'g'), (11, 103, 100.00, 'g'),
(12, 111, 500.00, 'g'), (12, 110, 1.00, 'unid'),
(13, 101, 500.00, 'g'), (13, 108, 300.00, 'g'),
(14, 108, 400.00, 'g'), (14, 110, 1.00, 'unid');

-- Restaurantes_cozinheiro
INSERT INTO restaurantes_cozinheiro (cod_coz_restcoz, nome_rest_restcoz, dt_contratacao) VALUES
('11122233344', 'Sabor Divino', '2020-01-15'),
('55566677788', 'Cantinho Gourmet', '2019-03-20'),
('99988877766', 'Delícias do Mar', '2021-06-01'),
('33344455511', 'O Gosto Perfeito', '2018-11-10'),
('22211133344', 'Sabor Divino', '2022-02-28');

-- Testa
INSERT INTO testa (cod_rec_test, cpf_deg_test, dt_test, nota_test) VALUES
(1, '10120230340', '2023-03-20', 9),
(2, '12345678900', '2023-05-01', 8),
(3, '98765432100', '2023-05-10', 9),
(6, '10120230340', '2024-03-15', 10),
(7, '12345678900', '2024-04-20', 9),
(8, '98765432100', '2024-05-25', 10);

-- Possui
INSERT INTO possui (cod_rec_pos, cpf_edit_pos) VALUES
(1, '40450560670'),
(2, '40450560670'),
(3, '40450560670'),
(4, '70780890910'),
(5, '40450560670'),
(6, '70780890910'),
(7, '70780890910'),
(8, '70780890910'),
(9, '70780890910'),
(10, '40450560670'),
(11, '70780890910'),
(12, '40450560670'),
(13, '70780890910'),
(14, '40450560670');

