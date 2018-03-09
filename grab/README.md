# Grabbing

## Initial brute grab
Create a folder for new data e.g. 
```
mkdir 2018-03
cd 2018-03
```

Then start grabbing with:
```
python ../grabFD.py
```

It asks for a start and end of interval. Choose a big interval (50k or 100k) to leave it all night, or start many sessions with smaller intervals (like 10K).

In case of timeouts, the scripts tries each cat once more, then skips it.

Each interval will write a `cats_[start]_[end].csv` file.

When done, the files can be cat'ed together into bigger chunks and finally one big `all.csv` or the likes.

## Find missing

Run something like:
```
python ../find_missing.py all_2018-03.csv > missing.txt
```

This will create a `missing.txt` that contains all the numbers of skipped cats.

*NOTE:* Open the file and edit out the header and footer statistics info 
(TODO: clean up script so it writes output directly to file and stats to std.out.)

Run: 
```
python ../grab_missing.py
```

This will run through all cats in missing.txt and try to grab them again, writing the output to `cats_missing.csv`.

Use `wc -l` to check if it found all, otherwise concat the new cats at the end of all.csv, and repeat the find missing procedure until satisfied. Note that there could be cats simply not in the DB, so check on `http://katte.felisdanica.dk/?id=[ID]` if there are a few that keep failing.

In 2018-03 I had 1411 cat id's that were not there at all.

## Cleanup
If missing have been concated on to the end, sorting might be a good idea.
```
q -e UTF-8 -d '|' "SELECT * FROM all.csv ORDER BY c1" > sorted.csv
```
or doing the `SELECT ... FROM all.csv missing.csv` should work fine as well?

It might also be a good idea to do a dos2unix convertion at some point.


 