#!/bin/bash

helpme()
{
  cat <<HELPMEHELPME

Usage:
    ${0} [location] [units]
where:
  - location - city (e.g: newyork) or airport code (e.g: waw)
  - units - m (metric) or u (USA)

HELPMEHELPME
}
LOC=newyork
UNIT=m

# validate the required env. variables
if [[ "$1" == "-h" || "$1" == "--help" ]] ; then
  helpme
  exit 1
fi

if [[ "$1" != "" ]] ; then
  LOC=$1
fi

if [[ "$2" != "" ]] ; then
  UNIT=$2
fi

curl -A "Mozilla/5.0" wttr.in/${LOC}?${UNIT} > /tmp/out

mkdir -p ./static/weather
mkdir -p ./static/$HOSTNAME
mv /tmp/out ./static/weather/index.html
