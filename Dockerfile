FROM ruby:2.3-slim
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev git curl
ENV INSTALL_PATH /job_api
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
ADD Gemfile Gemfile.lock ./
RUN bundle install --binstubs
ADD . .
