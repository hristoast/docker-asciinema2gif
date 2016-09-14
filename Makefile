TAG = asciinema2gif:0.4.1-4775c10

.DEFAULT_GOAL := build

build:
	sudo docker build -t $(TAG) .
