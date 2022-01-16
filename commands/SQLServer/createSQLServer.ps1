################################################################
#CREATE SQL SERVER :

az sql server create \
--admin-user udacityadmin \
--admin-password p@ssword1234 \
--name hello-world-server \
--resource-group resource-group-west \
--location westus2 \
--enable-public-network true \
--verbose


################################################################
#CREATE FIREWALL RULES :

#allow Allow Azure services and resources to access the server we just created.

az sql server firewall-rule create \
-g resource-group-west \
-s hello-world-server \
-n azureaccess \
--start-ip-address 0.0.0.0 \
--end-ip-address 0.0.0.0 \
--verbose

#find your computer's public ip address
#macOS:
curl ifconfig.me; 
#Windows:
ipconfig 

#set your computer's public Ip address to the server's firewall

#Create clientIp firewall rule
az sql server firewall-rule create \
    -g resource-group-west \
    -s hello-world-server \
    -n clientip \
    --start-ip-address <PUBLIC-IP-ADDRESS> \
    --end-ip-address <PUBLIC_IP_ADDRESS> \
    --verbose

#create the database itself
az sql db create \
    --name hello-world-db \
    --resource-group resource-group-west \
    --server hello-world-server \
    --tier Basic \
    --verbose





