# Test read/write speed of SD/microSD/USB/SSD/HDD.
Bash script for Mac OS X and Linux to test SD/microSD card or SSD/HDD/USB drive read and write speed.

this is fork from: https://github.com/biodranik/sd-card-speed-test/tree/master

- Simpified test process. Tested on Ubuntu/Lubuntu

Usage:
```
$ bash sd_card_speed_test.sh <path to directory which should be tested>
```
IE: `/Volumes/Untitled` and not `/dev/disk2`


Note: administrator password is necessary for sudo to reset file system cache. Read speed result is incorrect without cache reset.
