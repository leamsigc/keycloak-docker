# Keycloak on Docker

### This is for local development

1. [Install Docker](https://docs.docker.com/get-docker/)
2. [Install docker compose](https://docs.docker.com/compose/install/)
3. Copy the `.env-example` file to `.env` and edit it to your needs
4. Run `docker compose up -d` to start the services
5. Edit the `/etc/hosts` file to point `127.0.0.1 keycloak`
6. Open http://Keycloak:8080 in your browser
