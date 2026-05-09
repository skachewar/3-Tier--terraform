#!/bin/bash

apt update -y
apt install nginx -y

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Registration Form</title>
</head>
<body>

<h2>User Registration</h2>

<form action="http://APP_PRIVATE_IP/submit.php" method="POST">

Name:
<input type="text" name="name"><br><br>

Email:
<input type="email" name="email"><br><br>

<input type="submit" value="Register">

</form>

</body>
</html>
EOF

systemctl restart nginx