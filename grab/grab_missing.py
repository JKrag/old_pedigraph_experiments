#!/usr/bin/env python

# Usage example:
# python grab_missing.py
import fdscrape

import csv
import time
import codecs




m = open('missing.txt', "r")
missing = m.readlines()
m.close()


start_time = time.time()
with open("cats_missing.csv",'w') as out:
	csv_out=csv.writer(out, delimiter='|')
	for num in missing:
		a= str(int(num))
		row = fdscrape.cat(a)
		if row:
			row = [s.encode('utf-8') for s in row]
			csv_out.writerow(row)

end_time = time.time()
print end_time - start_time
