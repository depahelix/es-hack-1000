#!/bin/bash
mvn package; mvn assembly:assembly; java -jar target/hackday-mongo-loader.jar -c influencers -d traackr -m cluster-7-data-00.sl.hackreduce.net:28953 -o 10
