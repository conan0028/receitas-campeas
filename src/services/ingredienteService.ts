import pool from '../config/database';

export const getReceitasPorIngrediente = async (nomeIngrediente: string) => {
  const query = `
    SELECT
      i.nome_ingred,
      c.desc_categoria,
      COUNT(r.cod_rec) AS quantidade_receitas
    FROM ingredientes i
    JOIN ingredientes_receita ir ON i.cod_ingred = ir.cod_ing_ingrec
    JOIN receitas r ON ir.cod_rec_ingrec = r.cod_rec
    JOIN categorias c ON r.cod_categoria_rec = c.cod_categoria
    WHERE i.nome_ingred ILIKE $1
    GROUP BY i.nome_ingred, c.desc_categoria
    ORDER BY c.desc_categoria;
  `;
  const result = await pool.query(query, [`%${nomeIngrediente}%`]);
  return result.rows;
};