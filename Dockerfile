FROM ubuntu:14.04.5

RUN apt-get update \
    && apt-get install -y gifsicle git imagemagick npm
RUN ln -fs /usr/bin/nodejs /usr/bin/node

ENV PHANTOMJS_CDNURL=http://cnpmjs.org/downloads

RUN git clone https://github.com/tav/asciinema2gif.git
WORKDIR /asciinema2gif

RUN npm install -u phantomjs2
RUN ln -fs /asciinema2gif/node_modules/phantomjs2/lib/phantom/bin/phantomjs /usr/bin/

RUN chmod +x asciinema2gif
ENV TERM=xterm

ENTRYPOINT ./asciinema2gif
