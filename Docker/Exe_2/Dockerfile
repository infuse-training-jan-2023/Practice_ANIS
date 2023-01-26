FROM ruby:latest
WORKDIR /src/
RUN gem install json
RUN gem install pp
COPY . .
CMD ruby jsonparse.rb Read_file.json
