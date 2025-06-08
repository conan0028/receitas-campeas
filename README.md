# Projeto de Receitas Culinárias - POOBD

Este é um projeto acadêmico full-stack desenvolvido para a disciplina de  
**CMP1611 - Programação Orientada a Objetos com Banco de Dados**, do curso de Ciências de Computação da **PUC Goiás (Pontifícia Universidade Católica de Goiás)**.

O sistema consiste em uma API RESTful (backend) construída com Node.js e TypeScript, que interage com um banco de dados PostgreSQL, e uma interface de usuário (frontend) em HTML, CSS e JavaScript puro para consumir e exibir os dados.

## Funcionalidades

O projeto permite realizar as seguintes consultas:

* **Cozinheiros Campeões:** Listar o(s) cozinheiro(s) com o maior número de receitas criadas em um determinado ano.
* **Receitas por Ingrediente:** Agrupar, por categoria, a quantidade de receitas que utilizam um ingrediente específico.
* **Cozinheiros Mais Antigos:** Exibir o(s) cozinheiro(s) com o contrato de trabalho mais antigo, detalhando suas receitas e os livros onde foram publicadas.
* **Interface Reativa:** Frontend com um painel de controle para realizar as consultas de forma interativa.
* **Modo Escuro:** Alternância de tema (claro/escuro) com a preferência salva no navegador.

## Tecnologias Utilizadas

### Backend
* **Node.js:** Ambiente de execução para o JavaScript no servidor.
* **TypeScript:** Superset do JavaScript que adiciona tipagem estática.
* **Express.js:** Framework para a construção da API RESTful.
* **PostgreSQL:** Sistema de gerenciamento de banco de dados relacional.
* **node-postgres (pg):** Driver para a comunicação entre o Node.js e o PostgreSQL.
* **CORS:** Middleware para habilitar o compartilhamento de recursos entre origens diferentes.

### Frontend
* **HTML5:** Linguagem de marcação para a estrutura da página.
* **CSS3:** Linguagem para estilização, utilizando variáveis CSS para temas.
* **JavaScript (ES6+):** Linguagem para a interatividade, manipulação do DOM e consumo da API via `Fetch API`.

### Ambiente e Ferramentas
* **NVM (Node Version Manager):** Para gerenciar a versão do Node.js e evitar problemas de permissão.
* **Postman:** Utilizado para testar os endpoints da API durante o desenvolvimento.
* **serve:** Pacote para servir os arquivos estáticos do frontend em um servidor local.

## Pré-requisitos

Antes de começar, garanta que você tenha os seguintes softwares instalados:

1. **Node.js e npm:** Recomendamos fortemente a instalação através do **NVM**.
2. **PostgreSQL:** Um servidor PostgreSQL ativo e em execução.
3. **Git:** Para clonar o repositório.

## Como Executar o Projeto

Siga os passos abaixo para configurar e rodar o ambiente de desenvolvimento localmente.

**1. Clone o Repositório**
```bash
git clone <url-do-seu-repositorio>
cd receitas-campeas
```

**2. Configure o Banco de Dados**

Certifique-se de que seu serviço PostgreSQL está rodando.  
Use um cliente de banco de dados (como DBeaver, pgAdmin ou `psql`) para executar os seguintes scripts SQL:

```sql
-- Cria o banco e as tabelas
\i receitas_culinarias.sql

-- Popula com os dados iniciais
\i seed_receitas_campeos.sql
```

**3. Configure o Ambiente Backend**

Instale o NVM e o Node.js (se ainda não tiver feito):

```bash
# Instale o NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Recarregue o terminal ou feche e abra novamente

# Instale e use a versão LTS do Node
nvm install --lts
nvm use --lts
```

Crie o arquivo `.env` na raiz do projeto com suas credenciais do banco de dados:

```env
DB_USER=seu_usuario_postgres
DB_HOST=localhost
DB_NAME=receitas_culinarias
DB_PASSWORD=sua_senha_do_banco
DB_PORT=5432
```

**4. Instale as Dependências**

Instale as dependências do backend:

```bash
npm install
```

Instale o `serve` globalmente para rodar o frontend:

```bash
npm install -g serve
```

**5. Execute a Aplicação**

Você precisará de dois terminais abertos na pasta do projeto:

**No Terminal 1 – Inicie o Backend**
```bash
npm run dev
# A API estará disponível em http://localhost:3000
```

**No Terminal 2 – Inicie o Frontend**
```bash
serve public
# O frontend estará acessível em algo como http://localhost:3001
```

**6. Acesse a Aplicação**

Abra seu navegador e acesse o endereço fornecido pelo comando `serve`, geralmente:

```text
http://localhost:3001
```

## Estrutura de Pastas

```
.
├── public/              # Contém todos os arquivos do frontend
│   ├── styles/
│   │   └── main.css     # Estilos
│   ├── scripts/
│   │   └── main.js      # Lógica do cliente
│   └── index.html       # Estrutura da página
├── src/                 # Contém todos os arquivos do backend
│   ├── config/
│   ├── controllers/
│   ├── routes/
│   ├── services/
│   └── server.ts        # Ponto de entrada da API
├── .env                 # Arquivo para variáveis de ambiente (local)
├── package.json
└── README.md
```

## Endpoints da API

- `GET /api/cozinheiros/campeoes/:ano`  
  Retorna o(s) cozinheiro(s) com mais receitas no ano especificado.

- `GET /api/ingredientes/receitas?nome={ingrediente}`  
  Retorna a contagem de receitas por categoria para um dado ingrediente.

- `GET /api/cozinheiros/mais-antigos`  
  Retorna o(s) cozinheiro(s) com contrato mais antigo e suas receitas.

## Scripts de Banco de Dados

O diretório `database/` centraliza todos os scripts SQL necessários para o gerenciamento do ciclo de vida do banco de dados. Para uma configuração inicial ou para resetar o ambiente, os scripts devem ser executados na ordem apropriada.

* **`create_tables.sql`**: Este script contém todas as instruções `CREATE TABLE` e as definições de chaves primárias e estrangeiras. Ele é responsável por gerar todo o esquema do banco de dados a partir do zero. **Deve ser o primeiro script a ser executado**.

* **`populate_data.sql`**: Após a criação da estrutura, este script (`seed`) deve ser executado para popular as tabelas com um conjunto de dados iniciais, permitindo que a aplicação seja testada e demonstrada.

* **`clean_database.sql`**: Um script de utilidade para o ambiente de desenvolvimento. Ele remove todos os registros de todas as tabelas (`TRUNCATE`), permitindo um reset rápido do banco de dados sem a necessidade de apagar e recriar as tabelas. É ideal para quando se deseja testar com uma nova carga de dados.