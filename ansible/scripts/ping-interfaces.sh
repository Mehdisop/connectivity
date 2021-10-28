#!/bin/bash
IFS=$'\n'
 

for net in `ip r | awk '/via /{print $3" "$5}'` ;
do
 
 ping -c 2 -I `echo $net | awk '{print $2}'` `echo $net | awk '{print $1}'` &> /dev/null && echo "succeded to reach `echo $net | awk '{print $1}'` from `echo $net | awk '{print $2}'`" || echo "failed to reach `echo $net | awk '{print $1}'` from `echo $net | awk '{print $2}'`" ;
 
done
