#!/bin/sh
# install spring probe on tagsobe vm

mvn install
sudo cp target/travel.war $TOMCAT_HOME/webapps
sudo service tomcat6 start
until [ "`curl --silent --show-error --connect-timeout 1 -I http://localhost:8080 | grep 'Coyote'`" != "" ];
do
  echo Waiting for tomcat coming up...
  sleep 2
done


echo "http://localhost:8080/travel/hotels/search" > probe.url
