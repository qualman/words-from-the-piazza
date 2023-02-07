FROM ruby:3.2.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.4.6
RUN bundle install

COPY . .

EXPOSE 3000/tcp

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]