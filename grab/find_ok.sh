#!/bin/bash

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(sire_ems,1,3) IN (substr(ems,1,3),'','...') AND substr(dam_ems,1,3) IN (substr(ems,1,3),'','...')" > ok_new_same_breed.csv

#find OK Kat4 cats
q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('SIA','BAL','OSH','OLH') AND substr(sire_ems,1,3)  IN ('SIA','BAL','OSH','OLH','','...')  AND  substr(dam_ems,1,3) IN ('SIA','BAL','OSH','OLH','','...') " > ok_KAT4.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('PEB') AND ((substr(sire_ems,1,3) = 'PEB' AND   substr(dam_ems,1,3) IN ('OSH','SIA','BAL','OLH')) OR substr(dam_ems,1,3) = 'PEB' AND substr(sire_ems,1,3) IN ('OSH','OLH','SIA','BAL')) " > ok_PEB_WITH_ONE_KAT4_parent.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('PER','EXO') AND substr(sire_ems,1,3)  IN ('PER','EXO','','...')  AND  substr(dam_ems,1,3) IN ('PER','EXO','','...') " > ok_PER_EXO.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('BSH') AND ((substr(sire_ems,1,3) = 'BSH' AND   substr(dam_ems,1,3) IN ('PER','EXO')) OR substr(dam_ems,1,3) = 'BSH' AND substr(sire_ems,1,3) IN ('PER','EXO')) " > ok_BSH_WITH_PER_EXO.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('ABY','SOM') AND substr(sire_ems,1,3)  IN ('ABY','SOM','','...')  AND  substr(dam_ems,1,3) IN ('ABY','SOM','','...') " > ok_ABY_SOM.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('BSH','BLH') AND substr(sire_ems,1,3)  IN ('BSH','BLH','','...')  AND  substr(dam_ems,1,3) IN ('BSH','BLH','','...') " > ok_BLH_BSH.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('SRS','SRL') AND substr(sire_ems,1,3)  IN ('SRS','SRL','BLH','BSH','EXO','PER','','...')  AND  substr(dam_ems,1,3) IN ('SRS','SRL','BLH','BSH','EXO','PER','','...') " > ok_SRS_SRL.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('SIB','NEM') AND substr(sire_ems,1,3)  IN ('SIB','NEM','','...')  AND  substr(dam_ems,1,3) IN ('SIB','NEM','','...') " > ok_SIB_NEM.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('CYM','MAN') AND substr(sire_ems,1,3)  IN ('CYM','MAN','','...')  AND  substr(dam_ems,1,3) IN ('CYM','MAN','','...') " > ok_CYM_MAN.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('ACS','ACL') AND substr(sire_ems,1,3)  IN ('ACS','ACL','','...')  AND  substr(dam_ems,1,3) IN ('ACS','ACL','','...') " > ok_ACS_ACL.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('SFS','SFL') AND substr(sire_ems,1,3)  IN ('SFS','SFL','BSH','','...')  AND  substr(dam_ems,1,3) IN ('SFS','SFL','BSH','','...') " > ok_SFS_SFL.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('KBS','KBL') AND substr(sire_ems,1,3)  IN ('KBS','KBL','','...')  AND  substr(dam_ems,1,3) IN ('KBS','KBL','','...') " > ok_KBS_KBL.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE (substr(ems,1,3) = substr(sire_ems,1,3) AND substr(dam_ems,1,3) IN ('XSH','XLH')) OR (substr(ems,1,3) = substr(dam_ems,1,3) AND substr(sire_ems,1,3) IN ('XSH','XLH')) " > ok_SAME_with_one_XSH_or_XLH.csv

#Find those that have "Missing EMS" - we consider them OK for now, but check them manually.
q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE sire_ems = 'Missing EMS' OR dam_ems = 'Missing EMS' " > ok_MISSING_EMS.csv

#q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('XSH','XLH') AND substr(sire_ems,1,3)  IN ('XSH','XLH','','...')  AND  substr(dam_ems,1,3) IN ('XSH','XLH','','...') " > ok_XSH_XLH.csv

q -d ';' -D ';' -e UTF-8 "SELECT c1,c2,c3,c4 as ems,c5,c6,c7,c8 as sire_ems,c9,c10 as dam_ems FROM all_with_parent_ems_2.csv WHERE substr(ems,1,3) IN ('XSH','XLH')" > ok_XSH_XLH.csv

q -d ';' -D ';' -e UTF-8 "SELECT count(1) from ok*.csv"
q -d ';' -D ';' -e UTF-8 "SELECT count(distinct(c1)) from ok*.csv"

