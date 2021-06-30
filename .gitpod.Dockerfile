FROM gitpod/workspace-postgres

USER gitpod

RUN sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y wkhtmltopdf

# ---- Install python packages & Tools ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install git python3 python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less gdebi -y

# --- Install other required packages (node, less) ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install nodejs npm -y

RUN sudo npm install postcss
RUN sudo npm install -g rtlcss
# May cause: npm WARN rtlcss@3.2.1 requires a peer of postcss@^8.2.4 but none is installed. You must install peer dependencies yourself.

RUN sudo npm install -g less-plugin-clean-css

RUN pyenv install 3.7.10
RUN pyenv global 3.7.10
