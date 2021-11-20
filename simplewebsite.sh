#! /bin/bash

bc_root(){
if [ "$EUID" == 0 ]
then
        bc_installrequiredpackage
else
        echo "This script must be run as root adminstrator, please enter the command sudo su on the terminal. Thank you"
        exit 1
fi
}

bc_installrequiredpackage(){
echo -n "Please let me know if you want to install one website, plesae enter yes or no! (y/n) : "
read install
if [ "$install" == y ]
then
        bc_install
else
        echo "I am exting from here"
        exit 1
fi
}
bc_httpd(){
        echo "Pleasae wait a moment, while installing the httpd service on this machine.................................................................................................................................................................................................................................................................................................................................................................................."
        yum install httpd -y
        service httpd start
        echo "The httpd installation has been successfully completed."
        echo ""
}
bc_website(){

cat > /var/www/html/index.html << EOF
Hell World!
EOF
}

bc_install(){
        bc_httpd
        bc_website
}

bc_main(){

        bc_root
}
bc_main
exit
