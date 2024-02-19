FROM python:3.8

WORKDIR /usr/src/app

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python3 - && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

COPY ./pyproject.toml ./poetry.lock* ./
COPY ./tap_clientsuccess tap_clientsuccess
COPY ./tests tests
RUN poetry install

ENTRYPOINT [ "poetry", "run", "tap-clientsuccess" ]
CMD [ "--help" ]
