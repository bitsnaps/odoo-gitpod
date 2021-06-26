FROM gitpod/workspace-postgres

USER gitpod

RUN sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y wkhtmltopdf
