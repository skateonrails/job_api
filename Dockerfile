FROM ruby:2.3-slim
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev git
ENV INSTALL_PATH /job_api
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs
COPY . .

CMD foreman start
