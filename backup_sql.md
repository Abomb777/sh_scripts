# BACK UP SQL

### bu scpript

```
#!/bin/sh
DB='DB_NAME'
PGP_PASSWORD='123'
FTP_URL= 'ftp://FTP_ADDRESS/sql-bu/'
FTP_USERNAME_PASSWD='USER:PASS'
TABLES=`mysql -Bse 'show tables' $DB`
for TABLE in $TABLES
do
        echo "starting $TABLE"
        mysqldump $DB $TABLE > "/BU/${TABLE}_dump.sql"
        echo "ready"
done
cp /etc/my.cnf /BU/
tar -czP /BU/* | gpg --passphrase $PGP_PASSWORD --batch -c -o /upload/BU_`(date +%d-%m-%y)`.tgz.gpg
find /upload/ -name '*.*' -exec curl -T {} $FTP_URL --user $FTP_USERNAME_PASSWD \;
rm -rf /upload/*
rm -rf /BU/*.sql
```



##Example of compress
```
tar -cz /BU/* | gpg --passphrase 12345 --batch -c -o "/upload/BU_`(date +%d-%m-%y)`.tgz.gpg"
```

##Example of decompress
```
gpg --passphrase 12345 --batch -d BU_08-03-23.tgz.gpg | tar xz
```



### mysql bu example
```
mysqldump -p --opt DB_NAME > \BU\DB_NAME.sql
```

### mariadb DB restart
```
systemctl restart mariadb.service
```

