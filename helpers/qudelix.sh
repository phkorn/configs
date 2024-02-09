#!/usr/bin/env bash

btid="98-8e-79-00-8c-9f"

while true; do
  echo "wait for connect of $btid"
  blueutil --wait-connect $btid 
  echo "disconnecting $btid"
  gtimeout 1s blueutil --disconnect $btid 
done
