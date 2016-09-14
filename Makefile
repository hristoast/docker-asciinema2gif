TAG = asciinema2gif:v0.4.1

.DEFAULT_GOAL := build

build:
	sudo docker build -t $(TAG) .

clean:
	@rm -f *~

gif: url_check
	sudo docker run -v $$(pwd):/a/o --rm asciinema2gif:v0.4.1 $(URL)

url_check:
ifndef URL
	@echo "\n\033[31mPlease provide a valid asciinema URL!"
	@echo "USAGE: \033[91mmake gif URL=https://asciinema.org/api/asciicasts/12345\033[0m\n"
	@exit 1
endif
