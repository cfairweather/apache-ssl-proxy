# Docker
## Apache SSL Proxy

Docker "Apache SSL Proxy" is a simple container that uses your SSL certificates to authenticate and encrypt your otherwise unauthenticated Docker services. Conveniently, this will allow you to have multiple Docker containers available via the same port (443). 
You'll simply need a way to differentiate the traffic to different containers; multiple apache `.conf`s and multiple `VirtualHost` directives with appropriate `ServerName`s is the proper way to distinguish traffic meant for your various containers.

You'll need a proper DNS entry or `/etc/hosts` hack for each service's traffic proxied through this container. 

### Quick Start

Change `apache_proxy_ssl/config/default.conf` to match the correct `ServerName`, `SSLCertificateFile`, and `SSLCertificateKeyFile`.

Regenerate or replace keys in the `apache_proxy_ssl/ssl/` directory for security purposes. All files in this directory are available inside the container as `/etc/apache2/ssl/`. Make sure the apache configuration file uses that directory to reference keys and certificates!

In the default example, my.domain.com is proxied through this container to a monitoring container provided by Google, `cadvisor`.

Don't forget that multiple `VirtualHost` directives can be in the same `.conf` file as long as the `ServerName` is different!
