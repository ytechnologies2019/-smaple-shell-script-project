#!/bin/bash

# Operation: Check the Operating System
Ubuntu=$(head -n 1 /etc/os-release | awk -F "=" '{print $2}' | sed 's/"//g' | grep -i Ubuntu)
CentOS=$(head -n 1 /etc/os-release | awk -F "=" '{print $2}' | sed 's/"//g' | grep -i CentOS)
APT=$Ubuntu
YUM=$CentOS

##Check the usage
DISK_CHECK=$(df -hT / | awk -F '%' 'NR>1 { print $6 }')

while [ "$APT" = "Ubuntu" ] || [ "$YUM" = "$CentOS" ]; do {
    $DISK_CHECK
    break
} ; done

##Install Packages
echo "Confirm the Installation -> 'yes'"
read 'confirm'

EXIT_STATUS=$?
if [ $confirm = "yes" ];then {
    ##Package List
    package=("apache2","nginx","tomcat")
    echo "Type "apache2" -> To install apache2"
    echo "Type "nginx"   -> To install nginx"
    echo "Type "tomecat" -> To install tomcat"
}
     else {
        exit
} fi

##Package List
read install_package
#First Loop

    if [ "$APT" = "Ubuntu" ]; then {
        sudo apt update -y && sudo apt install $install_package -y
    } elif [ "$YUM" = "CentOS" ]; then {
        sudo yum update -y && sudo yum install $install_package -y
    } else {
        echo "Your Operation System is not supported"
    } fi


##Avoide the Duplicate File Name
web_page=$(ls /var/www/html/) 
current_time=$(date | awk '{{print $4}}')
    while [ "$web_page" = "index.nginx-debian.html" ] || [ "$web_page" = "index.html" ]; do {
        cp /var/www/html/* /tmp/index.html-$current_time
        break
    }; done

##Download the Web File
package_file="https://github.com/Alok-2002/Netflix_Home_Page_Using_HTML_And_CSS.git"
website="Netflix_Home_Page_Using_HTML_And_CSS"
download_path=$(ls /home/demouser/ | grep -i Netflix_Home_Page_Using_HTML_And_CSS)
    if [ "$download_path" = "$website" ];then {
        echo "Already exist!"
    } else {
        git clone "$package_file"
    } fi

##Deploy
website_path="/home/demouser/$website"
prod_path="/var/www/html/"

sudo cp -r $website_path/* $prod_path
sudo systemctl restart nginx
sudo systemctl status nginx | grep -i running

if [ $?=0 ]; then {
     echo "Operation Success!"
} else {
    echo "Opps! Something went wrong , please check again"
} fi
   
