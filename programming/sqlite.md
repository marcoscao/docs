SQLite
======

```bash
# open sqlite db
$ sqlite3 /opt/tech/config.db
```

```sql
# show all tables schemes
.schema		

# exit
.quit

# update table row field
update Settings set ValueSetting="QMYSQL://root:xxxx@192.168.1.1/e" where id=8;

```


