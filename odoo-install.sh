OE_VERSION="14.0"
USER="odoo14"
PASSWD="odoo14"
# DB_NAME="odoo14_db"

# Create a DB user
psql -c "create user $USER with encrypted password '$PASSWD';"
psql -c "ALTER ROLE $USER WITH SUPERUSER;"
psql -c "GRANT ALL PRIVILEGES ON DATABASE template0 TO $USER;"
psql -c "GRANT ALL PRIVILEGES ON DATABASE template1 TO $USER;"

# Create a database
# psql -c "CREATE DATABASE $DB_NAME WITH OWNER $USER;"
# psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $USER;"


# Upgrade pip
python -m pip install --upgrade pip

echo -e "\n==== Clone Odoo from repo ===="
sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/OCB.git odoo

cd odoo
pip install wheel
pip install -U -r requirements.txt
