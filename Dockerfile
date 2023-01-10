FROM ruby:2.7.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set an environment variable to store the app's root path
ENV APP_ROOT /myapp2

# Set the working directory
WORKDIR $APP_ROOT

# Add the current directory to the Docker image
ADD . $APP_ROOT

# Install gems
RUN bundle install

# Expose the app's port
EXPOSE 3000

# Run the app when the container starts
CMD ["rails", "server", "-b", "0.0.0.0"]
