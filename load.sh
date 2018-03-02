#!/bin/bash

/bin/ping -l 100000 -q -s 10 -f localhost &
/bin/ping -l 100000 -q -s 10 -f localhost &
/bin/ping -l 100000 -q -s 10 -f localhost &
while true; do dd if=/dev/zero of=bigfile bs=1024000 count=1024; rm bigfile; done
