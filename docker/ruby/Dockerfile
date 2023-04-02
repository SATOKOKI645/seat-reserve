FROM ruby:3.1.2

RUN apt update -qq && apt install -y postgresql-client
WORKDIR /usr/src
COPY Gemfile /usr/src/Gemfile
COPY Gemfile.lock /usr/src/Gemfile.lock

ARG RUBYGEMS_VERSION=3.3.20

RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install

COPY . ./usr/src

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]