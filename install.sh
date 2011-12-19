#!/bin/sh
# install spring probe on tagsobe vm

mvn install
sudo cp target/travel.war $TOMCAT_HOME/webapps
sudo service tomcat6 start
sleep 5

export PROBE_URL=http://localhost:8080/travel/hotels/search
