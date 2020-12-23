#!/bin/bash
# Run it from docker-container!
psql -h postgres -U root -p root -d dive_into_dbms -f task2-public.sql
