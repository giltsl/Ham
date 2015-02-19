#!/bin/bash

curl -Lo jenkins.war http://mirrors.jenkins-ci.org/war/latest/jenkins.war
ls;

java -jar jenkins.war&
sleep 45

ls ~/.jenkins/war/WEB-INF/jenkins-cli.jar
java -jar ~/.jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ install-plugin TestFairy.hpi
java -jar ~/.jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ create-job JenkinsTest < JenkinsTest.xml
java -jar ~/.jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ list-jobs
java -jar ~/.jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ build JenkinsTest


while true; do

    java -jar ~/.jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ console JenkinsTest > /tmp/console.log
    sleep 1
    echo console...
    echo /tmp/console.log
    grep "Finished: FAILURE" /tmp/console.log
    if [ $? == 0 ]; then
        echo Finished: FAILURE
        cat /tmp/console.log
        exit -1;
    fi

    echo check SUCCESS
    grep "Finished: SUCCESS" /tmp/console.log
    if [ $? == 0 ]; then
        echo Yay the build work
        exit 0;
    fi

done
