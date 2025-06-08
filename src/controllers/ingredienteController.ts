import { Request, Response } from 'express';
import * as ingredienteService from '../services/ingredienteService.js';

export const buscarReceitasPorIngrediente = async (req: Request, res: Response) => {
  try {
    const nomeIngrediente = req.query.nome as string;
    if (!nomeIngrediente) {
      return res.status(400).json({ error: 'Nome do ingrediente é obrigatório.' });
    }
    const receitas = await ingredienteService.getReceitasPorIngrediente(nomeIngrediente);
    res.json(receitas);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao buscar receitas por ingrediente.' });
  }
};