FROM gitpod/workspace-postgres

USER gitpod

RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils

RUN sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y wkhtmltopdf

# ---- Install python packages & Tools ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install git python3 python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less libpng12-0 gdebi -y

# --- Install other required packages (node, less) ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install nodejs npm -y

RUN npm install -g rtlcss
RUN npm install -g less-plugin-clean-css

RUN pyenv install 3.7.10
RUN pyenv global 3.7.10
