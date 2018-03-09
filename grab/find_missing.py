#!/usr/bin/env python

# Usage example:
# python find_missing.py done/all.csv > missing.txt

from bs4 import BeautifulSoup

import csv
import time
import codecs
import sys
import os

start_time = time.time()

path = sys.argv[1]

# Check if path exits
if not os.path.exists(path):
    print "Invalid file path"
    exit(1)

myfirst = None
mylast = None
found = set()
missing = set()

with open(path,'rb') as catfile:
    cats=csv.reader(catfile, delimiter='|',quotechar='"')
    for row in cats:
        id = int(row[0])
        found.add(id)

myfirst = min(found)
mylast = max(found)
print "records found:" + str(len(found))
print "records expected:" + str(mylast-myfirst+1)
print "myfirst:" + str(myfirst)
print "mylast:" + str(mylast)

for i in range(myfirst, mylast):
    if i not in found:
        missing.add(i)
        print i

print "number of missing cats: " + str(len(missing))

end_time = time.time()
print end_time - start_time
