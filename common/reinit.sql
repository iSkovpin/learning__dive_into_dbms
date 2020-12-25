-- Kill all active sessions
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'dive_into_dbms';

-- Recreate database
drop database dive_into_dbms;
create database dive_into_dbms;
