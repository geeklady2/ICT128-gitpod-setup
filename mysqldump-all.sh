#!/bin/bash -e

if [ "${1}" != "" ] && [ "${1}" != "--help" ] ; then

    DBNAME=${1}
    EXPORTFILE="${1}_dump.sql"
    VIEWS=$(mysql \
          -NB \
          -e "SELECT \
            CONCAT( '--ignore-table=', TABLE_SCHEMA, '.', TABLE_NAME ) AS q \
            FROM INFORMATION_SCHEMA.VIEWS \
            WHERE TABLE_SCHEMA = '${DBNAME}';" )
    echo ${VIEWS}
    if [ "$?" == "0" ] ; then
        echo Exporting database ${DBNAME}
        echo
        mysqldump ${VIEWS}  \
            --add-locks --extended-insert --flush-privileges --no-autocommit \
            --routines --triggers --single-transaction --master-data=2 \
            --flush-logs --events --quick --databases ${DBNAME} > ${EXPORTFILE} \
            || echo -e "\n\nERROR: failed to mysqldump ${DBNAME}"
        echo Exporting view definitions
        echo
        mysql --skip-column-names --batch \
              -e "SELECT \
                CONCAT( \
                'DROP TABLE IF EXISTS ', TABLE_SCHEMA, '.', TABLE_NAME, \
                '; CREATE OR REPLACE VIEW ', TABLE_SCHEMA, '.', TABLE_NAME, ' AS ', \
                VIEW_DEFINITION, '; ') AS TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS \
                WHERE TABLE_SCHEMA = '${DBNAME}';" >> ${EXPORTFILE} \
              || echo -e "\n\nERROR: failed to mysqldump view definitions"
            echo Export complete
            echo
    fi
 else
    echo -e "Usage: mysqldump-all DBNAME"
fi