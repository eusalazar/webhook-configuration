# Webhook Configuration

This project sets up a webhook configuration to automate certain tasks when a POST request is received at the `/payload` endpoint.

## Contents

- [Server Configuration](#server-configuration)
- [Docker Configuration](#docker-configuration)
- [Usage](#usage)
- [Contributing](#contributing)

## Server Configuration

The `server.rb` file contains a Sinatra server that listens for POST requests at the `/payload` endpoint. Upon receiving a request, it interprets the JSON body of the request and performs a series of actions, including:

1. Changing the working directory to `/root/porfolio-dev`.
2. Stopping Docker containers using the `dc down` command.
3. Updating the git repository using `git pull --rebase`.
4. Running the npm build script with `npm run build`.
5. Starting Docker containers with build using `dc up --build`.

## Docker Configuration

The `Dockerfile` defines the Docker image used to run the Sinatra server. It is based on the latest Ruby image. It copies files from the `src/` folder to the working directory `/usr/src/app`, installs necessary gems (`sinatra`, `json`, `puma`), and exposes port 3601.

## docker-compose.yml

The `docker-compose.yml` file defines the Docker services required to run the application. It configures the `ruby-admin` container with the necessary environment variables for the Sinatra server and sets up the required ports and volumes.

## Usage

To use this webhook configuration, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Ensure Docker and Node.js are installed on your system.
4. Run `npm install` to install dependencies.
5. Start the Docker containers using `docker-compose up`.

