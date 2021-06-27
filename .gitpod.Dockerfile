FROM gitpod/workspace-postgres

USER gitpod

RUN sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils wkhtmltopdf

RUN pyenv install 3.7.10
RUN pyenv global 3.7.10
