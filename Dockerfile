# Use the Ruby 3.1.0 base image
FROM ruby:3.1.0

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem install bundler:2.3.7
RUN bundle install --jobs 4 --retry 3

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000 for the Rails server
EXPOSE 3000

# # Set environment variables
# ENV RAILS_ENV production

# Precompile assets
# RUN bundle exec rake assets:precompile

# Run the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]