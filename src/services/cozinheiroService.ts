import pool from '../config/database';

export const getCampeoesPorAno = async (ano: number) => {
  const query = `
    WITH contagem_receitas AS (
      SELECT
        c.nome_coz,
        COUNT(r.cod_rec) AS quantidade_receitas
      FROM cozinheiros c
      JOIN receitas r ON c.cpf_coz = r.cpf_coz
      WHERE EXTRACT(YEAR FROM r.dt_criacao_rec) = $1
      GROUP BY c.nome_coz
    ),
    max_receitas AS (
      SELECT MAX(quantidade_receitas) AS max_qnt
      FROM contagem_receitas
    )
    SELECT
      cr.nome_coz,
      cr.quantidade_receitas
    FROM contagem_receitas cr
    JOIN max_receitas mr ON cr.quantidade_receitas = mr.max_qnt;
  `;
  const result = await pool.query(query, [ano]);
  return result.rows;
};

export const getMaisAntigos = async () => {
  const query = `
    WITH cozinheiro_antigo AS (
      SELECT
        cpf_coz,
        nome_coz,
        dt_contrato_coz
      FROM cozinheiros
      WHERE dt_contrato_coz = (SELECT MIN(dt_contrato_coz) FROM cozinheiros)
    )
    SELECT
      ca.nome_coz AS nome_cozinheiro,
      ca.dt_contrato_coz AS data_contrato,
      rc.nome_rest_restcoz AS restaurante_origem,
      cat.desc_categoria AS categoria_receita,
      r.nome_rec AS nome_receita,
      r.dt_criacao_rec AS data_criacao,
      l.titulo_livro
    FROM cozinheiro_antigo ca
    JOIN receitas r ON ca.cpf_coz = r.cpf_coz
    JOIN categorias cat ON r.cod_categoria_rec = cat.cod_categoria
    JOIN livros l ON r.isbn_rec = l.isbn
    LEFT JOIN restaurantes_cozinheiro rc ON ca.cpf_coz = rc.cod_coz_restcoz
    ORDER BY ca.nome_coz, r.nome_rec;
  `;
  const result = await pool.query(query);
  return result.rows;
};