.DEFAULT_GOAL := start

.PHONY: build
build:
   docker build --tag=astroneer .

.PHONY: start
start:
   docker run -it --rm astroneer:latest