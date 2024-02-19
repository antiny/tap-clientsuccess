1. Install pyenv
2. Install python via pyenv
```
pyenv install 3.8.5
pyenv rehash
pyenv local 3.8.5
```
3. Upgrade pip and install poetry, pipx, meltano
```
pip install --upgrade pip
pip install pipx
pipx ensurepath
pipx install poetry
pipx install meltano
```
4. Install package dependencies via poetry
```
poetry install
```
5. Run tests
```
poetry run pytest
```
