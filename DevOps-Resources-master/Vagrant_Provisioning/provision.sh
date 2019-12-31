#!/bin/bash -eu
# provision.sh -- Install Apache and a test PHP script

# Install Apache and PHP
apt-get update -y  
apt-get install -y apache2 php5 libapache2-mod-php5 php5-mcrypt

# Start the service
sudo service apache2 status
/etc/init.d/apache2 status
ps aux | grep apache
which php
cat > /var/www/html/index.php << EOF
<?php phpinfo(); ?>
EOF

