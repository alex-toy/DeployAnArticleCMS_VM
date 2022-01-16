"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"

################################################################
"GENERATE SCRIPTS TO CONNECT TO THE VM AND DEPLOY THE APP :"

#copy a basic Flask app from local machine to the VM
$application_path = "web"
scp -r ./${application_path} ${AdminUsername}@${IP}:/home/${AdminUsername}

#connect to the VM 
ssh ${AdminUsername}@${IP}
