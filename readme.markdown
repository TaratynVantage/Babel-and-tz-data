# Babel and TZ Data for date i18n

This repository demonstrates how timezone data is a different package than babel and how you can upgrade one without 
the other.

This demo relies on the fact that Manitoba moved to 
[Permanent Daylight Savings](https://news.gov.mb.ca/news/index.html?item=75397). `tzdata` 2026.5 captures this change
but `tzdata` 2026.4 had not. So depending on the `tzdata` package one has installed, UTC `2026-12-15T17:00:00+00:00` is 
either 11AM or 12PM in Winnipeg. 

## Example:

Command: 
```shell
$ make run-all
```

Output:
```
docker build -f Dockerfile.old -t "babel-tz-data-example:old" .
[+] Building 0.4s (8/8) FINISHED                                                                                                                                                        docker:desktop-linux
*snip* 

docker build -f Dockerfile.new -t "babel-tz-data-example:new" .
[+] Building 0.3s (8/8) FINISHED                                                                                                                                                        docker:desktop-linux
*snip*

docker run "babel-tz-data-example:old"
tzdata 2026.4
babel 2.18.0
Winnipeg: 11:00 AM GMT-06:00
New York: 12:00 PM GMT-05:00
docker run "babel-tz-data-example:new"
tzdata 2026.5
babel 2.18.0
Winnipeg: 12:00 PM GMT-05:00
New York: 12:00 PM GMT-05:00
```
