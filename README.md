# docker-asciinema2gif

Run asciinema2gif in a docker container.

## Usage

After cloning this repo, `cd` into it and build the image

    make

Then, run it:

    make gif URL=https://asciinema.org/api/asciicasts/12345

Or:

    docker run -v $(pwd):/a/o --rm asciinema2gif:v0.4.1 https://asciinema.org/api/asciicasts/12345

The above command will dump a file called `asciicast.gif` in your `pwd`.
