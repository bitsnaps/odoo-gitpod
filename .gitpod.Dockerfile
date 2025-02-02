FROM gitpod/workspace-postgres

USER gitpod

RUN wget -O - https://nightly.odoo.com/odoo.key | sudo apt-key add - && \
    echo "deb http://nightly.odoo.com/12.0/nightly/deb/ ./" | sudo tee -a /etc/apt/sources.list.d/odoo.list > /dev/null && \
    sudo apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y odoo wkhtmltopdf
