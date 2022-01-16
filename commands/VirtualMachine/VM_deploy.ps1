################################################################
#DEPLOYING TO THE VM :

cd /path/to/web

python3 -m venv venv

source venv/bin/activate

pip install --upgrade pip 
pip install -r requirements.txt

python application.py

#In a web browser, we can visit the public IP address. Type "exit" to disconnect from the VM