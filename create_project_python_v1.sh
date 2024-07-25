#!/bin/bash

# Nombre del proyecto (opcional, se preguntará si no se proporciona)
project_name=${1:-"my_project"}

# Directorio del proyecto (se creará si no existe)
project_dir="$HOME/projects/$project_name"

# Verificar si el proyecto ya existe
if [ -d "$project_dir" ]; then
    echo "El proyecto '$project_name' ya existe."
    code-insiders "$project_dir"
else
    # Crear el directorio del proyecto
    mkdir -p "$project_dir"
    echo "Proyecto '$project_name' creado en $project_dir."

    # Crear y activar el entorno virtual
    python3 -m venv "$project_dir/venv"
    source "$project_dir/venv/bin/activate"
    echo "Entorno virtual creado y activado."

    # Instalar dependencias (opcional, descomenta si tienes un archivo requirements.txt)
    # pip install -r requirements.txt

    # Abrir VSCode en el DevContainer
    code-insiders "$project_dir"
fi
