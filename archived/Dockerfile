FROM python:3.9.1

WORKDIR /usr/src/app

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python3 -
RUN cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false
RUN poetry --version

COPY ./pyproject.toml ./poetry.lock* ./
COPY ./tap_clientsuccess tap_clientsuccess
RUN poetry install

ENTRYPOINT [ "poetry", "run", "tap-clientsuccess" ]
CMD [ "--help" ]
