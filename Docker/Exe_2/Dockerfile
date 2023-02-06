FROM ruby:latest
WORKDIR /src/
ENV file="Read_file.json"
ENV version = ["GEM_HOME"]
RUN gem install json
RUN gem install pp
COPY . .
CMD ruby jsonparse.rb Read_file.json
