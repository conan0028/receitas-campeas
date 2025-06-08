// O 'defer' no script HTML garante que este código rode após o HTML ser carregado.
const API_BASE_URL = 'http://localhost:3000/api';

// Referências aos elementos do HTML
const formCampeoes = document.getElementById('form-campeoes');
const formIngredientes = document.getElementById('form-ingredientes');
const btnAntigos = document.getElementById('btn-antigos');
const resultadosDiv = document.getElementById('resultados');
const toggleButton = document.getElementById('toggle-dark-mode');
const body = document.body;

// --- LÓGICA DO MODO ESCURO ---
// Função para aplicar o tema e mudar o ícone
function applyTheme(theme) {
  if (theme === 'dark') {
    body.classList.add('dark-mode');
    toggleButton.textContent = '☀️'; // Sol
  } else {
    body.classList.remove('dark-mode');
    toggleButton.textContent = '🌙'; // Lua
  }
}

// Verifica se há um tema salvo no localStorage ao carregar a página
const savedTheme = localStorage.getItem('theme') || 'light';
applyTheme(savedTheme);

// Evento de clique no botão de alternância
toggleButton.addEventListener('click', () => {
  const currentTheme = body.classList.contains('dark-mode') ? 'light' : 'dark';
  applyTheme(currentTheme);
  localStorage.setItem('theme', currentTheme);
});
// --- FIM DA LÓGICA DO MODO ESCURO ---


// Função genérica para buscar dados na API
async function fetchData(url) {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Erro na rede: ${response.statusText}`);
    }
    return await response.json();
  } catch (error) {
    displayError(`Não foi possível buscar os dados: ${error.message}`);
    return null;
  }
}

// Funções para exibir os dados na tela
function displayError(message) {
  resultadosDiv.innerHTML = `<div class="mensagem erro">${message}</div>`;
}

function displayInfo(message) {
  resultadosDiv.innerHTML = `<div class="mensagem info">${message}</div>`;
}

function createTable(headers, data) {
  if (data.length === 0) {
    displayInfo('Nenhum resultado encontrado para esta consulta.');
    return;
  }

  const table = document.createElement('table');

  // Cabeçalho da tabela
  const thead = table.createTHead();
  const headerRow = thead.insertRow();
  headers.forEach(headerText => {
    const th = document.createElement('th');
    th.textContent = headerText;
    headerRow.appendChild(th);
  });

  // Corpo da tabela
  const tbody = table.createTBody();
  data.forEach(item => {
    const row = tbody.insertRow();
    Object.values(item).forEach(text => {
      const cell = row.insertCell();
      // Formata a data se for uma string de data/hora
      const isDate = typeof text === 'string' && text.match(/\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}/);
      cell.textContent = isDate ? new Date(text).toLocaleDateString('pt-BR') : text;
    });
  });

  resultadosDiv.innerHTML = '';
  resultadosDiv.appendChild(table);
}

// "Listeners" de eventos das consultas
formCampeoes.addEventListener('submit', async (event) => {
  event.preventDefault();
  const ano = document.getElementById('input-ano').value;
  if (!ano) return;
  displayInfo('Buscando campeões...');
  const data = await fetchData(`${API_BASE_URL}/cozinheiros/campeoes/${ano}`);
  if (data) {
    createTable(['Nome do Cozinheiro', 'Quantidade de Receitas'], data);
  }
});

formIngredientes.addEventListener('submit', async (event) => {
  event.preventDefault();
  const ingrediente = document.getElementById('input-ingrediente').value;
  if (!ingrediente) return;
  displayInfo('Buscando receitas por ingrediente...');
  const data = await fetchData(`${API_BASE_URL}/ingredientes/receitas?nome=${ingrediente}`);
  if (data) {
    createTable(['Ingrediente', 'Categoria', 'Quantidade de Receitas'], data);
  }
});

btnAntigos.addEventListener('click', async () => {
  displayInfo('Buscando cozinheiros mais antigos...');
  const data = await fetchData(`${API_BASE_URL}/cozinheiros/mais-antigos`);
  if (data) {
    createTable(['Nome', 'Contrato', 'Restaurante', 'Categoria', 'Receita', 'Criação', 'Livro'], data);
  }
});