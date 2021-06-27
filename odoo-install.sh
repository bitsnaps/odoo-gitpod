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

# Upgrade pip
python -m python -m pip install --upgrade pip

echo -e "\n---- Install python packages ----"
sudo DEBIAN_FRONTEND=noninteractive apt-get install python-dateutil python-lxml python-mako python-pyparsing python-simplejson python-tz python-werkzeug-doc python-xlwt-doc python-yaml python-docutils python-psutil python-mock python-unittest2 python-jinja2 python-decorator python-passlib python-pil apt-utils -y

if [  -n "$(lsb_release -r | grep 18)" ] || [ -n "$(lsb_release -r | grep 20)" ]; then
    # for Ubuntu 18.04 & 20.04
    sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-pypdf2 python3-lxml python-babel python3-babel -y
    #sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-lxml python3-yaml python3-psycopg2 python3-pil python3-psutil python3-passlib -y
else
    # for lower than Ubuntu 18.04
    sudo DEBIAN_FRONTEND=noninteractive apt-get install python-pypdf python-pybabel python-gevent  -y
fi

echo -e "\n---- Install python packages LDAP based on OpenLDAP ----"
if [ -n "$(lsb_release -r | grep 20)" ]; then
  sudo DEBIAN_FRONTEND=noninteractive apt-get install python-dev libldap2-dev libsasl2-dev gcc -y

else
  sudo DEBIAN_FRONTEND=noninteractive apt-get install libsasl2-dev python-dev libldap2-dev libssl-dev -y
fi

echo -e "\n---- Install zbar packages ----"
sudo DEBIAN_FRONTEND=noninteractive apt-get install zbar-tools -y

echo -e "\n---- Install python libraries ----"
# This is for compatibility with Ubuntu 16.04. Will work on 14.04, 15.04 and 16.04
sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-suds -y

echo -e "\n--- Install other required packages"
sudo DEBIAN_FRONTEND=noninteractive apt-get install node-clean-css node-less -y

echo -e "\n==== Clone Odoo from repo ===="
sudo git clone --depth 1 --branch $OE_VERSION https://github.com/OCA/OCB.git odoo

# cd odoo

# python -m pip install -r requirements.txt
# from requirements.txt
python -m pip install ebaysdk==2.1.5
python -m pip install feedparser==5.2.1
python -m pip install gevent==1.5.0
python -m pip install greenlet==0.4.14
python -m pip install lxml==4.2.3
python -m pip install Mako==1.0.4
python -m pip install MarkupSafe==0.23
python -m pip install mock==2.0.0
python -m pip install ofxparse==0.16
python -m pip install passlib==1.6.5
python -m pip install phonenumbers
python -m pip install pydot==1.2.3
python -m pip install pyldap==2.4.28
python -m pip install pyparsing==2.1.10
python -m pip install PyPDF2==1.26.0
python -m pip install pyserial==3.1.1
python -m pip install python-dateutil==2.5.3
python -m pip install python-stdnum<=1.14
python -m pip install pytz==2016.7
python -m pip install pyusb==1.0.0
python -m pip install PyYAML==3.13
python -m pip install qrcode==5.3
python -m pip install requests==2.20.0
python -m pip install suds-jurko==0.6
python -m pip install vatnumber==1.2
python -m pip install vobject==0.9.3
python -m pip install XlsxWriter==0.9.3
python -m pip install xlwt==1.3.*
python -m pip install xlrd==1.0.0

# Upgrade/Downgrade pip packages
# python -m pip install -U decorator==4.3.0
# python -m pip install -U python-dateutil==2.6.1
# python -m pip install -U pytz==2017.2
# python -m pip install -U requests==2.21.0
# python -m pip install -U Werkzeug==0.15

# Fix missing python packages
python -m pip install PyPDF2
python -m pip install passlib
python -m pip install babel
python -m pip install decorator
python -m pip install psycopg2
python -m pip install Pillow
python -m pip install -U Werkzeug==0.15
python -m pip install psutil
python -m pip install jinja2
python -m pip install reportlab
python -m pip install html2text
python -m pip install docutils
python -m pip install lxml
python -m pip install num2words

#./odoo-bin -w odoo11 -r odoo11 -d odoo11_db --addons-path=./addons --db_host 127.0.0.1
