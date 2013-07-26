具体参见源码包：
support-files/mysql-log-rotate.sh

/data/mysql_db/slow.log {
        # create 600 mysql mysql
        notifempty
    daily
        rotate 3
        missingok
        compress
    postrotate
    # just if mysqld is really running
    if test -x /usr/local/mysql/bin/mysqladmin && \
       /usr/local/mysql/bin/mysqladmin -uroot -pbudong ping &>/dev/null
    then
       /usr/local/mysql/bin/mysqladmin -uroot -pbudong -e "flush logs"
    fi
    endscript
}
/data/mysql_db/error.log {
        # create 600 mysql mysql
        notifempty
    daily
        rotate 3
        missingok
        compress
    postrotate
    # just if mysqld is really running
    if test -x /usr/local/mysql/bin/mysqladmin && \
       /usr/local/mysql/bin/mysqladmin -uroot -pbudong ping &>/dev/null
    then
       /usr/local/mysql/bin/mysqladmin -uroot -pbudong -e "flush logs"
    fi
    endscript
}
