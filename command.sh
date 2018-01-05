#!/bin/bash
 
	#check OS
hostnamectl
 
 
 ####################### install git #####################
yum install git
git --version
mkdir myrepo
cd myrepo
echo $(pwd)

 ######### Clonning Repository ####################
git clone https://github.com/navneetjo/customer_nodejs_mysql_working.git
cd customer_nodejs_mysql_working/

################# install node npm #########################
curl --silent --location https://rpm.nodesource.com/setup_6.x | sudo bash -
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash 
yum install nodejs
yum install gcc-c++ make
node -v

###################### install node packages #############################
npm install

###################### install mysql #############################
yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum install mysql-community-server
systemctl start mysqld.service
systemctl enable mysqld.service
service mysqld start
grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log |tail -1

################ create test database ################
# mysql -u root -p 
################ password is available at /var/log/mysqld.log  location ##################
# create database test;
# use test; 

################## manually run the following command ############################
# mysql -p test < customer.sql


################# change app.js #################
#host: localhost
#user : root
#password : m5eT=)ulNZhk which is available at /var/log/mysqld.log location
#database: test

################ start node server ######################
node app.js




 
 
 
 