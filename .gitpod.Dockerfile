FROM gitpod/workspace-postgres

USER gitpod

RUN sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils  && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y wkhtmltopdf

# ---- Install tool packages ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install wget git bzr python3-pip gdebi-core libpq-dev -y

# ---- Install python packages ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install python-dateutil python-lxml python-mako python-pyparsing python-simplejson python-tz python-werkzeug-doc python-xlwt-doc python-yaml python-docutils python-psutil python-mock python-unittest2 python-jinja2 python-decorator python-passlib python-pil apt-utils -y

# --- Other packages (Only ubuntu >= 18.04) ---
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-pypdf2 python3-lxml python-babel python3-babel -y

# ---- Install python packages LDAP based on OpenLDAP ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install python-dev libldap2-dev libsasl2-dev gcc -y

# ---- Install zbar packages ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install zbar-tools -y

# ---- Install python libraries ----
# This is for compatibility with Ubuntu 16.04. Will work on 14.04, 15.04 and 16.04
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-suds -y

# --- Install other required packages (node, less) ----
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install node-clean-css node-less -y

# the default python should work
# RUN pyenv install 3.7.10
# RUN pyenv global 3.7.10
