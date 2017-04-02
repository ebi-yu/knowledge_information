---
layout: manual
title: PostgreSQL
category: SetUp
path: '/ja/:id'
language: ja
flag: jp
---

### データベースを、PostgreSQLへ変更

knowledgeは動作確認を簡単にするため、起動時に組み込みデータベースの（H2Database）を起動しています。
導入は簡単なのですが、長期間、安定した運用を行いたい場合、組み込みデータベースからPostgreSQLに変更する事を推奨しています。

ここでは、組み込みデータベースからPostgreSQLへの切替方法をご説明いたします。

### 移行の前に
万が一データが紛失した！ということがあっても復旧できるように、H2databaseのバックアップを取っておいてください。
参考: http://masasuzu.hatenadiary.jp/entry/2015/01/23/H2%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%83%80%E3%83%B3%E3%83%97%E3%80%81%E3%83%AA%E3%82%B9%E3%83%88%E3%82%A2%E3%82%92%E3%81%99%E3%82%8B
http://stackoverflow.com/questions/3256694/how-in-h2db-get-sql-dump-like-in-mysql


### 手順

1. PostgreSQLを用意（インストール、Knowledge用のユーザ追加）
2. Knowledgeに管理者でログインします
3. 管理者の場合、右上のメニューに「システム設定」が表示されますので、それを選択
4. 「データベースの接続先変更」のメニューがありますので、こちらを選択して、その画面で「org.postgresql.Driver」の方を選択いただき、PostgreSQLへの接続情報を入力してください（ここで、h2の方を選択しっぱなしにしておくと、画面が見れなくなります。ご注意ください。）
5. その後、「組み込みDBのデータをカスタム設定のDBへコピー」を実行するとH2で登録した内容がPostgreSQLにコピーされます

## postgresqlのドライバ
以下からDLできます
https://jdbc.postgresql.org/download.html

### 配置方法
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
上記のイメージ

その後以下コマンド
```
source /etc/profile
```

### ちゃんと接続できるか確認
以下PGをご使用ください

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
