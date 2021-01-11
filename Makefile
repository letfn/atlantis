SHELL := /bin/bash

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

build: # Build defn/atlantis
	docker build -t defn/atlantis .

push: # Push defn/atlantis
	docker push defn/atlantis

pull : # Pull defn/atlantis
	docker pull defn/atlantis

bash: # Run bash shell with defn/atlantis
	docker run --rm -ti --entrypoint bash defn/atlantis

clean:
	docker-compose down --remove-orphans

up:
	docker-compose up -d --remove-orphans

down:
	docker-compose rm -f -s

recreate:
	$(MAKE) clean
	$(MAKE) up

logs:
	docker-compose logs -f

pr:
	gh pr create --web
