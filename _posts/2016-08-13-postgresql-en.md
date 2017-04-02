---
layout: manual
title: PostgreSQL
category: SetUp
path: '/en/:id'
language: en
flag: us
---

### Change database to PostgreSQL

If you want to make a stable operation, I recommend you to change from the built-in database to PostgreSQL.

In this page, how to change PostgreSQL from built-in database.

### How to change database

1. Install PostgreSQL and setup database. (add database user)
2. Administrator users sign in
3. In the menu at the top right of the screen, and select the "System Config"
4. Select "Change Database" menu. After select "org.postgresql.Driver" and edit to connect config.
5. Execute "Copy data from built-in database to PostgreSQL"

### Before trasfering data
You should create a dump data of h2database.
Useful pages: 
http://masasuzu.hatenadiary.jp/entry/2015/01/23/H2%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%83%80%E3%83%B3%E3%83%97%E3%80%81%E3%83%AA%E3%82%B9%E3%83%88%E3%82%A2%E3%82%92%E3%81%99%E3%82%8B
http://stackoverflow.com/questions/3256694/how-in-h2db-get-sql-dump-like-in-mysql


## postgresql driver
Can download from the following site.
https://jdbc.postgresql.org/download.html

### How to put
cat /etc/profile
```
export KNOWLEDGE_HOME=/home/tomcat8/.knowledge
export JAVA_OPTS="-Dfile.encoding=UTF-8 \
  -Dnet.sf.ehcache.skipUpdateCheck=true \
  -XX:+UseConcMarkSweepGC \
  -XX:+CMSClassUnloadingEnabled \
  -XX:+UseParNewGC \
  -XX:MaxPermSize=128m \
  -Xms512m -Xmx512m"
export PATH=$JAVA_HOME/bin:$PATH

CLASSPATH=$CLASSPATH:/usr/share/java/postgresql-9.3-1103.jdbc3.jar
export CLASSPATH
```

then,run the following command.
```
source /etc/profile
```

### Check whether to connect Postgresql
please use the following program.

```
cat PostgreSQLSample1.java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgreSQLSample1 {

    public static void main(String[] args) throws SQLException {
        String hostname = "localhost"; // 自分のものに書き換える
        String dbname = "knowledge"; // 自分のものに書き換える
        String username = "indival"; // 自分のものに書き換える
        String password = "indival"; // 自分のものに書き換える
        Connection conn = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://" + hostname
                    + ":5432/" + dbname, username, password);
            System.out.println("接続成功");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```
