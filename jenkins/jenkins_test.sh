#!/bin/bash

curl -Lo jenkins.war http://mirrors.jenkins-ci.org/war/latest/jenkins.war
ls
java -jar jenkins.war &
sleep 5m
ls ~/.jenkins/war/WEB-INF/jenkins-cli.jar

java -jar ~/.jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ install-plugin TestFairy.hpi
java -jar ~/.jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ create-job JenkinsTest < JenkinsTest.xml
java -jar ~/.jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ list-jobs
java -jar ~/.jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ build JenkinsTest
java -jar ~/.jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080/ console



