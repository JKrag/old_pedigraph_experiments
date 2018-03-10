#!/usr/bin/env python

# Usage example:
# python grabFD.py

import fdscrape

import csv
import time
import codecs

start = raw_input("Enter cat id interval start: ")
stop = raw_input("Enter cat id interval stop: ")
start = int(start)
stop = int(stop)

start_time = time.time()

with open("cats_{0:06d}-{1:06d}.csv".format(start,stop-1),'w') as out:
	csv_out=csv.writer(out, delimiter='|')
	# csv_out.writerow(['ID','GENDER','NAME','EMS','DOB','REG','SIRE','DAM'])
	for a in range(start, stop):
		row = fdscrape.cat(a)
		if row:
			row = [s.encode('utf-8') for s in row]
			csv_out.writerow(row)

end_time = time.time()
print end_time - start_time
print (end_time-start_time)/(stop-start)
