FROM node:6.5.0-slim

# Install dependencies
RUN apt-get update \
    && apt-get install -y bzip2 gifsicle git imagemagick

# Clone my fork of asciinema2gif, which works with self-hosted players
RUN git clone https://github.com/hristoast/asciinema2gif.git a
WORKDIR /a

# Install PhantomJS
ENV PHANTOMJS_CDNURL=http://cnpmjs.org/downloads
RUN npm install -u phantomjs2
RUN ln -fs /a/node_modules/phantomjs2/lib/phantom/bin/phantomjs /usr/bin/

# Set up to run asciinema2gif
RUN mkdir o
ENV TERM=xterm

# Run the asciinema2gif
ENTRYPOINT ["./asciinema2gif", "-o", "./o"]
