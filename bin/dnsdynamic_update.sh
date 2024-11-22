#! /usr/bin/env bash

user='your_user'
pass='your_password'
host='your_hostname'
my_ip=$(curl -s 'http://myip.dnsdynamic.org')

api_url="https://www.dnsdynamic.org/api/?hostname=${host}&myip=${my_ip}"

echo "Setting $my_ip for $host"
curl --silent --user "${user}:${pass}" -k "https://www.dnsdynamic.org/api/?hostname=${host}&myip=${my_ip}"

