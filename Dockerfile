FROM ruby:3.2

WORKDIR /app

COPY . .

RUN apt-get update -qq && apt-get install -y sqlite3 libsqlite3-dev
RUN gem install bundler
RUN bundle install

EXPOSE 4567

CMD ["ruby", "app.rb", "-o", "0.0.0.0"]
