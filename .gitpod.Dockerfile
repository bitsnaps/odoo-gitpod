FROM gitpod/workspace-postgres

USER gitpod

ARG DEBIAN_FRONTEND=noninteractive

RUN sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends apt-utils  && \
    sudo apt-get install -y wkhtmltopdf

RUN pyenv install 3.7.10
RUN pyenv global 3.7.10
