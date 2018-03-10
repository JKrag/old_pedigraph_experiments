from bs4 import BeautifulSoup

import requests
import re

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

def cat(cat_id):
	id = str(cat_id)
	data = ""
	try:
		r  = requests.get("http://katte.felisdanica.dk/?gens=1&id=" + id, timeout=10)
		data = r.text
	except (requests.exceptions.ConnectionError, requests.exceptions.ReadTimeout) as e:
		print e
		print "#### Retrying " + id + " once"
		try:
			r  = requests.get("http://katte.felisdanica.dk/?gens=1&id=" + id, timeout=30)
			data = r.text
		except Exception as e:
			print "#### Failed: " + id + " ########################"

	soup = BeautifulSoup(data, "html.parser")

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
	print "Cat " + id + " not found."
	return None
