#!/bin/bash

HERE=$( readlink -f $( dirname $0 ) ) 

if ! test -f "$HERE/docker-compose.yml"; then
	echo "Fatal: cannot find docker-compose.yml in same directory!"
	exit 1
fi

if ! `which docker-compose`; then
	echo "Fatal: docker-compose is not installed!"
	exit 1
fi

docker-compose pull
docker-compose down --remove-orphans
docker-compose up -d
