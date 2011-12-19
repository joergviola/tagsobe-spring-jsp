#!/bin/sh
# install spring probe on tagsobe vm

mvn install
cp target/travel.war $TOMCAT_HOME/webapps
sudo service tomcat6 start
sleep 5

bench.sh http://localhost:8080/travel/hotels/search

sudo service tomcat6 stop