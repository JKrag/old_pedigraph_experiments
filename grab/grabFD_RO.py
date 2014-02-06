#!/usr/bin/env python
from bs4 import BeautifulSoup

import requests
import re
import csv
import time
import codecs
from py2neo import neo4j
graph_db = neo4j.GraphDatabaseService("http://localhost:7474/db/data/")

linkP = re.compile(".*=(\d*)")
print type(linkP)
def cat(id):
	r  = requests.get("http://katte.ws2013.com/?gens=1&id=" + id)
	data = r.text
	soup = BeautifulSoup(data)
	stamtrae = soup.find("table", class_ = "stamtrae")
	stamchild = stamtrae.tr
	#print id
	if stamchild:
		#print "Content found for id: "+id
		gender = ""
		if soup.find("table", class_="kendt_han_master"):
			gender = "M"
		if soup.find("table", class_="kendt_hun_master"):
			gender = "F"
		katnavn_master = stamtrae.find(id="KatNavn_master").text
		ems_master = soup.find(id="EmsNr_master").text
		foedt_master = soup.find(id="foedt_master").text
		stambogsnr_master = soup.find(id="stambogsNr_master").text
		sire_id = ""
		dam_id  = ""
		sireTable = soup.find("table", class_="kendt_han")
		damTable = soup.find("table", class_="kendt_hun")
		if sireTable:
			sire_a = sireTable.a
			if sire_a and sire_a.has_attr('href'):
				sire_id = linkP.match(sire_a['href']).group(1)
		if damTable:
			dam_a = damTable.a
			if dam_a and dam_a.has_attr('href'):
				dam_id = linkP.match(dam_a['href']).group(1)
		print id + ", " + gender + ", " + katnavn_master + ", " + ems_master + ", " + foedt_master + ", " + stambogsnr_master + ", " + sire_id + ", " + dam_id
	print id
	#return (id, gender, katnavn_master, ems_master, foedt_master, stambogsnr_master, sire_id, dam_id)

start = raw_input("Enter cat id interval start: ")
stop = raw_input("Enter cat id interval stop: ")
start = int(start)
stop = int(stop)
#start = 1000
#stop = 9999

start_time = time.time()
#with open("cats_{0}-{1}.csv".format(start,stop-1),'w') as out:
#    csv_out=csv.writer(out)
#    csv_out.writerow(['ID','GENDER','NAME','EMS','DOB','REG','SIRE','DAM'])
for a in range(start, stop):
	cat(str(a))
#	    row = [s.encode('utf-8') for s in row]
#	    csv_out.writerow(row)

#end_time = time.time()
#print end_time - start_time
#print (end_time-start_time)/(stop-start)
