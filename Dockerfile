## Dockerfile
FROM ruby:2.5.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs


## Install bundler gem
RUN gem install bundler -v 2.3.27
RUN gem update --system 3.2.3

## Assign a work directory


ENV APP_HOME=/myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
# RUN bundle update --bundler
RUN bundle install

ADD . $APP_HOME

# RUN mkdir /api
# WORKDIR /api

RUN bundle exec middleman build --clean
