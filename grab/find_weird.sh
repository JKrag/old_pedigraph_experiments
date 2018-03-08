#!/bin/bash

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE c1 not IN (SELECT DISTINCT c1 FROM ok*.csv)" > suspects.csv


q -d ';' -D ';' -e UTF-8 "SELECT count(1) from suspects.csv"
#wc -l suspects.csv



#q -d ';' -D ';' -e UTF-8 "SELECT count(1) from more_suspect.csv"
#wc -l more_suspect.csv
