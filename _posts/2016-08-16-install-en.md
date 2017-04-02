---
layout: manual
title: Install
category: SetUp
path: '/en/:id'
language: en
flag: us
---

### Install

- Install the Java version 8 or later
- Install the Tomcat 8.0 or later 
- Even without a Tomcat, and I think that it works as long as it is a server that supports later Servlet3.1
- The path of the Tomcat installation should not be including the whitespace.
- Download knowledge.war.(from https://github.com/support-project/knowledge/releases)
- Put the knowledge.war to the Tomcat webapps directory  (war is ready to use, then this application is deployed)

### Warning
- If it doesn't work, you should check tomcat logs.
- Tomcat logs are in the tomcat log directory.
- For example Mac
```
$ catalina                                                                                                                                                                                                                            system
Using CATALINA_BASE:   /usr/local/Cellar/tomcat/8.5.9/libexec
Using CATALINA_HOME:   /usr/local/Cellar/tomcat/8.5.9/libexec
Using CATALINA_TMPDIR: /usr/local/Cellar/tomcat/8.5.9/libexec/temp
Using JRE_HOME:        /Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home
Using CLASSPATH:       /usr/local/Cellar/tomcat/8.5.9/libexec/bin/bootstrap.jar:/usr/local/Cellar/tomcat/8.5.9/libexec/bin/tomcat-juli.jar
Usage: catalina.sh ( commands ... )
commands:
  debug             Start Catalina in a debugger
  debug -security   Debug Catalina with a security manager
  jpda start        Start Catalina under JPDA debugger
  run               Start Catalina in the current window
  run -security     Start in the current window with security manager
  start             Start Catalina in a separate window
  start -security   Start in a separate window with security manager
  stop              Stop Catalina, waiting up to 5 seconds for the process to end
  stop n            Stop Catalina, waiting up to n seconds for the process to end
  stop -force       Stop Catalina, wait up to 5 seconds and then use kill -KILL if still running
  stop n -force     Stop Catalina, wait up to n seconds and then use kill -KILL if still running
  configtest        Run a basic syntax check on server.xml - check exit code for result
  version           What version of tomcat are you running?
Note: Waiting for the process to end and use of the -force option require that $CATALINA_PID is defined
```

```
 ls /usr/local/Cellar/tomcat/8.5.9/libexec/logs                                                                                                                                                                                      system
catalina.2016-12-28.log             catalina.2017-01-04.log             host-manager.2017-01-01.log         localhost.2017-01-01.log            localhost_access_log.2016-12-29.txt manager.2016-12-28.log
catalina.2016-12-29.log             catalina.out                        host-manager.2017-01-02.log         localhost.2017-01-02.log            localhost_access_log.2017-01-01.txt manager.2016-12-29.log
catalina.2017-01-01.log             host-manager.2016-12-28.log         localhost.2016-12-28.log            localhost.2017-01-04.log            localhost_access_log.2017-01-02.txt manager.2017-01-01.log
catalina.2017-01-02.log             host-manager.2016-12-29.log         localhost.2016-12-29.log            localhost_access_log.2016-12-28.txt localhost_access_log.2017-01-04.txt manager.2017-01-02.log
```

You should check catalina.out and localhost-xxxx-xx-xx.log.
Error messages are there.


