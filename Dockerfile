FROM ruby:latest

WORKDIR /usr/src/app
COPY src/ .
RUN gem install sinatra
RUN gem install json
RUN gem install puma

EXPOSE 3601

CMD ruby src/server.rb -p $VIRTUAL_PORT