# xnm-db liquibase

## Database changes
# mvn compile -Dbaseline -Dlocal
# mvn compile -Dgoal=rollback -Dliquibase.rollbackCount=4 -Dlocal
# mvn compile -Dgoal=rollback -Dliquibase.rollbackCount=4 -Dbaseline

# mvn compile -DwindowsLocal -Dgoal=rollback -Dliquibase.rollbackCount=1
# mvn compile -DwindowsLocal -Dgoal=rollback -Dliquibase.rollbackCount=1 -Dliquibase.tag=checkpoint
# mvn compile -DwindowsLocal


The process for a developer needing to make a database change is as follows:

1. Clone or update the project
1. Create a feature branch for your changes
1. Create a changelog for the changes required, or modify an existing one, if you're changing a db object.
1. Update `db.changelog-master.xml` file if necessary
1. Run against your local database
1. Test your **rollback** scripts against your local database
1. Submit a merge request

Once the change has been merged to master it will be automatically deployed as
a part of the CI pipeline.

## Quickstart

###Resume Docker
1. ```bash
    sudo docker ps -a
    sudo docker start oraclexe18id
    sudo docker exec -it oracle-xe bash -c "source /home/oracle/.bashrc; bash"
    $ORACLE_HOME/bin/sqlplus sys/Oracle18@localhost/xnmpdb as sysdba
    alter pluggable database open
   ```

### Testing Locally
All liquibase upgrade and rollback scripts must be run against a local environment first.

#### Docker Database
If using docker to spin up a local database then follow these steps:

1. Make sure that docker is running on your machine

1. Build the `evise-db` image (if you have not already done so).

    ```bash
    docker build -t evise-oracle-xe-11g .
    ```
    
1. Run the database container (allow some time for the database to finish loading, use `docker logs -f evise-db` to check the progress)

    ```bash
    docker run --rm --name evise-db -d -p 49160:22 -p 1521:1521 evise-oracle-xe-11g
    ```

#### Baseline/Initial build
On a clean, freshly built database you will need to run the baseline scripts to get your database into the correct state before
being able to run the incremental updates.

```bash
mvn compile -Dbaseline -DbaselineBuild
```

#### Incremental update
The following command updates only the changesets missing from your database.

```bash
mvn compile -Dlocal
```

#### Rollback
Make sure your changeset(s) can handle rollbacks appropriately.
This examples rolls back the last changeset:
```bash
mvn compile -Dgoal=rollback -Dliquibase.rollbackCount=1 -Dlocal
```

## Changelogs

A changelog is basically a .sql file containing the changes you want to make, with a few special comments to control
the tool. Here's a simple example:

```sql
    --liquibase formatted sql
    --changeset user-id:create-example enddelimiter:""
    
    CREATE TABLE example (ID NUMBER, NAME STRING)
    
    --rollback DROP TABLE example
```

As you can see, there are three Liquibase specific comments; a header that identifies the file, a line identifying the
changeset, and one providing the rollback command.

### changeset comment

This comment identifies the change being made, and allows you to configure some aspects of the way Liquibase will
process it. The only mandatory section is the Id part, which takes the form of `<user-id>:<change-id>`. The `user-id`
should be the network id of the user making the change, and the `change-id` should be a short, but accurate,
description of the change being made.

The information is extremely important, both for Liquibase to identify the change in question and for audit purposes. So
you must make sure to use the correct `user-id` and to give sufficient thought to your `change-id`. Do not blindly 
cut-and-paste this line from an existing file without changing it.

As well as the identity section, you can add other configuration options to this line. They are detailed
[here](http://www.liquibase.org/documentation/sql_format.html), in the "Available Changeset Attributes" section. The
only one you're likely to need is `runOnChange`, which specifies whether the changeset should be reapplied if the file
changes, and is typically set on stored-procedures, functions or other database objects. 

### rollback comment

The comment specifies the command that should be run if the changelogs needs to be rolled-back. Again; this is important,
and shouldn't be considered an afterthought, or omitted. 

## DDL / data updates

Most database changes, that will only be run once per-environment, should have their changelogs placed in an appropriate 
directory and they should be included in the masterfile.

## Database objects

Because database object have complex declarations that can change over time, they are treated slightly differently to
more typical changes:

- There is one, release independent directory for each type of object, where the changelogs files should go.
- Every changelogs should be re-runnable; i.e. `CREATE OR ALTER...`.
- Every changelogs should have the `runOnChange=true` attribute set
- There is one changelogs master file that includes all of the db-object changelogs `db.changelogs.objects.xml`

This means that there is a single place to look for the source code for each of the objects, rather than having to trawl
through every release, looking for the most recent version, and that for each release, the release manager just needs
to run the one db-object master file, and anything that has changed will be reapplied.

When modifying an existing db-object, all the developer need do, is find the appropriate changelogs in the source tree,
and modify it. No new changelogs is needed, and no master file needs changing. Additionally, the changelogs comment in the
file should be left alone; do not update the author section with your name, since this will make liquibase see it as a
new changelogs, rather than an edit of the existing one.

When creating a new db-object, then a new changelogs should be created in the appropriate directory, and the db-object
master file should be updated to include it. In this case, unlike editing an existing object, do set the author part of
the changeset comment to your ID, and remember to give the changeset a meaningful ID.

In both cases, the changes should be made in a feature branch, and then merged to master.

# Advanced
## Synchronising
With `changelogSync` it is possible to mark a database as having run all missing changesets that liquibase thinks are missing
without actually applying them. This may be useful when running liquibase against an existing database that does not need 
all the previous changesets to be run.

```bash
mvn compile -Dgoal=changelogSync -Dbaseline -P<environment>
```

## Tagging
This is more likely to be done automatically by the CI pipeline, for example once the release has been deployed.
Tagging essentially just puts a marker down on the latest changeset which can then be used for rollback or audit purposes.
To create a tag locally use (for other environemnts use a profile instead of -Dlocal, e.g. -PINT):

```bash
 mvn compile -Dgoal=tag -Dliquibase.tag=<version> -Dlocal
```

## Rollback
To rollback to a tagged checkpoint use the liquibase rollback goal. Below is an example for a local 
environment where `<tag>` is some previously tagged checkpoint.

```bash
mvn compile -Dgoal=rollback -Dliquibase.rollbackTag=<tag> -Dlocal
```
