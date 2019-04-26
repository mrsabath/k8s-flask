#!/bin/bash
python ./web-server.py &

while true; do ./get-script.sh;sleep 30; done
