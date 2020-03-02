mysqld_ini:
  mysqld_safe:
    socket: /var/run/mysqld/mysqld.sock
    nice: 0
  mysqld:
    default-time-zone: "\u0027+00:00\u0027"
    user: mysql
    pid-file: /var/run/mysqld/mysqld.pid
    socket: /var/run/mysqld/mysqld.sock
    port: 3306
    basedir: /usr
    datadir: /var/lib/mysql
    tmpdir: /tmp
    lc-messages-dir: /usr/share/mysql
    skip-external-locking: 1
    character-set-server: utf8
    init-connect: "\u0027SET NAMES utf8\u0027"
    collation-server: utf8_general_ci
    sql_mode: NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
    innodb_flush_log_at_timeout: 2700
    innodb_flush_log_at_trx_commit: 2
    innodb_flush_method: fsync
    sync_binlog: 0
    innodb_doublewrite: 0
    innodb_flush_neighbors: 0
    bind-address: 127.0.0.1
    key_buffer_size: 16M
    max_allowed_packet: 32M
    thread_stack: 192K
    thread_cache_size: 8
    query_cache_limit: 1M
    query_cache_size: 16M
    log_error: /var/log/mysql/error.log
    expire_logs_days: 10
    max_binlog_size: 100M
