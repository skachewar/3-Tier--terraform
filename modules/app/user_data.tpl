#!/bin/bash

apt update -y
apt install apache2 php php-mysql mysql-client -y

cat <<EOF > /var/www/html/submit.php
<?php

\$host = "${rds_endpoint}";
\$user = "admin";
\$pass = "Admin12345";
\$dbname = "userdb";

\$conn = new mysqli(\$host, \$user, \$pass, \$dbname);

if (\$conn->connect_error) {
    die("Connection failed: " . \$conn->connect_error);
}

\$name = \$_POST['name'];
\$email = \$_POST['email'];

\$sql = "INSERT INTO users (name, email)
VALUES ('\$name', '\$email')";

if (\$conn->query(\$sql) === TRUE) {
    echo "Registration successful";
} else {
    echo "Error: " . \$conn->error;
}

\$conn->close();

?>
EOF

systemctl restart apache2