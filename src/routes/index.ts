import { Router } from 'express';

import * as cozinheiroController from '../controllers/cozinheiroController.js';
import * as ingredienteController from '../controllers/ingredienteController.js';

const router = Router();

// Rotas para Cozinheiros
// @ts-ignore
router.get('/cozinheiros/campeoes/:ano', cozinheiroController.buscarCampeoesPorAno);
router.get('/cozinheiros/mais-antigos', cozinheiroController.buscarMaisAntigos);

// Rota para Ingredientes
// @ts-ignore
router.get('/ingredientes/receitas', ingredienteController.buscarReceitasPorIngrediente);

export default router;