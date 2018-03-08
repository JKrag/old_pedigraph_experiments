#!/usr/bin/env python

# Usage example:
# python grab_missing.py

from bs4 import BeautifulSoup

import requests
import re
import csv
import time
import codecs

linkP = re.compile(".*=(\d*)")

def cat_found(soup):
    return soup.find("table", class_="kendt_han_master") or soup.find("table", class_="kendt_hun_master")

def get_gender(soup):
    gender = ""
    if soup.find("table", class_="kendt_han_master"):
        gender = "M"
    if soup.find("table", class_="kendt_hun_master"):
        gender = "F"
    return gender

def cat(id):
    try:
        r  = requests.get("http://katte.felisdanica.dk/?gens=1&id=" + id, timeout=2)
    except (requests.exceptions.ConnectionError, requests.exceptions.ReadTimeout) as e:    
        print e
        print "#### Retrying " + id + " once"
        try:
            r  = requests.get("http://katte.felisdanica.dk/?gens=1&id=" + id, timeout=2)
        except Exception as e:
            print "#### Failed: " + id + " ########################"
    data = r.text
    soup = BeautifulSoup(data, "html.parser")
    #stamchild = stamtrae.tr

    if cat_found(soup):
        #print "Content found for id: "+id
        gender = get_gender(soup)
        stamtrae = soup.find("table", class_ = "stamtrae")
        katnavn_master = stamtrae.find(id="KatNavn_master").text.strip()
        ems_master = soup.find(id="EmsNr_master").text.strip()
        foedt_master = soup.find(id="foedt_master").text.strip()
        stambogsnr_master = soup.find(id="stambogsNr_master").text.strip()
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
        return (id, gender, katnavn_master, ems_master, foedt_master, stambogsnr_master, sire_id, dam_id)
    return None

#start = raw_input("Enter cat id interval start: ")
#stop = raw_input("Enter cat id interval stop: ")
#start = int(start)
#stop = int(stop)
#start = 1000
#stop = 9999

m = open('missing.txt', "r")
missing = m.readlines()
m.close()


start_time = time.time()
with open("cats_missing.csv",'w') as out:
    csv_out=csv.writer(out, delimiter='|')
    for num in missing:
        a= str(int(num))
#        print "Checking:" + a
        row = cat(a)
        if row:
            row = [s.encode('utf-8') for s in row]
            csv_out.writerow(row)

end_time = time.time()
print end_time - start_time
#print (end_time-start_time)/(stop-start)