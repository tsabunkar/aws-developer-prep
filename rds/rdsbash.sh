#!/bin/bash  
yum install httpd php php-mysql -y  #install apache server, php and php-mysql
yum update -y  
chkconfig httpd on  
service httpd start  # start apahce server
echo "<?php phpinfo();?>" > /var/www/html/index.php # create php page
cd /var/www/html  
wget https://s3.amazonaws.com/acloudguru-production/connect.php 
# copying the acloudguru hosted file into our EC2 instance inside /var/www/html