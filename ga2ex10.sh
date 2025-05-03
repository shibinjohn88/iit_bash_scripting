#!/bin/bash

conf="/etc/mysql/mariadb.conf.d/50-server.cnf"

#using sed edit file
sudo sed -i '/^bind-address/ {
	s/^/# &/
	a bind-address            = 0.0.0.0
}' "$conf"
