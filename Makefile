build:
	docker build -t tap-clientsuccess .

test:
	docker run --rm -it --env-file .env -v $(PWD):/app --entrypoint /bin/bash tap-clientsuccess -c "cd /app && poetry run pytest -vvv"

bash:
	docker run --rm -it --env-file .env -v $(PWD):/app --entrypoint /bin/bash tap-clientsuccess


# Meltano commands

run_tap:
	poetry run tap-clientsuccess --config ./config.json --catalog catalog.json | target-json > state.json

run_tap_config:
	poetry run tap-clientsuccess --config ./config.json --discover > ./catalog.json

run_meltano:
	meltano --log-level=debug elt tap-clientsuccess target-jsonl

show_meltano_config:
	meltano --log-level=debug config tap-clientsuccess

meltano_install:
	pipx install meltano
	meltano --log-level=debug install
	meltano --log-level=debug invoke tap-clientsuccess --version
