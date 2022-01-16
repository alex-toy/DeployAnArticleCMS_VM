################################################################
#DEPLOY FLASK APP IN THE VM :

#install Python Virtual Environment and NGNIX to use as a reverse proxy
sudo apt-get -y update && sudo apt-get -y install nginx python3-venv

#configure Nginx to redirect all incoming connections on port 80 to our app that is running on localhost port 3000
cd /etc/nginx/sites-available

#unlink the default site 
sudo unlink /etc/nginx/sites-enabled/default

sudo vim reverse-proxy.conf

#add the folloing to reverse-proxy.conf :
server {
    listen 80;
    location / {
        proxy_pass http://localhost:5555;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection keep-alive;
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

#activate the directories by creating a sym link to the /sites-enabled directory 
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

#restart nginx so the changes take effect
sudo service nginx restart


################################################################
#DEPLOYING TO THE VM :

cd /path/to/web

python3 -m venv venv

source venv/bin/activate

pip install --upgrade pip 
pip install -r requirements.txt
pip install flask_sqlalchemy flask_login  flask_session flask_wtf azure.storage msal

python application.py

#In a web browser, we can visit the public IP address. Type "exit" to disconnect from the VM
<yourmachine>.<local>.cloudapp.azurestack.contoso.com:5000

