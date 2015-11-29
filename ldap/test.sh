#!/bin/bash

# Run a ldap server, save the container id in LDAP_CID and get its IP:
LDAP_CID=$(docker run -h --name=openldap ldap.example.org -d osixia/openldap)
LDAP_IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" $LDAP_CID)

# Run phpLDAPadmin and set ldap host to ldap ip
PHPLDAP_CID=$(docker run -h phpldapadmin.example.org --name=phpldapadmin -e PHPLDAPADMIN_LDAP_HOSTS=$LDAP_IP -d osixia/phpldapadmin)

# We get phpLDAPadmin container ip
PHPLDAP_IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" $PHPLDAP_CID)

echo "Go to: https://$PHPLDAP_IP"
echo "Login DN: cn=admin,dc=example,dc=org"
echo "Password: admin"
