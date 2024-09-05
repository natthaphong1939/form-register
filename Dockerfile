# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.1
FROM ruby:$RUBY_VERSION-alpine as base

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages needed to build gems
RUN apk add --no-cache build-base git vips-dev libc6-compat nodejs yarn

# Copy Gemfile, Gemfile.lock, and the entire app code in one step
COPY Gemfile Gemfile.lock ./
COPY . .

# Install application gems and clean up
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Precompile bootsnap cache
RUN bundle exec bootsnap precompile app/ lib/

# Precompile Rails assets using a dummy SECRET_KEY_BASE
RUN RAILS_LOG_TO_STDOUT=1 RAILS_ENV=production SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile


# Final stage for app image
FROM base

# Install packages needed for deployment
RUN apk add --no-cache curl sqlite-libs vips

# Copy built artifacts: gems, application, and runtime dependencies in one step
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Run and own only the runtime files as a non-root user for security
RUN adduser -D rails && \
    chown -R rails:rails db log storage tmp
USER rails:rails

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server", "-p", "3000", "-b", "0.0.0.0"]
