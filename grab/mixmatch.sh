#!/bin/bash

if [ "$1" != "" ]; then
    echo "Querying $1 for $2 cats with weird parents"
else
    echo "Please specify filename and breeds to query  e.g. 'NFO'"
fi
SUBQUERY="SELECT c1,c2,c3,c4,c5,c6,c7,c8 FROM $1 WHERE substr(c4,1,3) IN ('$2')"
q -d '|' -D ';' -e UTF-8 "$SUBQUERY" > all_$2.csv

QUERY="\
SELECT\
	c1 as id,c2 as gender,c3 as name,c4 as ems,c5 as dob,c6 as reg,c7 as sire,c8 as dam \
FROM \
	$1 
WHERE \
	substr(ems,1,3) in ('$2') \
AND (\
	sire NOT IN (SELECT 102964 UNION SELECT c1 FROM all_$2.csv )
	OR \
	dam NOT IN (SELECT 102965 UNION SELECT c1 FROM all_$2.csv ) \
	) \
"
echo $QUERY
q -d '|' -D ';' -e UTF-8 "$QUERY"
