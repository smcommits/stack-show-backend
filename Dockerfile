# Set the base image to use
FROM ruby:3.0.1

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       postgresql-client

# Set the working directory
RUN mkdir /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile* /app/

# Install gems
RUN bundle install --jobs 4

# Copy the rest of the application code
COPY . /app/

# Set up the database
RUN bundle exec rails db:create && \
    bundle exec rails db:migrate

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

