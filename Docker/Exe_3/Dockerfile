FROM ruby:latest
WORKDIR /src/
RUN gem install json
RUN gem install test-unit
COPY . .
CMD ruby Json_file_UnitTest.rb
