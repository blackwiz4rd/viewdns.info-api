#!/bin/bash

#Import configuration
. conf

# Questionscurl -XGET MAIN="What Domain?"
QDOMAIN='enter the domain name'
QOUTPUT="json or xml? write your full answer"

function input_domain() {
echo "$QDOMAIN"
        read domain
        echo "$QOUTPUT"
        read output
}

echo "What tool do you want to run?"
echo -e "-Reverse Who Is [rwhois]\n-IP history [iph]\n-Reverse IP [rip]\n"
if [ -z "$1" ]
  then
    echo "No argument supplied"
    read tool
else
  tool = $1
  echo $tool
fi

if [ $tool == 'reversewhois' ] || [ $tool == 'rwhois' ]; then
	input_domain
		curl -XGET "http://pro.viewdns.info/reversewhois/?host=$domain&apikey=$APIKEY&output=$output" > output.json

elif [ $tool == 'iphistory' ] || [ $tool == 'iph' ]; then
  input_domain
      curl -XGET "https://api.viewdns.info/iphistory/?host=$domain&apikey=$APIKEY&output=$output" > output.json


elif [ $tool == 'reverseip' ] || [ $tool == 'rip' ]; then
	input_domain
    curl -XGET "https://api.viewdns.info/reverseip/?host=$domain&apikey=$APIKEY&output=$output" > output.json
fi
