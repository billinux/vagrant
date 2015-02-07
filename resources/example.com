# Using Apache2 and Nodejs
# http://blog.podrezo.com/making-node-js-work-with-apache/

<VirtualHost *:80>
  ServerName example.com
  ServerAlias www.example.com
  DocumentRoot /var/www/example.com/public
  Options -Indexes
#  ErrorDocument 503 /var/www/maintenance.html

#  ProxyRequests on
#  ProxyPass  /maintenance.html !
#  ProxyPass / http://localhost:8080/
</VirtualHost>
