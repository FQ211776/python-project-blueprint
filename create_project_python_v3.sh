#!/bin/bash
python -m venv env
source env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
python3.12 -m pip install --upgrade pytest flask
