#!/bin/bash

# Nombre del entorno virtual
ENV_DIR="env"

# Crear el entorno virtual
python -m venv $ENV_DIR

# Activar el entorno virtual
source $ENV_DIR/bin/activate

# Instalar dependencias si el archivo requirements.txt existe
if [ -f "requirements.txt" ]; then
  pip install -r requirements.txt
else
  echo "No se encontró el archivo requirements.txt. No se instalaron dependencias."
fi

echo "El entorno virtual se ha creado y activado correctamente."
