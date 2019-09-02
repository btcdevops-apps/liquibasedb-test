# xnm-db

liquibase


##open pdb database
sudo docker exec -it oracle-xe bash -c "source /home/oracle/.bashrc; bash"

$ORACLE_HOME/bin/sqlplus sys/Oracle18@localhost/xnmpdb as sysdba

alter pluggable database xnmpdb open;