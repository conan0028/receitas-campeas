#!/bin/zsh

# Diretório base
BASE_DIR="receitas-campeas"

# Estrutura de diretórios e arquivos
STRUCTURE=(
  "src/config/database.ts"
  "src/controllers/cozinheiroController.ts"
  "src/controllers/ingredienteController.ts"
  "src/services/cozinheiroService.ts"
  "src/services/ingredienteService.ts"
  "src/routes/index.ts"
  "src/server.ts"
  "package.json"
  "tsconfig.json"
)

# Criar diretórios e arquivos
for item in $STRUCTURE; do
  # Extrair o diretório do caminho
  dir=${item:h}
  
  # Criar diretório se não existir
  if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
    echo "Diretório criado: $dir"
  fi
  
  # Criar arquivo se não existir
  if [[ ! -f "$item" ]]; then
    touch "$item"
    echo "Arquivo criado: $item"
  fi
done

# Ajustar permissões (leitura, escrita e execução para o usuário atual)
chmod -R u+rwX "$BASE_DIR"

echo "Estrutura criada com sucesso em $BASE_DIR com permissões de leitura, escrita e execução para seu usuário."
