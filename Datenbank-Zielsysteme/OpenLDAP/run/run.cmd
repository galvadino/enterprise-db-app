cd "%~dp0.."
slapd -d 1 -h "ldaps:/// ldap:///" -f .\slapd.conf
