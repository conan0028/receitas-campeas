import { Request, Response } from 'express';
import * as cozinheiroService from '../services/cozinheiroService.js';

export const buscarCampeoesPorAno = async (req: Request, res: Response) => {
  try {
    const ano = parseInt(req.params.ano);
    if (isNaN(ano)) {
      return res.status(400).json({ error: 'Ano inválido.' });
    }
    const cozinheiros = await cozinheiroService.getCampeoesPorAno(ano);
    res.json(cozinheiros);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erro ao buscar cozinheiros campeões.' });
  }
};

export const buscarMaisAntigos = async (req: Request, res: Response) => {
  try {
    const cozinheiros = await cozinheiroService.getMaisAntigos();
    res.json(cozinheiros);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Erro ao buscar cozinheiros mais antigos.' });
  }
};