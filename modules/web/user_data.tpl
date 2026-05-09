#!/bin/bash

apt update -y

apt install nginx php-fpm php-mysql -y

systemctl start nginx
systemctl enable nginx

PHP_VERSION=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;")

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Registration Form</title>
</head>
<body>

<h2>User Registration</h2>

<form action="/submit.php" method="POST">

Name:
<input type="text" name="name"><br><br>

Email:
<input type="email" name="email"><br><br>

<input type="submit" value="Register">

</form>

</body>
</html>
EOF


cat <<EOF > /var/www/html/submit.php
<?php

echo "Form Submitted Successfully";

?>
EOF


cat <<EOF > /etc/nginx/sites-available/default
server {

    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;

    index index.php index.html;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php${PHP_VERSION}-fpm.sock;
    }
}
EOF


systemctl restart php${PHP_VERSION}-fpm
systemctl restart nginx