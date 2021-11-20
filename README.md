## simplewebsite html website 
A simple html website of hello world using the bash script

-------------------------------------------------- 

## prerequisite

```sh
sudo yum install git -y
```
-------------------------------------------------- 

How to use the scipt
-------------------------------------------------- 

```sh

git clone https://github.com/vyjith/simplewebsite

cd simplewebsite

chmod +x simplewebsite.sh

```

Script running
-------------------------------------------------- 
``` sh

bash simplewebsite.sh

```

Soruce code is the following

-------------------------------------------------- 

```sh
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
```

## Sample output is the following
-------------------------------------------------- 

![alt text](https://i.ibb.co/qs0hxWZ/image.png)
