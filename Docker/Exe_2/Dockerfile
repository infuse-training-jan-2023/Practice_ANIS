FROM ruby:latest
WORKDIR /src/
ENV num1=8
ENV num2=10
RUN gem install json
RUN gem install pp
COPY . .
CMD ruby jsonparse.rb Read_file.json
