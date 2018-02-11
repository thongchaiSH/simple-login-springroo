Run this for dev
-->mvn clean compile jetty:run -Djetty.port=8084

Run this for deploy UAT-Softsuare
-->Config file ReportProject/src/main/java/com/app2/tat/util/AbstractJndiDataSource.java
-->mvn clean compile package -Dmaven.test.skip=true tomcat7:redeploy -P deploy-server
