FROM node:6.5.0-slim

# Install dependencies
RUN apt-get update \
    && apt-get install -y bzip2 gifsicle git imagemagick

# Clone asciinema2gif, check out the latest release
RUN git clone -b v0.4.1 https://github.com/tav/asciinema2gif.git a
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
