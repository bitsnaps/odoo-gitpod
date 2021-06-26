OE_VERSION="11.0"
USER="odoo11"
PASSWD="odoo11"
#DB_NAME="odoodb"

sudo -u postgres psql -c "create user $USER with encrypted password '$PASSWD';"
