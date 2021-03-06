FROM ubuntu:18.04
FROM ruby:2.3.3

MAINTAINER Thiago Soares <thiagosoarescruz0@gmail.com>

# Install Build essentials and MySQL client
RUN apt-get update -qq && apt-get install -y build-essential \
    libpq-dev mysql-client ca-certificates curl\
    libssl-dev apt-utils mysql-client && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Set some config
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_ENV=development

# Mkdir
RUN mkdir -p /home/app

# Workdir
WORKDIR /home/app/

# ADD gems
ADD Gemfile /home/app/Gemfile
ADD Gemfile.lock /home/app/Gemfile.lock

#GEM install bundle
RUN gem install bundle

#Run bundle
RUN bundle install

# Add the Rails app
ADD . /home/app

# Create user and group
RUN groupadd --gid 9999 app && \
    useradd --uid 9999 --gid app app && \
    chown -R app:app /home/app

#Expose app port
EXPOSE 80 3000

# Save timestamp of image building
RUN date -u > BUILD_TIME
