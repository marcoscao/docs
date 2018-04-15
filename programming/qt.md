Qt
==

1. Compile Driver Sql
2. SQL code examples

### Compile Driver Qt MYsql

-> instalar libmysqlclient-dev
-> link symbolic libmyslqclient_r.so apuntando a libmysqlclient.so en misma ubicación
-> qmake
-> make
-> make install


### SQL code examples

```c++ 
//void dump_helper(QString const &qr_str)
//{
//    // sql operations

//    QSqlDatabase db = qx::QxSqlDatabase::getSingleton()->getDatabase();
//    QSqlQuery qr(qr_str, db);

//    QSqlError err = db.lastError();
//    if (err.isValid())
//    {
//        qDebug() << "SQL Error: " << err.text();
//        return;
//    }

//    qDebug() << "Sending query: " << qr_str;
//    qDebug() << "..................................................................";

//    while (qr.next())
//    {
//        int id = qr.value(0).toInt();
//        QString field_3 = qr.value(3).toString();
//        QString field_4 = qr.value(4).toString();
//        qDebug() << "* id: " << id << " field_created: " << field_3 << " field_updated: " << field_4;
//    }

//    qDebug() << ".................................................................";
//}

//QSqlQuery execute_query(const QString &qr_s, QSqlDatabase &db)
//{
//    // Search by Name = "-Campo" returns 0 items
//    QSqlQuery qr(qr_s, db);

//    QSqlError err = db.lastError();
//    if (err.isValid())
//    {
//        qDebug() << ">>>>>>>>>>>>>>>>>>>>>>>>> SQL Error: %1" << err.text();
//        return QSqlQuery();
//    }

//    return qr;
//}

```

