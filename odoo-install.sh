OE_VERSION="11.0"
USER="odoo11"
PASSWD="odoo11"
#DB_NAME="odoodb"

psql -c "create user $USER with encrypted password '$PASSWD';"
psql -c "ALTER ROLE $USER WITH SUPERUSER;"
psql -c "GRANT ALL PRIVILEGES ON DATABASE template0 TO $USER;"
psql -c "GRANT ALL PRIVILEGES ON DATABASE template1 TO $USER;"

echo -e "\n---- Install tool packages ----"
sudo DEBIAN_FRONTEND=noninteractive apt-get install wget git bzr python3-pip gdebi-core libpq-dev -y

# maybe needed
# python -m pip install --upgrade pip

echo -e "\n---- Install python packages ----"
sudo DEBIAN_FRONTEND=noninteractive apt-get install python-pypdf2 python-dateutil python-lxml python-mako python-pyparsing python-simplejson python-tz python-werkzeug-doc python-xlwt-doc python-yaml python-docutils python-psutil python-mock python-unittest2 python-jinja2 python-decorator python-passlib python-pil apt-utils -y

if [  -n "$(lsb_release -r | grep 18)" ] || [ -n "$(lsb_release -r | grep 20)" ]; then
    # for Ubuntu 18.04 & 20.04
    sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-pypdf2 python-babel python3-babel -y
    #sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-lxml python3-yaml python3-psycopg2 python3-pil python3-psutil python3-passlib -y
else
    # for lower than Ubuntu 18.04
    sudo DEBIAN_FRONTEND=noninteractive apt-get install python-pypdf python-pybabel python-gevent  -y
fi

echo -e "\n---- Install python packages LDAP based on OpenLDAP ----"
sudo DEBIAN_FRONTEND=noninteractive apt-get install libsasl2-dev python-dev libldap2-dev libssl-dev -y

echo -e "\n---- Install zbar packages ----"
sudo DEBIAN_FRONTEND=noninteractive apt-get install zbar-tools -y

echo -e "\n---- Install python libraries ----"
# This is for compatibility with Ubuntu 16.04. Will work on 14.04, 15.04 and 16.04
sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-suds -y

echo -e "\n--- Install other required packages"
sudo DEBIAN_FRONTEND=noninteractive apt-get install node-clean-css node-less -y

echo -e "\n==== Clone Odoo from repo ===="
sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/OCB.git odoo

cd odoo

pip install -r requirements.txt
# Upgrade/Downgrade pip packages
# pip install -U decorator==4.3.0
# pip install -U python-dateutil==2.6.1
# pip install -U pytz==2017.2
# pip install -U requests==2.21.0
# pip install -U Werkzeug==0.15

# Status:
# ModuleNotFoundError: No module named 'passlib'

./odoo-bin -w odoo11 -r odoo11 -d odoo11_db --addons-path=./addons --db_host 127.0.0.1
