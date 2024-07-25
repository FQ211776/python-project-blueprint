#!/bin/bash

# Nombre del proyecto (opcional, se preguntará si no se proporciona)
project_name=${1:-"my_project"}

# Directorio del proyecto (se creará si no existe)
project_dir="$HOME/projects/$project_name"

# Verificar si el proyecto ya existe
if [ -d "$project_dir" ]; then
  echo "El proyecto '$project_name' ya existe."
else
  # Crear el directorio del proyecto
  mkdir -p "$project_dir"
  echo "Proyecto '$project_name' creado en $project_dir."

  # Copiar archivos del blueprint al nuevo proyecto
  cp -r blueprint/* "$project_dir"
  echo "Archivos del blueprint copiados al proyecto."

  # Crear y activar el entorno virtual
  python3.12 -m venv "$project_dir/venv" # Usar Python 3.12
  source "$project_dir/venv/bin/activate"
  echo "Entorno virtual creado y activado."

  # Instalar dependencias (ahora obligatorio)
  pip install -r "$project_dir/requirements.txt"
  echo "Dependencias instaladas."
fi

cd "$project_dir"
git init
echo "Repositorio Git inicializado."

# Abrir VSCode en el proyecto (independientemente de si ya existía)
code-insiders "$project_dir"
